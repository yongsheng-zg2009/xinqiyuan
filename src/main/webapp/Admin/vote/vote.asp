<!-- #include file="conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href='css.css' rel='stylesheet' type='text/css'>
<title>���ڿƼ�ͶƱ������ϵͳ</title>

</head><body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
action=request.QueryString("action")
select case action
case "exevote"
id=request.form("id")
v=request.form("v")
chk=request.form("chk")
ltime=request.form("ltime")
v_cbox=request.form("v_cbox")
idd=request.form("idd")
t_interval=request.form("t_interval")
t_intervaltype=request.form("t_intervaltype")
if request.cookies("idd")=idd then
response.write "<script>alert('���Ѿ�Ͷ��Ʊ�ˣ��벻Ҫ�ظ�ͶƱ');history.back();</script>"
response.end
end if

if not isnumeric(id) or v="" or chk="" or ltime="" then
response.write "<script>alert('ͶƱʧ�ܣ�');history.back();</script>"
response.end
end if
if cdate(ltime)<date() then
response.write "<script>alert('ͶƱ��Чʱ���ѹ���ͶƱ�Ѿ�ֹͣ��');history.back();</script>"
response.end
end if
select case chk
case "1" '��ѡ
conn.execute("update hfweb_item set item_count=item_count+1 where id="&v&"")
case "2" '��ѡ
vvv=replace(v," ","")
vv=split(vvv,",")
if clng(ubound(vv)+1)>clng(v_cbox) then
response.write "<script>alert('������ʾ���Բ��������ֻ��ѡ"&v_cbox&"�����ͶƱ��');history.back();</script>"
response.end
end if

for i= 0 to ubound(vv)
conn.execute("update hfweb_item set item_count=item_count+1 where id="&vv(i)&"")
next
end select
response.cookies("idd")=idd
select case t_intervaltype
case "min"'����
response.cookies("idd").expires=date+(0.007*clng(t_interval))
case "hour"'Сʱ
response.cookies("idd").expires=date+(0.042*clng(t_interval))
case "day"'��
response.cookies("idd").expires=date+(1*clng(t_interval))
end select

response.write "<script>alert('ͶƱ�ɹ�');history.back();</script>"
response.end

case "vote"'ͶƱ��ʾ
%>
<form action='vote.asp?action=exevote' method='post' name="form1" id="form1">
  <table border='1' cellpadding='2' cellspacing='0' bordercolordark='#f7f7f7' bordercolorlight='#cccccc' class='css'>
<%
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('ͶƱʧ�ܣ�');history.back();</script>"
response.end
end if

set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_vote where id="&id&"",conn,1,1
if not rs.eof then
chk=rs("vote_radio")
ltime=rs("vote_ltime")
v_cbox=rs("vote_cbox")
t_interval=rs("vote_timeinterval")
t_intervaltype=rs("vote_intervaltype")
%>
<tr><td bgcolor='#f7f7f7' height='30'><b><%=rs("vote_title")%></b></td></tr><tr><td><table width='100%' border='0' class="css">

<%
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from hfweb_item where vote_id="&id&"",conn,1,1
if not rs1.eof then
do while not rs1.eof
	if i<>0 then
		if (i mod rs("vote_brcount"))=0 then
		%>
		<tr>

		<%end if
	end if
%>
<td>
<%
select case rs("vote_radio")
case "1" '��ѡ
%>
<input type='radio' name='v' value='<%=rs1("id")%>'><%=rs1("item_title")%><br>
<%
case "2" '��ѡ
%>
<input type='checkbox' name='v' value='<%=rs1("id")%>'><%=rs1("item_title")%><br>
<%
end select
%>
</td>
<%
i=i+1
rs1.movenext
loop
end if
rs1.close
set rs1=nothing
end if
rs.close
set rs=nothing
%>
</table>
</td></tr><tr><td bgcolor='#f7f7f7' height='30' align='center'><input type='hidden' name='idd' value='<%=id%>'><input type='submit' name='submit' value='ͶƱ' <%if chk=2 and v_cbox>0 then%>title="���ֻ��ѡ<%=v_cbox%>��"<%end if%>>
    <input name="v_cbox" type="hidden" id="v_cbox" value="<%=v_cbox%>">    
    <input name="t_interval" type="hidden" id="t_interval" value="<%=t_interval%>">
    <input name="t_intervaltype" type="hidden" id="t_intervaltype" value="<%=t_intervaltype%>">
    &nbsp;&nbsp;
    <input type='button' name='button1' value='�鿴' onclick=window.open('vote.asp?action=viewvote&id=<%=id%>','vie','scrollbars=yes,resizable=yes,width=550,height=250');>
    <input name="ltime" type="hidden" id="ltime" value="<%=ltime%>">
