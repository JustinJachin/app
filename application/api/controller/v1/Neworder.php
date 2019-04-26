<?php
namespace app\api\controller\v1;
use app\api\model\Base;
use app\common;
use app\api\model\Neworder as NeworderModel;
/**
* 新增订单
*/
class Neworder extends Base
{
	
	public function index(){
		if(request()->ispost()){
			$neworder=new NeworderModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$date=[
				'start'=>$data['start'],
				'bourn'=>$data['bourn'],
				'delivery_distance'=>$data['distance'],
				'merchant_id'=>$data['merchant_id'],
				'consignee'=>$data['consignee'],
				'consignee_phone'=>$data['consignee_phone'],
				'cash'=>$data['cash'],
				'orderNote'=>$data['orderNote'],
				'orderclass'=>$data['orderclass'],
				'city'=>$data['city'],
				'creat_time'=>time()
			];
			$money=db('user')->where('id','=',$data['merchant_id'])->find();
			$moneys=$money['money']-$data['cash'];
			if($moneys<=0){
				return show(0,'创建订单失败');
			}else{
				if(db('indent')->insert($date)){
					$dats=[
						'oid'=>db('indent')->getLastInsID(),
						'money'=>$data['cash'],
						'deduct'=>$data['cash']*0.8,
						'income'=>$data['cash']*0.2,
					];
					db('deal')->insert($dats);
					db('user')->where('id',$data['merchant_id'])->update(['money' =>$moneys]);
					return show(1,'创建订单成功');							
				}else{
					return show(0,'创建订单失败');
				}
			}
		}
	}
}