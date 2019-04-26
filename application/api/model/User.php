<?php
/**
 * 登录接口
 */


namespace app\api\model;
use think\Model;

class User extends  Model
{
    public function login($data){
        $user=db('user')->where('phonenum','=',$data['phonenum'])->find();
        if($user){
            if($user['password']==$data['password']){
                return 3;//信息正确
            }else{
                return 2;//密码错误
            }
        }else{
            return 1;//用户不存在
        }
    }
}