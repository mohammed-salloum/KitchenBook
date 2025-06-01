<?php

use common\models\Recipe;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'Kitchen Book';
?>
<div class="site-index">
    <!-- lates-recipes -->
    <div class="row">
        <!-- Printing Recipes -->
        <?php foreach($recipes as $recipe) { ?>

        <!-- recipe -->
        <div class="col-md-4 padding-0">
            <!-- image -->
            <div class="image">
                <a href="<?= Url::toRoute(['recipe/view', 'id' => $recipe->recipe_id]) ?>">
                    <img class="img-responsive" src="<?=Yii::getAlias('@web') . '/' . 'uploads/' . $recipe->recipe_picture ?>" />
                    <h2><span><?= $recipe->recipe_title ?></span></h2>
                </a>
            </div><!-- image -->
        </div><!-- recipe -->

        <?php } ?><!-- foreach -->
    </div><!-- latest-recipes -->

    <!-- albums nav -->
    <div class="row">
        <!-- album -->
        <ul class="nav nav-pills" id="myTab" role="tablist">
            <!-- Printing Albums -->
            <?php for($i = 0; $i<sizeof($categories); $i++) { ?>

                <li class="nav-item <?php if($i==0) echo 'active'; ?>">
                    <a class="nav-link <?php if($i==0) echo 'active'; ?>"
                    id="<?= $categories[$i]->category_id ?>-tab" data-toggle="tab" href="#<?= $categories[$i]->category_id ?>" role="tab"
                    aria-controls="<?= $categories[$i]->category_id ?>" aria-selected="true"><?= $categories[$i]->category_name ?>
                    </a>
                </li>

        <?php } ?><!-- for -->
        </ul>
    </div><!-- albums nav -->
    <!-- albums divs -->
    <div class="row">
        <div class="tab-content" id="myTabContent">
            <!-- Printing Albums -->
            <?php for($i = 0; $i<sizeof($categories); $i++) {
            ?>
                <div class="tab-pane fade <?php if($i==0) echo 'active in'; ?>"
                id="<?= $categories[$i]->category_id ?>" role="tabpanel" aria-labelledby="
                <?= $categories[$i]->category_id ?>-tab">
                    <div class="row">
                        <?php
                            $models = Recipe::find()
                            ->where('recipe_category = :cat', [':cat' => $categories[$i]->category_id])
                            ->all();
                            foreach ($models as $model) { ?>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <div class="img-container">
                                            <a href="<?= Url::toRoute(['recipe/view', 'id' => $model->recipe_id]) ?>">
                                                <img src="<?= Yii::getAlias('@web') . '/' . 'uploads/' . $model->recipe_picture ?>"
                                                     class="figure-img img-fluid"/>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <strong>
                                                <?= $model->recipe_title ?>
                                            </strong>
                                            <span class="cat">
                                                <?= $model->getCategoryName($model->recipe_category) ?><br />
                                            </span>
                                            <div class="btn btn-primary">
                                                <?= $model->getRecipeLikes($model->recipe_id) ?>
                                                <div class="glyphicon glyphicon-thumbs-up"></div>
                                            </div>
                                            <div class="btn btn-success">
                                                <?= intval($model->getRecipeRates($model->recipe_id)) ?>
                                                <div class="glyphicon glyphicon-star"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <?php } ?>
                    </div>
                </div>

            <?php } ?><!-- for -->
        </div>
    </div>


</div><!-- site-index -->



<?php $style = <<< CSS

.cat {
    color: rgb(255,127,39);
}

.padding-0 {
    padding-left: 0;
    padding-right: 0;
}

.image {
   position: relative;
   width: 100%; /* for IE 6 */
   max-height: 218px;
   overflow: hidden;
}
.img-container {
    max-height: 147px;
    overflow: hidden;
}

.image:hover {
    z-index: 100;
}

h2 {
   position: absolute;
   bottom: 0;
   left: 0;
}

h2 span {
   color: white;
   font: bold 24px/45px Helvetica, Sans-Serif;
   letter-spacing: -1px;
   background: rgb(0, 0, 0); /* fallback color */
   background: rgba(0, 0, 0, 0.7);
   padding: 10px;
}

ul {
    background: rgb(34, 34, 34);
}

li.nav-item, li.active {
    padding: 0;
    background: rgb(34, 34, 34);
}

.nav-pills > li > a {
    border-radius: 0;
    color: #999;
    background: rgb(34, 34, 34);
}

.nav-pills > li > a:hover {
    color: #fff;
    background: rgb(34, 34, 34);
}

.nav-pills > li.active > a,
.nav-pills > li.active > a:hover,
.nav-pills > li.active > a:focus {
    background: #000;
}

.nav-pills > li.active > a:hover {
    color: #fff;
    background: rgb(0, 0, 0);
}

CSS;
$this->registerCss($style);
?>
