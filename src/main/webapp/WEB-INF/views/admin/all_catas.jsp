<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 主页</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="/acs/common/hplus-4.0/favicon.ico">
    <link href="/acs/common/hplus-4.0/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Morris -->
    <link href="/acs/common/hplus-4.0/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="/acs/common/hplus-4.0/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="/acs/common/hplus-4.0/css/animate.css" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">

<div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基本
                        <small>分类，查找</small>
                    </h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="table_data_tables.html#">选项1</a>
                            </li>
                            <li>
                                <a href="table_data_tables.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid"><div class="row"><div class="col-sm-6"><div class="dataTables_length" id="DataTables_Table_0_length"><label>每页 <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条记录</label></div></div><div class="col-sm-6"><div id="DataTables_Table_0_filter" class="dataTables_filter"><label>查找：<input type="search" class="form-control input-sm" aria-controls="DataTables_Table_0"></label></div></div></div><table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                        <thead>
                        <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="渲染引擎：激活排序列升序" style="width: 195px;">序号</th>
                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="浏览器：激活排序列升序" style="width: 331px;">标题</th>
                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="平台：激活排序列升序" style="width: 300px;">所属类型编号</th>
                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="引擎版本：激活排序列升序" style="width: 131px;">点击量</th>
                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="CSS等级：激活排序列升序" style="width: 126px;">备注</th>
                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="CSS等级：激活排序列升序" style="width: 126px;">创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach items="${allCatas}" var="data">
                        <tr class="gradeA odd">
							<td class="sorting_1">${data.id }</td>
                            <td class=" ">${data.title }</td>
                            <td class=" "><a href="/manager/cata/${data.rootId }.html" target="_blank">${data.rootId }</a></td>
                            <td class="center ">${data.number }</td>
                            <td class="center ">${data.remark }</td>
                             <td class="center ">${data.createTime }</td>
                        </tr>
                        </c:forEach>
	                        <!--  
		                        <tr class="gradeA even">
		                            <td class="sorting_1">${data.id }</td>
		                            <td class=" ">Firefox 1.0</td>
		                            <td class=" ">Win 98+ / OSX.2+</td>
		                            <td class="center ">1.7</td>
		                            <td class="center ">A</td>
		                        </tr>
	                        -->
                        </tbody>
                        <tfoot>
                        <tr><th rowspan="1" colspan="1">序号</th><th rowspan="1" colspan="1">标题</th><th rowspan="1" colspan="1">所属类型编号</th><th rowspan="1" colspan="1">点击量</th><th rowspan="1" colspan="1">备注</th><th rowspan="1" colspan="1">创建时间</th></tr>
                        </tfoot>
                    </table><div class="row"><div class="col-sm-6"><div class="dataTables_info" id="DataTables_Table_0_info" role="alert" aria-live="polite" aria-relevant="all">显示 1 到 10 项，共 57 项</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_previous"><a href="#">上一页</a></li><li class="paginate_button active" aria-controls="DataTables_Table_0" tabindex="0"><a href="#">1</a></li><li class="paginate_button " aria-controls="DataTables_Table_0" tabindex="0"><a href="#">2</a></li><li class="paginate_button " aria-controls="DataTables_Table_0" tabindex="0"><a href="#">3</a></li><li class="paginate_button " aria-controls="DataTables_Table_0" tabindex="0"><a href="#">4</a></li><li class="paginate_button " aria-controls="DataTables_Table_0" tabindex="0"><a href="#">5</a></li><li class="paginate_button " aria-controls="DataTables_Table_0" tabindex="0"><a href="#">6</a></li><li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_next"><a href="#">下一页</a></li></ul></div></div></div></div>

                </div>
            </div>
        </div>
    </div>
    
	</div>


</body>
</html>