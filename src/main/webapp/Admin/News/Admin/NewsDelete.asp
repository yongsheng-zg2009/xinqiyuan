<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->


<%

Call Header("ɾ����Ϣ")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()

	' ȡ����������ID
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
		
			Call OKToWhere("��Ϣɾ���ɹ���ȷ�Ϸ��أ�","-1")
		Else
			Call OKToWhere("������ѡ��һ����Ϣ��¼��","-1")
		End If
	Case "check"
		If Not IsEmpty(strIdList) Then
			arrIdList = Split(strIdList,",")
		
			For i = 0 To UBound(arrIdList)
				iId = Clng(arrIdList(i))			
				oConn.Execute("UPDATE NewsData SET D_Num = 1 WHERE D_ID="&iId&"")			
			Next
		
			Call OKToWhere("��Ϣ��˳ɹ���ȷ�Ϸ��أ�","-1")
		Else
			Call OKToWhere("������ѡ��һ����Ϣ��¼��","-1")
		End If
	Case "uncheck"
		If Not IsEmpty(strIdList) Then
			arrIdList = Split(strIdList,",")
		
			For i = 0 To UBound(arrIdList)
				iId = Clng(arrIdList(i))			
				oConn.Execute("UPDATE NewsData SET D_Num = 0 WHERE D_ID="&iId&"")
			Next
		
			Call OKToWhere("��Ϣ�����ɹ���ȷ�Ϸ��أ�","-1")
		Else
			Call OKToWhere("������ѡ��һ����Ϣ��¼��","-1")
		End If
	End Select
	Else
		Call OKToWhere("����Ȩ�޲����Խ��дβ�����","-1")
	End If
End Sub

Sub DelNews(idstr)

	' ���������ݱ���ȡ����ص��ϴ��ļ�
	' �ϴ��󱣴浽���ط�������·���ļ����������"|"�ָ�
	' ɾ���ļ���Ҫȡ��·�����ļ����ſ��ԣ�����ֻҪ����Ϳ����ˣ�ԭ�����ԭ�ļ����򲻴�·���ı����ļ��������������ط�ʹ��

	Dim sSavePathFileName
	
	sSql = "SELECT D_SavePathFileName FROM NewsData WHERE D_ID=" & idstr
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sSavePathFileName = oRs("D_SavePathFileName")
	Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
	End If
	oRs.Close

	' �Ѵ�"|"���ַ���תΪ����
	Dim aSavePathFileName
	aSavePathFileName = Split(sSavePathFileName, "|")

	' ɾ��������ص��ļ������ļ�����
	Dim j
	For j = 0 To UBound(aSavePathFileName)
		' ��·���ļ���ɾ���ļ�
		Call DoDelFile(aSavePathFileName(j))
	Next

	' ɾ������
	sSql = "DELETE FROM NewsData WHERE D_ID=" & idstr
	oConn.Execute sSql
	
End Sub

' ɾ��ָ�����ļ�
Sub DoDelFile(sPathFile)
	On Error Resume Next
	Dim oFSO
	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	oFSO.DeleteFile(Server.MapPath(sPathFile))
	Set oFSO = Nothing
End Sub
%>


