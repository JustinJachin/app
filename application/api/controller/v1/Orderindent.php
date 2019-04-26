<?php
namespace app\api\controller\v1;
use app\api\model\Orderindent as OrderindentModel;
use app\common;
use app\api\model\Base;
/**
* 接单者单个状态条数查询
*/
class Orderindent extends Base
{
	public function index(){
		if(request()->ispost()){
			$orderindent=new OrderindentModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$order=db('indent')->where('delivery_id','=',$data['id'])->select();
			if($order){
				$user=db('indent')->where('delivery_id','=',$data['id'])->where('order_status','=',$data['status'])->order('creat_time desc')->select();
				
				if($user){
					$i=0;
					foreach ($user as $v1) {
						$usermerchant=db('user')->where('id','=',$user[$i]['merchant_id'])->find();
						$userorder=db('user')->where('id','=',$user[$i]['delivery_id'])->find();	
						foreach ($v1 as $key => $value) {
							if("$key"=='creat_time'){		
								$user[$i]['creat_time']=date('m-d h:i',$value);
							}
							if("$key"=='finish_time'){
								$user[$i]['finish_time']=date('m-d h:i',$value);
							}
							$user[$i]['merchant_name']=$usermerchant['username'];
							$user[$i]['merchant_phone']=$usermerchant['phonenum'];
							$user[$i]['order_name']=$userorder['username'];
							$user[$i]['order_phone']=$userorder['phonenum'];						
						}
						
						$i++;
					}
					return usershow(1,'有订单信息',$user);
				}else{
					return usershow(0,'无订单信息',null);
				}
			}else{
				return usershow(0,'无该配送员',null);
			}
		}
	}
}