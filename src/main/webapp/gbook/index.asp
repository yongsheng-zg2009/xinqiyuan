<!--
'#################################################################
'#Ѹ��Ӱ��
'#################################################################
-->
<%
if request("keywords")<>"" then
if checktxt(request("keywords"))<>request("keywords") then
	response.write "<script language='javascript'>"
	response.write "alert('������������ؼ��к��зǷ��ַ���������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
end if
end if
%>
<!--#include file="book_conn.asp"-->
<HTML><HEAD>
<TITLE><%=sitename%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="<%=sitename%>">
<meta name="keywords" content="<%=sitename%>">
<link rel="stylesheet" href="book.css" type="text/css">
<style type="text/css">
<!--
.STYLE2 {color: #999999}
.STYLE3 {color: #FFFFFF}
.STYLE4 {color: #CCCCCC}
body {
	background-image: url(IMAGES/bg.gif);
}
-->
</style>
</HEAD>
<center>
<!--#include file="book_top.asp"-->
<table width="760" border=0 cellspacing=0 cellpadding=0 align=center bgcolor="#FFFFFF" class="grayline">
<tr>
  <td height=50 align=center bgcolor="242424">
	<a target="_blank" href="index.asp"><img border=0 src=images/return.gif title="������ҳ"></a>  &nbsp;&nbsp;&nbsp;&nbsp; <a href=book_write.asp><img border=0 src=images/write.gif title="��Ҫд����"></a>  &nbsp;&nbsp;&nbsp;&nbsp;<a href=index.asp><img border=0 src=images/read.gif title="���Ա���ҳ"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=book_admin.asp><img src=IMAGES/admin_home.gif width="83" height="30" border=0 title="���Ա���ҳ"></a></td>
</tr>
<tr><td bgcolor="242424">
<%
set rs=Server.CreateObject("ADODB.RecordSet")
sql="select * from Feedback where online='1' "
keywords=request("keywords")
if keywords<>"" then sql=sql+ " and Comments like '%"&keywords&"%' "
sql=sql + "order by top desc,Postdate desc"
rs.open sql,conn,1
if not (rs.eof and rs.bof) then			'���������ʱ������ʾ���ԡ����е�if�뵹����6�е�end if���Ӧ

if pages=0 or pages="" then pages=10		'ÿҳ��������
rs.pageSize = pages	'ÿҳ��¼��
allPages = rs.pageCount	'��ҳ��
page = Request("page")	'�������ȡ�õ�ǰҳ
'if�ǻ����ĳ�����

If not isNumeric(page) then page=1

if isEmpty(page) or Cint(page) < 1 then
page = 1
elseif Cint(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page			'ת��ĳҳͷ��
	Do While Not rs.eof and pages>0
	UserName=rs("UserName")		'�û���
	pic=rs("pic")			'ͷ��
	face=rs("face")			'����
	Comments=rs("Comments")		'����
	bad1=split(bad,"/")		'�����໰
	for t=0 to ubound(bad1)
	Comments=replace(Comments,bad1(t),"***")
	next
	Replay=rs("Replay")		'�ظ�
	Usermail=rs("Usermail")		'�ʼ�
	url=rs("url")			'��ҳ
	I=I+1				'���
	temp=RS.RecordCount-(page-1)*rs.pageSize-I+1
	%>

<table cellSpacing="1" cellPadding="3" width="680" align="center" bgColor="#000000" border="0" style="word-break:break-all">
  <tr>
	<td vAlign="top" width="25%" bgColor="#3c3c3c" rowSpan="2" align=center>
	<table border=0 width=85%><tr><td align=center><img src=images/face/pic<%=pic%>.gif border=0></td></tr>
	<tr><td><span class="STYLE4">������<%=UserName%><br>
	���ԣ�<%=left(rs("ip"),(len(rs("ip"))-2))+"**"%><br>
	�ʼ���<a href=mailto:<%=Usermail%>><img src=images/mail.gif border=0 alt="<%=Usermail%>"></a><br>
	��ҳ��<a href="<%=URL%>" target='_blank'><img src=images/home.gif border=0 alt="<%=URL%>"></a><a href="<%=URL%>" target='_blank'></a></span></td></tr>
	</table>	</td>
	<td width="75%" height="20" bgColor="121212"><span class="STYLE2">
	  <%if rs("top")<>"1" then response.write "[NO."&temp&"]"%> 
	  <img border=0 src=images/face/face<%=face%>.gif> �����ڣ�<%=cstr(rs("Postdate"))%></span></td>
  </tr>
  <tr>
	<td vAlign="top" bgColor="#282828" width='75%' height=120 onMouseOver="bgColor='#404040'" onMouseOut="bgColor='#282828'"><span class="STYLE3">
	  <%
	'�Ƿ��������������е�html�ַ�
	if html=0 then
	response.write replace(server.htmlencode(Comments),vbCRLF,"<BR>")
	else
	response.write replace(Comments,vbCRLF,"<BR>")
	end if
	%>
      <br>
	</span><br>
	<%if rs("Replay")<>"" then%>
	<table cellSpacing="1" cellPadding="3" width="90%" align="center" bgColor="darkgray" border="0">
	  <tr><td vAlign="top" bgColor="#000000">	
	    <span class="STYLE2"><%=huifutishi%>��<br>
	    <%=Replay%></span>
	</td>
	  </tr></table><br>
	<%end if%>	</td>
  </tr>
</table>
<table cellSpacing="0" cellPadding="0" width="680" align="center" bgColor="#FFFFFF" border="0">
<TR><TD height=8 bgcolor="1f1f1f"> </TD>
</TR></TABLE>

<%
pages = pages - 1
rs.movenext
if rs.eof then exit do
loop

response.write "<table border=0 width=680 align=center><tr><td><form action='index.asp' method='post'>�ܼ�����"&RS.RecordCount&"�� "
if page = 1 then
response.write "<font color=darkgray>��ҳ ǰҳ</font>"
else
response.write "<a href=index.asp?page=1>��ҳ</a> <a href=index.asp?keywords="&keywords&"&page="&page-1&">ǰҳ</a>"
end if
if page = allpages then
response.write "<font color=darkgray> ��ҳ ĩҳ</font>"
else
response.write " <a href=index.asp?keywords="&keywords&"&page="&page+1&">��ҳ</a> <a href=index.asp?keywords="&keywords&"&page="&allpages&">ĩҳ</a>"
end if
response.write " ��"&page&"ҳ ��"&allpages&"ҳ &nbsp; ת���� "
response.write "<select name='page'>"
for i=1 to allpages
response.write "<option value="&i&">"&i&"</option>"
next
response.write "</select> ҳ <input type=submit name=go value='Go'><input type=hidden name=keywords value='"&keywords&"'></form></td><td align=right>"
response.write "<form action='index.asp' method='post'><input title='�����ʲô����' type=text name=keywords value='"&keywords&"' size=10 maxlength=20><input type=submit value='����' title='������'></form></td></tr></table>"


else
response.write "<table cellSpacing=0 cellPadding=0 width=680 align=center bgColor=#FFFFFF border=0><TR><TD height=120 align=center>"
if keywords="" then response.write "��ʱû������" else response.write "��Ǹ��û���ҵ���Ҫ�鵽������<br><br><a href='javascript:history.go(-1)'>������һҳ</a>" end if
response.write "</TD></TR></TABLE>"
end if
%>
</td>
</tr></table>
<!--#include file="book_down.asp"-->
</center>
</body>
</html>





