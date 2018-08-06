<?php
include("inc/conn.php");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd"><HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>河南贝思特科技有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META http-equiv=Content-Language content=zh-CN>
<meta name="keywords" content="<?=$keywords?>" />
<meta name="description" content="<?=$description?>" />
<link rel=stylesheet type="text/css" href="style/index.css">
<script type="text/javascript" src="inc/flash.js"></script>
<script>
<!--
var AlertInput = "请输入:\n\n";	
function Login(form){
	var mesg = "";
	if(form.name.value == "") mesg += "用　户\n";
	if(form.passwd.value == "") mesg += "密　码\n";
	if(mesg != ""){
		mesg = AlertInput + mesg;
		alert(mesg);
		return false;
	}

//	if (form.language.value !="-") form.Lang.value = form.language.value;
	form.action = "login.php?Cmd=login";
	form.submit();
}

function SelectLang(form){
	language = form.language.value;
	if(language == "-") return false;
	form.Lang.value = language;
	form.action = "login.php?Lang=" + language;
	form.submit();
}
function freset(obj){ 
   obj.reset(); 
} 
  function inputcheck() 
      { 
      if(newDocument.instructNum.value.length==0) 
      { 
        alert("请填写批示编号！"); 
        return false; 
      } 
      if(newDocument.instructNum.value.length>16) 
      { 
        alert("批示编号不能大于25个字符！"); 
        return false; 
      } 
      if(newDocument.procNodeId.value.length==0) 
      { 
        alert("请填写公文文号！"); 
        return false; 
      } 
      if(newDocument.procNodeId.value.length>25) 
      { 
        alert("公文文号不能大于25个字符！"); 
        return false; 
      } 
      if(newDocument.SEND_TO.value.length==0) 
      { 
        alert("请选择批示的领导！"); 
        return false; 
      } 
      if(newDocument.SEND_TO.value.length>16) 
      { 
        alert("批示的领导名字不能大于16个字符！"); 
        return false; 
      } 
       
    newDocument.submit(); 
    return true; 
  }

//-->
</script>

</head>
<body>
<div id=box>
     <div id=mainbox>
<!--pagebegin-->
	 <div id=header>
		<div style="width:982px;">
              <div id=logo>
	         <a href=index.php alt=$nametitle><img src=images/logo.gif></a>
	      </div>
              <div id=tool>
		 <a href=about.php>关于我们</a>&nbsp;|&nbsp;
		 <a href=contact.php>联系我们</a>&nbsp;|&nbsp;
		 <a href=bbs/>交流论坛</a>&nbsp;|&nbsp;
		 <a id="based">繁体中文<Script Language=Javascript Src="Inc/southidcj2f.Js"></Script></a>
	      </div>
		</div>
		<div id=menu>
		<span class=img2></span>
		<ul>
			
			<li><a href=index.php alt="网站首页"><span>网站首页</span></a></li>
			<li><a href=company.php alt="企业介绍"><span>企业介绍</span></a></li>
			<li><a href=news.php alt="新闻资讯">新闻资讯</a></li>
			<li><a href=product.php alt="产品信息">产品信息</a></li>
                        <li><a href=# alt="服务项目">服务项目</a></li>
			<li><a href=# alt="行业软件">行业软件</a></li>
			<li><a href=# alt="解决方案">解决方案</a></li>
			<li><a href=# alt="成功案例">成功案例</a></li>
			<li><a href=download.php alt="下载中心">下载中心</a></li>
			<li><a href=# alt="售后服务">售后服务</a></li>
			<li><a href=guestbook.php alt="客户留言">客户留言</a></li>
			

		</ul>
		<span class=img></span>
		</div>

	 </div>
<div class=nav></div>
        <div id="banner">
	<script language="JavaScript" type="text/javascript">
			writeFlashHTML("_swf=images/inbanner.swf", "_width=982px", "_height=186px" ,"_wmode=transparent");
	</script>
	</div>
<div class=nav></div>
<!--header end-->
<div id=maincontent>
<div id=leftcontent>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
			 <div class=headertit>企业邮箱</div>
				<div class=mail>
				 <ul>
				<form name="login" method="post" action="http://mail.hn-best.net/login.php?Cmd=login" onsubmit="Login(this.form);return false" target=_blank>
				 <li>用户名：<input name="name" type="text" class="input_text" onkeypress="nameStrFilter()" size="15" value="" /><input name="domain" type="hidden" onKeyPress="domainStrFilter()" value="hn-best.net" size="20" /></li>
				<li>密&nbsp;&nbsp;码：<input name="passwd" type="password" class="input_text" size="15" /><input type="hidden" name="Lang" value="zh_CN" /></li>
<li><input type="image" onclick="Login(this.form);return false" value="登 录" src="images/login_01.gif" width="47" height="20" border="0" />&nbsp;&nbsp;&nbsp;<a href="javascript:document.login.reset();"><img src="images/login_02.gif" width="47" height="20" border="0"></a></li>
				 </ul>
				</div>
                	 
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>成功案例</div>
                	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>

			  </ul>
                          </div>
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
 <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>站内搜索</div>
			 <div class=search>
