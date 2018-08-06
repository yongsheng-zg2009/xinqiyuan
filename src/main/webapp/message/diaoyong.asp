<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<style>
body, td {margin:0; font-family: Arial, Helvetica, sans-serif, 宋体;font-size: 12px;}
li {list-style: none;text-decoration: none;}
a:link, a:visited {color: #1A2C60; text-decoration: none;}
a:hover {color: #6699FF; text-decoration: underline;}
ul {margin:1px; padding:0;}
</style>

<body topmargin="0" leftmargin="0">
<ul>
<%
dim n,w,dateOn

	n=10		'/// n为要显示的留言数，可修改
	w=20		'/// w为每条留言所显示的标题的字数。如果可用面积较窄，可改小此数字
	dateOn=true		'/// 设定是否显示留言时间。如果可用面积较窄，可设为 false

sql="Select id from [topic] where top=1"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
dim topNum
topNum=rs.recordcount

sql="Select top "&n&" * from [topic] where checked=1 and whisper=0 order by usertime desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1

if rs.eof and rs.bof then
	Response.Write "没有留言。"
else
	dim usertitle,inpage,curNum

	curNum = topNum + 1
	while not rs.eof

	if curNum mod perpage = 0 then
		inpage = curNum \ perpage
	else
		inpage = curNum \ perpage + 1
	end if

	if rs("usertitle")="" then
		usertitle=left(HTMLencode(rs("usercontent")),w)&"..."
	else
		if len(HTMLencode(rs("usertitle"))) > w then
			usertitle=left(HTMLencode(rs("usertitle")),w)&"..."
		else
			usertitle=HTMLencode(rs("usertitle"))
		end if
	end if%>
  <li><a href="index.asp?page=<%=inpage%>#msg<%=rs("id")%>" title="<%if not dateOn=true then%>发表时间：<%=year(rs("usertime"))%>年<%=month(rs("usertime"))%>月<%=day(rs("usertime"))%>日<%else%>点击查看留言<%end if%>" target="_blank"><%=usertitle%></a><%if dateOn=true then%> (<%=year(rs("usertime"))%>年<%=month(rs("usertime"))%>月<%=day(rs("usertime"))%>日)<%end if%></li>
	<%
	curNum = curNum + 1
	rs.movenext
	wend
end if

rs.close
set rs=nothing
%>
</ul>
</body>