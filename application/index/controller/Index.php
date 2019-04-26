<?php
namespace app\index\controller;
use think\Controller;
//use think\Request;
use app\index\model\Index as IndexModel;

class Index extends Controller
{
    public function index()
    {

    	// $index=new IndexModel();
        return $this->fetch();
        // return "前端";
    }
}
