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
                      <TD>您好 <%=session("adminName")%>，您上次登录的时间是： 2006-12-8 16:42:03 
                  </TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=ShopInfo_Title>信息快报</TD></TR>
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
                      <TD>您的网站已有留言 0 条 <A 
                        href="/message" 
                        >[点击查看]</A></TD>
                    </TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=ShopInfo_Title>当前空间使用情况</TD></TR>
              <TR>
                <TD>
                  <TABLE width="100%"  border=0 cellPadding=0 cellSpacing=0 class=ShopInfo>
                    <TR bgcolor="#FFFFFF">
                      <TD width="50%">服务器名和IP：<%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</TD>
                      <TD width="50%">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>服务器操作系统：Windows Server 2003
                        <%
	'Dim WshShell,WshSysEnv, okOS
	'Set WshShell = Server.CreateObject("WScript.Shell")
	'Set WshSysEnv = WshShell.Environment("SYSTEM")
	'okOS = Cstr(WshSysEnv("OS"))
	'Response.Write okOS
%></TD>
                      <TD>IIS 版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>站点物理路径：<%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></TD>
                      <TD>数据库占用空间总计：
                        <%Call GetFileSize("/admin/MyDB/")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>上传图片空间总计：
                        <%Call GetFileSize("/admin/News/UploadFile")%></TD>
                      <TD>整个站点空间总计：
                        <%Call GetFileSize("/")%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>FSO文本读写：
                        <%
If IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%></TD>
                      <TD>数据库使用：
                        <%
If IsObjInstalled("adodb.connection") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD><span class="forumrow">无组件上传支持：
                          <%
If IsObjInstalled("Adodb.Stream") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%>
                      </span></TD>
                      <TD>AspUpload上传支持
                        <%
If IsObjInstalled("Persits.Upload") Then
	Response.Write "<font color=green><b>√</b></font>"
Else
	Response.Write "<font color=red><b>×</b></font>"
End If
%></TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                      <TD>Jmail组件支持：
                        <%
If Not IsObjInstalled("JMail.SmtpMail") Then
	Response.Write "<font color=#FF0000><b>×</b></font>"
Else
	Response.Write "<font color=#FF0000><b>√</b></font>"
End If
%></TD>
                      <TD>CDONTS组件支持：
                        <%
If Not IsObjInstalled("CDONTS.NewMail") Then
	Response.Write "<font color=#FF0000><b>×</b></font>"
Else
	Response.Write "<font color=#FF0000><b>√</b></font>"
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

