<?php
namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\User as UserModel;
use think\File;

class User extends Base
{
    public function lst()
    {
        $model=new UserModel();
        $list = db('user')->where('power',0)->paginate(6);
        // $list = UserModel::paginate(5);
        $this->assign('list',$list);
        return $this->fetch('lst');
    }
    public function add()
    {
        if(request()->isPost()){
            //将表单提交上来的数据存到$data
            $data=[
                'username' => input('username'),
                'password' => input('password'),
                'sex'=>input('sex'),
                'age'=>input('age'),
                'phonenum'=>input('phonenum'),
                'email'=>input('email'),
                'creattime' => time(),
            ];
//            dump($data);die;
            //上传图片，
            if($_FILES['pic']['tmp_name']){
                $file=request()->file('pic');
                //获取图片路径
                $info=$file->move(ROOT_PATH . 'public' . DS . 'static/admin/uploads');
                //将路径存到数据库中
                $data['pic']='/uploads/'.$info->getSaveName();
            }


            $validate = \think\Loader::validate('User');
            //验证数组中数据是否符合规则
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError());
                die;
            }
            //将用户密码加密
            $data['password']=md5( $data['password']);
            //然后写入数据库
            if(db('user')->insert($data)){
                 $this->success('添加用户成功，正在为您跳转...','lst','',1);
        }else{
            $this->error('添加用户失败，正在为您跳转...','','',1);
            }
            return ;
        }
        return $this->fetch('add');
    }
    public function edit()
    {
        $id=input("id");
        $users=db('user')->find($id);
        if(request()->isPost()){
            $data=[
                'id'=>input('id'),
                'username'=>input('username'),
                'sex'=>input('sex'),
                'age'=>input('age'),
                'phonenum'=>input('phonenum'),
                'email'=>input('email'),
            ];
            if (!emptyempty($_SERVER['HTTP_CLIENT_IP']))
            {
                $ip=$_SERVER['HTTP_CLIENT_IP'];
            }
            elseif (!emptyempty($_SERVER['HTTP_X_FORWARDED_FOR']))
                //to check ip is pass from proxy
            {
                $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
            }
            else
            {
                $ip=$_SERVER['REMOTE_ADDR'];
            }
            $data['ip']=$ip;
            if($_FILES['pic']['tmp_name']){
                $file=request()->file('pic');
                //获取图片路径
                $info=$file->move(ROOT_PATH . 'public' . DS . 'static/admin/uploads');
                //将路径存到数据库中
                $data['pic']='/uploads/'.$info->getSaveName();
            }
            if(input('password')){

                $data['password']=input('password');
                $validate = \think\Loader::validate('User');
                if(!$validate->scene('edit')->check($data)){
                    $this->error($validate->getError()); die;
                }
                $data['password']=md5(input('password'));
            }else{
                $validate = \think\Loader::validate('User');
                if(!$validate->scene('editi')->check($data)){
                    $this->error($validate->getError()); die;
                }
                $data['password']=$users['password'];
            }

            $save=db('user')->update($data);
            if($save !== false){
                $this->success('修改用户成功！','lst');
            }else{
                $this->error('修改用户失败！');
            }
            return;
        }
        $this->assign('users',$users);
        return $this->fetch('edit');
    }
    public function check()
    {
        $id=input("id");
        $users=db('user')->find($id);
        $this->assign('users',$users);
        return $this->fetch('check');
    }
    public function del()
    {
        $id=input('id');
        if(db('user')->delete(input('id'))){
             $this->success('删除用户成功，正在为您跳转...','lst','',1);
        }else{
            $this->error('删除用户失败，正在为您跳转...','','',1);
        }
    }
}

