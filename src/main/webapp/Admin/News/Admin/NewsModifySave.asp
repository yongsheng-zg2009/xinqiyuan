<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("�������ű���")
Call Content()
Call Footer()

' ��ҳ������
Sub Content()
	Dim comurl
	comurl=Trim(Request("comurl"))

	Dim i

	' �������������ID
	Dim sNewsID
	sNewsID = GetSafeInt(Trim(Request("id")),0)

	' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
	If sNewsID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If

	' ȡ�ύ����������
	' ע��ȡ�������ݵķ�������Ϊ�Դ�����Զ�����һ��Ҫʹ��ѭ�����������100K�����ݽ�ȡ�������������������Ϊ102399�ֽڣ�100K���ң�
	Dim sCataId, sTitle, sContent, sPicture, sFrom, sSpecial,etitle,sAuthor,sTitle_Color,sicon,sAddtime
	sCataId = Request.Form("d_cataid")
	sTitle = Request.Form("d_title")
	sTitle_Color = Request.Form("TitleColor")
	eTitle =  Request.Form("eTitle")
	sicon = request.Form("d_icon") '����,���º�׺ͼ�� ,xuhj ,2007-9-10
	sAddtime = request.Form("d_Addtime")
	SAuthor = Request.Form("d_author")
	sPicture = Request.Form("d_picture")
	sFrom = Request.Form("d_from")
	sSpecial = Request.Form("d_special")
	'If sSpecial Is Null Or sSpecial="" Then 
	'	sSpecial=0 
	'End if

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
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 1, 3
	If Not oRs.Eof Then
		oRs("D_CataId") = sCataId
		oRs("D_Title") = sTitle
		oRs("D_Title_Color") = sTitle_Color
		oRs("e_Title") = eTitle
		oRs("D_Icon") = sicon		'����,���º�׺ͼ�� ,xuhj ,2007-9-10
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
		Call OKGo("������Ϣ�޸ĳɹ���ȷ�Ϸ��أ�",comurl)
	Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
	End If
	

End Sub
%>

