<?php 

namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\Deal as DealModel;
/**
* 
*/
class Deal extends Base
{
	
	public function lst(){
		$deal=new DealModel();
		$list=DealModel::paginate(10);
		$this->assign('list',$list);
		return $this->fetch('lst');
	}
	public function check(){
		$id=input('id');
		$data=db('deal')->find($id);
		$indent=db('indent')->where('id','=',$data['oid'])->find();
        $indentmerchant=db("user")->where('id',$indent['merchant_id'])->find();
        $indentorder=db("user")->where('id',$indent['delivery_id'])->find();
        $this->assign('indentorder',$indentorder);
        $this->assign('indent',$indent);
        $this->assign('indentmerchant',$indentmerchant);
		$this->assign('date',$data);
		return $this->fetch('check');
	}
	// public function del(){
	// 	$id=input('id');
	// 	if(db('deal')->delete(input('id'))){
	// 		$this->success('删除成功');
	// 	}else{
			
	// 	}
	// }
}