<html>
<head>
<title>����ͶƱ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
if session("us")="" then
response.redirect "login.asp"
end if
%>
<!-- #include file="conn.asp"-->
<table width="98%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#efefef" class="tables">
  <tr>
    <td><div align="center">
      <p><a href="a_vote.asp?action=vote">ͶƱ����</a> | <a href="a_vote.asp?action=addvote">���</a> </p>
      </div></td>
    <td><div align="center"><a href="a_vote.asp?action=colligatevote">�ۺ�ͶƱ</a> | <a href="a_vote.asp?action=addcolligatevote">���</a> </div></td>
    <td><div align="center"><a href="a_vote.asp?action=editlogin">��¼��Ϣ</a></div></td>
  </tr>
</table>
<br>
<%
action=request.QueryString("action")
select case action
case "vote"
%>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#efefef" height="30" colspan="6">�鿴���е�ͶƱ</td>
</tr>
<tr>
<td bgcolor="#f7f7f7"><div align="center">ͼ��</div></td>
<td bgcolor="#f7f7f7">ͶƱ����</td>
<td align="center" bgcolor="#f7f7f7">��/��</td>
<td align="center" bgcolor="#f7f7f7">��������</td>
<td bgcolor="#f7f7f7"><div align="center">����</div></td>
<td bgcolor="#f7f7f7"><div align="center">���ô���</div></td>
</tr>
<%
dim rs
set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_vote where c_id=0 order by id desc",conn,1,1
do while not rs.eof
%>
<tr>
<td><div align="center"><img src="isvote.gif" border="0"></div></td>
<td><a href="?action=item&id=<%=rs("id")%>"><%=rs("vote_title")%></a></td>
<td align="center"><%if rs("vote_radio")=1 then
response.write "��ѡ"
else
response.write "��ѡ"
end if
%></td>
<td align="center"><%=formatdatetime(rs("vote_ltime"),2)%></td>
<td>
  <div align="center"><a href="?action=book&id=<%=rs("id")%>&t=1">����</a> <a href="?action=editvote&id=<%=rs("id")%>">�޸�</a>
      <a href="?action=delvote&id=<%=rs("id")%>" onclick="return confirm('������ʾ�������Ҫɾ������ͶƱ/������Ϣ��');">ɾ��</a>
  </div></td>
<td><textarea name="transfer" cols="30" rows="2" wrap="VIRTUAL" class="inputt"><iframe frameborder="0" width="100%" height="100%" scrolling="no" src="vote.asp?action=vote&id=<%=rs("id")%>"></iframe></textarea></td>
</tr>
<%
rs.movenext
loop
rs.close
set rs=nothing
%>
</table>
<%
case "savaaddvote"
isradio=request.form("isradio")'��ѡ/��ѡ
cbox=request.form("cbox")'��ѡ����
vote_iscomment=request.form("vote_iscomment")'�Ƿ�����
timeinterval=request.form("timeinterval")'ͶƱ���ʱ��
intervaltype=request.form("intervaltype")'ͶƱ���ʱ������
brstr=request.form("brstr")'�ּ�����ʾ
ltime=request.form("ltime")'����ʱ��
title=request.form("title")'ͶƱ����
if isradio="" Or cbox="" or vote_iscomment="" Or timeinterval="" Or intervaltype="" Or brstr="" or ltime="" Or title="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��������д��ɺ�ſ�����ӣ�');history.back();</script>"
response.end
end if

conn.execute("insert into hfweb_vote (vote_title,vote_radio,vote_brcount,vote_ltime,vote_cbox,vote_iscomment,vote_timeinterval,vote_intervaltype) values ('"&title&"',"&isradio&","&brstr&",#"&ltime&"#,"&cbox&","&vote_iscomment&","&timeinterval&",'"&intervaltype&"')")
response.write "<script>alert('������ʾ��ͶƱ��ӳɹ�������µ�ͶƱ���ͶƱѡ�');location.href='?action=item';</script>"
response.end

case "addvote"
%>
<form method="post" action="?action=savaaddvote">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="inputt">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">����µ�ͶƱ</td>
</tr>
<tr>
<td>��ѡ/��ѡ</td>
<td><input name="isradio" type="radio" onclick="cobxtr.style.display='none'" value="1" checked>
  ��ѡ
    <input type="radio" name="isradio" value="2" onclick="cobxtr.style.display=''">
    ��ѡ</td>
</tr>
<tr id="cobxtr" style="display:none">
  <td>��ѡ����</td>
  <td class="inputt"><input name="cbox" type="text" class="inputt" id="cbox" value="0" size="30" maxlength="5">
    <br>
    <font color="#666666">ÿ��ͶƱ���ѡ����,0��������</font></td>
