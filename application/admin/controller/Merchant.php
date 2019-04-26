<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 3/11/2018
 * Time: 1:04 PM
 */

namespace app\admin\controller;
use app\admin\controller\Base;
use app\Admin\model\Merchant as MerchantModel;
use think\Db;


class Merchant extends  Base
{
    public function lst()
    {

        $model=new MerchantModel();

        $list = db('user')->where('power',2)->paginate(10);
        
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function check()
    {
        $id=input("id");
        $users=db('user')->where('power',2)->find($id);
        $this->assign('users',$users);
        return $this->fetch('check');
    }
    public function del()
    {
        $id=input('id');
        if(db('user')->delete(input('id'))){
             $this->success('删除商家成功，正在为您跳转...','lst','',1);
        }else{
            $this->error('删除商家失败，正在为您跳转...','','',1);
        }
    }

}