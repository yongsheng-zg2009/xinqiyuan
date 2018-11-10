<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 富文本编辑器</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="/acs/common/hplus-4.0/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/animate.css" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="/acs/common/hplus-4.0/css/style.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
	   <div class="row">
	   
	        <div class="col-sm-12">
	            <div class="ibox float-e-margins">
	                <div class="ibox-title">
	                    <h5>所有表单元素
	                        <small>包括自定义样式的复选和单选按钮</small>
	                    </h5>
	                    <div class="ibox-tools">
	                        <a class="collapse-link">
	                            <i class="fa fa-chevron-up"></i>
	                        </a>
	                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
	                            <i class="fa fa-wrench"></i>
	                        </a>
	                        <ul class="dropdown-menu dropdown-user">
	                            <li><a href="form_basic.html#">选项1</a></li>
	                            <li><a href="form_basic.html#">选项2</a></li>
	                        </ul>
	                        <a class="close-link">
	                            <i class="fa fa-times"></i>
	                        </a>
	                    </div>
	                </div>
	                <div class="ibox-content">
	                    <form method="post" class="form-horizontal" id="addNewsForm" action="">
	                    
     
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">标题</label>
	
	                            <div class="col-sm-10">
	                                <input type="text" class="form-control" value="${newsData.title }" name="title" id="title">
	                            </div>
	                        </div>
	                        <div class="hr-line-dashed"></div>
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">选择分类</label>
	
	                            <div class="col-sm-10">
	                                <select class="form-control m-b" name="cataId" id="cataId">
	                                <c:forEach items="${allCatas}" var="data">
	                              		  <option value="${data.rootId }">${data.rootId }- ${data.title }</option>
	                                </c:forEach>
	                                </select>
	                            </div>
	                        </div>
	                        
	                        <div class="hr-line-dashed"></div>
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">宣传图片</label>
	
	                            <div class="col-sm-10">



 									            <div class="ibox float-e-margins">
									                <div class="ibox-title">
									                    <h5>文件上传</h5>
									                    <div class="ibox-tools">
									                        <a class="collapse-link">
									                            <i class="fa fa-chevron-up"></i>
									                        </a>
									                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_file_upload.html#">
									                            <i class="fa fa-wrench"></i>
									                        </a>
									                        <ul class="dropdown-menu dropdown-user">
									                            <li>
									                                <a href="form_file_upload.html#">选项1</a>
									                            </li>
									                            <li>
									                                <a href="form_file_upload.html#">选项2</a>
									                            </li>
									                        </ul>
									                        <a class="close-link">
									                            <i class="fa fa-times"></i>
									                        </a>
									                    </div>
									                </div>
									                <div class="ibox-content gray-bg">
									                    <form id="my-awesome-dropzone" class="dropzone" action="form_file_upload.html#">
									                        <div class="dropzone-previews"></div>
									                        <button type="submit" class="btn btn-primary pull-right">提交</button>
									                    </form>
									                </div>
									            </div>
	                            </div>
	                        </div>
	                        
	                        <div class="hr-line-dashed"></div>
	                        <h5><b>添加内容文本：</b></h5>
	                          <div class="summernote" id="summernoteContent">
	                       		 ${newsData.content }
	                       	  </div>
	                        <textarea name="newsContent" id="newsContent" name="newsContent" hidden="hiden"></textarea>
	                        <div class="hr-line-dashed"></div>

                
                
	                        <div class="form-group">
	                            <div class="col-sm-4 col-sm-offset-2">
	                                <button class="btn btn-primary" type="button" onclick="javascript:dosubmit();">保存内容</button>
	                                <button class="btn btn-white"  id="btn_cancle">取消</button>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>

    <!-- 全局js -->
    <script src="/acs/common/hplus-4.0/js/jquery.min.js?v=2.1.4"></script>
    <script src="/acs/common/hplus-4.0/js/bootstrap.min.js?v=3.3.5"></script>
    <!-- 自定义js -->
    <script src="/acs/common/hplus-4.0/js/content.js?v=1.0.0"></script>
    <!-- SUMMERNOTE -->
    <script src="/acs/common/hplus-4.0/js/plugins/summernote/summernote.min.js"></script>
    <script src="/acs/common/hplus-4.0/js/plugins/summernote/summernote-zh-CN.js"></script>
    <script>
        $(document).ready(function () {

        	
            $('.summernote').summernote({
                lang: 'zh-CN'
            });
            // 取消按钮
            $('#btn_cancle').on("click",function(){
            	window.close();
            })
        });
        var edit = function () {
            $("#eg").addClass("no-padding");
            $('.click2edit').summernote({
                lang: 'zh-CN',
                focus: true
            });
        };
        var save = function () {
            $("#eg").removeClass("no-padding");
            var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
            $('.click2edit').destroy();
        };
        
        function dosubmit(){
        	var summernoteContent = $("#summernoteContent").html();
        	$("#newsContent").val($(".note-editable").html());
        //	console.log($("#title").val());
        //	console.log($("#cataId").val());
        //	console.log($("#newsContent").val());

         	var newWind = window.open("","_blank");
       		var params = {cataId:$("#cataId").val(),title:$("#title").val(),newsContent:$("#newsContent").val()};
       		$.ajax({
                url:"/manager/addNewsAjax",
                type:"post",
                data:params,
                success:function(data){
                	var rs = $.parseJSON( data );
                 	if(rs.success){
                		 window.close();
                		 alert("资源添加成功");
                         newWind.location.href="/manager/listall/news"
                	}else{
                		alert(rs.message);
                	}  
                },
                error:function(e){
                    alert("错误！！");
                    newWind.close();
                }
            }); 
        }
    </script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->
</body>

</html>