</tr>
<tr>
  <td>�Ƿ�����</td>
  <td class="inputt"><input type="radio" name="vote_iscomment" value="1">
    ����
      <input name="vote_iscomment" type="radio" value="0" checked>
      ������</td>
</tr>
<tr>
  <td>ʱ������</td>
  <td class="inputt"><input name="timeinterval" type="text" class="inputt" id="timeinterval" value="2" size="20" maxlength="10">
    <select name="intervaltype" class="inputt" id="intervaltype">
      <option value="min">����</option>
      <option value="hour" selected>Сʱ</option>
      <option value="day">��</option>
    </select>
    <br>
    <font color="#666666">ͬһIP����ͶƱʱ����</font></td>
</tr>
<tr>
  <td>������ʾ</td>
  <td class="inputt"><select name="brstr" class="inputt" id="brstr">
    <option value="1" selected>һ����ʾ</option>
    <option value="2">������ʾ</option>
    <option value="3">������ʾ</option>
    <option value="4">������ʾ</option>
    <option value="5">������ʾ</option>
  </select></td>
</tr>
<tr>
  <td>��������</td>
  <td><input name="ltime" type="text" class="inputt" id="ltime" size="30" maxlength="10">
    <br>
    <font color="#666666">���ڸ�ʽ������&quot;0000-00-00&quot;</font></td>
</tr>
<tr>
<td>ͶƱ����</td>
<td><input type="text" name="title" size="30" maxlength="150" class="inputt"></td>
</tr>
<tr>
<td colspan="2" align="center" height="30" bgcolor="#f7f7f7"><input type="submit" name="submit" value="����µ�ͶƱ" class="inputt">��
  <input name="Submit" type="button" class="inputt" value="����" onclick="history.back();">
</td>
</tr>
</table>
</form>
<%
case "savaeditvote"'�����޸ĵ�ͶƱ
id=request.form("id")
isradio=request.form("isradio")'��ѡ/��ѡ
cbox=request.form("cbox")'��ѡ����
vote_iscomment=request.form("vote_iscomment")'�Ƿ�����
timeinterval=request.form("timeinterval")'ͶƱ���ʱ��
intervaltype=request.form("intervaltype")'ͶƱ���ʱ������
brstr=request.form("brstr")'�ּ�����ʾ
ltime=request.form("ltime")'����ʱ��
title=request.form("title")'ͶƱ����
if not isnumeric(id) or isradio="" Or cbox="" or vote_iscomment="" Or timeinterval="" Or intervaltype="" Or brstr="" or ltime="" Or title="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��������д��ɺ�ſ�����ӣ�');history.back();</script>"
response.end
end if
conn.execute("update hfweb_vote set vote_title='"&title&"',vote_radio="&isradio&",vote_brcount="&brstr&",vote_ltime=#"&ltime&"#,vote_cbox="&cbox&",vote_iscomment="&vote_iscomment&",vote_timeinterval="&timeinterval&",vote_intervaltype='"&intervaltype&"' where id="&id&"")
response.write "<script>location.href='?action=vote';</script>"
response.end

case "editvote"'�޸�ͶƱ
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ�޸ĵ���Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_vote where id="&id&"")
if not rs.eof then
%>
<form method="post" action="?action=savaeditvote">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="inputt">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">�޸�ͶƱ��Ϣ</td>
</tr>
<tr>
<td>��ѡ/��ѡ</td>
<td><input name="isradio" type="radio" onclick="cobxtr.style.display='none'" value="1"<%if rs("vote_radio")=1 then response.write " checked" end if%>>
  ��ѡ
    <input type="radio" name="isradio" value="2" onclick="cobxtr.style.display=''"<%if rs("vote_radio")=2 then response.write " checked" end if%>>
    ��ѡ</td>
</tr>
<tr id="cobxtr" <%if rs("vote_radio")=1 then response.write "style='display:none'" end if%>>
  <td>��ѡ����</td>
  <td class="inputt"><input name="cbox" type="text" class="inputt" id="cbox" value="<%=rs("vote_cbox")%>" size="30" maxlength="5">
    <br>
    <font color="#666666">ÿ��ͶƱ���ѡ����,0��������</font></td>
</tr>
<tr>
  <td>�Ƿ�����</td>
  <td class="inputt"><input type="radio" name="vote_iscomment" value="1"<%if rs("vote_iscomment")=1 then response.write " checked" end if%>>
    ����
      <input name="vote_iscomment" type="radio" value="0"<%if rs("vote_iscomment")=0 then response.write " checked" end if%>>
      ������</td>
