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
Call Header("管理中心")
Call Content()
Call Footer()

' 开始写入内容
Sub Content()
%>
<!--#include file="Include/Top.asp" -->
<br>
<TABLE cellSpacing=0 cellPadding=0 width=95% align=center border=0>
  <TR> 
    <TD > 
      <p><b><font color="#FF0000">欢迎光临 <%=homepage_title%>--管理控制面板</font></b></p>   
      <p>在这里，您可以控制你所有的网站设置。请在此页的左侧选择您要进行管理的链接。</p>
    </TD>
  </TR>
</TABLE>
<table cellpadding="2" cellspacing="1" border="0" width="95%" align="center">
  <tr bgcolor="#799AE1"> 
    <td colspan=2 height=25> 
      <div align="center"><font color="#FFFFFF"><b>数据库信息统计</b></font></div>
    </td>
  <tr> 
    <td width="50%"   height=23 bgcolor="#DDEEFF">服务器名和IP：<%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
    <td width="50%"  bgcolor="#DDEEFF">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr> 
    <td width="50%"   height=23 bgcolor="#DDEEFF">服务器操作系统：
<%
	Dim WshShell,WshSysEnv, okOS
	Set WshShell = Server.CreateObject("WScript.Shell")
	Set WshSysEnv = WshShell.Environment("SYSTEM")
	okOS = Cstr(WshSysEnv("OS"))
	Response.Write okOS
%>
	</td>
    <td width="50%"  bgcolor="#DDEEFF">IIS 版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>   
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">站点物理路径：<%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
    <td width="50%"  bgcolor="#DDEEFF">数据库占用空间总计： 
      <%Call GetFileSize("/admin/MyDB/")%>
    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">上传图片空间总计： 
      <%Call GetFileSize("/admin/News/UploadFile")%>    </td>
    <td width="50%"  bgcolor="#DDEEFF">整个站点空间总计： 
      <%Call GetFileSize("/")%>    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF">FSO文本读写：    
<%
If IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%>
    </td>
    <td width="50%"  bgcolor="#DDEEFF">数据库使用： 
<%
If IsObjInstalled("adodb.connection") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%>
    </td>
  </tr>
  <tr> 
    <td width="50%"  height=23 bgcolor="#DDEEFF"><span class="forumrow">无组件上传支持：
<%
If IsObjInstalled("Adodb.Stream") Then
	Response.Write "<font color=#FF0000><b>√</b></font>"
Else
	Response.Write "<font color=#FF0000><b>×</b></font>"
End If
%>
    </span></td>
    <td width="50%"  bgcolor="#DDEEFF">AspUpload上传支持   
<%
If IsObjInstalled("Persits.Upload") Then
	Response.Write "<font color=green><b>√</b></font>"
Else
	Response.Write "<font color=red><b>×</b></font>"
End If
%>
	</td>
  </tr>
  <tr>
    <td  height=23 bgcolor="#DDEEFF">Jmail组件支持：   
<%
If Not IsObjInstalled("JMail.SmtpMail") Then
	Response.Write "<font color=#FF0000><b>×</b></font>"
Else
	Response.Write "<font color=#FF0000><b>√</b></font>"
End If
%>	</td>
    <td  bgcolor="#DDEEFF">CDONTS组件支持：   
<%
If Not IsObjInstalled("CDONTS.NewMail") Then
	Response.Write "<font color=#FF0000><b>×</b></font>"
Else
	Response.Write "<font color=#FF0000><b>√</b></font>"
End If
%>    </td>
  </tr>
</table>
<table width="95%" border="0" cellspacing="1" cellpadding="2" align="center">
  <tr> 
    <td bgcolor="#799AE1" height="25"> 
      <div align="center"><font color="#FFFFFF"><b>服务器基本数据测试</b></font></div>
    </td>
  </tr>
  <tr> 
    <td height="23" bgcolor="#DDEEFF">磁盘文件操作速度测试：
      <%
	Response.Write "正在重复创建、写入和删除文本文件50次..."

	Dim thetime3,tempfile,iserr,t1,FsoObj,tempfileOBJ,t2,i
	Set FsoObj=Server.CreateObject("Scripting.FileSystemObject")

	iserr=False
	t1=timer
	tempfile=server.MapPath("./") & "\aspchecktest.txt"
	For i=1 To 50
		Err.Clear

		Set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		If Err <> 0 Then
			Response.Write "创建文件错误！"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		If Err <> 0 Then
			Response.Write "写入文件错误！"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete 
		If Err <> 0 Then
			Response.Write "删除文件错误！"
			iserr=True
			Err.Clear
			Exit For
		end if
		Set tempfileOBJ=Nothing
	Next
	t2=timer
	If Not iserr Then
		thetime3=cstr(int(( (t2-t1)*10000 )+0.5)/10)
		Response.Write "...已完成！本服务器执行此操作共耗时 <font color=red>" & thetime3 & " 毫秒</font>"
	End If
%>
    </td>
  </tr>
  <tr>
    <td height="23" bgcolor="#DDEEFF">整数运算测试：
      <%

	Response.Write "正在进行50万次加法运算..."
	dim lsabc,thetime,thetime2
	t1=timer
	for i=1 to 500000
		lsabc= 1 + 1
	next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！共耗时 <font color=red>" & thetime & " 毫秒</font><br>"
%>
    </td>
  </tr>
  <tr>
    <td height="23" bgcolor="#DDEEFF">浮点运算测试：
      <%

	Response.Write "正在进行20万次开方运算..."
	t1=timer
	for i=1 to 200000
		lsabc= 2^0.5
	next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！共耗时 <font color=red>" & thetime2 & " 毫秒</font><br>"
%>
    </td>
  </tr>
</table>
<%
End Sub
%>
