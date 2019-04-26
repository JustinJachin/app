<?php
namespace app\api\controller\v1;
use app\api\model\Base;
use app\common;
use app\api\model\Mmorder as MmorderModel;
/**
* 商家所有状态查询
*/
class Mmorder extends Base
{
	public function index(){
		if (request()->ispost()) {
			$mmorder=new Mmorder();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$user=db('indent')->where('merchant_id','=',$data['id'])->order('creat_time desc')->select();
			if($user){
				$i=0;
				foreach ($user as $v) {
					$usermerchant=db('user')->where('id','=',$user[$i]['merchant_id'])->find();
					$userorder=db('user')->where('id','=',$user[$i]['delivery_id'])->find();	
						foreach ($v as $key => $value) {
							if("$key"=='creat_time'){
								
								$order[$i]['creat_time']=date('m-d h:i',$value);
							}
							if("$key"=='finish_time'){
								$order[$i]['finish_time']=date('m-d h:i',$value);
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
				return usershow(0,'无该商家订单',null);
			}
		}
	}
	
}