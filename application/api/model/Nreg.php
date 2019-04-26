<?php
/**
* 没注册时候，手机号注册
*/
namespace app\api\model;
use think\Model;

class Nreg extends Model
{
	
	public function index($data){
		$user=db('user')->where('phonenum','=',$data['phonenum'])->find();
		if($user){
			return 1;
		}else{
			return 0;
		}
	}
}