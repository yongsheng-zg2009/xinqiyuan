<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Response.Expires = 0 
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
%> 
<%
Dim U_About, U_Title, U_Text,U_Tel, U_Address, U_Mail, SendTo,SendUser,action,Sqlread,MSGID
if request.form("Submit")="����" then
	U_About = Request.Form("About")
	U_Title = Request.Form("Title")
	U_Text = Request.Form("Content")
	U_Tel = Request.Form("Tel")
	U_Address = Request.Form("Address")
	U_Mail= Request.Form("Mail")
	SendTo=request.Form("SendTo")
	SendUser = request.Form("SendUser")
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
	sSql = "SELECT * FROM Message WHERE D_ID is Null"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("About") = U_About
	oRs("Title") = U_Title
	oRs("Content") = U_Text
	oRs("U_Tel") = U_Tel
	oRs("Address") = U_Address
	oRs("Mail") = U_Mail
	oRs("SendUser") = Session("Sys_Admin")
	oRs("MsgState") = 1
	If SendTo <>"" Then oRs("SendTo") = SendTo
	oRs.Update
	oRs.Close
	set ors=nothing
	Call OKGo("��Ϣ���ͳɹ�!","message.asp")
	end if

if request.form("Submit")="���Ͷ���" then
	U_About = Request.Form("About")
	U_Title = Request.Form("Title")
	U_Text = Request.Form("Content")
	U_Tel = Request.Form("Tel")
	U_Address = Request.Form("Address")
	U_Mail= Request.Form("Mail")
	SendTo=request.Form("SendTo")
	SendUser = request.Form("SendUser")
	MSGID = GetSafeInt(Trim(Request("id")),0)
	If MSGID < 1 Then
	GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
	sSql = "SELECT * FROM Message WHERE D_ID="&MSGID
	oRs.Open sSql, oConn, 1, 3
	oRs("About") = U_About
	oRs("Title") = U_Title
	oRs("Content") = U_Text
	oRs("U_Tel") = U_Tel
	oRs("Address") = U_Address
	oRs("Mail") = U_Mail
	oRs("SendUser") = Session("Sys_Admin")
	oRs("msgState") = 1
	oRs("SendTo") = SendTo
	oRs.Update
	oRs.Close
	set ors=nothing
	Call OKGo("��Ϣ���ͳɹ�!","message.asp")
	end if

if request.form("Submit")="�������" then
	U_About = Request.Form("About")
	U_Title = Request.Form("Title")
	U_Text = Request.Form("Content")
	U_Tel = Request.Form("Tel")
	U_Address = Request.Form("Address")
	U_Mail= Request.Form("Mail")
	SendTo=request.Form("SendTo")
	SendUser = request.Form("SendUser")
	MSGID = GetSafeInt(Trim(Request("id")),0)
	If MSGID < 1 Then
	GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
	sSql = "SELECT * FROM Message WHERE D_ID="&MSGID
	oRs.Open sSql, oConn, 1, 3
	oRs("About") = U_About
	oRs("Title") = U_Title
	oRs("Content") = U_Text
	oRs("U_Tel") = U_Tel
	oRs("Address") = U_Address
	oRs("Mail") = U_Mail
	oRs("SendUser") = Session("Sys_Admin")
	oRs("MsgState") = 0
	oRs("SendTo") = SendTo
	oRs.Update
	oRs.Close
	set ors=nothing
	Call OKGo("��Ϣ����ɹ�!","message.asp")
	end if
	
