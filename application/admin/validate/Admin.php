<?php
namespace app\admin\validate;
use think\Validate;
class Admin extends Validate
{

	protected $rule = [
        'adminname'=>'require|max:25|unique:admin',
		'password'=>'require|max:20|min:8',

    ];

    protected $message  =   [
        'adminname.require'=>'管理员名称必须填写',
		'adminname.max'=>'管理员名称长度不得大于25位',
		'adminname.unique'=>'管理员名称不得重复',
		'password.require'=>'密码名称必须填写',
		'password.max'=>'密码长度不得大于20位',
        'password.max'=>'密码长度不得小于8位',

    ];

    protected $scene = [
        'add' => ['adminname'=>'require|unique:admin','password'],
		'edit' => ['adminname'=>'require|unique:admin'],
    ];

}