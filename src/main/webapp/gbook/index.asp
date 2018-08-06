<!--
'#################################################################
'#迅捷影视
'#################################################################
-->
<%
if request("keywords")<>"" then
if checktxt(request("keywords"))<>request("keywords") then
	response.write "<script language='javascript'>"
	response.write "alert('您输入的搜索关键中含有非法字符，请检查后重新输入！');"
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
	<a target="_blank" href="index.asp"><img border=0 src=images/return.gif title="返回主页"></a>  &nbsp;&nbsp;&nbsp;&nbsp; <a href=book_write.asp><img border=0 src=images/write.gif title="我要写留言"></a>  &nbsp;&nbsp;&nbsp;&nbsp;<a href=index.asp><img border=0 src=images/read.gif title="留言本首页"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=book_admin.asp><img src=IMAGES/admin_home.gif width="83" height="30" border=0 title="留言本首页"></a></td>
</tr>
<tr><td bgcolor="242424">
<%
set rs=Server.CreateObject("ADODB.RecordSet")
sql="select * from Feedback where online='1' "
keywords=request("keywords")
if keywords<>"" then sql=sql+ " and Comments like '%"&keywords&"%' "
sql=sql + "order by top desc,Postdate desc"
rs.open sql,conn,1
if not (rs.eof and rs.bof) then			'如果有留言时，就显示留言。此行的if与倒数第6行的end if相对应

if pages=0 or pages="" then pages=10		'每页留言条数
rs.pageSize = pages	'每页记录数
allPages = rs.pageCount	'总页数
page = Request("page")	'从浏览器取得当前页
'if是基本的出错处理

If not isNumeric(page) then page=1

if isEmpty(page) or Cint(page) < 1 then
page = 1
elseif Cint(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page			'转到某页头部
	Do While Not rs.eof and pages>0
	UserName=rs("UserName")		'用户名
	pic=rs("pic")			'头像
	face=rs("face")			'表情
	Comments=rs("Comments")		'内容
	bad1=split(bad,"/")		'过滤脏话
	for t=0 to ubound(bad1)
	Comments=replace(Comments,bad1(t),"***")
	next
	Replay=rs("Replay")		'回复
	Usermail=rs("Usermail")		'邮件
	url=rs("url")			'主页
	I=I+1				'序号
	temp=RS.RecordCount-(page-1)*rs.pageSize-I+1
	%>

<table cellSpacing="1" cellPadding="3" width="680" align="center" bgColor="#000000" border="0" style="word-break:break-all">
  <tr>
	<td vAlign="top" width="25%" bgColor="#3c3c3c" rowSpan="2" align=center>
	<table border=0 width=85%><tr><td align=center><img src=images/face/pic<%=pic%>.gif border=0></td></tr>
	<tr><td><span class="STYLE4">姓名：<%=UserName%><br>
	来自：<%=left(rs("ip"),(len(rs("ip"))-2))+"**"%><br>
	邮件：<a href=mailto:<%=Usermail%>><img src=images/mail.gif border=0 alt="<%=Usermail%>"></a><br>
	主页：<a href="<%=URL%>" target='_blank'><img src=images/home.gif border=0 alt="<%=URL%>"></a><a href="<%=URL%>" target='_blank'></a></span></td></tr>
	</table>	</td>
	<td width="75%" height="20" bgColor="121212"><span class="STYLE2">
	  <%if rs("top")<>"1" then response.write "[NO."&temp&"]"%> 
	  <img border=0 src=images/face/face<%=face%>.gif> 发表于：<%=cstr(rs("Postdate"))%></span></td>
  </tr>
  <tr>
	<td vAlign="top" bgColor="#282828" width='75%' height=120 onMouseOver="bgColor='#404040'" onMouseOut="bgColor='#282828'"><span class="STYLE3">
	  <%
	'是否屏蔽留言内容中的html字符
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
	    <span class="STYLE2"><%=huifutishi%>：<br>
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

response.write "<table border=0 width=680 align=center><tr><td><form action='index.asp' method='post'>总计留言"&RS.RecordCount&"条 "
if page = 1 then
response.write "<font color=darkgray>首页 前页</font>"
else
response.write "<a href=index.asp?page=1>首页</a> <a href=index.asp?keywords="&keywords&"&page="&page-1&">前页</a>"
end if
if page = allpages then
response.write "<font color=darkgray> 下页 末页</font>"
else
response.write " <a href=index.asp?keywords="&keywords&"&page="&page+1&">下页</a> <a href=index.asp?keywords="&keywords&"&page="&allpages&">末页</a>"
end if
response.write " 第"&page&"页 共"&allpages&"页 &nbsp; 转到第 "
response.write "<select name='page'>"
for i=1 to allpages
response.write "<option value="&i&">"&i&"</option>"
next
response.write "</select> 页 <input type=submit name=go value='Go'><input type=hidden name=keywords value='"&keywords&"'></form></td><td align=right>"
response.write "<form action='index.asp' method='post'><input title='想查找什么内容' type=text name=keywords value='"&keywords&"' size=10 maxlength=20><input type=submit value='搜索' title='给我搜'></form></td></tr></table>"


else
response.write "<table cellSpacing=0 cellPadding=0 width=680 align=center bgColor=#FFFFFF border=0><TR><TD height=120 align=center>"
if keywords="" then response.write "暂时没有留言" else response.write "抱歉，没有找到您要查到的内容<br><br><a href='javascript:history.go(-1)'>返回上一页</a>" end if
response.write "</TD></TR></TABLE>"
end if
%>
</td>
</tr></table>
<!--#include file="book_down.asp"-->
</center>
</body>
</html>





