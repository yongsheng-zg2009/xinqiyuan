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

	Response.Write ("<BR><BR>�ϴ���<BR>")
	For Each formName In upload.Files ''�г������ϴ��˵��ļ�
		Set file = upload.Files(formName)  ''����һ���ļ�����
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

		response.write "<a href='uploadfile.asp?uploadid=" & uploadID & "' target='_blank'>" & File.FileName & "</a>" & "����ɹ�!<br>"
		response.write "<br /><BR>"
		Set file=nothing
	Next
Else
	Response.Write("�ϴ������г��ִ���:<br>" & Upload.ErrMsg)
End If

Set upload=nothing
Conn.Close
%>  