</tr>
<tr>
  <td>ʱ������</td>
  <td class="inputt"><input name="timeinterval" type="text" class="inputt" id="timeinterval" value="<%=rs("vote_timeinterval")%>" size="20" maxlength="10">
    <select name="intervaltype" class="inputt" id="intervaltype">
      <option value="min"<%if rs("vote_intervaltype")="min" then response.write " selected" end if%>>����</option>
      <option value="hour"<%if rs("vote_intervaltype")="hour" then response.write " selected" end if%>>Сʱ</option>
      <option value="day"<%if rs("vote_intervaltype")="day" then response.write " selected" end if%>>��</option>
    </select>
    <br>
    <font color="#666666">ͬһIP����ͶƱʱ����</font></td>
</tr>
<tr>
  <td>������ʾ</td>
  <td class="inputt"><select name="brstr" class="inputt" id="brstr">
    <option value="1"<%if rs("vote_brcount")=1 then response.write " selected" end if%>>һ����ʾ</option>
    <option value="2"<%if rs("vote_brcount")=2 then response.write " selected" end if%>>������ʾ</option>
    <option value="3"<%if rs("vote_brcount")=3 then response.write " selected" end if%>>������ʾ</option>
    <option value="4"<%if rs("vote_brcount")=4 then response.write " selected" end if%>>������ʾ</option>
    <option value="5"<%if rs("vote_brcount")=5 then response.write " selected" end if%>>������ʾ</option>
  </select></td>
</tr>
<tr>
  <td>��������</td>
  <td><input name="ltime" type="text" class="inputt" id="ltime" value="<%=rs("vote_ltime")%>" size="30" maxlength="10">
    <br>
    <font color="#666666">���ڸ�ʽ������&quot;0000-00-00&quot;</font></td>
</tr>
<tr>
<td>ͶƱ����</td>
<td><input name="title" type="text" class="inputt" value="<%=rs("vote_title")%>" size="30" maxlength="150">
  <input name="id" type="hidden" id="id" value="<%=id%>"></td>
</tr>
<tr>
<td colspan="2" align="center" height="30" bgcolor="#f7f7f7"><input type="submit" name="submit" value="�ύ�޸�" class="inputt">��
  <input name="Submit" type="button" class="inputt" value="����" onclick="history.back();">
</td>
</tr>
</table>
</form>
<%
end if
rs.close
set rs=nothing

case "book"'���Բ鿴
id=request.querystring("id")
t=request.QueryString("t")
if not isnumeric(id) or not isnumeric(t) then
response.write "<script>alert('������ʾ���Բ���û�ҵ���Ҫ�鿴����Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_book where vote_id="&id&" and book_type="&t&"")
if not rs.eof then
%>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
  <tr>
    <td bgcolor="#f7f7f7" height="30" colspan="5">�鿴������Ϣ</td>
  </tr>
  <%
  	Const MaxPerPage=30
	Dim CurrentPage,F
	Dim TotalPut
	Rs.MoveFirst
	If Trim(Request.Querystring("Page"))<>"" Or Not IsNumeric(Request.Querystring("Page")) Then
	CurrentPage=Clng(Request.Querystring("Page"))
	Else
	CurrentPage=1
	End If
	TotalPut=Conn.ExeCute("Select Count(id) From hfweb_book Where vote_id="&id&" and book_type="&t&"",0,1)(0)
	If CurrentPage<>1 Then
		If (CurrentPage-1)*MaxPerPage<TotalPut Then
		Rs.Move(CurrentPage-1)*MaxPerPage
		End If
	End If
	Dim N,K
	If (TotalPut Mod MaxPerPage)=0 Then
	N=TotalPut \ MaxPerPage
	Else
	N=TotalPut \ MaxPerPage+1
	End If
	For F=1 To MaxPerPage
	If Not Rs.Eof Then
  %>
  <tr>
    <td>�û�����<%=rs("book_user")%></td>
    <td>�������䣺<%=rs("book_email")%></td>
    <td>����ʱ�䣺<%=rs("book_time")%></td>
    <td>����IP��<%=rs("book_ip")%></td>
    <td align="right"><input name="Submit" type="button" class="inputt" value="ɾ��" onclick="location.href='?action=delbook&id=<%=rs("id")%>&v_id=<%=id%>'"></td>
  </tr>
  <tr align="left">
    <td height="30" colspan="5">�������ݣ�<%=rs("book_note")%></td>
  </tr>
  <tr bgcolor="#999999">
    <td height="4" colspan="5" align="center"></td>
  </tr>
 <%
  Rs.MoveNext
  End If
  Next
 %>
  <tr>
    <td bgcolor="#f7f7f7" height="30" align="center"><input type="button" name="submit" class="inputt" value="����" onClick="history.back();">
&nbsp;&nbsp;
      <input type="button" name="reset" value="��ӡ" class="inputt" onClick="window.print();"></td>
    <td height="30" colspan="4" align="center" bgcolor="#f7f7f7">������Ϣ          <%Response.Write TotalPut%>          ������ǰ�ǵ�
      <%Response.Write CurrentPage%>
          /
          <%Response.Write N%>
          ҳ��
