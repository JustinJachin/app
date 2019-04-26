<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

//return [
//    '__pattern__' => [
//        'name' => '\w+',
//    ],
//    '[hello]'     => [
//        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
//        ':name' => ['index/hello', ['method' => 'post']],
//    ],
//
//];
use think\Route;
Route::post('api/:ver/Login','api/:ver.login/index');//登录接口
Route::post('api/:ver/Reg','api/:ver.reg/index');//注册接口
Route::post('api/:ver/Infomation','api/:ver.infomation/index');//获取个人信息接口
Route::get('api/:ver/Arcticle','api/:ver.arcticle/index');//获取新闻所有信息接口
Route::get('api/:ver/Articlelist','api/:ver.articlelist/index');//推荐文章接口
Route::post('api/:ver/ArticleDetail','api/:ver.articledetail/index');//推荐文章接口
Route::post('api/:ver/ArticleComment','api/:ver.articlecomment/index');//推荐评论接口
Route::post('api/:ver/Postcomment','api/:ver.postcomment/index');//接受前台评论接口
Route::post('api/:ver/Articlecommentgood','api/:ver.articlecommentgood/index');//接受前台评论接口
Route::get('api/:ver/Goods','api/:ver.goods/index');//商品兑换接口
Route::post('api/:ver/Match','api/:ver.match/index');//一级菜单查询接口
Route::get('api/:ver/Index','api/:ver.index/index');//首页接口
Route::post('api/:ver/Getemail','api/:ver.getemail/index');//邮箱手机号接口
Route::post('api/:ver/Gettruename','api/:ver.gettruename/index');//信息修改接口
Route::post('api/:ver/Pic','api/:ver.pic/index');//头像上传接口