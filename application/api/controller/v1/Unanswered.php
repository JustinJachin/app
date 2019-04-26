<?php
namespace app\api\controller\v1;
use app\common;
use app\api\model\Base;
use app\api\model\Unanswered as UnansweredModel;
/**
* 未接单的单子派送给接单者
*/
class Unanswered extends Base
{
	
	public function index(){
		if(request()->ispost()){
			$unanswered =new UnansweredModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$user=db('indent')->where('city','=',$data['city'])->where('orderclass','=',$data['orderclass'])->where('order_status','=','0')->select();
			
			if($user){
	 			$i=0;
	 			foreach ($user as $v) {
	 				$usermerchant=db('user')->where('id','=',$user[$i]['merchant_id'])->find();
					foreach ($v as $key => $value) {
						if("$key"=='creat_time'){	
							$order[$i]['creat_time']=date('m-d h:i',$value);
						}
						$user[$i]['merchant_name']=$usermerchant['username'];
						$user[$i]['merchant_phone']=$usermerchant['phonenum'];
					}
					$i++;
	 			}
	 			// dump($user);exit;
	 			return usershow(1,'有订单信息',$user);
	 		}else{
	 			return usershow(0,'无相关订单',null);
	 		}
			// if($order){
			// 	return usershow(1,'有相关订单',$order);
			// }else{
			// 	return usershow(0,'无相关订单',null);
			// }
		}
	}
}