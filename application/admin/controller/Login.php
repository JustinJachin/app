<?php
namespace app\Admin\controller;
use think\Controller;
use app\admin\model\Admin;
class Login extends Controller
{
    public function index()
    {
        if(request()->isPost()){
            $admin=new Admin();
            $data=input('post.');
            $num=$admin->login($data);
            if($num==3){
                $this->success('信息正确，正在为您跳转...','index/index','',1);
            }elseif($num==4){
                $this->error('验证码错误，正在为您跳转...','','',2);
            }else if($num==5){
                $this->error('验证码不能为空，正在为您跳转...','','',2);
            } else{
                $this->error('用户名或者密码错误，正在为您跳转...','','',2);
            }

        }
        return $this->fetch('login');
    }
}