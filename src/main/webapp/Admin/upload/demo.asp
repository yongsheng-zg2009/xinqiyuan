<!-- #include file="Upload.asp" -->

<%

  Server.ScriptTimeout = 9999
 
  set Upload = new DoteyUpload
  Upload.MaxTotalBytes = 10 *1024 *1024	' ���10MB

  Upload.ProgressID = Request.QueryString("ProgressID")
  Upload.Upload() '�ϴ���ʾ�������浽Ӳ��

  If Request.TotalBytes > 10 *1024 *1024 Then
	Response.Write "��Ҫ�ϴ�����10MB���ļ�"
	Response.End
  End If 

  if Upload.ErrMsg <> "" then 
    Response.Write(Upload.ErrMsg)
    Response.End()
  end if

  if Upload.Files.Count > 0 then
	Items = Upload.Files.Items
  end if

  Response.Write("�����ϴ� " & Upload.Files.Count & " ���ļ���: " & path & "<hr>")
  for each File in Upload.Files.Items
	'File.SaveAs("c:\" & File.FileName)	''���Ҫ���棬��ȥ��ǰ���ע��
    Response.Write("�ļ���: " & File.FileName & "<br>")
    Response.Write("�ļ���С: " & File.FileSize/1024 & " KB<br>")
    Response.Write("�ļ�����: " & File.FileType & "<br>")
    Response.Write("�ͻ���·��: " & File.FilePath & "<br>")
    Response.Write("<hr>")
  next
  Response.Write("<br>")
%>
