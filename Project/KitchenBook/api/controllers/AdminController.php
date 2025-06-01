<?php

namespace api\controllers;

use yii\rest\ActiveController;
use common\models\Admin;

class AdminController extends ActiveController
{
    
    public $modelClass = 'backend\models\Admin';

}
