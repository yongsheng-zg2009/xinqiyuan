<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("�������ű���")
Call Content()
Call Footer()

' ��ҳ������
Sub Content()
	Dim i

	' ȡ�ύ����������
	' ע��ȡ�������ݵķ�������Ϊ�Դ�����Զ�����һ��Ҫʹ��ѭ�����������100K�����ݽ�ȡ�������������������Ϊ102399�ֽڣ�100K���ң�
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
	sicon = request.Form("d_icon") '����,���º�׺ͼ�� ,xuhj ,2007-9-10

	' ��ʼ��eWebEditor�༭��ȡֵ-----------------
	sContent = ""
	For i = 1 To Request.Form("d_content").Count
		sContent = sContent & Request.Form("d_content")(i)
	Next
	' ������eWebEditor�༭��ȡֵ-----------------

	' ����Ϊ����ͨ���༭���ϴ��������ļ������Ϣ�������༭���ֶ��ϴ��ĺ��Զ�Զ���ϴ���
	' GetSafeStr����Ϊ����һЩ�����ַ�����ֹ��Щ�˶�����ƻ�����ʾ����

	' �ϴ��󱣴浽���ط��������ļ���������·�����������"|"�ָ�
	Dim sSaveFileName
	' �ϴ��󱣴浽���ط�������·���ļ����������"|"�ָ�
	Dim sSavePathFileName
	sSaveFileName = GetSafeStr(Request.Form("d_savefilename"))
	sSavePathFileName = GetSafeStr(Request.Form("d_savepathfilename"))

	' �����������ݣ�ͬʱȡ������������ID
	sSql = "SELECT * FROM NewsData WHERE D_ID is Null"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("D_CataId") = sCataId
	oRs("D_Title") = sTitle
	oRs("D_Title_Color") = s_Title_Color
	oRs("E_title") = eTitle
	oRs("D_Icon") = sicon		'����,���º�׺ͼ�� ,xuhj ,2007-9-10
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
	Call Confirm("������Ϣ�����ɹ����Ƿ����������","NewsAdd.asp" , "NewsList.asp")
End Sub

%>