if request.form("Submit")="����" then
	U_About = Request.Form("About")
	U_Title = Request.Form("Title")
	U_Text = Request.Form("Content")
	U_Tel = Request.Form("Tel")
	U_Address = Request.Form("Address")
	U_Mail= Request.Form("Mail")
	SendTo=request.Form("SendTo")
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
	sSql = "SELECT * FROM Message WHERE D_ID is Null"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("About") = U_About
	oRs("Title") = U_Title
	oRs("Content") = U_Text
	oRs("U_Tel") = U_Tel
	oRs("Address") = U_Address
	oRs("Mail") = U_Mail
	oRs("SendUser") = Session("Sys_Admin")
	oRs("MsgState") = 0
	oRs("SendTo") = SendTo
	oRs.Update
	oRs.Close
	set oRs=nothing
	Call OKGo("��Ϣ����ɹ���","message.asp")
	end if
	
	if request("sid")="del" then
	MSGID = GetSafeInt(Trim(Request("id")),0)
	If MSGID < 1 Then
	GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If
	'response.write MSGID
	'response.end
	oConn.execute("update Message Set MsgState=3 where D_id="&MSGID)
	Call OKGo("��Ϣɾ���ɹ���","message.asp")
	end if
	
	if request("sid")="delRecycled" then
	MSGID = GetSafeInt(Trim(Request("id")),0)
	If MSGID < 1 Then
	GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If
	'response.write MSGID
	'response.end
	oConn.execute("update Message Set MsgState=4 where D_id="&MSGID)
	Call OKGo("��Ϣɾ���ɹ���","message.asp")
	end if
	
	
%>

<%
Call Header("����Ϣ����")
%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<link href="../../css/Style.css" rel="stylesheet" type="text/css" />
<br>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><%=Homepage_title%> - <font color="#FF0000">����Ϣ����</font></b></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#799ADD">
  <tr>
    <td width="80%" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="799AE1">
      <tr>
        <td align="center" bgcolor="#FFFFFF"><table border="0" cellspacing="0" cellpadding="6">
            <tr>
                <td align="center"><a href="message.asp?SID=Readfold"><img src="../../img/o_inbox.gif" alt="�ռ���" width="40" height="40" border="0" /></a></td>
                <td align="center"><a href="message.asp?SID=Getfold"><img src="../../img/M_isread.gif" alt="�ռ���" width="40" height="40" border="0" /></a></td>
                <td align="center"><a href="message.asp?SID=Sendfold"><img src="../../img/M_outbox.gif" alt="�ռ���" width="40" height="40" border="0" /></a><a href="message.asp?SID=sendedFold"></a></td>
                <td align="center"><a href="message.asp?SID=Recycled"><img src="../../img/M_recycle.gif" alt="�ռ���" width="40" height="40" border="0" /></a></td>
                <td align="center"><a href="message.asp?SID=Write"><img src="../../img/m_write.gif" alt="�ռ���" width="40" height="40" border="0" /></a></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <br />
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="799AE1">
        <tr>
          <td width="10%" height="25" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF" class="font"><b><font color="#fffff">�Ѷ�</font></b></td>
          <td width="10%" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF"><b><font color="#fffff">������</font></b></td>
          <td width="30%" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF"><b><font color="#fffff">����</font></b></td>
          <td width="20%" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF"><b><font color="#fffff">����</font></b></td>
          <td width="10%" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF"><b><font color="#fffff">��С</font></b></td>
          <td width="10%" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF"><b><font color="#fffff">����</font></b></td>
        </tr>
      </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="799AE1">
   <%
    action=request.querystring("SID")
	  Select Case action
	  Case "Readfold"     sSql = "SELECT * FROM Message where Msgstate=1 and sendto='"&Session("Sys_Admin")&"'"
      Case "Getfold"      sSql = "SELECT * FROM Message where Msgstate=2 and sendto='"&Session("Sys_Admin")&"'"
      Case "Sendfold"     sSql = "SELECT * FROM Message where Msgstate=0 and SendUser='"&Session("Sys_Admin")&"'"
	  Case "sendedFold"   sSql = "SELECT * FROM Message where Msgstate=2 and SendUser='"&Session("Sys_Admin")&"'"
	  Case "Recycled"     sSql = "SELECT * FROM Message where Sendto='"&Session("Sys_Admin")&"' and msgstate=3"
	  Case else           sSql = "SELECT * FROM Message where Msgstate=1 and sendto='"&Session("Sys_Admin")&"'"
      End Select
	  Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Loopno, Mpage,Pmcount,pageno
