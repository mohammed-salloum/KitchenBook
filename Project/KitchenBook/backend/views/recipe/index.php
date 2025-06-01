<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\RecipeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Recipes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="recipe-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'recipe_id',
            'recipe_title',
            'recipe_date',
            [
              'attribute' => 'recipe_owner',
              'value' => 'recipeOwner.username',
            ],
            'recipe_preparation:ntext',
            //'recipe_category',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