<ul>
                            <form name="Search" method="get" action="Search.asp">
<div><input name="Range" type="radio" value="Product" checked="checked" />产品 <input type="radio" name="Range" value="News" />新闻 <input type="radio" name="Range" value="Down" />下载</div>
<div style="margin-top:5px;">
<div style="width:110px;float:left;padding-left:0px;"><input name="keyword" type="text" id="keyword" style="width:100px;border:1px #dadada solid;" /></div>
<div style="widith:80px;float:left;padding-left:6px;"><span onclick=inputcheck();><img src=images/btn_sear.gif border=0 class="SubmitInput"></span> 
</div>

</div>

                        </form>

</ul>


				</div>
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>员工风采</div>
                	  <div class=ygfc>
			 <ul>
			     <li><a href=#><img src=2.jpg /></a></li>
<li><a href=#><img src=2.jpg /></a></li>
<li><a href=#><img src=2.jpg /></a></li>
<li><a href=#><img src=2.jpg /></a></li>
			  </ul>
                          </div>
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>

</div>
<div id=rightcontent>
<div id=left>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>公司介绍</div>
			 <div class=gsjs>
			     <img src="images/templatemo_pic.jpg" alt="cssk8.com" width="192" height="147" />
<p>&nbsp;&nbsp;&nbsp;河南贝思特科技有限公司是一家以计算机及网络技术的推广应用为基础，专业从事行业软件的研发和销售；计算机信息系统集成，计算机及网络产品销售，IT外包服务；DIY装机，办公自动化设备销售及维护的综合性公司；并以“best”品牌著称。公司下设办公室、人事部、开发部、市场部、技术部、工程部、售后中心、财务部，并设有两个直属门市，在全省5个地市设有办事处。业务覆盖： 政府部门；大中小型企业；校园；网吧；超市；酒店等IT密集使用部门。</p><p>

 &nbsp;&nbsp;&nbsp;公司司自成立以来坚持“专业、诚信、创新、务实”的企业理念，为广大用户提供质量可靠，性能优越的产品及全面完善的专业服务。
</p>
                         </div>
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			         </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
			 <div class=headertit>
<span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>
		新闻动态
			</div>  
			<div style="width:260px; height:183px; overflow:hidden; float:left;padding-top:8px; margin:5px;">
				

<script type="text/javascript">

var swf_width=260
var swf_height=183
var files='upload/20081130130344862.jpg|upload/20081130130830574.jpg|upload/20081130140345174.jpg|upload/20081130140625974.jpg|upload/20081130140804666.jpg|upload/20081130141130489.jpg'
var links='About-6.html|New-61.html|New-64.html|New-65.html|New-67.html|New-68.html|New-70.html'
var texts='江苏南京2008届高校毕业生供|高考第一天 各地考生轻松应考|北京成人高招录取18日启动|“新农村少儿舞蹈美育工程|中国音乐学院声乐作品演|2008年年底前14家中央企业招聘'

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="images/bcastr31.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
document.write('<embed src="images/bcastr31.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 


</script>

			</div>
	<div class=newscontent>
			<ul>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
				<li><span>2010-12-31</span><a href=#>请在后台增加</a></li>
			</ul>
		</div>                	 
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>

	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>合作伙伴</div>
                	     <div class=hz>   
					<ul>
				<li><img src="upload/pp_03.jpg"></img></li>
				<li><img src="upload/pp_06.jpg"></img></li>
				<li><img src="upload/pp_08.jpg"></img></li>
				<li><img src="upload/pp_10.jpg"></img></li>
				<li><img src="upload/pp_17.jpg"></img></li>
				<li><img src="upload/pp_19.jpg"></img></li>
				<li><img src="upload/pp_21.jpg"></img></li>
				<li><img src="upload/pp_23.jpg"></img></li>
					</ul>
			   </div>
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
			        </div>





<div id=right>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>我们的业务</div>
			 <div class=wmdyw>
			 <ul>
			     <li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
			  </ul>

                          </div>

      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="更多">more</a></span></span>产品与服务</div>
                	                 	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
			  </ul>
                          </div>
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>服务热线</div>
                	                 	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
<li><a href=#>请在后台增加内容</a></li>
			  </ul>
                          </div>
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>

</div>









</div>
</div>
<!--mainend-->
 <div class="footer">
        <p class="footer-nav">
            <a href="#" target="_blank">关于我们</a> |
            <a href="#" target="_blank">联系我们</a> |
            <a href="a.asp" target="_blank">员工登陆</a> |
            <a href="link.asp" target="_blank">友情链接</a> |
            <a href="sitemap.asp" target="_blank">网站地图</a> |
            <a href="payment.php" target="_blank">付款方式 </a> |
            <a href="job.asp" target="_blank">人才招聘</a> |
            <a href="faq.asp" target="_blank">帮助</a> 
        </p>
        <p>CopyRight 2002-2010  文星通网络  Chinaz.Com ,All Rights Reserved </p>
        <p>鄂ICP备888888888号 </p>
 </div>
<!--footer end-->





















<!--end begin-->
       </div>
</div>
</body>
</html>
