<?php
namespace app\api\controller\v1;
use app\api\model\Addorder as AddprderModel;
use app\common;
use app\api\model\Base;
/**
* 在订单表中添加接单者id
*/
class Addorder extends Base
{
	
	public function index(){
		if(request()->ispost()){
			$addorder=new AddprderModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			// dump($data);exit;
			$num=$addorder->index($data);
			if($num){
				$date=[
					'delivery_id'=>$data['delivery_id'],
				];
				$datas=db('indent')->where('id',$data['id'])->find();
				// dump($datas);exit;
				if($datas['order_status']!=0){
					return show(0,'该订单已被人接');
				}else{
					$indent=db('indent')->where('id',$data['id'])->update($date);
					// dump($indent);exit;

					$da=db('indent')->where('id',$data['id'])->setInc('order_status');
					$te=db('user')->where('id','=',$data['id'])->setInc('count');
					dump($te);
					if($indent&&$te){
						return show(1,'接单成功');
					}else{
						return show(0,'接单失败');
					}
				}
					
			}else{
				return show(0,'无该订单');
			}
		}
	}
}