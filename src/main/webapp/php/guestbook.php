<?php
function htmtocode($content) {
	$content = str_replace("\n", "<br>", str_replace(" ", "&nbsp;", $content));
	return $content;
}
if($_POST['submit'])
{
$postcontent=htmtocode($_POST[content]);
$gbook="insert into gbook_super (id,title,content,linkman,sex,company,address,zipcode,qq,tel,fax,mobile,email,addtime)".
	"values ('','$_POST[title]','$postcontent','$_POST[linkman]','$_POST[sex]','$_POST[company]',".
	"'$_POST[address]'".
	",'$_POST[zipcode]','$_POST[qq]','$_POST[tel]','$_POST[fax]','$_POST[mobile]','$_POST[email]',now())";
mysql_query($gbook) or die(mysql_error());
echo "<script language='javascript'>alert('留言成功提交！');location.replace('index.php');</script>";
}
?>
<?php
include("inc/conn.php");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd"><HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?=$nametitle?></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META http-equiv=Content-Language content=zh-CN>
<meta name="keywords" content="<?=$keywords?>" />
<meta name="description" content="<?=$description?>" />
<link rel=stylesheet type="text/css" href="style/index.css">
<script type="text/javascript" src="inc/flash.js"></script>
<script language="javascript">
function gbooksubmit()
{
if (gbook.title.value=="")
	{
		alert("请输入要留言的主题");
		gbook.title.focus();
		return false;
	}
	if(gbook.content.value=="")
	{
		alert("留言内容不能为空");
		gbook.content.focus();
		return false;
	}
	if (gbook.linkman.value=="")
	{
		alert("请输入你的称呼");
		gbook.linkman.focus();
		return false;
	}
	if(gbook.company.value=="")
	{
		alert("请输入公司名称");
		gbook.company.focus();
		return false;
	}
	if(gbook.address.value=="")
	{
		alert("请输入你的联系方式");
		gbook.address.focus();
		return false;
	}
	if(gbook.zipcode.value.length!=6)
	{
		alert("邮政编码应该是6位数");
		gbook.zipcode.focus();
		return false;
	}
	if (gbook.qq.value.length<5 || gbook.qq.value.length>10)
	{
		alert("请输入大于5或小于10位数字的号码");
		gbook.qq.focus();
		return false;
	}
	if(gbook.tel.value.length<7 || gbook.tel.value.length>12 )
	{
		alert("请输入正确的电话号码");
		gbook.tel.focus();
		return false;
	}
	if(gbook.fax.value.length<7 || gbook.fax.value.length>12)
	{
		alert("请输入正确的传真号码");
		gbook.fax.focus();
		return false;
	}
	if(gbook.mobile.value.length!=11)
	{
		alert("手机号码应该为11位数");
		gbook.mobile.focus();
		return false;
	}
	if(gbook.email.value=="")
	{
		alert("请输于你的邮箱地址");
		gbook.email.focus();
		return false;
	}
}
</SCRIPT>
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
<div class=gbook>
<form method="post" action="guestbook.php" name=gbook onsubmit="return gbooksubmit()">
<ul>
<li><span>留言主题:</span><input type=text name="title" class=gbooktext></li>
<li><span>留言内容:</span><textarea name="content" rows="8" style="width: 380px" /></textarea></li>
<li><span>称呼:</span><input type=text name="linkman" class=gbooktext></li>
<li><span>性别:</span>
<input name="sex" type="radio" value="先生" checked />
                      先生
                      <input type="radio" name="sex" value="女士"  />
                      女士
</li>
<li><span>公司名称:</span><input type=text name="company" class=gbooktext></li>
<li><span>联系地址:</span><input type=text name="address" class=gbooktext></li>
<li><span>邮政编码:</span><input type=text name="zipcode" class=gbooktext></li>
<li><span>QQ:</span><input type=text name="qq" class=gbooktext></li>
<li><span>联系电话:</span><input type=text name="tel" class=gbooktext></li>
<li><span>传真号码:</span><input type=text name="fax" class=gbooktext></li>
<li><span>手机号码:</span><input type=text name="mobile" class=gbooktext></li>
<li><span>电子邮箱:</span><input type=text name="email" class=gbooktext></li>
<li><input type=submit name=submit value=提交></li>
</ul>
</form>
</div>
</div>
</body>
</html>
<?php
mysql_close();
?>
