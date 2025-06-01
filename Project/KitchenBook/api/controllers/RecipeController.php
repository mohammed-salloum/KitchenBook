<?php

namespace api\controllers;

use yii\rest\ActiveController;
use common\models\RecipeIngredient;

class RecipeController extends ActiveController
{
    public $modelClass = 'common\models\Recipe';

    
}
