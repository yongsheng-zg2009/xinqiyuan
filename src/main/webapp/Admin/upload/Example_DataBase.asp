<!-- #include file="Upload.asp" -->
<%
Server.ScriptTimeout = 900

dim Conn,RS
Set RS = Server.CreateObject("ADODB.Recordset")
Set Conn = CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.open "Data Source=" & Server.MapPath("upload.mdb") 

Set upload= New DoteyUpload
Dim binary, uploadID

Upload.Upload()


If upload.ErrMsg = "" then

	Response.Write ("<BR><BR>上传：<BR>")
	For Each formName In upload.Files ''列出所有上传了的文件
		Set file = upload.Files(formName)  ''生成一个文件对象
		binary = file.GetBinary()
		RS.Open "Upload", Conn, 1, 2
		RS.AddNew
		RS("ContentType") = file.FileType
		RS("Content") = binary
		RS("FileName") = file.FileName
		RS("FileSize") = file.FileSize

		RS.Update
		uploadID = RS("UploadID")
		RS.Close

		response.write "<a href='uploadfile.asp?uploadid=" & uploadID & "' target='_blank'>" & File.FileName & "</a>" & "保存成功!<br>"
		response.write "<br /><BR>"
		Set file=nothing
	Next
Else
	Response.Write("上传过程中出现错误:<br>" & Upload.ErrMsg)
End If

Set upload=nothing
Conn.Close
%>  


