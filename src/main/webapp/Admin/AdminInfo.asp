<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<HTML>
<HEAD>
<TITLE>AdminInfo</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=JavaScript name=vs_defaultClientScript>
<LINK href="AdminShopInfo.files/default.css" type=text/css rel=stylesheet></HEAD>
<BODY>
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
<SCRIPT language=JavaScript>if(parent && parent.Top && parent.Top.setMainLocation)parent.Top.setMainLocation(window)</SCRIPT>
<TABLE cellSpacing=0 cellPadding=0 width="99%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=C_Left_03 vAlign=top width=8><IMG height=7 
      src="AdminShopInfo.files/JiSu_Admin_22.gif" width=8></TD>
    <TD class=C_Left_01>&nbsp;</TD>
    <TD class=C_Left_04 vAlign=top width=8><IMG height=7 
      src="AdminShopInfo.files/JiSu_Admin_25.gif" width=8></TD></TR>
  <TR>
    <TD class=C_Left_03>&nbsp;</TD>
    <TD class=C_Middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD height="96" align=middle vAlign=top>
            <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE class=ShopInfo cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD>���� <%=session("adminName")%>�����ϴε�¼��ʱ���ǣ� 2006-12-8 16:42:03 
                  </TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=ShopInfo_Title>��Ϣ�챨</TD></TR>
              <TR>
                <TD>
                  <TABLE class=ShopInfo cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD></TD></TR>
                    <TR>
                      <TD></TD></TR>
                    <TR>
                      <TD></TD></TR>
                    <TR>
                      <TD></TD></TR>
                    <TR>
                      <TD>������վ�������� 0 �� <A 
                        href="/message" 
                        >[����鿴]</A></TD>
                    </TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=ShopInfo_Title>��ǰ�ռ�ʹ�����</TD></TR>
              <TR>
                <TD>
                  <TABLE width="100%"  border=0 cellPadding=0 cellSpacing=0 class=ShopInfo>
                    <TR bgcolor="#FFFFFF">
                      <TD width="50%">����������IP��<%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</TD>
                      <TD width="50%">�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>����������ϵͳ��Windows Server 2003
                        <%
	'Dim WshShell,WshSysEnv, okOS
	'Set WshShell = Server.CreateObject("WScript.Shell")
	'Set WshSysEnv = WshShell.Environment("SYSTEM")
	'okOS = Cstr(WshSysEnv("OS"))
	'Response.Write okOS
%></TD>
                      <TD>IIS �汾��<%=Request.ServerVariables("SERVER_SOFTWARE")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>վ������·����<%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></TD>
                      <TD>���ݿ�ռ�ÿռ��ܼƣ�
                        <%Call GetFileSize("/admin/MyDB/")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>�ϴ�ͼƬ�ռ��ܼƣ�
                        <%Call GetFileSize("/admin/News/UploadFile")%></TD>
                      <TD>����վ��ռ��ܼƣ�
                        <%Call GetFileSize("/")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>FSO�ı���д��
                        <%
If IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%></TD>
                      <TD>���ݿ�ʹ�ã�
                        <%
If IsObjInstalled("adodb.connection") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD><span class="forumrow">������ϴ�֧�֣�
                          <%
If IsObjInstalled("Adodb.Stream") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%>
                      </span></TD>
                      <TD>AspUpload�ϴ�֧��
                        <%
If IsObjInstalled("Persits.Upload") Then
	Response.Write "<font color=green><b>��</b></font>"
Else
	Response.Write "<font color=red><b>��</b></font>"
End If
%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>Jmail���֧�֣�
                        <%
If Not IsObjInstalled("JMail.SmtpMail") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%></TD>
                      <TD>CDONTS���֧�֣�
                        <%
If Not IsObjInstalled("CDONTS.NewMail") Then
	Response.Write "<font color=#FF0000><b>��</b></font>"
Else
	Response.Write "<font color=#FF0000><b>��</b></font>"
End If
%></TD>
                    </TR>

                  </TABLE></TD></TR></TBODY></TABLE></TD>
          </TR>
        </TBODY></TABLE></TD>
    <TD class=C_Left_04>&nbsp;</TD></TR>
  <TR>
    <TD class=C_Left_03 vAlign=bottom width=8><IMG height=8 
      src="AdminShopInfo.files/JiSu_Admin_48.gif" width=8></TD>
    <TD class=C_Left_02>&nbsp;</TD>
    <TD class=C_Left_04 vAlign=bottom width=8><IMG height=8 
      src="AdminShopInfo.files/JiSu_Admin_51.gif" width=8></TD></TR></TBODY></TABLE>
</BODY></HTML>

