<!-- #include file="Upload.asp" -->

<%
Server.ScriptTimeout = 900

formPath = "UploadFiles/"

Set upload= New DoteyUpload

Upload.SaveTo(formPath) '���ļ��������ļ���ͳһ������ĳ·����

If upload.ErrMsg = "" then
	Response.Write ("�г�����form����:<BR>")
	For each formName in upload.Form ''�г�����form����
		Response.write formName & "=" & upload.Form(formName) & "<br>"
	next

	Response.Write ("<BR><BR>�г������ϴ��˵��ļ�:<BR>")
	For Each formName In upload.Files ''�г������ϴ��˵��ļ�
		Set file = upload.Files(formName)  ''����һ���ļ�����
		response.write file.FilePath  & " (" & file.FileType & "/" & file.FileSize/1024 &"K) => <a target=_blank href='" & formPath & File.FileName & "'>" & formPath & File.FileName & "</a> �ɹ�!<br>"
		response.write "<br /><BR>"
		Set file=nothing
	Next
Else
	Response.Write("�ϴ������г��ִ���:<br>" & Upload.ErrMsg)
End If

Set upload=nothing
%>

