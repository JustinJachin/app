<?php
namespace app\api\model;
use think\Model;
/**
* 头像修改
*/
class Pic extends Model
{
	
	public function index($data){
		$user=db('user')->where('id','=',$data['id'])->find();
		
		if($user){
			return $user['id'];
		}else{
			return 0;
		}
	}
}