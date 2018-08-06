<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("增加新闻保存")
Call Content()
Call Footer()

' 本页内容区
Sub Content()
	Dim i

	' 取提交过来的数据
	' 注意取新闻内容的方法，因为对大表单的自动处理，一定要使用循环，否则大于100K的内容将取不到，单个表单项的限制为102399字节（100K左右）
	Dim sCataId, sTitle, sContent, sPicture, sFrom, sSpecial, eTitle,sAuthor,s_Title_Color,sicon,sAddtime
	sCataId = Request.Form("d_cataid")
	sTitle = Request.Form("d_title")
	sPicture = Request.Form("d_picture")
	s_Title_Color = Request.Form("TitleColor")
	sFrom = Request.Form("d_from")
	sSpecial= Request.Form("d_special")
	eTitle=request.Form("eTitle")
	sAddtime = request.Form("d_Addtime")
	sAuthor = request.Form("d_author")
	sicon = request.Form("d_icon") '新增,文章后缀图标 ,xuhj ,2007-9-10

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
	sSql = "SELECT * FROM NewsData WHERE D_ID is Null"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("D_CataId") = sCataId
	oRs("D_Title") = sTitle
	oRs("D_Title_Color") = s_Title_Color
	oRs("E_title") = eTitle
	oRs("D_Icon") = sicon		'新增,文章后缀图标 ,xuhj ,2007-9-10
	oRs("D_author") = sauthor
	oRs("D_Content") = sContent
	oRs("D_Picture") = sPicture
	oRs("D_SaveFileName") = sSaveFileName
	oRs("D_SavePathFileName") = sSavePathFileName
	oRs("D_From") = sFrom
	If sSpecial <>"" Then oRs("D_Special") = sSpecial
	oRs("D_AddTime") = sAddtime ' Now()
	oRs("D_Hits") = 1
	oRs("D_Num") = 0
	
	oRs.Update
	oRs("D_SortID")=oRs("D_ID")
	oRs.Update
	oRs.Close
	session("sCataId")=sCataId
	Call Confirm("新闻信息发布成功，是否继续发布？","NewsAdd.asp" , "NewsList.asp")
End Sub

%>

