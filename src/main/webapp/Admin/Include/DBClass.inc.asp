<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option Explicit %>
<!--#include file="SetUp.asp" -->
<%
' ============================================
' ����ȫ�ֱ���
' ============================================
' ���ݿ����
Dim oConn, oRs, sSql, DateBase
' ============================================
' ��ʼ���ݴ���
' ============================================
' ��ʼ�����ݿ�����
Call DBConnBegin()
' ********************************************
' ����Ϊ���ݿ���غ���
' ********************************************
' ============================================
' ��ʼ�����ݿ����Ӷ���
' ʹ��ԭ����ٵ��ã������ͷ�
' ============================================
Sub DBConnBegin()
	' ������ݿ�����Ѵ򿪣���Ҫ�ٴ�
	If IsObject(oConn) = True Then Exit Sub
	' ����Բ���Ҫ�����ݿ����Ӷ����ֱ�Ӵ򿪼�¼�����󣬵��������Ҫ�򿪶����¼������Ļ���Ч���Ǻܵ͵ġ�
	' ����㲻����һ�����ݿ����Ӷ���ADO����ÿ����¼����ʱ�Զ�����һ���µ����ݿ����Ӷ��󣬾������õ�����ͬ��SQL��䡣
	Set oConn = Server.CreateObject("ADODB.Connection")
	On Error Resume Next
	' Access���ݿ� ���ݿ����Ѿ������˷�ֹ���صĻ��ǣ�
	DateBase = "/admin/MyDB/#9za0yb#$%@.mdb"
	oConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(DateBase)
	If Err.Number > 0 Then
		' ��ʾ������Ϣ,���ҷ����ʼ�֪ͨ����Ա
		'Call DBConnError(Err)
		' ��ȫ���˳��������еĽű�
		Response.End
	End If
	' ����һ����¼��
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
End Sub
' ============================================
' �ͷ����ݿ����Ӷ���
' ============================================
Sub DBConnEnd()
	On Error Resume Next
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
End Sub
' ********************************************
' ����Ϊ���ú���
' ********************************************
' ============================================
' ���󷵻ش���
' ============================================
Sub GoError(str)
	Call DBConnEnd()
	Response.Write "<script language=javascript>alert('" & str & "\n\nϵͳ���Զ�����ǰһҳ��...');history.back();</script>"
	Response.End
End Sub
' ============================================
' ���в����жϣ��Ƿ��һ������
' strAlert ��ʾ���� url1 ȷ�Ϸ��صĵ�ַ url2 ȡ�����صĵ�ַ
' ============================================
Function Confirm(strAlert,url1,url2)
	Response.Write("<Script Language='Javascript'>")
	Response.Write("if(confirm('"& strAlert &"'))")
	Response.Write("{")
	Response.Write("location.href='" & url1 & "';")
	Response.Write("}")
	Response.Write("else")
	Response.Write("{")
	Response.Write("location.href='" & url2 & "';")
	Response.Write("}")
	Response.Write("</Script>")
End Function
' ============================================
' ���в����жϣ��Ƿ��һ������
' strAlert ��ʾ���� Num ȷ�Ϸ��صĵ�ַ
' ============================================
Function OKToWhere(strAlert,Num)
	Response.Write("<Script Language='Javascript'>")
	Response.Write("alert('" & strAlert & "');")
	Response.Write("history.go(" & Num & ");")
	Response.Write("</Script>")
	Response.End
End Function

Function OKGo(strAlert,url)
	Response.Write("<Script Language='Javascript'>")
	Response.Write("alert('" & strAlert & "');")
	Response.Write("location.href='" & url & "';")
	Response.Write("</Script>")
	Response.End
End Function
' ============================================
' ������ʾ��Ϣ
' str ��ʾ����ϸ����
' ============================================
Function AlertMsg(str)
	Response.Write("<Script Language='Javascript'>")
	Response.Write("alert('" & str & "');")
	Response.Write("</Script>")
