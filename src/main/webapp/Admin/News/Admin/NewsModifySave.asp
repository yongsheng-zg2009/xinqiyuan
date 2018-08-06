<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("增加新闻保存")
Call Content()
Call Footer()

' 本页内容区
Sub Content()
	Dim comurl
	comurl=Trim(Request("comurl"))

	Dim i

	' 传入参数：新闻ID
	Dim sNewsID
	sNewsID = GetSafeInt(Trim(Request("id")),0)

	' 新闻ID有效性验证，防止有些人恶意的破坏此演示程序
	If sNewsID < 1 Then
		GoError "请通过页面上的链接进行操作，不要试图进行任何非法操作。"
	End If

	' 取提交过来的数据
	' 注意取新闻内容的方法，因为对大表单的自动处理，一定要使用循环，否则大于100K的内容将取不到，单个表单项的限制为102399字节（100K左右）
	Dim sCataId, sTitle, sContent, sPicture, sFrom, sSpecial,etitle,sAuthor,sTitle_Color,sicon,sAddtime
	sCataId = Request.Form("d_cataid")
	sTitle = Request.Form("d_title")
	sTitle_Color = Request.Form("TitleColor")
	eTitle =  Request.Form("eTitle")
	sicon = request.Form("d_icon") '新增,文章后缀图标 ,xuhj ,2007-9-10
	sAddtime = request.Form("d_Addtime")
	SAuthor = Request.Form("d_author")
	sPicture = Request.Form("d_picture")
	sFrom = Request.Form("d_from")
	sSpecial = Request.Form("d_special")
	'If sSpecial Is Null Or sSpecial="" Then 
	'	sSpecial=0 
	'End if

	' 开始：eWebEditor编辑区取值-----------------
	sContent = ""
	For i = 1 To Request.Form("d_content").Count
		sContent = sContent & Request.Form("d_content")(i)
	Next
	' 结束：eWebEditor编辑区取值-----------------

	' 以下为所有通过编辑器上传的所有文件相关信息，包括编辑区手动上传的和自动远程上传的
	' GetSafeStr函数为过滤一些特殊字符，防止有些人恶意的破坏此演示程序

	' 上传后保存到本地服务器的文件名（不带路径），多个以"|"分隔
	Dim sSaveFileName
	' 上传后保存到本地服务器的路径文件名，多个以"|"分隔
	Dim sSavePathFileName
	sSaveFileName = GetSafeStr(Request.Form("d_savefilename"))
	sSavePathFileName = GetSafeStr(Request.Form("d_savepathfilename"))

	' 保存新闻内容，同时取出自增的新闻ID
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 1, 3
	If Not oRs.Eof Then
		oRs("D_CataId") = sCataId
		oRs("D_Title") = sTitle
		oRs("D_Title_Color") = sTitle_Color
		oRs("e_Title") = eTitle
		oRs("D_Icon") = sicon		'新增,文章后缀图标 ,xuhj ,2007-9-10
		oRs("D_Author") = sAuthor
		oRs("D_Content") = sContent
		oRs("D_Picture") = sPicture
		oRs("D_SaveFileName") = sSaveFileName
		oRs("D_SavePathFileName") = sSavePathFileName
		oRs("D_From") = sFrom
		oRs("D_AddTime") = sAddtime ' Now()
		oRs("D_Special") = sSpecial
		'If sSpecial = 1 Then oRs("D_Special") = sSpecial
		oRs.Update
		oRs.Close
		Call OKGo("新闻信息修改成功，确认返回！",comurl)
	Else
		GoError "无效的新闻ID，请点页面上的链接进行操作！"
	End If
	

End Sub
%>

