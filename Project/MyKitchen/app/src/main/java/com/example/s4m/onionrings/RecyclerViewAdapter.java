package com.example.s4m.onionrings;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import de.hdodenhof.circleimageview.CircleImageView;

public class RecyclerViewAdapter extends RecyclerView.Adapter<RecyclerViewAdapter.ViewHolder>{
    private static final String TAG = "RecyclerViewAdapter";

    private ArrayList<String> mImageNames = new ArrayList<>();
    private ArrayList<String> mImages = new ArrayList<>();
    private JSONArray jsonArray = new JSONArray();
    private JSONObject jsonObj;
    Context mContext;
    private MainActivity main = new MainActivity();

    public RecyclerViewAdapter(Context mContext, ArrayList<String> mImageNames, ArrayList<String> mImages, JSONArray jsonArray) {
        this.mImageNames = mImageNames;
        this.mImages = mImages;
        this.mContext = mContext;
        this.jsonArray = jsonArray;
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

        /*if(mImages.get(position) == null) {

            Log.d(TAG, "IMAGE IS EMPTY!!!!");
            Drawable temp = mContext.getResources().getDrawable(R.drawable.ic_category);
            holder.image.setImageDrawable(temp);

        }*/ if(mImages.get(position) != "@drawable/ic_category"){
            Glide.with(mContext)
                    .asBitmap()
                    .load(mImages.get(position))
                    .into(holder.image);
        }

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
                Intent intent = new Intent(view.getContext(), RecipeActivity.class);
                intent.putExtra("message", "Cute:)");
                intent.putExtra("object", jsonObj.toString());
                intent.putExtra("path", mImages.get(position));
                intent.putExtra("recipes", jsonArray.toString());
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
