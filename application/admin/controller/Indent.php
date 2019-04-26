<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 3/11/2018
 * Time: 10:17 PM
 */

namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\Indent as IndentModel;

class Indent extends Base
{
    public function  lst()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list=db('indent')->order('creat_time desc')->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lst');
    }
    public function  lsta()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',0)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lsta');
    }
    public function  lstb()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',1)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lstb');
    }
    public function  lstc()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',2)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lstc');
    }
    public function  lstd()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',3)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lstd');
    }
     public function  lste()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',4)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lste');
    }
     public function  lstf()
    {
        $model=new IndentModel();
        // $list= IndentModel::paginate(10);
        $list= db('indent')->order('creat_time desc')->where('order_status',5)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('lstf');
    }
    public function check()
    {
        $id=input("id");
        $indent=db("indent")->find($id);
        // dump($indent);exit;
        $indentmerchant=db("user")->where('id',$indent['merchant_id'])->find();
        $indentorder=db("user")->where('id',$indent['delivery_id'])->find();
        $this->assign('indentorder',$indentorder);
        $this->assign('indent',$indent);
        $this->assign('indentmerchant',$indentmerchant);
        return $this->fetch('check');
    }
    public function del()
    {
        $id=input('id');
        if(db('indent')->delete(input('id'))){
            db('deal')->where('oid','=',input('id'))->delete();
            db('evaluate')->where('order_id','=',input('id'))->delete();
            $this->success('删除订单成功，正在为您跳转...','lsta','',1);
        }else{
            $this->error('删除订单失败，正在为您跳转...','','',1);
        }
    }
    public function edit(){
        $id=input('id');
        // dump($id);exit;
        $dataid=$id;
        $data=db('indent')->where('id',$id)->value('city');

       
        $this->assign('dataid',$dataid);
    
        $list=db('user')->order('overall desc,count desc')->where('city','like',$data)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch('edit');
    }
    public function updates(){
        $id=input('id');
        // dump($id);exit;
        $indent_id=input('indent_id');
        // dump($indent_id);exit;
        $data=db('indent')->where('id',$indent_id)->setField('delivery_id',$id);
        $data1=db('indent')->where('id',$indent_id)->setInc('order_status');
        $data2=db('user')->where('id',$id)->setInc('count');
        // dump($data);exit;
        if($data&&$data1&&$data1){
            $this->success('派单成功，正在为您跳转...','lst','',1);
        }else{
            $this->error('派单失败，正在为您跳转...','lsta','',1);
        }
    }

}