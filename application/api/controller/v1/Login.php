<?php
/**
 * 登录接口
 */

namespace app\api\controller\v1;
use app\api\model\Base;
use app\api\model\User;
use app\common;
class Login extends  Base
{
    public function index(){
        if(request()->isPost()){
            $user=new User();
            $data = file_get_contents('php://input');
//            $data='{"phonenum":"15689074552","password":"25d55ad283aa400af464c76d713c07ad"}';
//            echo $data;exit;
            $date=json_decode($data,true);
//            $data=[
//                'phonenum'=>
//            ];
//            dump($date);exit;
            $num=$user->login($date);
            if($num==3){
//                $userdata=
                return show(1,'验证通过');
            }else{
                return show(0,'验证不通过');
            }

        }
    }
}