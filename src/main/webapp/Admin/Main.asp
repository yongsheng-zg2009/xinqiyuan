<!--#include file = "Include/DBClass.inc.asp"-->
<!--#include file = "Include/SysLoginCheck.inc.asp" -->

<%
Function GetFileSize(FileName)
	Dim fso,drvpath,d,size,showsize
	set fso=server.createobject("scripting.filesystemobject")
	drvpath=server.mappath(FileName)
	set d=fso.getfolder(drvpath)	
	size=d.size
	showsize=size & "&nbsp;Byte" 
	if size>1024 then
	   size=(Size/1024)
	   showsize=size & "&nbsp;KB"
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;MB"		
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;GB"	   
	end if   
	set fso=nothing
	Response.Write showsize
End Function

Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function

%>

<%
Call Header("��������")
Call Content()
Call Footer()

' ��ʼд������
Sub Content()
%>
<!--#include file="Include/Top.asp" -->
<br>
<TABLE cellSpacing=0 cellPadding=0 width=95% align=center border=0>
  <TR> 
    <TD > 
      <p><b><font color="#FF0000">��ӭ���� <%=homepage_title%>--����������</font></b></p>   
      <p>����������Կ��������е���վ���á����ڴ�ҳ�����ѡ����Ҫ���й�������ӡ�</p>
    </TD>
  </TR>
</TABLE>
<table cellpadding="2" cellspacing="1" border="0" width="95%" align="center">
  <tr bgcolor="#799AE1"> 
    <td colspan=2 height=25> 
      <div align="center"><font color="#FFFFFF"><b>���ݿ���Ϣͳ��</b></font></div>
    </td>
  <tr> 
    <td width="50%"   height=23 bgcolor="#DDEEFF">����������IP��<%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
    <td width="50%"  bgcolor="#DDEEFF">�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr> 
    <td width="50%"   height=23 bgcolor="#DDEEFF">����������ϵͳ��
<%
	Dim WshShell,WshSysEnv, okOS
	Set WshShell = Server.CreateObject("WScript.Shell")
	Set WshSysEnv = WshShell.Environment("SYSTEM")
	okOS = Cstr(WshSysEnv("OS"))
	Response.Write okOS
%>
	</td>
    <td width="50%"  bgcolor="#DDEEFF">IIS �汾��<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>   
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">վ������·����<%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
    <td width="50%"  bgcolor="#DDEEFF">���ݿ�ռ�ÿռ��ܼƣ� 
      <%Call GetFileSize("/admin/MyDB/")%>
    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">�ϴ�ͼƬ�ռ��ܼƣ� 
      <%Call GetFileSize("/admin/News/UploadFile")%>    </td>
    <td width="50%"  bgcolor="#DDEEFF">����վ��ռ��ܼƣ� 
      <%Call GetFileSize("/")%>    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">FSO�ı���д��    
<%
If IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>
    </td>
    <td width="50%"  bgcolor="#DDEEFF">���ݿ�ʹ�ã� 
<%
If IsObjInstalled("adodb.connection") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>
    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF"><span class="forumrow">������ϴ�֧�֣�
<%
If IsObjInstalled("Adodb.Stream") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>
    </span></td>
    <td width="50%"  bgcolor="#DDEEFF">AspUpload�ϴ�֧��   
<%
If IsObjInstalled("Persits.Upload") Then
	Response.Write "<font color=green><b>��</b></font>"
Else
	Response.Write "<font color=red><b>��</b></font>"
End If
%>
	</td>
  </tr>
  <tr>
    <td  height=23 bgcolor="#DDEEFF">Jmail���֧�֣�   
<%
If Not IsObjInstalled("JMail.SmtpMail") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>	</td>
    <td  bgcolor="#DDEEFF">CDONTS���֧�֣�   
<%
If Not IsObjInstalled("CDONTS.NewMail") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>    </td>
  </tr>
</table>
<table width="95%" border="0" cellspacing="1" cellpadding="2" align="center">
  <tr> 
    <td bgcolor="#799AE1" height="25"> 
      <div align="center"><font color="#FFFFFF"><b>�������������ݲ���</b></font></div>
    </td>
  </tr>
  <tr> 
    <td height="23" bgcolor="#DDEEFF">�����ļ������ٶȲ��ԣ�
      <%
	Response.Write "�����ظ�������д���ɾ���ı��ļ�50��..."

	Dim thetime3,tempfile,iserr,t1,FsoObj,tempfileOBJ,t2,i
	Set FsoObj=Server.CreateObject("Scripting.FileSystemObject")

	iserr=False
	t1=timer
	tempfile=server.MapPath("./") & "\aspchecktest.txt"
	For i=1 To 50
		Err.Clear

		Set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		If Err <> 0 Then
			Response.Write "�����ļ�����"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		If Err <> 0 Then
			Response.Write "д���ļ�����"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete 
		If Err <> 0 Then
			Response.Write "ɾ���ļ�����"
			iserr=True
			Err.Clear
			Exit For
		end if
		Set tempfileOBJ=Nothing
	Next
	t2=timer
	If Not iserr Then
		thetime3=cstr(int(( (t2-t1)*10000 )+0.5)/10)
		Response.Write "...����ɣ���������ִ�д˲�������ʱ <font color=red>" & thetime3 & " ����</font>"
	End If
%>
    </td>
  </tr>
  <tr>
    <td height="23" bgcolor="#DDEEFF">����������ԣ�
      <%

	Response.Write "���ڽ���50��μӷ�����..."
	dim lsabc,thetime,thetime2
	t1=timer
	for i=1 to 500000
		lsabc= 1 + 1
	next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�����ʱ <font color=red>" & thetime & " ����</font><br>"
%>
    </td>
  </tr>
  <tr>
    <td height="23" bgcolor="#DDEEFF">����������ԣ�
      <%

	Response.Write "���ڽ���20��ο�������..."
	t1=timer
	for i=1 to 200000
		lsabc= 2^0.5
	next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�����ʱ <font color=red>" & thetime2 & " ����</font><br>"
%>
    </td>
  </tr>
</table>
<%
End Sub
%>