Rcount = oRs.Recordcount
If Pmcount="" or isempty(Pmcount) or Pmcount<1 then
        Pmcount=15
End If
oRs.Pagesize = pmcount   	'����ÿҳ��
Mpage = oRs.Pagecount    	'�õ���ҳ��
Pageno = GetSafeInt(Request("Pageno"),1)
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'align=center>��ʱû���κζ���Ϣ��</td></tr>"
Else
	oRs.Absolutepage = Pageno	'��ָ������ָ��ҳ�ĵ�һ����¼
	Loopno = Pmcount
	Do While Not oRs.Eof and Loopno > 0
%>
        <tr>
          <td width="10%" height="25" align="center" bgcolor="#FFFFFF" class="font"><%
      Select Case ors("MsgState")
      Case "0"   response.write "�ݸ�"
      Case "1"   response.write "δ��"
	  Case "2"   response.write "�Ѷ�"
	  Case "3"   response.write "ɾ��"
      End Select
	%>          </td>
          <td width="10%" align="center" bgcolor="#FFFFFF"><%=oRs("SendUser")%>&nbsp;</td>
          <td width="30%" align="center" bgcolor="#FFFFFF">
		  <% if action="Readfold" or action="" then %>
		  <a href="?action=read&id=<%=ors("D_Id")%>" target="_self"><%=oRs("Title")%></a>
		  <% end if %>
		  
		  <% if action="Getfold" then %>
		  <a href="?action=read&id=<%=ors("D_Id")%>" target="_self"><%=oRs("Title")%></a>
		  <% end if %>
		  
		  <% if action="Sendfold" then %>
		  <a href="?action=edit&id=<%=ors("D_Id")%>" target="_self"><%=oRs("Title")%></a>
		  <% end if %>
		  
		  <% if action="Recycled" then %>
		  <a href="?action=Recycled&id=<%=ors("D_Id")%>" target="_self"><%=oRs("Title")%></a>
		  <% end if %>		  
		  </td>
          <td width="20%" align="center" bgcolor="#FFFFFF"><%=oRs("SendTime")%>&nbsp;</td>
          <td width="10%" align="center" bgcolor="#FFFFFF"><%=lenb(oRs("Content"))%>KB&nbsp;</td>
          <td width="10%" align="center" bgcolor="#FFFFFF">
		  <% if action="Recycled" then %>
		  �ظ�|<a href="?sid=delRecycled&id=<%=oRs("D_id")%>">ɾ��</a> 
		  <% else %>
		  �ظ�|<a href="?sid=del&id=<%=oRs("D_id")%>">ɾ��</a> 
		  <% end if %>
		  </td>
        </tr>
        <%
		oRs.Movenext						
		Loopno=Loopno-1
		Loop		
		oRs.Close
		set oRs=nothing
		End if
	  %>
      </table>
      <br />
	  <% if request.querystring("SID")="Write" then %>
	  <form action="" method="post">
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="799AE1">
        <tr>
          <td width="13%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="87%" bgcolor="#FFFFFF"><span class="Position">
            <input class="input"  id="Title" size="50" name="Title" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><span class="Position">
              <input class="input"   id="SendTo" name="SendTo" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><span class="Position">
            <textarea class="input" id="Content" name="Content" rows="6" cols="60"></textarea>
            <input name="senduser" type="hidden" id="senduser" value="<%=Session("Sys_Admin")%>" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
          <td bgcolor="#FFFFFF"><label>
            <input type="submit" name="Submit" value="����" />
              <input name="Submit" type="submit" id="Submit" value="����" />
          </label></td>
        </tr>
      </table>
	  </form>
	  <% end if %>
	  <%
		if request.querystring("action")="edit" then
		MSGID = GetSafeInt(Trim(Request("id")),0)
		If MSGID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
		End If
		Set oRs = Server.CreateObject( "ADODB.Recordset" )
		Sqlread="select * from message where D_ID="&MSGID
		oRs.Open Sqlread, oConn, 0, 1
		If Not oRs.Eof Then
	  %>
	  <form action="" method="post">
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="799AE1">
        <tr>
          <td width="13%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="87%" bgcolor="#FFFFFF"><span class="Position">
              <input name="Title" class="input"  id="Title" value="<%=ors("Title")%>" size="50" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><span class="Position">
              <input name="SendTo" class="input"   id="SendTo" value="<%=ors("SendTo")%>" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><span class="Position">
              <textarea class="input" id="Content" name="Content" rows="6" cols="60"><%=ors("Content")%></textarea>
            <input name="senduser" type="hidden" id="senduser" value="<%=Session("Sys_Admin")%>" />
          </span></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
          <td bgcolor="#FFFFFF"><label> 
              <input type="submit" name="Submit" value="���Ͷ���" />
              <input name="Submit" type="submit" id="Submit" value="�������" />
              <input name="id" type="hidden" id="id" value="<%=ors("D_id")%>">
              </label></td>
        </tr>
      </table>
	  </form>
	  <%
	    ors.close
		set oRs=nothing
		Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
		End If
		end if
		%>
	  <%
	  if request.querystring("action")="read" then
		MSGID = GetSafeInt(Trim(Request("id")),0)
		If MSGID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
		End If
		Sqlread="select * from message where D_ID="&MSGID
		Set oRs = Server.CreateObject( "ADODB.Recordset" )
		oRs.Open Sqlread, oConn, 0, 1
		If Not oRs.Eof Then
	  %>
	  <br/>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="799AE1">
        <tr>
          <td width="13%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="87%" bgcolor="#FFFFFF"><%=oRs("SendUser")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF"> ��ַ </td>
          <td bgcolor="#FFFFFF"><%=oRs("Address")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">�ʼ�</td>
          <td bgcolor="#FFFFFF"><%=oRs("Mail")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">�绰</td>
          <td bgcolor="#FFFFFF"><%=oRs("U_Tel")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><%=oRs("Title")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><%=oRs("Content")%></td>
        </tr>
      </table>
	  <%
	    ors.close
		set oRs=nothing
	    oconn.execute("update message set msgstate=2 where D_id="&MSGID)
		Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
		End If
		end if
		%>
		
		<%
	  if request.querystring("action")="Recycled" then
		MSGID = GetSafeInt(Trim(Request("id")),0)
		If MSGID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
		End If
		Sqlread="select * from message where D_ID="&MSGID
		Set oRs = Server.CreateObject( "ADODB.Recordset" )
		oRs.Open Sqlread, oConn, 0, 1
		If Not oRs.Eof Then
	  %>
	  <br/>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="799AE1">
        <tr>
          <td width="13%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="87%" bgcolor="#FFFFFF"><%=oRs("SendUser")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF"> ��ַ </td>
          <td bgcolor="#FFFFFF"><%=oRs("Address")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">�ʼ�</td>
          <td bgcolor="#FFFFFF"><%=oRs("Mail")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">�绰</td>
          <td bgcolor="#FFFFFF"><%=oRs("U_Tel")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><%=oRs("Title")%></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF"><%=oRs("Content")%></td>
        </tr>
      </table>
	  <%
	    ors.close
		set oRs=nothing
		Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
		End If
		end if
		%>
    
    </td>
    <td width="20%" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="799AE1">
      <tr>
        <td width="10%" height="25" align="center" background="../../img/bg1.gif" bgcolor="#FFFFFF" class="font"><b><font color="#fffff">��ǰ����</font></b></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="4">
        <tr>
          <td>
		  	<%
			dim online,i,onlinetime
	online=Application("onlinelist")
	online=split(online,"##")
	for i=lbound(online) to ubound(online)-1
	onlinetime=split(online(i),"|")
	response.Write onlinetime(0)&"<br>"
	next
	%>
		  </td>
        </tr>
      </table></td>
  </tr>
</table>
<% Call Footer() %>
