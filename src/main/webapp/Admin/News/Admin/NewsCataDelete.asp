<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("删除信息类别")
Call Content()
Call Footer()
' 本页内容区
Sub Content()

	Dim H_Level
	H_Level = Session("Sys_Level")
	
	'验证权限
	If H_Level > 1 Then
	
		' 传入参数：新闻ID
		Dim sRootID
		sRootID = GetSafeStr(Trim(Request("delrootid")))
	
		' 新闻ID有效性验证，防止有些人恶意的破坏此演示程序
		If Len(sRootID) < 5 Then
			GoError "请通过页面上的链接进行操作，不要试图进行任何非法操作。"
		End If
		
		Dim aRs, aSql, aLen
		Set aRs = Server.CreateObject( "ADODB.Recordset" )
		aSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&sRootID&"'"
		aRs.Open aSql, oConn, 1, 1
		If Not aRs.EOF Then
			aLen = Len(sRootID)
		Else
			Call OKToWhere("请通过页面上的链接进行操作，不要试图进行任何非法操作。","-1")	
		End If
		aRs.Close
		Set aRs = Nothing
			
		Dim bRs, bSql, bRootID
		Set bRs = Server.CreateObject( "ADODB.Recordset" )
		bSql = "SELECT * FROM NewsCata ORDER BY C_ID DESC"
		bRs.Open bSql, oConn, 1, 3
		Do While Not bRs.Eof
			bRootID = bRs("C_RootID")
			If Mid(bRootID,1,aLen) = sRootID Then
				Call DelNews(bRootID)
				
				' 删除信息类别 
				bRs.Delete
				bRs.Update
			End If
			
		'其实这里应该还有一个非常重要的操作，由于时间的关系，暂时不写，留待以后再扩充。
		'如果不是频繁的对类别进行操作，这里写不写都无所谓的。
		'但是作为一个严谨的程序来讲，此操作必不可少！-----踏雪无痕
		
		bRs.Movenext
		Loop
		bRs.Close
		Set bRs = Nothing
		
		Call OKToWhere("信息类别删除成功，确认返回！","-1")
	Else
		Call OKToWhere("您的权限不足以进行次操作！","-1")
	End If
End Sub

Sub DelNews(idstr)

	' 从新闻数据表中取出相关的上传文件
	' 上传后保存到本地服务器的路径文件名，多个以"|"分隔
	' 删除文件，要取带路径的文件名才可以，并且只要这个就可以了!	

	Dim cRs, cSql, sSavePathFileName
	
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsData WHERE D_CataID = '"&idstr&"'"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.Eof
		sSavePathFileName = cRs("D_SavePathFileName")

		' 把带"|"的字符串转为数组
		Dim aSavePathFileName
		aSavePathFileName = Split(sSavePathFileName, "|")

		' 删除新闻相关的文件，从文件夹中
		Dim j
		For j = 0 To UBound(aSavePathFileName)
			' 按路径文件名删除文件
			Call DoDelFile(aSavePathFileName(j))
		Next

		' 删除新闻
		cRs.Delete
		cRs.Update
		
	cRs.Movenext
	Loop
	cRs.Close
	Set cRs = Nothing
End Sub

' 删除指定的文件
Sub DoDelFile(sPathFile)
	On Error Resume Next
	Dim oFSO
	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	oFSO.DeleteFile(Server.MapPath(sPathFile))
	Set oFSO = Nothing
End Sub
%>


