<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<style>
body, td {margin:0; font-family: Arial, Helvetica, sans-serif, ����;font-size: 12px;}
li {list-style: none;text-decoration: none;}
a:link, a:visited {color: #1A2C60; text-decoration: none;}
a:hover {color: #6699FF; text-decoration: underline;}
ul {margin:1px; padding:0;}
</style>

<body topmargin="0" leftmargin="0">
<ul>
<%
dim n,w,dateOn

	n=10		'/// nΪҪ��ʾ�������������޸�
	w=20		'/// wΪÿ����������ʾ�ı����������������������խ���ɸ�С������
	dateOn=true		'/// �趨�Ƿ���ʾ����ʱ�䡣������������խ������Ϊ false

sql="Select id from [topic] where top=1"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
dim topNum
topNum=rs.recordcount

sql="Select top "&n&" * from [topic] where checked=1 and whisper=0 order by usertime desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1

if rs.eof and rs.bof then
	Response.Write "û�����ԡ�"
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
  <li><a href="index.asp?page=<%=inpage%>#msg<%=rs("id")%>" title="<%if not dateOn=true then%>����ʱ�䣺<%=year(rs("usertime"))%>��<%=month(rs("usertime"))%>��<%=day(rs("usertime"))%>��<%else%>����鿴����<%end if%>" target="_blank"><%=usertitle%></a><%if dateOn=true then%> (<%=year(rs("usertime"))%>��<%=month(rs("usertime"))%>��<%=day(rs("usertime"))%>��)<%end if%></li>
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