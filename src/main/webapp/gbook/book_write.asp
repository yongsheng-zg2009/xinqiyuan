<%
'#################################################################
'# �������ƣ������������  www.54aa.com
'# ��Ȩ��ʽ��������
'# ���ߣ�  ��������
'# ����ʱ�䣺2008-11.01
'# ���������������������ö��������������������а�Ȩ��
'# ������;�������ʹ�á����ɴ����������뱣����������еİ�Ȩ��Ϣ��
'#################################################################
%>
<!--#include file="book_conn.asp"-->
<%
if request("send")="ok" then

	username=trim(request.form("username"))
	usermail=trim(request.form("usermail"))

	if username="" or request.form("Comments")="" then
	response.write "<script language='javascript'>"
	response.write "alert('��д���ϲ�������������������룡');"
	response.write "location.href='javascript:history.go(-1)';"
	response.write "</script>"
	response.end
	end if

	if checktxt(request.form("username"))<>request.form("username") then
	response.write "<script language='javascript'>"
	response.write "alert('��������û����к��зǷ��ַ���������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	if mailyes=0 then		'����Ϊ����ʱ��������Ƿ�Ϸ�

	if checktxt(request.form("usermail"))<>request.form("usermail") then
	response.write "<script language='javascript'>"
	response.write "alert('������������к��зǷ��ַ���������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	if Instr(usermail,".")<=0 or Instr(usermail,"@")<=0 or len(usermail)<10 or len(usermail)>50 then
	response.write "<script language='javascript'>"
	response.write "alert('������ĵ����ʼ���ַ��ʽ����ȷ��������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	end if

	if len(request.form("Comments"))>maxlength then
	response.write "<script language='javascript'>"
	response.write "alert('��������̫���ˣ��벻Ҫ����"&maxlength&"���ַ���');"
	response.write "location.href='javascript:history.go(-1)';"
	response.write "</script>"
	response.end
	end if

	Comments1=request.form("Comments")
	bad1=split(bad,"/")		'�����໰
	for t=0 to ubound(bad1)
	Comments1=replace(Comments1,bad1(t),"***")
	next

	if request.form("Comments")<>Comments1 then
	response.write "<script language='javascript'>"
	response.write "alert('�����ˣ��������԰�����ֹ�ύ�����ݣ�');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if


	set rs=Server.CreateObject("ADODB.RecordSet")
	sql="select * from Feedback where online='1' order by Postdate desc"
	rs.open sql,conn,1,3

			rs.Addnew
			rs("username")=Request("username")
			rs("comments")=Request("comments")
			rs("usermail")=Request("usermail")
			rs("face")=Request("face")
			rs("pic")=Request("pic")
			rs("url")=Request("url")
			rs("qq")=Request("qq")
			view=cstr(view)
			if view<>"0" then view="1"
			rs("online")=view
			rs("IP")=Request.serverVariables("REMOTE_ADDR")
			rs.Update
		rs.close
		set rs=nothing
	response.write "<script language='javascript'>"
	if view="0" then
	response.write "alert('�����ύ�ɹ��������뾭����Ա��˲��ܷ�����');"
	else
	response.write "alert('�����ύ�ɹ���������ȷ�������������б�');"
	end if
	response.write "location.href='index.asp';"	
	response.write "</script>"
	response.end
end if
%>



<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="<%=sitename%>">
<meta name="keywords" content="<%=sitename%>">
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #999999}
body {
	background-image: url(IMAGES/bg.gif);
}
-->
</style>
</HEAD>
<center>
<!--#include file="book_top.asp"-->

<table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF"  class="grayline">
<tr><td height=50 align=center bgcolor="242424">
<img border=0 src=images/write.gif> &nbsp;&nbsp;&nbsp;&nbsp;  <a href=index.asp><img border=0 src=images/read.gif title="��Ҫ������"></a>
</td>
</tr>

