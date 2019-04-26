<?php
/**
 * Created by PhpStorm.
 * User: jachin
 * Date: 2018/3/24
 * Time: 9:34
 */
namespace  app\api\validate;
use think\Validate;
class Reg extends  Validate
{
    protected  $rule=[
        'phonenum'=>'unique:user',
//        'username'=>'unique:user',
//        'password'=>'require|max:20|min:8'
    ];
    protected  $message=[
        'phonenum.unique'=>'该手机号已注册',
//        'username.unique'=>'该用户名已被人使用',
    ];
    protected  $scene=[
        'reg'=>['phonenum']
    ];
}