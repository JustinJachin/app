<?php
/**
 * 个人信息接口
 */
namespace app\api\model;
use think\Model;
class Information extends Model{
	public function index($data){
		$user=db('user')->where('phonenum','=',$data['phonenum'])->find();
		if($user){
			return $user['id'];
		}else {
			// $user=db('user')->where('phonenum','=',$dta['phonenum'])->find();
			// if($user){
			// 	return $user['id'];
			// }else{
				return 0;
			// }
			
		}
	} 
}