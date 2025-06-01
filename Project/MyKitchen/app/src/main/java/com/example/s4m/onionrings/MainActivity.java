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
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.CookieManager;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    //ToolBar.
    private Toolbar toolbar;

    //Drawer layout
    private DrawerLayout drawerLayout;
    private NavigationView navigationView;

    private static final String TAG = "MainActivity";
    private static final String _PATH = "http://192.168.1.6/onionrings/uploads/";
    private static final String _URL = "http://192.168.1.6/onionrings/api/web/index.php/recipes";
    //vars
    private ArrayList<String> mNames = new ArrayList<>();
    private ArrayList<String> mImageUrls = new ArrayList<>();
    private JSONArray jsonArray;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d(TAG, "onCreate: started.");

        toolbar = findViewById(R.id.toolBar);
        setSupportActionBar(toolbar);

        new ParseTask().execute();
        Log.d(TAG, "Size://"+mNames.size());

        drawerLayout = findViewById(R.id.drawer_layout);
        navigationView = findViewById(R.id.navigationView);

        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                switch (item.getItemId()) {
                    case R.id.nav_recipe:
                        return false;

                    case R.id.nav_category:
                        item.setChecked(true);

                        Intent categoryIntent = new Intent(MainActivity.this, CategoriesActivity.class);
                        categoryIntent.putExtra("recipes", jsonArray.toString());
                        startActivity(categoryIntent);

                        drawerLayout.closeDrawers();
                        return true;
                }


                return false;
            }
        });
    }

    private void initRecyclerView() {
        Log.d(TAG, " initRecyclerView: init RecyclerView");
        RecyclerView recyclerView = findViewById(R.id.recyclerview);
        RecyclerViewAdapter adapter = new RecyclerViewAdapter(this, mNames, mImageUrls, jsonArray);
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
            Log.d(TAG, " onPostExecute started:");
            super.onPostExecute(strJson);
            try {

                jsonArray = new JSONArray(strJson);
                for(int i =0 ; i < jsonArray.length() ; i++) {
                    JSONObject jsonObj = jsonArray.getJSONObject(i);

                    mNames.add(jsonObj.getString("recipe_title"));
                    mImageUrls.add(_PATH + jsonObj.getString("recipe_picture"));
                    Log.d(TAG, "Row ://" + jsonObj.getString("recipe_title") + jsonObj.getString("recipe_picture"));
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






















