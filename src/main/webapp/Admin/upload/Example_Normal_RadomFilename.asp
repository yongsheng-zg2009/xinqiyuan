<!-- #include file="Upload.asp" -->
<!-- 本例说明如何对上传文件进行重命名 -->
<%
Server.ScriptTimeout = 900

formPath = "UploadFiles/"

Set upload= New DoteyUpload

Upload.Upload() '上传文件

' 遍历所有已上传文件

Randomize '初始化随机数生成器。
For Each fileItem In Upload.Files.Items			
	fileItem.SaveAs formPath & Int((99999 * Rnd) + 1) & fileItem.FileExt
Next

If upload.ErrMsg = "" then
	Response.Write ("列出所有form数据:<BR>")
	For each formName in upload.Form ''列出所有form数据
		Response.write formName & "=" & upload.Form(formName) & "<br>"
	next

	Response.Write ("<BR><BR>列出所有上传了的文件:<BR>")
	For Each formName In upload.Files ''列出所有上传了的文件
		Set file = upload.Files(formName)  ''生成一个文件对象
		response.write file.FilePath  & " (" & file.FileType & "/" & file.FileSize/1024 &"K) => <a target=_blank href='" & formPath & File.NewFileName & "'>" & formPath & File.FileName & "</a> 成功!<br>"
		response.write "<br /><BR>"
		Set file=nothing
	Next
Else
	Response.Write("上传过程中出现错误:<br>" & Upload.ErrMsg)
End If

Set upload=nothing
%>

