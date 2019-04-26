<?php
namespace app\admin\controller;
use app\admin\model\Picture as PictureModel;
use app\admin\controller\Base;
/**
* 图片上传
*/
class Picture extends Base
{
	public function lst(){
		return $this->fetch('lst');
	}
}