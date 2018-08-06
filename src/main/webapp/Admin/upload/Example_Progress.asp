<!-- #include file="Upload.asp" -->

<%
  Server.ScriptTimeout = 9999
 
  path = "UploadFiles" 

  set Upload = new DoteyUpload

  Upload.ProgressID = Request.QueryString("ProgressID")
  Upload.SaveTo(path)

  if Upload.ErrMsg <> "" then 
    Response.Write(Upload.ErrMsg)
    Response.End()
  end if

  if Upload.Files.Count > 0 then
    Items = Upload.Files.Items
  end if

  Response.Write("�����ϴ� " & Upload.Files.Count & " ���ļ���: " & path & "<hr>")
  for each File in Upload.Files.Items
    Response.Write("�ļ���: " & File.FileName & "<br>")
    Response.Write("�ļ���С: " & File.FileSize/1024 & " KB<br>")
    Response.Write("�ļ�����: " & File.FileType & "<br>")
    Response.Write("�ͻ���·��: " & File.FilePath & "<br>")
    Response.Write("<hr>")
  next
  Response.Write("<br>")
%>
