<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--侧边QQ在线开始-->
<style type="text/css">
ul,li,img {margin:0;padding:0;border:0;list-style:none;}
.qqbox a {text-decoration:none;color:#333;}
.qqbox a:hover {text-decoration:underline;color:#f30;}
.qqbox{
	width:168px;
	height:auto;
	overflow:hidden;
	position:absolute;
	right:0;
	top:120px;
	color:#333;
	font-size:12px;
	letter-spacing:0px;
	z-index:101;
}
.qqlv{
	width:20px;
	height:197px;
	overflow:hidden;
	position:relative;
	float:right;
	z-index:50;
}
.close {width:20px;height:17px;overflow:hidden;}
.qqlv2{
	width:20px;
	height:181px;
	overflow:hidden;
}
.qqkf{
	width:168px;
	height:auto;
	overflow:hidden;
	right:0;
	top:0;
	z-index:99;
}
.qqtop {
	width:168px;
	height:49px;
}
.qqcenter {
	width:168px;
	height:auto;
	overflow:hidden;
	background:url(/online/online_r5_c1.jpg) repeat-y left top;
}
.qqcenter_box {
	width:160px;
	height:auto;
	overflow:hidden;
}
.qq1 {
	text-align:left;
	text-indent:10px;
	font-weight:bold;
}
.qq_line {
	width:150px;
	height:1px;
	margin-top:2px;
	margin-bottom:6px;
	overflow:hidden;
	background:url(/online/online_r7_c1.jpg) no-repeat;
}
.qq1_box {
	width:150px;
	height:auto;
	text-align:left;
	overflow:hidden;
}
.qq1_box ul li {
	text-align:left;
	text-indent:13px;
	margin-bottom:3px;margin-left:10px;
}
.qq1_box ul .tm {margin-left:10px;}
.qq2 {
	text-align:left;
	text-indent:10px;
	font-weight:bold;
	margin-top:6px;
}
.qq2 span {font-weight:normal;}
.qq2_box ul li {
	text-align:left;
	text-indent:8px;
	margin-bottom:3px;
}
.qqend {
	width:168px;
	height:81px;
}
</style>
<div class="qqbox" id="divQQbox">
  <div class="qqkf" id="contentid" onClick="hideMsgBox(event)">
    <div class="qqtop" style="cursor:hand;" ><img src="/online/online_r1_c1.jpg" onClick="document.getElementById('contentid').style.display='none'"></div>
    <div class="qqcenter">
      <div class="qqcenter_box">
        <div class="qq1"><img src="/online/online_r3_c2.jpg" align="absmiddle"> 业务咨询</div>
        <div class="qq_line"></div>
        <div class="qq1_box">
          <ul>
            <li><a target="_blank" href="tencent://message/?uin=2529146061&Site=www.hn-best.net&Menu=yes" title="点击我发送消息"><img src="/image/qq_links.jpg"></a> <a href="tencent://message/?uin=2529146061&Site=www.ufbest.com&Menu=yes">业务小张①</a></li>
            <li><a target="_blank" href="tencent://message/?uin=761826378&Site=www.ufbest.com&Menu=yes" title="点击我发送消息"><img src="/image/qq_links.jpg"></a> <a href="tencent://message/?uin=761826378&Site=www.ufbest.com&Menu=yes">业务小李②</a></li>
          </ul>
        </div>
        <div class="qq1"><img src="/online/online_r3_c2.jpg" align="absmiddle"> 技术服务</div>
        <div class="qq_line"></div>
        <div class="qq1_box">
          <ul>
            <li><a target="_blank" href="tencent://message/?uin=94643412&Site=www.hn-best.net&Menu=yes" title="点击我发送消息"><img src="/image/qq_links.jpg"></a> <a href="tencent://message/?uin=94643412&Site=www.hn-best.net&Menu=yes">技术服务①</a></li>
            <li><a target="_blank" href="tencent://message/?uin=1603853931&Site=www.hn-best.net&Menu=yes" title="点击我发送消息"><img src="/image/qq_links.jpg"></a> <a href="tencent://message/?uin=1603853931&Site=www.hn-best.net&Menu=yes">技术服务②</a></li>
            
          </ul>
        </div>
        <div class="qq2"><img src="/online/online_r3_c2.jpg" align="absmiddle"> 客户热线</div>
        <div class="qq_line"></div>
        <div class="qq2_box">
          <ul>
            <li>业务电话：0371-55000913</li>
            <li style="margin-left:0px;">手机：18637199576（24h）</li>
            <li>技术：18937640913（24h）</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="qqend"><img src="/online/online_r9_c1.jpg"></div>
  </div>
</div>

<script language="javascript">
var tips; 
var theTop = 120;
var old = theTop;
function initFloatTips(){ 
	tips = document.getElementById('divQQbox');
	moveTips();
}
function moveTips(){
	 	  var tt=50; 
		  if (window.innerHeight) 
		  {
		pos = window.pageYOffset  
		  }else if (document.documentElement && document.documentElement.scrollTop) {
		pos = document.documentElement.scrollTop  
		  }else if (document.body) {
		    pos = document.body.scrollTop;  
		  }
		  //http:
		  pos=pos-tips.offsetTop+theTop; 
		  pos=tips.offsetTop+pos/10; 
		  if (pos < theTop){
			 pos = theTop;
		  }
		  if (pos != old) { 
			 tips.style.top = pos+"px";
			 tt=10;//alert(tips.style.top);  
		  }
		  old = pos;
		  setTimeout(moveTips,tt);
}

initFloatTips();
	if(typeof(HTMLElement)!="undefined")//给firefox定义contains()方法，ie下不起作用
		{  
		  HTMLElement.prototype.contains=function (obj)  
		  {  
			  while(obj!=null&&typeof(obj.tagName)!="undefind"){//
				  if(obj==this) return true;
			  	obj=obj.parentNode;
			  }  
			  return false;  
		  }
	}
function show(){
	document.getElementById("meumid").style.display="none"
	document.getElementById("contentid").style.display="block"
}

function hideMsgBox(theEvent){
	  if (theEvent){
		var browser=navigator.userAgent;
		if (browser.indexOf("Firefox")>0){//Firefox
		    if (document.getElementById("contentid").contains(theEvent.relatedTarget)) {
				return
			}
		}
		if (browser.indexOf("MSIE")>0 || browser.indexOf("Presto")>=0){
	        if (document.getElementById('contentid').contains(event.toElement)) {
			    return;//结束函式
		    }
		}
	  }
	  document.getElementById("meumid").style.display = "block";
	  document.getElementById("contentid").style.display = "none";
 	}
</script>
<!--侧边QQ在线结束-->
<script type="text/javascript">
</script>
<script type="text/javascript" src="http://cpro.baidu.com/cpro/ui/rt.js"></script>
<noscript>
<div style="display:none;">
<img height="0" width="0" style="border-style:none;" src="http://eclick.baidu.com/rt.jpg?t=noscript&rtid=Pjf4rHD" />
</div>
</noscript>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
//document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd2009088d64e993319fd52382df904cc' type='text/javascript'%3E%3C/script%3E"));
</script>

