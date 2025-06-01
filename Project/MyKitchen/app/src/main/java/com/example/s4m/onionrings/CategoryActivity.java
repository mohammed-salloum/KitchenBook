package com.example.s4m.onionrings;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.support.v7.widget.Toolbar;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class CategoryActivity extends AppCompatActivity {

    private int id;
    private JSONArray jsonArray;


    private static final String _PATH = "http://192.168.1.6/onionrings/uploads/";

    private ArrayList<String> mNames = new ArrayList<>();
    private ArrayList<String> mImageUrls = new ArrayList<>();

    //Toolbar
    private Toolbar toolbar;

    //Drawer Layout
    private DrawerLayout drawerLayout;
    private NavigationView navigationView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_category);

        Intent intent = getIntent();

        toolbar = findViewById(R.id.toolBar);
        toolbar.setTitle(intent.getStringExtra("category_name"));
        setSupportActionBar(toolbar);


        id = Integer.parseInt(intent.getStringExtra("category_id"));
        String recipesString = intent.getStringExtra("recipes");
        try {
            jsonArray = new JSONArray(recipesString);
        } catch (JSONException je) {
            je.printStackTrace();
        }

        filterRecipes();
        initRecyclerView();

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

                        Intent categoryIntent = new Intent(CategoryActivity.this, CategoriesActivity.class);
                        categoryIntent.putExtra("recipes", jsonArray.toString());
                        startActivity(categoryIntent);

                        drawerLayout.closeDrawers();
                        return true;
                }


                return false;
            }
        });
    }

    private void filterRecipes() {
        JSONArray rec = new JSONArray();
        JSONObject jsonObj; int catID;
        for(int i = 0; i < jsonArray.length(); i++) {
            try {
                jsonObj = jsonArray.getJSONObject(i);
                catID = Integer.parseInt(jsonObj.getString("recipe_category"));
//                textView.setText(textView.getText()+ "//" + id + " " + catID);

                if(catID == id) {
                    rec.put(jsonObj);
                    mImageUrls.add(_PATH + jsonObj.getString("recipe_picture"));
                    mNames.add(jsonObj.getString("recipe_title"));
                }

            } catch (JSONException je) {
                je.printStackTrace();
            }
        }
        jsonArray = rec;
    }

    private void initRecyclerView() {
        RecyclerView recyclerView = findViewById(R.id.recyclerview);
        RecyclerViewAdapter adapter = new RecyclerViewAdapter(this, mNames, mImageUrls, jsonArray);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }
}
