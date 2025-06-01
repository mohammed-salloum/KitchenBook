package com.example.s4m.onionrings;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import de.hdodenhof.circleimageview.CircleImageView;

public class CatRecyclerViewAdapter extends RecyclerView.Adapter<CatRecyclerViewAdapter.ViewHolder>{
    private static final String TAG = "RecyclerViewAdapter";

    private ArrayList<String> mImageNames = new ArrayList<>();
    private ArrayList<String> mImages = new ArrayList<>();
    private ArrayList<String> mCategoryIDs = new ArrayList<>();
    private JSONArray jsonArray = new JSONArray();
    private JSONObject jsonObj;
    Context mContext;
    private MainActivity main = new MainActivity();

    public CatRecyclerViewAdapter(Context mContext, ArrayList<String> mImageNames, ArrayList<String> mImages,ArrayList<String> mCategoryIDs, JSONArray jsonArray) {
        this.mImageNames = mImageNames;
        this.mImages = mImages;
        this.mContext = mContext;
        this.jsonArray = jsonArray;
        this.mCategoryIDs = mCategoryIDs;
        Log.d(TAG, jsonArray.toString());
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.layout_listitem, parent, false);
        ViewHolder viewHolder = new ViewHolder(view);

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {

        Log.d(TAG, "onBindViewHolder: called." + mImages.get(position));

        holder.imageName.setText(mImageNames.get(position));

        Log.d(TAG, "Image Names:////// " + mImages.get(position));

        holder.parentLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d(TAG, "onClick: clicked " + mImageNames.get(position));

                try {
                    jsonObj = jsonArray.getJSONObject(position);
                } catch(JSONException e){
                    e.printStackTrace();
                }
                Intent intent = new Intent(view.getContext(), CategoryActivity.class);
                intent.putExtra("recipes", jsonArray.toString());
                intent.putExtra("category_id", mCategoryIDs.get(position));
                intent.putExtra("category_name", mImageNames.get(position));
                view.getContext().startActivity(intent);

            }
        });
    }

    @Override
    public int getItemCount() {
        return mImageNames.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{

        CircleImageView image;
        TextView imageName;
        RelativeLayout parentLayout;
        public ViewHolder(View itemView) {
            super(itemView);

            image = itemView.findViewById(R.id.image);
            imageName = itemView.findViewById(R.id.image_name);
            parentLayout = itemView.findViewById(R.id.parent_layout);
        }
    }
}
