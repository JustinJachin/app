<?php 
/**
 * 个人信息接口
 */
namespace app\api\controller\v1;
use app\api\model\Base;
use app\api\model\Information as InformationModel;
use app\common;
// use think\controller\Rest;
class Information extends Base{

	public function index(){
	// echo '1111';exit;
		if(request()->ispost()){
	
			$information=new InformationModel();
	
			$data=file_get_contents('php://input');

			$data=json_decode($data,true);
	
			$num=$information->index($data);
			if($num){
				$date=db('user')->where('id',$num)->find();
			
				return usershow(1,'有个人信息',$date);
				// return db('user')->where('id',$num)->find()->toJson();
				// $model->get($id)->toJson();
			 }else{
			 	return usershow(0,'无个人信息',null);
			 }
		}
	}
}