<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php if(!Yii::$app->user->isGuest) { ?>
        <p>
            <?= Html::a('Create Category', ['create'], ['class' => 'btn btn-link']) ?>
        </p>
    <?php } ?>

    <div class="row">
        <?=
        \yii\widgets\ListView::widget([
            'dataProvider' => $dataProvider,
            'options' => [
                'tag' => 'div',
                'class' => 'list-wrapper',
                'id' => 'list-wrapper',
            ],
            'layout' => "{pager}\n{items}\n{summary}",
            'itemView' => '_list_item',
        ]);
        ?>

    </div>

</div>

<?php $style = <<< CSS

CSS;
$this->registerCss($style);
?>
