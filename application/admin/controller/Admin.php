<?php
namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\Admin as AdminModel;

class Admin extends Base
{
    public function lst()
    {
//        dump(session('uid'));die;
        $model=new AdminModel();

        if(session('role')==1){
            $list =AdminModel::paginate(10);
        }else{
            $list=db('admin')->where('id',session('uid'))->select();
        }
        $this->assign('list',$list);
        return $this->fetch('lst');
    }
    public function add()
    {
        if(request()->isPost()){
            $data=[
                'adminname' => input('adminname'),
                'password' => input('password'),
                'creattime' => time(),

            ];
            
            $validate = \think\Loader::validate('Admin');

            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());die;
            }
            $data['password']=md5( $data['password']);
            if(db('admin')->insert($data)){
                // return $this -> success('添加管理员成功！','lst');
                return $this->success('添加管理员成功，正在为您跳转...','lst','',1);
            }else{
                return $this -> error('添加管理员失败，正在为您跳转...','','',1);
            }
            return ;
        }
        return $this->fetch('add');
    }
    public function edit()
    {
        $id=input("id");
        $admins=db('admin')->find($id);
        if(request()->isPost()){
            $data=[
                'id'=>input('id'),
                'adminname'=>input('adminname'),
            ];
            if(input('password')){
                $data['password']=md5(input('password'));
            }else{
                $data['password']=$admins['password'];
            }
            $validate = \think\Loader::validate('Admin');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError()); die;
            }
            $save=db('admin')->update($data);
            if($save !== false){
                $this->success('修改管理员成功，正在为您跳转...','lst','',1);
            }else{
                $this->error('修改管理员失败，正在为您跳转...','','',1);
            }
            return;
        }
        $this->assign('admins',$admins);
        return $this->fetch('edit');
    }
    public function del()
    {
    	$id=input('id');
        if($id!=1){
            if(db('admin')->delete(input('id'))){
                $this->success('删除管理员成功，正在为您跳转...','lst','',1);
            }else{
                $this->error('删除管理员失败，正在为您跳转...','','',1);
            }
        }else{
            $this->error('初始化管理员不能删除！','','',1);
        }
    }
    public function logout(){
//        echo "11";
//        die;
        session(null);
        $this->success('退出成功!','Login/index','',1);
    }
}

