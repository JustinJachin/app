<?php
namespace app\admin\model;
use think\Model;

class Admin extends Model
{

    public function login($data){
        $captcha = new \think\captcha\Captcha();
        if (!$captcha->check($data['code'])) {
            if($data['code']==''){
                return 5;
            }else {
                return 4;
            }
        }
        $user=db('admin')->where('adminname','=',$data['adminname'])->find();
        if($user){
            if($user['password'] == md5($data['password'])){
                session('adminname',$user['adminname']);
                session('uid',$user['id']);
                session('role',$user['role']);
                return 3; //信息正确
            }else{
                return 2; //密码错误
            }
        }else{
            return 1; //用户不存在
        }
    }
}
