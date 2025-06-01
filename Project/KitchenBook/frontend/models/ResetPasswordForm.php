<?php
namespace frontend\models;

use yii\base\InvalidArgumentException;
use yii\base\Model;
use common\models\User;

/**
 * {@inheritdoc}
 */
class ResetPasswordForm  extends \common\models\ResetPasswordForm
{
    /**
     * {@inheritdoc}
     */
    protected static function getUserClass()
    {
        return Member::class;
    }
}
