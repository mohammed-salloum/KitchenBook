package com.example.s4m.onionrings;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;
import com.bumptech.glide.Glide;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class RecipeActivity extends AppCompatActivity {

    private String ingredients = "";
    private int id;

    //Toolbar
    Toolbar toolbar;

    //Drawer Layout
    DrawerLayout drawerLayout;
    NavigationView navigationView;

    //Ingredients vars
    ExpandableListView listView;
    private ExpandableListAdapter listAdapter;
    private List<String> listDataHeader;
    private HashMap<String, List<String>> listHash;
    private JSONArray jsonArray;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recipe);

        toolbar = findViewById(R.id.toolBar);
        setSupportActionBar(toolbar);

        Intent intent = getIntent();
        String recipesString = intent.getStringExtra("recipes");
        try {
            jsonArray = new JSONArray(recipesString);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        new ParseTask().execute();

        JSONObject recipeJSON;

        TextView title = findViewById(R.id.title);
        TextView preparation = findViewById(R.id.preparation);
        ImageView image = findViewById(R.id.imageView);

        //list adapter init.
        //listAdapter = new ExpandableListAdapter(this, listDataHeader, listHash);

        drawerLayout = findViewById(R.id.drawer_layout);
        navigationView = findViewById(R.id.navigationView);

        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                switch (item.getItemId()) {
                    case R.id.nav_recipe:
                        item.setChecked(true);

                        Intent intent = new Intent( RecipeActivity.this, MainActivity.class);
                        startActivity(intent);

                        drawerLayout.closeDrawers();
                        return true;
                    case R.id.nav_category:
                        item.setChecked(true);

                        Intent categoryIntent = new Intent(RecipeActivity.this, CategoriesActivity.class);
                        categoryIntent.putExtra("recipes", jsonArray.toString());
                        startActivity(categoryIntent);

                        drawerLayout.closeDrawers();
                        return true;
                }


                return false;
            }
        });


        String recipeTitle = "";
        String recipePreparation = "";
        String path = "";

        try {
            recipeJSON = new JSONObject(getIntent().getStringExtra("object"));
            path = getIntent().getStringExtra("path");
            recipeTitle = recipeJSON.getString("recipe_title");
            recipePreparation = recipeJSON.getString("recipe_preparation");
            id = recipeJSON.getInt("recipe_id");

        } catch(JSONException e) {
            e.printStackTrace();
        }
        title.setText(recipeTitle);
        toolbar.setTitle(recipeTitle);
        preparation.setText(recipePreparation);

        Glide.with(this)
                .asBitmap()
                .load(path)
                .into(image);
    }

    private class ParseTask extends AsyncTask<Void, Void, String> {

        JSONArray jsonArray = new JSONArray();
        String _URL = "http://192.168.1.6/onionrings/api/web/index.php/ingredients";

        HttpURLConnection urlConnection = null;
        BufferedReader reader = null;
        String resultJson = "";

        @Override
        protected String doInBackground(Void... Params) {
            try {

                //String site_url_json = "http://192.168.1.8/onionrings/onionRings/api/web/index.php/recipes";
                URL url = new URL(_URL);

                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.connect();

                InputStream inputStream = urlConnection.getInputStream();
                StringBuffer buffer = new StringBuffer();

                reader = new BufferedReader(new InputStreamReader(inputStream));

                String line;
                while((line = reader.readLine()) != null) {
                    buffer.append(line);
                }

                resultJson = buffer.toString();
            } catch(Exception e) {
                e.printStackTrace();
            }
            return resultJson;
        }


        protected void onPostExecute(String strJson) {
            super.onPostExecute(strJson);
            try {

                jsonArray = new JSONArray(strJson);


                //Ingredients vars init
                listDataHeader = new ArrayList<>();
                listHash = new HashMap<>();

                //list label
                listDataHeader.add("Ingredients");

                //list items array
                List<String> ings = new ArrayList<>();

                for(int i =0 ; i < jsonArray.length() ; i++) {
                    JSONObject jsonObj = jsonArray.getJSONObject(i);

                    if(id == jsonObj.getInt("recipe_id"))
                        ings.add (
                                        jsonObj.getString("ingredient_name") + " " +
                                        jsonObj.getString("ingredient_quantity") + " " +
                                        jsonObj.getString("ingredient_unit") + " " +
                                        jsonObj.getString("ingredient_desc")
                        );
                    Log.d("ING", jsonObj.getString("ingredient_name"));
                }

                listView = findViewById(R.id.lvExp);
                listView.setAdapter(listAdapter);
                Log.d("Header", listDataHeader.get(0));
                listHash.put(listDataHeader.get(0), ings);

                listAdapter = new ExpandableListAdapter(getBaseContext(), listDataHeader, listHash);
                listView.setAdapter(listAdapter);


            } catch(JSONException e) {
                e.printStackTrace();
            }
        }
    }

}
