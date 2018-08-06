<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option Explicit %>
<!--#include file="SetUp.asp" -->
<%
' ============================================
' 常用全局变量
' ============================================
' 数据库对象
Dim oConn, oRs, sSql, DateBase
' ============================================
' 初始数据处理
' ============================================
' 初始化数据库连接
Call DBConnBegin()
' ********************************************
' 以下为数据库相关函数
' ********************************************
' ============================================
' 初始化数据库连接对象
' 使用原则：最迟调用，最早释放
' ============================================
Sub DBConnBegin()
	' 如果数据库对象已打开，不要再打开
	If IsObject(oConn) = True Then Exit Sub
	' 你可以不需要打开数据库连接对象而直接打开记录集对象，但如果你需要打开多个记录集对象的话，效率是很低的。
	' 如果你不创建一个数据库连接对象，ADO会在每个记录集打开时自动创建一个新的数据库连接对象，就算你用的是相同的SQL语句。
	Set oConn = Server.CreateObject("ADODB.Connection")
	On Error Resume Next
	' Access数据库 数据库中已经增加了防止下载的机智！
	DateBase = "/admin/MyDB/#9za0yb#$%@.mdb"
	oConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(DateBase)
	If Err.Number > 0 Then
		' 显示错误信息,并且发送邮件通知管理员
		'Call DBConnError(Err)
		' 完全地退出正在运行的脚本
		Response.End
	End If
	' 创建一个记录集
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
End Sub
' ============================================
' 释放数据库连接对象
' ============================================
Sub DBConnEnd()
	On Error Resume Next
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
End Sub
' ********************************************
' 以下为常用函数
' ********************************************
' ============================================
' 错误返回处理
' ============================================
Sub GoError(str)
	Call DBConnEnd()
	Response.Write "<script language=javascript>alert('" & str & "\n\n系统将自动返回前一页面...');history.back();</script>"
	Response.End
End Sub
' ============================================
' 进行操作判断，是否进一步操作
' strAlert 提示语言 url1 确认返回的地址 url2 取消返回的地址
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
' 进行操作判断，是否进一步操作
' strAlert 提示语言 Num 确认返回的地址
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
' 操作提示信息
' str 提示的详细内容
' ============================================
Function AlertMsg(str)
	Response.Write("<Script Language='Javascript'>")
	Response.Write("alert('" & str & "');")
	Response.Write("</Script>")
End Function
' ============================================
' 判断是否是数字，否则用默认值替换
' iCheck 要替换的变量,iDefault 默认值
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
' 得到安全字符串,在查询中或有必要强行替换的表单中使用
' str 要替换的字符串
' ============================================
Function GetSafeStr(str)
'	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
	GetSafeStr = Replace(Replace(Replace(Replace(Replace(str,"'","‘"),"""","“"),"&",""),"<","&lt;"),">","&gt;")
End Function
' ============================================
' 把字符串进行HTML解码,替换server.htmlencode
' 去除Html格式，用于显示输出
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
' 去除Html格式，用于从数据库中取出值填入输入框时
' 注意：value="?"这边一定要用双引号
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
' 初始化下拉框
'	s_FieldName	: 返回的下拉框名	
'	a_Name		: 定值名数组
'	a_Value		: 定值值数组
'	v_InitValue	: 初始值
'	s_Sql		: 从数据库中取值时,select name,value from table
'	s_AllName	: 空值的名称,如:"全部","所有","默认"
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
' 每页头部内容
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
' 每页底部内容
' ============================================
Sub Footer()
	Call DBConnEnd()
	Response.Write "</BODY></HTML>"
End Sub
Private Function GetUrl()
Dim ScriptAddress, M_ItemUrl, M_item
ScriptAddress = CStr(Request.ServerVariables("SCRIPT_NAME")) '取得当前地址
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
