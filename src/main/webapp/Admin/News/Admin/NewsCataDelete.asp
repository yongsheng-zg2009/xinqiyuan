<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("ɾ����Ϣ���")
Call Content()
Call Footer()
' ��ҳ������
Sub Content()

	Dim H_Level
	H_Level = Session("Sys_Level")
	
	'��֤Ȩ��
	If H_Level > 1 Then
	
		' �������������ID
		Dim sRootID
		sRootID = GetSafeStr(Trim(Request("delrootid")))
	
		' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
		If Len(sRootID) < 5 Then
			GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
		End If
		
		Dim aRs, aSql, aLen
		Set aRs = Server.CreateObject( "ADODB.Recordset" )
		aSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&sRootID&"'"
		aRs.Open aSql, oConn, 1, 1
		If Not aRs.EOF Then
			aLen = Len(sRootID)
		Else
			Call OKToWhere("��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������","-1")	
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
				
				' ɾ����Ϣ��� 
				bRs.Delete
				bRs.Update
			End If
			
		'��ʵ����Ӧ�û���һ���ǳ���Ҫ�Ĳ���������ʱ��Ĺ�ϵ����ʱ��д�������Ժ������䡣
		'�������Ƶ���Ķ������в���������д��д������ν�ġ�
		'������Ϊһ���Ͻ��ĳ����������˲����ز����٣�-----̤ѩ�޺�
		
		bRs.Movenext
		Loop
		bRs.Close
		Set bRs = Nothing
		
		Call OKToWhere("��Ϣ���ɾ���ɹ���ȷ�Ϸ��أ�","-1")
	Else
		Call OKToWhere("����Ȩ�޲����Խ��дβ�����","-1")
	End If
End Sub

Sub DelNews(idstr)

	' ���������ݱ���ȡ����ص��ϴ��ļ�
	' �ϴ��󱣴浽���ط�������·���ļ����������"|"�ָ�
	' ɾ���ļ���Ҫȡ��·�����ļ����ſ��ԣ�����ֻҪ����Ϳ�����!	

	Dim cRs, cSql, sSavePathFileName
	
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsData WHERE D_CataID = '"&idstr&"'"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.Eof
		sSavePathFileName = cRs("D_SavePathFileName")

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
		cRs.Delete
		cRs.Update
		
	cRs.Movenext
	Loop
	cRs.Close
	Set cRs = Nothing
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


