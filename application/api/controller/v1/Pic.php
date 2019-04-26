<?php
namespace app\api\controller\v1;
use app\api\model\Base;
use app\api\model\Pic as PicModel;
use app\common;
/**
* 头像修改
*/
class Pic extends Base
{
	
	public function index(){
		if(request()->ispost()){
			$pic =new PicModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			// dump($data);exit;
			$num=$pic->index($data);
			if($num){
				$numa=db('user')->where('id',$num)->update(['pic' =>$data['pic']]);
				if($numa){
					return show(1,'头像修改成功');
				}else{
					return show(0,'头像修改失败');
				}
			}else{
				return show(0,'无该用户');
			}

		}
	}
}