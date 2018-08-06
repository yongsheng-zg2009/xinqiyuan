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

  Response.Write("您已上传 " & Upload.Files.Count & " 个文件到: " & path & "<hr>")
  for each File in Upload.Files.Items
    Response.Write("文件名: " & File.FileName & "<br>")
    Response.Write("文件大小: " & File.FileSize/1024 & " KB<br>")
    Response.Write("文件类型: " & File.FileType & "<br>")
    Response.Write("客户端路径: " & File.FilePath & "<br>")
    Response.Write("<hr>")
  next
  Response.Write("<br>")
%>
