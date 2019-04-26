<?php
/**
 * 注册接口
 */


namespace app\api\controller\v1;
use app\api\model\Base;
use app\common;
use app\api\model\Reg as RegModel;
//use app\api\validate\Reg as RegValidate;

class Reg extends  Base
{
    public function add(){
        if(request()->isPost()){
            $data = file_get_contents('php://input');//获取app端传输过来的json数据
            $data=json_decode($data,true);//将json解析为数组类型
            $datas=[
               'username'=>$data['phonenum'],
                'phonenum'=>$data['phonenum'],

                'password'=>$data['password'],
                'creattime'=>time(),
            ];
            $validate= \think\Loader::validate('Reg');//验证手机号是否被注册过
            if(!$validate->scene('reg')->check($datas)){
                return show(0,'手机号已注册');
            }
            if(db('user')->insert($datas)){
                return show(1,'用户注册成功');
            }else{
                return show(0,'用户注册失败');
            }
        }
    }
}