<tr><td bgcolor="242424">
<form action=book_write.asp method=post name="book">
  <table cellSpacing="1" borderColorDark="#ffffff" cellPadding="4" width="680" align="center" bgColor="#000000" borderColorLight="#000000" border="0">
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#282828"><span class="STYLE1">����������</span></td>
    <td bgcolor="#282828" ><input type=text name="UserName" size="30" maxlength=999999> 
      <font color="#FF0000">*</font></td>   
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#262626"><span class="STYLE1">�������䣺</span></td>
    <td bgcolor="#262626" ><input type=text name="UserMail" size="30"  maxlength=999999> 
      <%if mailyes=0 then%><font color="#FF0000">*</font><%end if%></td>   
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#282828"><span class="STYLE1">������վ��</span></td>
    <td bgcolor="#282828"><input type=text value="http://" name="url" size="30"  maxlength=999999></td>
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#262626"><span class="STYLE1">������ϵ��ʽ��</span></td>
    <td bgcolor="#262626"><input type=text value="" name="QQ" size="30"  maxlength=999999> <span class="STYLE1">����QQ��MSN��UC�ȣ�</span></td>
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#282828"><span class="STYLE1">�������ݣ�</span><br>
      <font color=red>��<%=maxlength%>�����ڣ�</font></td>
    <td bgcolor="#282828"><textarea name="Comments" rows="7" cols="66" style="overflow:auto;"></textarea></td>
  </tr>
  <tr bgColor="#ebebeb">
    <td   width="20%" align=right bgcolor="#262626"><span class="STYLE1">��ѡ����飺</span></td>
    <td bgcolor="#262626">
	<input type="radio" value="1" name="face" checked><img border=0 src="images/face/face1.gif"> 
	<input type="radio" value="2" name="face"><img border=0 src="images/face/face2.gif">
	<input type="radio" value="3" name="face"><img border=0 src="images/face/face3.gif">
	<input type="radio" value="4" name="face"><img border=0 src="images/face/face4.gif">
	<input type="radio" value="5" name="face"><img border=0 src="images/face/face5.gif">
	<input type="radio" value="6" name="face"><img border=0 src="images/face/face6.gif"> 
	<input type="radio" value="7" name="face"><img border=0 src="images/face/face7.gif">
	<input type="radio" value="8" name="face"><img border=0 src="images/face/face8.gif">
	<input type="radio" value="9" name="face"><img border=0 src="images/face/face9.gif">
	<input type="radio" value="10" name="face"><img border=0 src="images/face/face10.gif">
	<input type="radio" value="10" name="face"><img border=0 src="images/face/face22.gif">
	<br>
	<input type="radio" value="11" name="face"><img border=0 src="images/face/face11.gif"> 
	<input type="radio" value="12" name="face"><img border=0 src="images/face/face12.gif">
	<input type="radio" value="13" name="face"><img border=0 src="images/face/face13.gif">
	<input type="radio" value="14" name="face"><img border=0 src="images/face/face14.gif">
	<input type="radio" value="15" name="face"><img border=0 src="images/face/face15.gif">
	<input type="radio" value="16" name="face"><img border=0 src="images/face/face16.gif"> 
	<input type="radio" value="17" name="face"><img border=0 src="images/face/face17.gif">
	<input type="radio" value="18" name="face"><img border=0 src="images/face/face18.gif">
	<input type="radio" value="19" name="face"><img border=0 src="images/face/face19.gif">
	<input type="radio" value="20" name="face"><img border=0 src="images/face/face20.gif">
	<input type="radio" value="20" name="face"><img border=0 src="images/face/face21.gif">


    </td>
  </tr>
  <tr bgColor="#ebebeb">
    <td width="20%" align=right bgcolor="#282828"><span class="STYLE1">��ѡ��ͷ��</span></td>
    <td bgcolor="#282828">
	<input type="radio" value="1" name="pic" checked><img border=0 src="images/face/pic1.gif" width=60>
	<input type="radio" value="2" name="pic"><img border=0 src="images/face/pic2.gif" width=60>
	<input type="radio" value="3" name="pic"><img border=0 src="images/face/pic3.gif" width=60>
	<input type="radio" value="4" name="pic"><img border=0 src="images/face/pic4.gif" width=60>
	<input type="radio" value="5" name="pic"><img border=0 src="images/face/pic5.gif" width=60>
	<input type="radio" value="12" name="pic"><img border=0 src="images/face/pic12.gif" width=60>
	<br>
	<input type="radio" value="6" name="pic"><img border=0 src="images/face/pic6.gif" width=60>
	<input type="radio" value="7" name="pic"><img border=0 src="images/face/pic7.gif" width=60>
	<input type="radio" value="8" name="pic"><img border=0 src="images/face/pic8.gif" width=60>
	<input type="radio" value="9" name="pic"><img border=0 src="images/face/pic9.gif" width=60>
	<input type="radio" value="10" name="pic"><img border=0 src="images/face/pic10.gif" width=60>
           <input type="radio" value="11" name="pic"><img border=0 src="images/face/pic11.gif" width=60>
      </td>
  </tr>
  <tr bgColor="#ebebeb">
    <td colSpan="2" bgcolor="#262626"><input type="submit" value="�ύ����" name="Submit"> 
      <input type="reset" value="������д" name="Submit2"><input type=hidden name=send value=ok></td>
  </tr>
</table>
</form>

</table>

<!--#include file="book_down.asp"-->
</body>
</html>