<input type='hidden' name='id' value='<%=id%>'><input type='hidden' name='chk' value='<%=chk%>'></td></tr></table></form>
<%
case "viewvote"
%>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#efefef"><table width="100%" height="2"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width='99%' border="0" align="center" bordercolorlight='#cccccc' bordercolordark='#f7f7f7' bgcolor="#f7f7f7" class="css">
<%
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('�鿴����');window.close();</script>"
response.end
end if

set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_vote where id="&id&"",conn,1,1
if not rs.eof then
iscomment=rs("vote_iscomment")
set rs2=server.createobject("adodb.recordset")
rs2.open "select sum(item_count) as asum from hfweb_item where vote_id="&id&"",conn,1,1
if not rs2.eof then
asum=rs2("asum")
if asum=0 then
asum=1
end if
%>
<tr bgcolor="#efefef"><td colspan='2' align='center'><font color='#000000' size='3'><b><%=rs("vote_title")%></b></font><br><table border="0" cellpadding="1" cellspacing="1">
  <tr><td height="8"></td></tr></table>Ŀǰ����<font color='#ff0000'><%=rs2("asum")%></font>�˲�����ͶƱ</td></tr><tr>
  <td height="12" colspan="2"></td>
  </tr>
<%
i=1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from hfweb_item where vote_id="&id&"",conn,1,1
if not rs1.eof then
do while not rs1.eof
i_count=rs1("item_count")
if i_count=0 then
i_count=1
end if
%>
<tr>
  <td width="3%">
    <%=i%>.</td>
  <td><%=rs1("item_title")%> <font color="#999999">�����</font><font color="#0033FF"><%=rs1("item_count")%></font><font color="#999999">Ʊ</font></td>
  </tr>
<tr bgcolor="#f7f7f7">
  <td align='center'>&nbsp;</td>
  <td align='left' bgcolor="#f7f7f7"><img src='a.gif' border='0'><img src='b.gif' border='0' height='8' width='<%=(i_count/asum)*800%>'><img src='c.gif' border='0'> <font color='#A2A2A2'>
    <%
disbf=formatnumber((i_count/asum)*100,2)
if disbf<0 then
response.write "0.00"
else
response.write disbf
end if%>%</font></td>
  </tr>
<%
i=i+1
rs1.movenext
loop
end if
rs1.close
%>
</table></td>
  </tr>
</table>
<%
if iscomment=1 then
%>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC" class="css">
<tr bgcolor='#efefef' onclick='if (style.display=='none') {style.display=''}else{style.display='none'}'>
<td colspan='5' bgcolor="#f7f7f7"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="css">
    <tr>
      <td><strong>ͶƱ����</strong> </td>
      <td align="right"><a href="?action=allcolligatecomment&id=<%=id%>&t=1"><font color="#666666">����</font></a></td>
    </tr>
  </table></td>
</tr>

<tr>
  <td colspan="5" bgcolor="#efefef">
  <%
  set pl=conn.execute("select top 8 * from hfweb_book where vote_id="&id&" order by id desc")
  if not pl.eof then
  do while not pl.eof
  %>
 <table width='100%'  border='0' align='center' class="css">
    <tr>
      <td width='30%' height='25' bgcolor='#f7f7f7'>�û���<%=pl("book_user")%></td>
     <td width='70%' bgcolor='#f7f7f7'>���䣺<%=pl("book_email")%></td>
    </tr>
    <tr>
      <td colspan='2'><%=pl("book_note")%></td>
    </tr>
</table>
  <%
  pl.movenext
  loop
  end if
  pl.close
%>  </td>
</tr>
<tr id='viewpl'<%if request.cookies("isbook")<>"" then response.write "style=display:none" end if%>>
  <td height='30' colspan='5' bgcolor="#efefef">
  
    <table width='100%' align='left' class="css">
  <form method='post' action='?action=addpl' name='form1'>
    <tr>
      <td>�û����ƣ�        <input name='usname' type='text' class="inputt" id='usname' size='10' maxlength='20'>��        �������䣺        <input name='email' type='text' class="inputt" id='email' size='15' maxlength='50'>
        <a name="write"></a></td>
    </tr>
    <tr>
     <td valign='top'>�������ݣ�        <textarea name='content' cols='40' rows='3' wrap='VIRTUAL' class="inputt" id='content'></textarea>
       <input name='idd' type='hidden' id='idd' value='<%=id%>'>
        <input name='Submit' type='submit' class="inputt" value='�������'></td>
    </tr>
  </form>
 </table></td>
