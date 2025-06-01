<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="col-md-4">
    <div class="thumbnail">
        <div class="img-container">
            <a href="<?= Url::toRoute(['recipe/category', 'id' => $model->category_id]) ?>">
                <img src="<?= Yii::getAlias('@web') . '/' . 'uploads/' . $model->getImage($model->category_id) ?>"
                     class="figure-img img-fluid"/>
            </a>
        </div>
        <div class="caption">
            <?= $model->category_name ?>
        </div>
    </div>
</div>

<?php $style = <<< CSS
.img-container {
    max-height: 147px;
    overflow: hidden;
}
CSS;
$this->registerCss($style);
?>
