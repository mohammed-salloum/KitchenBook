<?php

namespace common\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Album;

/**
 * AlbumSearch represents the model behind the search form of `common\models\Album`.
 */
class AlbumSearch extends Album
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['album_id', 'album_recipe'], 'integer'],
            [['album_name'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Album::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'album_id' => $this->album_id,
            'album_name' => $this->album_name,
            'album_recipe' => $this->album_recipe,
        ]);

        return $dataProvider;
    }
}
