<?php
/**
* 没注册时候，手机号注册
*/

namespace app\api\controller\v1;
use app\api\model\Base;
use app\common;
use app\api\model\Nreg as NregModel;
class Nreg extends Base
{
	
	public function index(){
		if(request()->ispost()){
			$nreg=new NregModel();
			$data=file_get_contents('php://input');
			$data=json_decode($data,true);
			$num=$nreg->index($data);
			if($num==1){
				return show(1,'已注册');
			}else{
				return show(0,'未注册');
			}
		}
	}
}