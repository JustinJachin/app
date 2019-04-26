<?php
namespace app\api\controller\v1;
use app\api\model\Base;
use app\commont;
use app\api\model\Morder as MorderModel;
/**
* 商家单个状态订单查询
*/
class Morder extends Base
{
	public function index(){
		if(request()->ispost()){
			$morder=new Morder();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$user=db('indent')->where('merchant_id','=',$data['id'])->select();
			if($user){
				$order=db('indent')->where('merchant_id','=',$data['id'])->where('order_status','=',$data['statu'])->order('creat_time desc')->select();
				if($order){

					$i=0;
					foreach ($order as $v1) {
						$usermerchant=db('user')->where('id','=',$order[$i]['merchant_id'])->find();
						$userorder=db('user')->where('id','=',$order[$i]['delivery_id'])->find();	
						foreach ($v1 as $key => $value) {
							if("$key"=='creat_time'){
								
								$order[$i]['creat_time']=date('m-d h:i',$value);
							}
							if("$key"=='finish_time'){
								$order[$i]['finish_time']=date('m-d h:i',$value);
							}
							$order[$i]['merchant_name']=$usermerchant['username'];
							$order[$i]['merchant_phone']=$usermerchant['phonenum'];
							$order[$i]['order_name']=$userorder['username'];
							$order[$i]['order_phone']=$userorder['phonenum'];
							
						}
						
						$i++;
					}

					return usershow(1,'有订单信息',$order);
				}else{
					return usershow(1,'无订单信息',null);
				}
			}else{
				return usershow(1,'无该商家订单',null);
			}
		}
	}
	
}