<?php
namespace app\api\controller\v1;
use app\api\model\Cancellation as CancellationModel;
use app\api\model\Base;
use app\common;
/**
* 修改订单
*/
class Cancellation extends Base
{
	public function index(){
		if(request()->ispost()){
			$cancellation=new CancellationModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$order=db('indent')->where('id','=',$data['id'])->select();
			if($order){
				
				$num=db('indent')->where('id','=',$data['id'])->update(['order_status' => $data['status']]);
				
				if($num){
					return show(1,'修改订单成功');
				}else{
					return show(0,'修改订单失败');
				}
			}else{
				return show(0,'无该订单记录');
			}

		}
	}
	
}