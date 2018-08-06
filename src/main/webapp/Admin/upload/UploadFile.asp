<%
dim Conn
Set Conn = CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.open "Data Source=" & Server.MapPath("upload.mdb") 

Dim uploadID,FileName,ContentType
Dim S
uploadID = request("uploadID")
Dim rs, strSql, field, size, bytes

set rs=server.createobject("ADODB.recordset") 
strSql = "Select * from upload where uploadid = " & uploadID

rs.Open strSql,conn,1,1

If Not rs.Eof Then
	FileName = rs("FileName")
	ContentType = rs("ContentType")

	field = rs("Content")
	'size = field.ActualSize
	size=rs("filesize")
	bytes = rs("Content").GetChunk(rs("Content").ActualSize)
Else
	
	Response.Write("No Such Record")
	Response.End

	rs.close
	Set rs = nothing
	conn.close
	Set conn = nothing

End If

rs.close
Set rs = nothing
conn.close
Set conn = nothing


Response.AddHeader "Content-Disposition", "attachment; filename="&filename
Response.CharSet = "GB2312" 
Response.ContentType = ContentType
Response.BinaryWrite(bytes)
Response.Flush

%>