</tr>
</table><%end if%>
<table width="100%" height="15">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="99%" align="center" bgcolor="#f7f7f7">
  <tr>
    <td height="30" align="center" class="css"><strong>���ڿƼ�����ͶƱϵͳ</strong></td>
  </tr>
</table>
<%
rs2.close
end if
end if
rs.close
conn.close
set conn=nothing
  case "addpl" '�������
  if request.cookies("isbook")=request.form("idd") then
  response.write "<script>alert('������ʾ���Բ������Ѿ����۹��ˣ�');history.back();</script>"
  response.end
  end if
  usname=trim(request.form("usname"))
  email=trim(request.form("email"))
  content=request.form("content")
  idd=trim(request.form("idd"))
  ip=request.servervariables("http_x_forwarded_fox")
  if ip="" then
  ip=request.servervariables("remote_addr")
  end if
  if usname="" or content="" or idd="" then
  response.write "<script>alert('�Բ��𣬱�Ҫ����Ϣ��û����д');history.back();</script>"
  response.end
  end if
  if len(content)>250 then
  response.write "<script>alert('������ʾ���Բ����������ݲ��ܳ���250���ַ���');history.back();</script>"
  response.end
  end if
  conn.execute("insert into hfweb_book (vote_id,book_user,book_email,book_note,book_ip) values ("&idd&",'"&usname&"','"&email&"','"&content&"','"&ip&"')")
  response.cookies("isbook")=idd
  response.write "<script>alert('������۳ɹ���');window.close();</script>"
  response.end
  
case "savacolligate"
if request.cookies("idd")<>"" then
response.write "<script>alert('������ʾ���Բ������Ѿ�Ͷ��Ʊ�ˣ��벻Ҫ�ظ�ͶƱ��');history.back();</script>"
response.end
end if
v_id=replace(request.form("v_id")," ","")
v_radio=replace(request.form("v_radio")," ","")
m_id=request.form("m_id")
if v_id="" or v_radio="" or m_id="" then
response.write "<script>alert('������ʾ��ͶƱʧ�ܣ�');history.back();</script>"
response.end
end if
t_v_id=split(v_id,",")
t_v_radio=split(v_radio,",")
for i=0 to ubound(t_v_id)
t_v=replace(request.form("v"&t_v_id(i))," ","")
if t_v="" then
response.write "<script>alert('ͶƱʧ�ܣ���������ͶƱѡ���Ƿ�ѡ����ȷ��');history.back();</script>"
response.end
end if
'response.write t_v_id(i)&"   "&t_v_radio(i)&"   "&t_v&"<br>"
	select case t_v_radio(i)
	case "1" '��ѡ
	conn.execute("update hfweb_item set item_count=item_count+1 where id="&t_v&"")
	case "2" '��ѡ
	t_vv=split(t_v,",")
	for ii= 0 to ubound(t_vv)
	conn.execute("update hfweb_item set item_count=item_count+1 where id="&t_vv(ii)&"")
	next
	end select
next
response.cookies("idd")=m_id
response.cookies("idd").expires=date+1
response.write "<script>alert('��ϲ����ͶƱ�ɹ���');location.href='?action=colligate&id="&m_id&"';</script>"
response.end
case "colligate"'�ۺ�ͶƱ
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ�鿴����Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_colligate where id="&id&"")
if not rs.eof then
%>
<form name="form2" method="post" action="?action=savacolligate">
   <table width="99%" border='1' align="center" cellpadding='2' cellspacing='0' bordercolorlight='#cccccc' bordercolordark='#f7f7f7' class='css'>
    <tr>
      <td align="center" bgcolor="#efefef"><b><%=rs("colligate_title")%></b></td>
    </tr>
    <tr>
      <td align="left"><%=rs("colligate_note")%></td>
    </tr>
<%
ci=1
set rs1=conn.execute("select * from hfweb_vote where c_id="&rs("id")&"")
if not rs1.eof then
do while not rs1.eof
%>
    <tr>
      <td bgcolor="#f7f7f7"><%=ci%>.<%=rs1("vote_title")%>
      <input name="v_id" type="hidden" id="v_id" value="<%=rs1("id")%>">
      <input name="v_radio" type="hidden" id="v_radio" value="<%=rs1("vote_radio")%>"></td>
    </tr>
    <tr>
      <td><table width="100%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#efefef" class="css">
