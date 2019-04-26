<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
// function json($code,$msg="",$count,$data=array()){
//     $result=array(
//         'code'=>$code,
//         'msg'=>$msg,
//         'count'=>$count,
//         'data'=>$data
//     );
//     //输出json
//     echo json_encode($result);
//     exit;
// }
/*
*通用化api接口数据输出
*@param int $status 业务状态码
*@param string $message 信息提示
*@param [] $data 数据
*@param int $httpCode http状态码
*@param $array  
*
*
*
*/
// function show($status,$message,$data=[],$httpCode=200){
function show($status,$message,$httpCode=200){
	$data= [
			'status'=>$status,
			'message'=>$message,
			// 'data'=>$data,
		];
	return json($data,$httpCode);
}
function usershow($status,$message,$data=[],$httpCode=200){
	$date=[
		'status'=>$status,
		'message'=>$message,
		 'data'=>$data,
	];
	return json($date,$httpCode);
}
function ordershow($status,$message,$data=[],$user=[],$httpCode=200){
	$date=[
		'status'=>$status,
		'message'=>$message,
		 'data'=>$data,
		 'user'=>$user,
	];
	return json($date,$httpCode);
}