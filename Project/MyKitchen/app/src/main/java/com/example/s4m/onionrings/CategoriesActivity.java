package com.example.s4m.onionrings;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.MenuItem;
import android.support.v7.widget.Toolbar;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class CategoriesActivity extends AppCompatActivity {

    private DrawerLayout drawerLayout;
    private NavigationView navigationView;
    private JSONArray jsonArray;
    private JSONArray recipes;

    //Toolbar
    Toolbar toolbar;

    private static final String _URL = "http://192.168.1.6/onionrings/api/web/index.php/categories";

    private ArrayList<String> mNames = new ArrayList<>();
    private ArrayList<String> mImageUrls = new ArrayList<>();
    private ArrayList<String> mCategoryIDs = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_categories);

        toolbar = findViewById(R.id.toolBar);
        setSupportActionBar(toolbar);

        Intent intent = getIntent();
        String recipesString = intent.getStringExtra("recipes");
        try {
            Log.d("CATEGORIES ACTIVITY", recipesString);
            recipes = new JSONArray(recipesString);
        } catch (Exception e) {
            e.printStackTrace();
        }

        new ParseTask().execute();

        drawerLayout = findViewById(R.id.drawer_layout);
        navigationView = findViewById(R.id.navigationView);

        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {


                switch (item.getItemId()) {
                    case R.id.nav_recipe:
                        item.setChecked(true);

                        Intent intent = new Intent( CategoriesActivity.this, MainActivity.class);
                        startActivity(intent);
                        drawerLayout.closeDrawers();
                        return true;
                    case R.id.nav_category:
                        return false;
                }


                return false;
            }
        });

    }

    private void initRecyclerView() {
        RecyclerView recyclerView = findViewById(R.id.recyclerview);
        CatRecyclerViewAdapter adapter = new CatRecyclerViewAdapter(this, mNames, mImageUrls,mCategoryIDs, recipes);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }


    private class ParseTask extends AsyncTask<Void, Void, String> {

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
                for(int i =0 ; i < jsonArray.length() ; i++) {
                    JSONObject jsonObj = jsonArray.getJSONObject(i);

                    mNames.add(jsonObj.getString("category_name"));
                    mCategoryIDs.add(jsonObj.getString("category_id"));
                    mImageUrls.add("@drawable/ic_category");
                }

                initRecyclerView();

                //TextView textView = (TextView) findViewById(R.id.txtShow);
                //textView.setText(result_json_text);

            } catch(JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
