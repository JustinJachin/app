<?php
namespace app\api\model;
use think\Model;
/**
* 
*/
class Addorder extends Model
{
	public function index($data){
		$num=db('indent')->where('id','=',$data['id'])->select();
		if($num){
			return 1;
		}else{
			return 0;
		}
	}	
}