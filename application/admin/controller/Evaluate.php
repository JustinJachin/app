<?php
namespace app\admin\controller;
use app\admin\controller\Base;
use app\admin\model\Evaluate as EvaluateModel;
/**
* 评价
*/
class Evaluate extends Base
{
	
	public function lst(){
		$evaluate=new EvaluateModel();
		$list=EvaluateModel::paginate(10);
		$this->assign('list',$list);
		return $this->fetch('lst');
	}
	public function check(){
		$id=input("id");
		$evaluate=db('evaluate')->find($id);
		$indent=db('indent')->where('id','=',$evaluate['order_id'])->find();
		// $user=db('user')->where('id','=',$indent['merchant_id'])->find();
		$user=db('user')->where('id','=',$indent['delivery_id'])->find();
		$overall=$user['overall']/$user['count'];
		$this->assign('overall',$overall);
		$this->assign('evaluate',$evaluate);
		$this->assign('indent',$indent);
		$this->assign('user',$user);
		return $this->fetch('check');
	}
}