<%
set rs2=server.createobject("adodb.recordset")
rs2.open "select * from hfweb_item where vote_id="&rs1("id")&"",conn,1,1
if not rs2.eof then
do while not rs2.eof
	if i<>0 then
		if (i mod rs1("vote_brcount"))=0 then
		%>
		<tr>

		<%end if
	end if
%>
          <td bgcolor="#FFFFFF"><%
select case rs1("vote_radio")
case "1" '��ѡ
%>
<input type='radio' name='v<%=rs1("id")%>' value='<%=rs2("id")%>'>
<%=rs2("item_title")%><br>
<%
case "2" '��ѡ
%>
<input name='v<%=rs1("id")%>' type='checkbox' id="v<%=rs1("id")%>" value='<%=rs2("id")%>'>
<%=rs2("item_title")%><br>
<%
end select
%></td>
<%
i=i+1
rs2.movenext
loop
end if
rs2.close
set rs2=nothing
%>
      </table></td>
    </tr>
<%
ci=ci+1
rs1.movenext
loop
end if
rs1.close
set rs1=nothing
%>
    <tr>
      <td align="center"><input name="m_id" type="hidden" id="m_id" value="<%=id%>">
      <input name="Submit" type="submit" class="inputt" value="��ʼͶƱ��">��
        <input name="Submit" type="button" class="inputt" value="�鿴ͶƱ" onClick="location.href='?action=viewcolligate&id=<%=id%>';"></td>
    </tr>
  </table>
</form>
<%
end if
rs.close
set rs=nothing
case "viewcolligate"'�鿴�ۺ�ͶƱ���
id=request.querystring("id")
if not isnumeric(id) then
response.write "<script>alert('������ʾ���Բ���û���ҵ���Ҫ�鿴����Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_colligate where id="&id&"")
if not rs.eof then
%><table width="99%" border='1' align="center" cellpadding='2' cellspacing='0' bordercolorlight='#cccccc' bordercolordark='#f7f7f7' class='css'>
    <tr>
      <td align="center" bgcolor="#efefef"><b><%=rs("colligate_title")%></b></td>
    </tr>
    <tr>
      <td align="left"><%=rs("colligate_note")%></td>
    </tr>
<%
ci=1
set rs1=conn.execute("select * from hfweb_vote where c_id="&rs("id")&"")
if not rs1.eof then
do while not rs1.eof
%>
    <tr>
      <td bgcolor="#f7f7f7"><%=ci%>.<%=rs1("vote_title")%>
      <input name="v_id" type="hidden" id="v_id" value="<%=rs1("id")%>">
      <input name="v_radio" type="hidden" id="v_radio" value="<%=rs1("vote_radio")%>"></td>
    </tr>
    <tr>
      <td><table width="100%"  border="0" class="css">
<%
set rs3=conn.execute("select sum(item_count) as asum from hfweb_item where vote_id="&rs1("id")&"")
if not rs3.eof then
asum=rs3("asum")
end if
rs3.close
set rs3=nothing

set rs2=server.createobject("adodb.recordset")
rs2.open "select * from hfweb_item where vote_id="&rs1("id")&"",conn,1,1
if not rs2.eof then
do while not rs2.eof
%>
		<tr>

          <td width="26%">
<%=rs2("item_title")%>&nbsp;</td>
          <td width="46%"><img src='a.gif' border='0'><img src='b.gif' border='0' height='8' width='<%=(rs2("item_count")/asum)*300%>'><img src='c.gif' border='0'>
<font color='#A2A2A2'><%=rs2("item_count")%>Ʊ</font></td>
          <td width="28%"><font color='#A2A2A2'><%
disbf=formatnumber((rs2("item_count")/asum)*100,2)
if disbf<0 then
response.write "0.00"
else
response.write disbf
end if%>%</font></td>
		</tr>
<%
rs2.movenext
loop
end if
rs2.close
set rs2=nothing
%>
      </table></td>
    </tr>
