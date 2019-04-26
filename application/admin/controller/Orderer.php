<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 3/11/2018
 * Time: 3:48 PM
 */

namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\Orderer as OrdererModel;


class Orderer extends  Base
{
    public  function  lst(){
        $model=new Orderer();
        $list=db('user')->where('power',1)->paginate(10);
        $this->assign('list',$list);
        return $this->view ->fetch('lst');
    }
    public function check(){
        $id=input("id");
        $users=db('user')->where('power',1)->find($id);
        $this->assign('users',$users);
        return $this->fetch('check');
    }
    public function del(){
        $id=input('id');
        if(db('user')->delete(input('id'))){
             $this->success('删除接单者成功，正在为您跳转...','lst','',1);
        }else{
            $this->error('删除接单者失败，正在为您跳转...','','',1);
        }
    }

}