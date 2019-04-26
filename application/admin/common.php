<?php
/**
 * Created by PhpStorm.
 * User: jachin
 * Date: 2018/3/18
 * Time: 17:21
 */
namespace  app\admin\common;

class common
{
    function json($code,$msg="",$count,$data=array()){
        $result=array(
            'code'=>$code,
            'msg'=>$msg,
            'count'=>$count,
            'data'=>$data
        );
        //输出json
        echo json_encode($result);
        exit;
    }
}