<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>+ 新起源公司 - 管理系统</title>
     
  <!-- <base href="http://static.cyxsr.com/sr/common/hplus-4.0/" /> -->
    <base href="/acs/common/hplus-4.0/" />

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="/acs/common/hplus-4.0/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/animate.css" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/style.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="profile.html">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="login.html">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">内容管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        
                            <li>
                                <a class="J_menuItem" href="/manager/listall/catas" data-index="0">资源类型管理</a>
                            </li> 
                            <!--
                            <li>
                                <a class="J_menuItem" href="/manager/listall/news">添加资源</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="index_v3.html">主页示例三</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v4.html">主页示例四</a>
                            </li>
                            <li>
                                <a href="index_v5.html" target="_blank">主页示例五</a>
                            </li> -->
                        </ul>

                    </li>

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
     	<jsp:include page="others.jsp"></jsp:include>
    </div>

    <!-- 全局js -->
    <script src="/acs/common/hplus-4.0/js/jquery.min.js?v=2.1.4"></script>
    <script src="/acs/common/hplus-4.0/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/acs/common/hplus-4.0/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/acs/common/hplus-4.0/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/acs/common/hplus-4.0/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hplus.js?v=4.0.0"></script>
    <script type="text/javascript" src="js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>

</body>

</html>