<%
	K=CurrentPage
	If K<>1 Then
	Response.Write "<a href='?action=book&id="&id&"&t="&t&"&Page=1'>��ҳ</a>��"
	Response.Write "<a href='?action=book&id="&id&"&t="&t&"&Page="&k-1&"'>��һҳ</a>��"
	Else
	Response.Write "��ҳ����һҳ��"
	End If
	if K<>N Then
	Response.Write "<a href='?action=book&id="&id&"&t="&t&"&Page="&k+1&"'>��һҳ</a>��"
	Response.Write "<a href='?action=book&id="&id&"&t="&t&"&Page="&n&"'>βҳ</a>��"
	Else
	Response.Write "��һҳ��βҳ��"
	End If
	%></td>
  </tr>
</table>
<%
else
response.write "û��������Ϣ��"
end if
rs.close
set rs=nothing
case "savaedititem"'�����޸ĵ�ͶƱѡ��
i_title=request.form("i_title")'ͶƱѡ�����
id=request.form("id")'��ǰ�޸�������Ϣ��ID
v_id=request.form("v_id")'����ͶƱid
i_count=request.form("i_count")'ͶƱ��
if i_title="" or not isnumeric(id) or not isnumeric(v_id) or not isnumeric(i_count) then
response.write "<script>alert('������ʾ���Բ�������һ������д����Ϣ���ٴ��ύ��');history.back();</script>"
response.end
end if
conn.execute("update hfweb_item set item_title='"&i_title&"',item_count='"&i_count&"' where id="&id&"")
response.write "<script>location.href='?action=item&id="&v_id&"';</script>"