End Function
' ============================================
' �ж��Ƿ������֣�������Ĭ��ֵ�滻
' iCheck Ҫ�滻�ı���,iDefault Ĭ��ֵ
' ============================================
Function GetSafeInt(iCheck,iDefault) 
	If Trim(iCheck)="" Then
		GetSafeInt = iDefault
		Exit Function
	End If
	If IsNumeric(iCheck)=false Then
		GetSafeInt = iDefault
		Exit Function
	End If
	GetSafeInt = iCheck
End Function
' ============================================
' �õ���ȫ�ַ���,�ڲ�ѯ�л��б�Ҫǿ���滻�ı���ʹ��
' str Ҫ�滻���ַ���
' ============================================
Function GetSafeStr(str)
'	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
	GetSafeStr = Replace(Replace(Replace(Replace(Replace(str,"'","��"),"""","��"),"&",""),"<","&lt;"),">","&gt;")
End Function
' ============================================
' ���ַ�������HTML����,�滻server.htmlencode
' ȥ��Html��ʽ��������ʾ���
' ============================================
Function outHTML(str)
	Dim sTemp
	sTemp = str
	outHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	sTemp = Replace(sTemp, Chr(10), "<br>")
	outHTML = sTemp
End Function
' ============================================
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================
Function inHTML(str)
	Dim sTemp
	sTemp = str
	inHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	inHTML = sTemp
End Function
' ===============================================
' ��ʼ��������
'	s_FieldName	: ���ص���������	
'	a_Name		: ��ֵ������
'	a_Value		: ��ֵֵ����
'	v_InitValue	: ��ʼֵ
'	s_Sql		: �����ݿ���ȡֵʱ,select name,value from table
'	s_AllName	: ��ֵ������,��:"ȫ��","����","Ĭ��"
' ===============================================
Function InitSelect(s_FieldName, a_Name, a_Value, v_InitValue, s_Sql, s_AllName)
	Dim i
	InitSelect = "<select name='" & s_FieldName & "' size=1>"
	If s_AllName <> "" Then
		InitSelect = InitSelect & "<option value=''>" & s_AllName & "</option>"
	End If
	If s_Sql <> "" Then
		oRs.Open s_Sql, oConn, 0, 1
		Do While Not oRs.Eof
			InitSelect = InitSelect & "<option value=""" & inHTML(oRs(1)) & """"
			If oRs(1) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(oRs(0)) & "</option>"
			oRs.MoveNext
		Loop
		oRs.Close
	Else
		For i = 0 To UBound(a_Name)
			InitSelect = InitSelect & "<option value=""" & inHTML(a_Value(i)) & """"
			If a_Value(i) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(a_Name(i)) & "</option>"
		Next
	End If
	InitSelect = InitSelect & "</select>"
End Function
' ============================================
' ÿҳͷ������
' ============================================
Sub Header(str)
	Response.Write "<html>"
	Response.Write "<head>"
	Response.Write "<title>" & str &"</title>"
	Response.Write "<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>"
	Response.Write "<link rel='stylesheet' href='/admin/Css/Style.css' type='text/css'>"
	Response.Write "</head>"

	Response.Write "<body bgcolor='#FFFFFF' leftmargin='0' topmargin='0'>"
End Sub
' ============================================
' ÿҳ�ײ�����
' ============================================
Sub Footer()
	Call DBConnEnd()
	Response.Write "</BODY></HTML>"
End Sub
Private Function GetUrl()
Dim ScriptAddress, M_ItemUrl, M_item
ScriptAddress = CStr(Request.ServerVariables("SCRIPT_NAME")) 'ȡ�õ�ǰ��ַ
M_ItemUrl = ""
If (Request.QueryString <> "") Then
ScriptAddress = ScriptAddress & "?"
For Each M_item In Request.QueryString
If InStr(page,M_Item)=0 Then
M_ItemUrl = M_ItemUrl & M_Item &"="& Server.URLEncode(Request.QueryString(""&M_Item&"")) & "&"
End If
Next
end if
GetUrl = ScriptAddress & M_ItemUrl
GetUrl=left(GetUrl,len(GetUrl)-1)
End Function
%>
