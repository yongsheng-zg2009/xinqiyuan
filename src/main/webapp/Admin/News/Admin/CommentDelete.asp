<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%

Call Header("删除信息")
Call Content()
Call Footer()

' 本页内容区
Sub Content()
	' 取参数：新闻ID
	Dim strIdList,arrIdList,iId,i,action,H_Level
	H_Level = Session("Sys_Level")
	
	If H_Level > 1 Then
	strIdList = GetSafeStr(Trim(Request.Form("NewsID")))
	action = GetSafeStr(Trim(Request.Form("action")))
	Select Case action
	Case "del"
		If Not IsEmpty(strIdList) Then
			arrIdList = Split(strIdList,",")
		
			For i = 0 To UBound(arrIdList)
				iId = Clng(arrIdList(i))			
				Call DelNews(iId)			
			Next
		
			Call OKToWhere("信息删除成功，确认返回！","-1")
		Else
			Call OKToWhere("请至少选择一条信息记录！","-1")
		End If
	Case "check"
		If Not IsEmpty(strIdList) Then
			arrIdList = Split(strIdList,",")
		
			For i = 0 To UBound(arrIdList)
				iId = Clng(arrIdList(i))			
				oConn.Execute("UPDATE NewsData SET D_Num = 1 WHERE D_ID="&iId&"")			
			Next
		
			Call OKToWhere("信息审核成功，确认返回！","-1")
		Else
			Call OKToWhere("请至少选择一条信息记录！","-1")
		End If
	Case "uncheck"
		If Not IsEmpty(strIdList) Then
			arrIdList = Split(strIdList,",")
		
			For i = 0 To UBound(arrIdList)
				iId = Clng(arrIdList(i))			
				oConn.Execute("UPDATE NewsData SET D_Num = 0 WHERE D_ID="&iId&"")
			Next
		
			Call OKToWhere("信息撤销成功，确认返回！","-1")
		Else
			Call OKToWhere("请至少选择一条信息记录！","-1")
		End If
	End Select
	Else
		Call OKToWhere("您的权限不足以进行次操作！","-1")
	End If
End Sub

Sub DelNews(idstr)

	sSql = "DELETE FROM Comment WHERE D_ID=" & idstr
	oConn.Execute sSql
	
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