<%
ci=ci+1
rs1.movenext
loop
end if
rs1.close
set rs1=nothing
%>
    <tr>
      <td align="center"><input name="m_id" type="hidden" id="m_id" value="<%=id%>">
      <input name="Submit" type="button" class="inputt" value="��Ҫ���ۣ�">��
        <input name="Submit" type="button" class="inputt" value="�鿴����" onClick="location.href='?action=allcolligatecomment&t=2&id=<%=id%>';"></td>
    </tr>
  </table><br><table width="99%" align="center" bgcolor="#f7f7f7">
  <tr>
    <td height="30" align="center" class="css"><strong>���ڿƼ�����ͶƱϵͳ</strong></td>
  </tr>
</table>

<%
end if
rs.close
set rs=nothing
case "savaallcolligate"'����ͶƱ
  if request.cookies("isbook")=request.form("idd") then
  response.write "<script>alert('������ʾ���Բ������Ѿ����۹��ˣ�');history.back();</script>"
  response.end
  end if
  usname=trim(request.form("usname"))
  email=trim(request.form("email"))
  content=request.form("content")
  idd=trim(request.form("idd"))
  b_type=request.form("b_type")
  ip=request.servervariables("http_x_forwarded_fox")
  if ip="" then
  ip=request.servervariables("remote_addr")
  end if
  if usname="" or content="" or idd="" or b_type="" then
  response.write "<script>alert('�Բ��𣬱�Ҫ����Ϣ��û����д');history.back();</script>"
  response.end
  end if
  if len(content)>250 then
  response.write "<script>alert('������ʾ���Բ����������ݲ��ܳ���250���ַ���');history.back();</script>"
  response.end
  end if
  conn.execute("insert into hfweb_book (vote_id,book_user,book_email,book_note,book_ip,book_type) values ("&idd&",'"&usname&"','"&email&"','"&content&"','"&ip&"',"&b_type&")")
  response.cookies("isbook")=idd
  response.write "<script>alert('������۳ɹ���');history.back();</script>"
  response.end
case "allcolligatecomment"'�鿴������
id=request.querystring("id")
t=request.QueryString("t")
if not isnumeric(id) or not isnumeric(t) then
response.write "<script>alert('������ʾ���Բ���û�ҵ���Ҫ�鿴����Ϣ��');history.back();</script>"
response.end
end if
set rs=conn.execute("select * from hfweb_book where vote_id="&id&" and book_type="&t&" order by id desc")
if not rs.eof then
%><table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
  <form method='post' action='?action=savaallcolligate' name='form1'>
    <tr>
      <td>�û����ƣ�        <input name='usname' type='text' class="inputt" id='usname' size='10' maxlength='20'>��        �������䣺        <input name='email' type='text' class="inputt" id='email' size='15' maxlength='50'>
        <a name="write"></a></td>
    </tr>
    <tr>
     <td valign='top'>�������ݣ�        <textarea name='content' cols='40' rows='3' wrap='VIRTUAL' class="inputt" id='content'></textarea>
       <input name='idd' type='hidden' id='idd' value='<%=id%>'>
        <input name='Submit' type='submit' class="inputt" value='�������'>
        <input name="b_type" type="hidden" id="b_type" value="<%=t%>"></td>
    </tr>
  </form>
 </table><br>
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
  <tr>
    <td bgcolor="#f7f7f7" height="30" colspan="3">�鿴������Ϣ</td>
  </tr>
  <%
  	Const MaxPerPage=10
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
  </tr>
  <tr align="left">
    <td height="30" colspan="3">�������ݣ�<%=rs("book_note")%></td>
  </tr>
  <tr bgcolor="#999999">
    <td height="4" colspan="3" align="center"></td>
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
    <td height="30" colspan="2" align="center" bgcolor="#f7f7f7">������Ϣ          <%Response.Write TotalPut%>          ������ǰ�ǵ�
      <%Response.Write CurrentPage%>
          /
          <%Response.Write N%>
          ҳ��
<%
	K=CurrentPage
	If K<>1 Then
	Response.Write "<a href='?action=allcolligatecomment&id="&id&"&t="&t&"&Page=1'>��ҳ</a>��"
	Response.Write "<a href='?action=allcolligatecomment&id="&id&"&t="&t&"&Page="&k-1&"'>��һҳ</a>��"
	Else
	Response.Write "��ҳ����һҳ��"
	End If
	if K<>N Then
	Response.Write "<a href='?action=allcolligatecomment&id="&id&"&t="&t&"&Page="&k+1&"'>��һҳ</a>��"
	Response.Write "<a href='?action=allcolligatecomment&id="&id&"&t="&t&"&Page="&n&"'>βҳ</a>��"
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
end select
%>
</body></html>
