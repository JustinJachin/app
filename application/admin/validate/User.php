<?php
namespace app\admin\validate;
use think\Validate;
class User extends Validate
{

    protected $rule = [
        'username'=>'require|max:25|unique:user',
        'password'=>'require|max:20|min:8',
        'age'   => 'number|between:0,120',
        'sex'   => 'require',
        'email' => 'email',
        'phonenum'=>'max:11|/^1[3-8]{1}[0-9]{9}$/',
//        'pic' => 'image',
    ];

    protected $message  =   [
        'username.require'=>'用户名称必须填写！',
        'username.max'=>'用户名称长度不得大于25位！',
        'username.unique'=>'用户名称不得重复！',
        'password.require'=>'密码名称必须填写！',
        'password.max'=>'密码长度不得大于20位！',
        'password.min'=>'密码长度不得小于8位！',
        'sex'   => '请选择性别！',
        'age.number'   => '年龄必须是数字！',
        'age.between'  => '年龄只能在1-120之间！',
        'email'        => '邮箱格式错误！',
        'phonenum.max'=>'手机号码最多不能超过11个字符！',
        'phonenum'=>'手机号码格式不正确！',
//        'pic'=>'图片格式不正确',
    ];
//场景设置
    protected $scene = [
        'add' => ['username'=>'require|unique:user','password','age','email','phonenum','pic','sex'=>'require'],
        'edit' => ['username'=>'require|unique:user','password'],
        'editi' => ['username'=>'require|unique:user'],

    ];

}