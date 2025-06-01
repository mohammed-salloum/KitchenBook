<?php

use yii\helpers\Html;
use common\models\Recipe;


$this->title = 'Recipes';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="recipe_category">
      <h1><?= $this->title ?></h1>
</div>

<?php if (!Yii::$app->user->isGuest): ?>
    <p>
        <?= Html::a('Create Recipe', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php endif; ?>

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
