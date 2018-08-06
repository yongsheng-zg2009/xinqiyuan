<!-- #include file="Upload.asp" -->

<%
Server.ScriptTimeout = 900

formPath = "UploadFiles/"

Set upload= New DoteyUpload

Upload.SaveTo(formPath) '将文件根据其文件名统一保存在某路径下

If upload.ErrMsg = "" then
	Response.Write ("列出所有form数据:<BR>")
	For each formName in upload.Form ''列出所有form数据
		Response.write formName & "=" & upload.Form(formName) & "<br>"
	next

	Response.Write ("<BR><BR>列出所有上传了的文件:<BR>")
	For Each formName In upload.Files ''列出所有上传了的文件
		Set file = upload.Files(formName)  ''生成一个文件对象
		response.write file.FilePath  & " (" & file.FileType & "/" & file.FileSize/1024 &"K) => <a target=_blank href='" & formPath & File.FileName & "'>" & formPath & File.FileName & "</a> 成功!<br>"
		response.write "<br /><BR>"
		Set file=nothing
	Next
Else
	Response.Write("上传过程中出现错误:<br>" & Upload.ErrMsg)
End If

Set upload=nothing
%>

