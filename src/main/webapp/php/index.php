<?php
include("inc/conn.php");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd"><HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>���ϱ�˼�ؿƼ����޹�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META http-equiv=Content-Language content=zh-CN>
<meta name="keywords" content="<?=$keywords?>" />
<meta name="description" content="<?=$description?>" />
<link rel=stylesheet type="text/css" href="style/index.css">
<script type="text/javascript" src="inc/flash.js"></script>
<script>
<!--
var AlertInput = "������:\n\n";	
function Login(form){
	var mesg = "";
	if(form.name.value == "") mesg += "�á���\n";
	if(form.passwd.value == "") mesg += "�ܡ���\n";
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
        alert("����д��ʾ��ţ�"); 
        return false; 
      } 
      if(newDocument.instructNum.value.length>16) 
      { 
        alert("��ʾ��Ų��ܴ���25���ַ���"); 
        return false; 
      } 
      if(newDocument.procNodeId.value.length==0) 
      { 
        alert("����д�����ĺţ�"); 
        return false; 
      } 
      if(newDocument.procNodeId.value.length>25) 
      { 
        alert("�����ĺŲ��ܴ���25���ַ���"); 
        return false; 
      } 
      if(newDocument.SEND_TO.value.length==0) 
      { 
        alert("��ѡ����ʾ���쵼��"); 
        return false; 
      } 
      if(newDocument.SEND_TO.value.length>16) 
      { 
        alert("��ʾ���쵼���ֲ��ܴ���16���ַ���"); 
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
<!--header end-->
<div id=maincontent>
<div id=leftcontent>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
			 <div class=headertit>��ҵ����</div>
				<div class=mail>
				 <ul>
				<form name="login" method="post" action="http://mail.hn-best.net/login.php?Cmd=login" onsubmit="Login(this.form);return false" target=_blank>
				 <li>�û�����<input name="name" type="text" class="input_text" onkeypress="nameStrFilter()" size="15" value="" /><input name="domain" type="hidden" onKeyPress="domainStrFilter()" value="hn-best.net" size="20" /></li>
				<li>��&nbsp;&nbsp;�룺<input name="passwd" type="password" class="input_text" size="15" /><input type="hidden" name="Lang" value="zh_CN" /></li>
<li><input type="image" onclick="Login(this.form);return false" value="�� ¼" src="images/login_01.gif" width="47" height="20" border="0" />&nbsp;&nbsp;&nbsp;<a href="javascript:document.login.reset();"><img src="images/login_02.gif" width="47" height="20" border="0"></a></li>
				 </ul>
				</div>
                	 
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>�ɹ�����</div>
                	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>

			  </ul>
                          </div>
      	  	         </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
 <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>վ������</div>
			 <div class=search>
<ul>
                            <form name="Search" method="get" action="Search.asp">
<div><input name="Range" type="radio" value="Product" checked="checked" />��Ʒ <input type="radio" name="Range" value="News" />���� <input type="radio" name="Range" value="Down" />����</div>
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
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>Ա�����</div>
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
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>��˾����</div>
			 <div class=gsjs>
			     <img src="images/templatemo_pic.jpg" alt="cssk8.com" width="192" height="147" />
<p>&nbsp;&nbsp;&nbsp;���ϱ�˼�ؿƼ����޹�˾��һ���Լ���������缼�����ƹ�Ӧ��Ϊ������רҵ������ҵ������з������ۣ��������Ϣϵͳ���ɣ�������������Ʒ���ۣ�IT�������DIYװ�����칫�Զ����豸���ۼ�ά�����ۺ��Թ�˾�����ԡ�best��Ʒ�����ơ���˾����칫�ҡ����²������������г����������������̲����ۺ����ġ����񲿣�����������ֱ�����У���ȫʡ5���������а��´���ҵ�񸲸ǣ� �������ţ�����С����ҵ��У԰�����ɣ����У��Ƶ��IT�ܼ�ʹ�ò��š�</p><p>

 &nbsp;&nbsp;&nbsp;��˾˾�Գ���������֡�רҵ�����š����¡���ʵ������ҵ���Ϊ����û��ṩ�����ɿ���������Խ�Ĳ�Ʒ��ȫ�����Ƶ�רҵ����
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
<span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>
		���Ŷ�̬
			</div>  
			<div style="width:260px; height:183px; overflow:hidden; float:left;padding-top:8px; margin:5px;">
				

<script type="text/javascript">

var swf_width=260
var swf_height=183
var files='upload/20081130130344862.jpg|upload/20081130130830574.jpg|upload/20081130140345174.jpg|upload/20081130140625974.jpg|upload/20081130140804666.jpg|upload/20081130141130489.jpg'
var links='About-6.html|New-61.html|New-64.html|New-65.html|New-67.html|New-68.html|New-70.html'
var texts='�����Ͼ�2008���У��ҵ����|�߿���һ�� ���ؿ�������Ӧ��|�������˸���¼ȡ18������|����ũ���ٶ��赸��������|�й�����ѧԺ������Ʒ��|2008�����ǰ14��������ҵ��Ƹ'

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="images/bcastr31.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
document.write('<embed src="images/bcastr31.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 


</script>

			</div>
	<div class=newscontent>
			<ul>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
				<li><span>2010-12-31</span><a href=#>���ں�̨����</a></li>
			</ul>
		</div>                	 
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>

	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>�������</div>
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
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>���ǵ�ҵ��</div>
			 <div class=wmdyw>
			 <ul>
			     <li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
			  </ul>

                          </div>

      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit><span style="float:right;"><span class=moreline>|</span>&nbsp;<span class=more><a href=# alt="����">more</a></span></span>��Ʒ�����</div>
                	                 	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
			  </ul>
                          </div>
      	  	       		 </div>
   	     		     <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>    
			 </div>
<div class=nav></div>
	    		  <div class="color1">
       				 <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
       				 <div class="content">  
	    		 <div class=headertit>��������</div>
                	                 	  <div class=wmdyw>
			 <ul>
			     <li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
<li><a href=#>���ں�̨��������</a></li>
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
            <a href="#" target="_blank">��������</a> |
            <a href="#" target="_blank">��ϵ����</a> |
            <a href="a.asp" target="_blank">Ա����½</a> |
            <a href="link.asp" target="_blank">��������</a> |
            <a href="sitemap.asp" target="_blank">��վ��ͼ</a> |
            <a href="payment.php" target="_blank">���ʽ </a> |
            <a href="job.asp" target="_blank">�˲���Ƹ</a> |
            <a href="faq.asp" target="_blank">����</a> 
        </p>
        <p>CopyRight 2002-2010  ����ͨ����  Chinaz.Com ,All Rights Reserved </p>
        <p>��ICP��888888888�� </p>
 </div>
<!--footer end-->





















<!--end begin-->
       </div>
</div>
</body>
</html>