case "delbook"'ɾ��������Ϣ
id=request.querystring("id")
v_id=request.querystring("v_id")
if not isnumeric(id) or not isnumeric(v_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.end
end if
conn.execute("delete from hfweb_book where id="&id&"")
response.write "<script>location.href='?action=book&id="&v_id&"';</script>"

case "item"
%>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#efefef" colspan="4" height="30"><b>�޸ġ����ͶƱѡ��</b></td>
</tr>
<tr>
<td bgcolor="#f7f7f7">���</td>
<td bgcolor="#f7f7f7">ͶƱѡ��</td>
<td bgcolor="#f7f7f7">ͶƱ��</td>
<td bgcolor="#f7f7f7">����</td>
</tr>

<%
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('�Բ���û���ҵ���Ҫ�鿴����Ϣ��');history.back();</script>"
response.end
end if

set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_item where vote_id="&id&"",conn,1,1
if not rs.eof then
do while not rs.eof
i=i+1
%>
<tr>
<td align="center"><%=i%></td>
<form method="post" action="?action=savaedititem">
<td><input name="i_title" type="text" class="inputt" id="i_title" value="<%=rs("item_title")%>" size="35" maxlength="50">
<input name="id" type="hidden" id="id" value="<%=rs("id")%>">
<input name="v_id" type="hidden" id="v_id" value="<%=id%>"></td>
<td><input name="i_count" type="text" class="inputt" id="i_count" value="<%=rs("item_count")%>" size="3" maxlength="10">
<td><input type="submit" name="submit" value="�޸�" class="inputt">&nbsp;&nbsp;<input type="button" name="button" value="ɾ��" class="inputt" onclick="if (confirm('�����Ҫɾ����ѡ����\n\nע�⣺�ò������ɻָ�'))location.href='?action=delitem&id=<%=rs("id")%>&v_id=<%=id%>'"></td>
</form>
</tr>
<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
<form method="post" action="?action=savaadditem">
<tr>
<td bgcolor="#efefef" height="30" colspan="4">���ѡ��&nbsp;
<input name="i_title" type="text" class="inputt" id="i_title" size="30" maxlength="50">
<input type="hidden" name="v_id" value="<%=id%>">
<input type="submit" name="submit" value="���" class="inputt">
</td>
</tr>
</form>
</table>
<%
case "delitem"'ɾ��ͶƱѡ��
id=request.querystring("id")
v_id=request.querystring("v_id")
if not isnumeric(id) or not isnumeric(v_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.end
end if
conn.execute("delete from hfweb_item where id="&id&"")
response.write "<script>location.href='?action=item&id="&v_id&"';</script>"

case "delvote"'ɾ��ͶƱ
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ�޸ĵ���Ϣ��');history.back();</script>"
response.end
end if
conn.execute("delete from hfweb_item where vote_id="&id&"")
conn.execute("delete from hfweb_vote where id="&id&"")
response.write "<script>location.href='?action=vote';</script>"
response.end

case "savaadditem"'�������ͶƱѡ��
i_title=request.form("i_title")
v_id=request.form("v_id")
if i_title="" or not isnumeric(v_id) then
response.write "<script>alert('������ʾ���Բ�����������д����Ϣ�Ƿ��д�����ٴ��ύ��');history.back();</script>"
response.end
end if
conn.execute("insert into hfweb_item (vote_id,item_title) values ("&v_id&",'"&i_title&"')")

response.write "<script>location.href='?action=item&id="&v_id&"';</script>"
response.end
case "colligatevote"'�ۺ�ͶƱ��Ŀ
%>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr bgcolor="#efefef">
<td height="30" colspan="5">�鿴�ۺ�ͶƱ</td>
</tr>
<tr>
  <td align="center">ͼ��</td>
  <td bgcolor="#f7f7f7">ͶƱ����</td>
  <td align="center" bgcolor="#f7f7f7">��������</td>
  <td align="center" bgcolor="#f7f7f7">����</td>
  <td align="center" bgcolor="#f7f7f7">����</td>
</tr>
<%
set rs=conn.execute("select * from hfweb_colligate order by id desc")
if not rs.eof then
do while not rs.eof
%>
<tr>
  <td align="center"><img src="isvote.gif" border="0"></td>
  <td><a href="?action=addcooligateitem&c_id=<%=rs("id")%>"><%=rs("colligate_title")%></a></td>
  <td align="center"><%=rs("colligate_ltime")%></td>
  <td align="center"><a href="?action=book&id=<%=rs("id")%>&t=2">����</a> <a href="?action=editcolligate&id=<%=rs("id")%>">�޸�</a> <a href="?action=delcolligate&id=<%=rs("id")%>" onclick="return confirm('������ʾ�������Ҫɾ����ͶƱ/������Ϣ���������ܵ����޷��ָ��ĺ����');">ɾ��</a></td>
  <td><textarea name="transfer" cols="30" rows="2" wrap="VIRTUAL" class="inputt"><iframe frameborder="0" width="100%" height="100%" scrolling="no" src="vote.asp?action=colligate&id=<%=rs("id")%>"></iframe></textarea></td>
</tr>
<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
</table>
<%
case "savaaddcolligatevote"'�����ۺ�ͶƱ��Ŀ
title=request.form("title")
ltime=request.form("ltime")
iscomment=request.form("iscomment")
note=request.form("note")
if title="" or ltime="" or iscomment="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��д��������');history.back();</script>"
response.end
end if
conn.execute("insert into hfweb_colligate (colligate_title,colligate_ltime,colligate_note,colligate_iscomment) values ('"&title&"',#"&ltime&"#,'"&note&"',"&iscomment&")")
response.write "<script>alert('������ʾ����ϲ�����ۺ�ͶƱ��ӳɹ����������ϸͶƱѡ�');location.href='?action=addcolligateitem';</script>"
response.end
case "addcolligatevote"'����ۺ�ͶƱ��Ŀ
%>
<form action="?action=savaaddcolligatevote" method="post" name="addcolligateform1" id="addcolligateform1">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">����ۺ�ͶƱ</td>
</tr>
<tr>
  <td>ͶƱ���ƣ�</td>
  <td><input name="title" type="text" class="inputt" id="title" size="30" maxlength="50"></td>
  </tr>
<tr>
  <td>����ʱ�䣺</td>
  <td><input name="ltime" type="text" class="inputt" id="ltime" size="30" maxlength="10">
    <br>
    <font color="#666666">���ڸ�ʽ������&quot;0000-00-00&quot;</font></td>
  </tr>
<tr>
  <td>�������ԣ�</td>
  <td><input type="radio" name="iscomment" value="1">
    ����
      <input name="iscomment" type="radio" value="0" checked>
      ������</td>
</tr>
<tr>
  <td>ͶƱ��飺</td>
  <td><textarea name="note" cols="60" rows="2" wrap="VIRTUAL" id="note"></textarea></td>
  </tr>
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2" align="center"><input type="submit" name="submit" class="inputt" value="�����ͶƱ">&nbsp;&nbsp;<input type="reset" name="reset" value="����" class="inputt"></td>
</tr>
</table>
</form>
<%
case "savaeditcolligatevote"'�����޸ĵ��ۺ�ͶƱ
id=request.form("id")
title=request.form("title")
ltime=request.form("ltime")
iscomment=request.form("iscomment")
note=request.form("note")
if title="" or ltime="" or iscomment="" or not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���������Ϣ��д��������');history.back();</script>"
response.end
end if
conn.execute("update hfweb_colligate set colligate_title='"&title&"',colligate_ltime=#"&ltime&"#,colligate_note='"&note&"',colligate_iscomment="&iscomment&" where id="&id&"")

response.write "<script>location.href='?action=colligatevote';</script>"
response.end


case "editcolligate"'�޸��ۺ�ͶƱ
id=request.querystring("id")
if not isnumeric(id) then 
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ�޸ĵ���Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_colligate where id="&id&"")
if not rs.eof then
%>
<form action="?action=savaeditcolligatevote" method="post" name="savaeditcolligatevoteform1" id="savaeditcolligatevoteform1">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">�޸��ۺ�ͶƱ��Ϣ</td>
</tr>
<tr>
  <td>ͶƱ���ƣ�</td>
  <td><input name="title" type="text" class="inputt" id="title" value="<%=rs("colligate_title")%>" size="30" maxlength="50"></td>
  </tr>
<tr>
  <td>����ʱ�䣺</td>
  <td><input name="ltime" type="text" class="inputt" id="ltime" value="<%=rs("colligate_ltime")%>" size="30" maxlength="10">
    <br>
    <font color="#666666">���ڸ�ʽ������&quot;0000-00-00&quot;</font></td>
  </tr>
<tr>
  <td>�������ԣ�</td>
  <td><input type="radio" name="iscomment" value="1"<%if rs("colligate_iscomment")=1 then response.write " checked" end if%>>
    ����
      <input name="iscomment" type="radio" value="0"<%if rs("colligate_iscomment")=0 then response.write " checked" end if%>>
      ������</td>
</tr>
<tr>
  <td>ͶƱ��飺</td>
  <td><textarea name="note" cols="60" rows="2" wrap="VIRTUAL" id="note"><%=rs("colligate_note")%></textarea>
    <input name="id" type="hidden" id="id" value="<%=id%>"></td>
  </tr>
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2" align="center"><input type="submit" name="submit" class="inputt" value="�ύ�޸�">
&nbsp;&nbsp;<input type="reset" name="reset" value="����" class="inputt"></td>
</tr>
</table>
</form>
<%
end if
rs.close
set rs=nothing
case "addcooligateitem"'����ۺ�ͶƱ��Ŀ
c_id=request.querystring("c_id")
if not isnumeric(c_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ��ӵ���Ϣ��');history.back();</script>"
response.end
end if

%>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr bgcolor="#efefef">
<td height="30" colspan="4">����ۺ�ͶƱѡ��</td>
</tr>
<%
set rs=conn.execute("select * from hfweb_vote where c_id="&c_id&"")
do while not rs.eof
%>
<tr bgcolor="#f7f7f7">
  <td colspan="3" bgcolor="#f7f7f7"><%=rs("vote_title")%></td>
  <td bgcolor="#f7f7f7"><input name="Submit" type="button" class="inputt" value="�޸�" onClick="location.href='?action=editcolligatetitle&id=<%=rs("id")%>&c_id=<%=c_id%>';">
&nbsp; <input name="Submit" type="button" class="inputt" value="ɾ��" onClick="location.href='?action=delcolligatetitle&id=<%=rs("id")%>&c_id=<%=c_id%>';"></td>
</tr>
<%
i1=1
set rs1=conn.execute("select * from hfweb_item where vote_id="&rs("id")&"")
do while not rs1.eof

%>
<tr><form method="post" action="?action=editcolligateitem" name="s<%=rs1("id")%>">
  <td align="center"><%=i1%></td>
  <td><input name="i_title" type="text" class="inputt" id="i_title" value="<%=rs1("item_title")%>" size="35" maxlength="50">
    <input name="c_id" type="hidden" id="c_id" value="<%=c_id%>">
    <input name="id" type="hidden" id="id" value="<%=rs1("id")%>"></td>
  <td><input name="i_count" type="text" class="inputt" id="i_count" value="<%=rs1("item_count")%>" size="3" maxlength="10"></td>
  <td><input name="Submit" type="submit" class="inputt" value="�޸�">
    &nbsp;
    <input name="Submit" type="button" class="inputt" value="ɾ��" onclick="location.href='?action=delcollgateitem&id=<%=rs1("id")%>&c_id=<%=c_id%>';"></td></form>
</tr>
<%
i1=i1+1
rs1.movenext
loop
rs1.close
set rs1=nothing
%>
<tr><form action="?action=savaaddcolligateadditem" name="form111" method="post">
  <td colspan="4">���
    <input name="i_title" type="text" class="inputt" id="i_title" size="35" maxlength="50">
    <input name="Submit" type="submit" class="inputt" value="���">
    <input name="c_id" type="hidden" id="c_id" value="<%=c_id%>">
    <input name="v_id" type="hidden" id="v_id" value="<%=rs("id")%>"></td></form>
  </tr><%
rs.movenext
loop
rs.close
set rs=nothing
%>
</table>
<form action="?action=savaaddcolligatevoteitem" method="post" name="savaaddcolligatevoteitemform1" id="savaaddcolligatevoteitemform1">
  <table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="inputt">
    <tr>
      <td bgcolor="#f7f7f7" height="30" colspan="2">����µ�ͶƱ</td>
    </tr>
    <tr>
      <td>��ѡ/��ѡ</td>
      <td><input name="isradio" type="radio" onclick="cobxtr.style.display='none'" value="1" checked>
        ��ѡ
          <input type="radio" name="isradio" value="2" onclick="cobxtr.style.display=''">
        ��ѡ</td>
    </tr>
    <tr id="cobxtr" style="display:none">
      <td>��ѡ����</td>
      <td class="inputt"><input name="cbox" type="text" class="inputt" id="cbox" value="0" size="30" maxlength="5">
          <br>
          <font color="#666666">ÿ��ͶƱ���ѡ����,0��������</font></td>
    </tr>
    <tr>
      <td>������ʾ</td>
      <td class="inputt"><select name="brstr" class="inputt" id="brstr">
          <option value="1" selected>һ����ʾ</option>
          <option value="2">������ʾ</option>
          <option value="3">������ʾ</option>
          <option value="4">������ʾ</option>
          <option value="5">������ʾ</option>
      </select></td>
    </tr>
    <tr>
      <td>ͶƱ����</td>
      <td><input type="text" name="title" size="30" maxlength="150" class="inputt">
      <input name="c_id" type="hidden" id="c_id" value="<%=c_id%>"></td>
    </tr>
    <tr>
      <td colspan="2" align="center" height="30" bgcolor="#f7f7f7"><input type="submit" name="submit" value="���" class="inputt">
          ��
          <input name="Submit" type="button" class="inputt" value="����" onclick="history.back();">
      </td>
    </tr>
  </table>
</form>
<%
case "editcolligatetitle"'�޸��ۺ�ͶƱ
id=request.querystring("id")
c_id=request.querystring("c_id")
if not isnumeric(id) or not isnumeric(c_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.End
end if
set rs=conn.execute("select * from hfweb_vote where id="&id&"")
if not rs.eof then
%>
<form action="?action=savaeditcolligatetitle" method="post" name="savaaddcolligatevoteitemform1" id="savaaddcolligatevoteitemform1">
  <table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="inputt">
    <tr>
      <td bgcolor="#f7f7f7" height="30" colspan="2">�޸�ͶƱ��Ϣ</td>
    </tr>
    <tr>
      <td>��ѡ/��ѡ</td>
      <td><input name="isradio" type="radio" onclick="cobxtr.style.display='none'" value="1"<%if rs("vote_radio")=1 then response.write " checked" end if%>>
        ��ѡ
          <input type="radio" name="isradio" value="2" onclick="cobxtr.style.display=''"<%if rs("vote_radio")=2 then response.write " checked" end if%>>
        ��ѡ</td>
    </tr>
    <tr id="cobxtr" <%if rs("vote_radio")=1 then response.write "style='display:none'" end if%>>
      <td>��ѡ����</td>
      <td class="inputt"><input name="cbox" type="text" class="inputt" id="cbox" value="<%=rs("vote_cbox")%>" size="30" maxlength="5">
          <br>
          <font color="#666666">ÿ��ͶƱ���ѡ����,0��������</font></td>
    </tr>
    <tr>
      <td>������ʾ</td>
      <td class="inputt"><select name="brstr" class="inputt" id="brstr">
          <option value="1"<%if rs("vote_brcount")=1 then response.write " selected" end if%>>һ����ʾ</option>
          <option value="2"<%if rs("vote_brcount")=2 then response.write " selected" end if%>>������ʾ</option>
          <option value="3"<%if rs("vote_brcount")=3 then response.write " selected" end if%>>������ʾ</option>
          <option value="4"<%if rs("vote_brcount")=4 then response.write " selected" end if%>>������ʾ</option>
          <option value="5"<%if rs("vote_brcount")=5 then response.write " selected" end if%>>������ʾ</option>
      </select></td>
    </tr>
    <tr>
      <td>ͶƱ����</td>
      <td><input name="title" type="text" class="inputt" value="<%=rs("vote_title")%>" size="30" maxlength="150">
          <input name="c_id" type="hidden" id="c_id" value="<%=c_id%>">
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
    </tr>
    <tr>
      <td colspan="2" align="center" height="30" bgcolor="#f7f7f7"><input type="submit" name="submit" value="�ύ�޸�" class="inputt">
        ��
          <input name="Submit" type="button" class="inputt" value="����" onclick="history.back();">
      </td>
    </tr>
  </table>
</form>
<%
end if
rs.close
set rs=nothing
case "delcolligate"'ɾ���ۺ�ͶƱ
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.End
end if

set dr=conn.execute("select id from hfweb_vote where c_id="&id&"")
do while not dr.eof
conn.execute("delete from hfweb_item where vote_id="&dr("id")&"")
dr.movenext
loop
dr.close
set dr=nothing

conn.execute("delete from hfweb_vote where c_id="&id&"")
conn.execute("delete from hfweb_colligate where id="&id&"")
response.write "<script>location.href='?action=colligatevote';</script>"
response.end
case "delcolligatetitle"'ɾ���ۺ�ͶƱ��Ŀ
id=request.querystring("id")
c_id=request.querystring("c_id")
if not isnumeric(id) or not isnumeric(c_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.End
end if
conn.execute("delete from hfweb_item where vote_id="&id&"")
conn.execute("delete from hfweb_vote where id="&id&"")
response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end

case "savaeditcolligatetitle"'�����޸��ۺ�ͶƱ
id=request.form("id")
c_id=request.form("c_id")
isradio=request.form("isradio")
cbox=request.form("cbox")
brstr=request.form("brstr")
title=request.form("title")
if not isnumeric(id) or not isnumeric(c_id) or isradio="" Or brstr="" or title="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��д��������');history.back();</script>"
response.end
end if
conn.execute("update hfweb_vote set c_id="&c_id&",vote_title='"&title&"',vote_radio="&isradio&",vote_brcount="&brstr&",vote_cbox="&cbox&" where id="&id&"")
response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end

case "delcollgateitem"'ɾ���ۺ�ͶƱѡ��
id=request.querystring("id")
c_id=request.querystring("c_id")
if not isnumeric(id) or not isnumeric(c_id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫɾ������Ϣ��');history.back();</script>"
response.End
end if
conn.execute("delete from hfweb_item where id="&id&"")
response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end
case "editcolligateitem"'�����޸��ۺ�ͶƱѡ��
id=request.form("id")
c_id=request.form("c_id")
i_title=request.form("i_title")
i_count=request.form("i_count")
if not isnumeric(id) or not isnumeric(c_id) or not isnumeric(i_count) or i_title="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��д��������');history.back();</script>"
response.end
end if
conn.execute("update hfweb_item set item_title='"&i_title&"',item_count="&i_count&" where id="&id&"")

response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end

case "savaaddcolligateadditem"'��������ۺ�ͶƱѡ��
i_title=request.form("i_title")
c_id=request.form("c_id")
v_id=request.form("v_id")
if not isnumeric(c_id) or i_title="" or not isnumeric(v_id) then
response.write "<script>alert('������ʾ���Բ���������Ϣû����д������');history.back();</script>"
response.end
end if
conn.execute("insert into hfweb_item (vote_id,item_title) values ("&v_id&",'"&i_title&"')")
response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end
case "savaaddcolligatevoteitem"'��������ۺ�ͶƱ��Ŀ
isradio=request.form("isradio")
cbox=request.form("cbox")
brstr=request.form("brstr")
title=request.form("title")
c_id=request.form("c_id")
if not isnumeric(c_id) or isradio="" Or brstr="" or title="" then
response.write "<script>alert('������ʾ���Բ���������Ϣ��д��������');history.back();</script>"
response.end
end if
conn.execute("insert into hfweb_vote (c_id,vote_title,vote_radio,vote_brcount,vote_cbox) values ("&c_id&",'"&title&"',"&isradio&","&brstr&","&cbox&")")
response.write "<script>location.href='?action=addcooligateitem&c_id="&c_id&"';</script>"
response.end

case "savaeditlogin"

us=replace(request.form("us"),"'","")
pas=replace(request.form("pas"),"'","")
if us="" or pas="" then
response.write "<script>alert('������ʾ���Բ����û������벻��Ϊ�գ�');history.back();</script>"
response.end
end if

conn.execute("update hfweb_user set user_user='"&us&"',user_pass='"&pas&"'")
response.write "<script>alert('�޸ĳɹ���');location.href='?action=editlogin';</script>"
response.end

case "quit"
session("us")=abandon
response.redirect "a_vote.asp?action=login"

case "editlogin"
set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_user",conn,1,1
if not rs.eof then
%>
<form method="post" action="?action=savaeditlogin">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">�޸ĵ�¼�û���������</td>
</tr>
<tr>
<td>�û���</td>
<td><input type="text" size="30" maxlength="40" name="us" value="<%=rs("user_user")%>" class="inputt"></td>
</tr>
<tr>
<td>����</td>
<td><input type="text" size="30" maxlength="40" name="pas" value="<%=rs("user_pass")%>" class="inputt"></td>
</tr>
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2" align="center"><input type="submit" name="submit" class="inputt" value="�޸�">&nbsp;&nbsp;<input type="reset" name="reset" value="�ָ�ԭֵ" class="inputt"></td>
</tr>
</table>
</form>
<%
end if
rs.close
set rs=nothing
end select
%>
</body>
</html>
