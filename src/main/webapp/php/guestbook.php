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
echo "<script language='javascript'>alert('���Գɹ��ύ��');location.replace('index.php');</script>";
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
		alert("������Ҫ���Ե�����");
		gbook.title.focus();
		return false;
	}
	if(gbook.content.value=="")
	{
		alert("�������ݲ���Ϊ��");
		gbook.content.focus();
		return false;
	}
	if (gbook.linkman.value=="")
	{
		alert("��������ĳƺ�");
		gbook.linkman.focus();
		return false;
	}
	if(gbook.company.value=="")
	{
		alert("�����빫˾����");
		gbook.company.focus();
		return false;
	}
	if(gbook.address.value=="")
	{
		alert("�����������ϵ��ʽ");
		gbook.address.focus();
		return false;
	}
	if(gbook.zipcode.value.length!=6)
	{
		alert("��������Ӧ����6λ��");
		gbook.zipcode.focus();
		return false;
	}
	if (gbook.qq.value.length<5 || gbook.qq.value.length>10)
	{
		alert("���������5��С��10λ���ֵĺ���");
		gbook.qq.focus();
		return false;
	}
	if(gbook.tel.value.length<7 || gbook.tel.value.length>12 )
	{
		alert("��������ȷ�ĵ绰����");
		gbook.tel.focus();
		return false;
	}
	if(gbook.fax.value.length<7 || gbook.fax.value.length>12)
	{
		alert("��������ȷ�Ĵ������");
		gbook.fax.focus();
		return false;
	}
	if(gbook.mobile.value.length!=11)
	{
		alert("�ֻ�����Ӧ��Ϊ11λ��");
		gbook.mobile.focus();
		return false;
	}
	if(gbook.email.value=="")
	{
		alert("��������������ַ");
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
		 <a href=about.php>��������</a>&nbsp;|&nbsp;
		 <a href=contact.php>��ϵ����</a>&nbsp;|&nbsp;
		 <a href=bbs/>������̳</a>&nbsp;|&nbsp;
		 <a id="based">��������<Script Language=Javascript Src="Inc/southidcj2f.Js"></Script></a>
	      </div>
		</div>
		<div id=menu>
		<span class=img2></span>
		<ul>
			
			<li><a href=index.php alt="��վ��ҳ"><span>��վ��ҳ</span></a></li>
			<li><a href=company.php alt="��ҵ����"><span>��ҵ����</span></a></li>
			<li><a href=news.php alt="������Ѷ">������Ѷ</a></li>
			<li><a href=product.php alt="��Ʒ��Ϣ">��Ʒ��Ϣ</a></li>
                        <li><a href=# alt="������Ŀ">������Ŀ</a></li>
			<li><a href=# alt="��ҵ���">��ҵ���</a></li>
			<li><a href=# alt="�������">�������</a></li>
			<li><a href=# alt="�ɹ�����">�ɹ�����</a></li>
			<li><a href=download.php alt="��������">��������</a></li>
			<li><a href=# alt="�ۺ����">�ۺ����</a></li>
			<li><a href=guestbook.php alt="�ͻ�����">�ͻ�����</a></li>
			

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
<li><span>��������:</span><input type=text name="title" class=gbooktext></li>
<li><span>��������:</span><textarea name="content" rows="8" style="width: 380px" /></textarea></li>
<li><span>�ƺ�:</span><input type=text name="linkman" class=gbooktext></li>
<li><span>�Ա�:</span>
<input name="sex" type="radio" value="����" checked />
                      ����
                      <input type="radio" name="sex" value="Ůʿ"  />
                      Ůʿ
</li>
<li><span>��˾����:</span><input type=text name="company" class=gbooktext></li>
<li><span>��ϵ��ַ:</span><input type=text name="address" class=gbooktext></li>
<li><span>��������:</span><input type=text name="zipcode" class=gbooktext></li>
<li><span>QQ:</span><input type=text name="qq" class=gbooktext></li>
<li><span>��ϵ�绰:</span><input type=text name="tel" class=gbooktext></li>
<li><span>�������:</span><input type=text name="fax" class=gbooktext></li>
<li><span>�ֻ�����:</span><input type=text name="mobile" class=gbooktext></li>
<li><span>��������:</span><input type=text name="email" class=gbooktext></li>
<li><input type=submit name=submit value=�ύ></li>
</ul>
</form>
</div>
</div>
</body>
</html>
<?php
mysql_close();
?>
