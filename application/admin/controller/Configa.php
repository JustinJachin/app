<?php
namespace app\admin\controller;
use app\admin\model\Configa as ConfigaModel;
use app\admin\controller\Base;
/**
* 图片上传
*/
class Configa extends Base
{
	public function lst(){
		return $this->fetch('lst');
	}
}