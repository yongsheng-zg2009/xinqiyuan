<!-- #include file="Upload.asp" -->

<%

  Server.ScriptTimeout = 9999
 
  set Upload = new DoteyUpload
  Upload.MaxTotalBytes = 10 *1024 *1024	' 最大10MB

  Upload.ProgressID = Request.QueryString("ProgressID")
  Upload.Upload() '上传演示，不保存到硬盘

  If Request.TotalBytes > 10 *1024 *1024 Then
	Response.Write "不要上传超过10MB的文件"
	Response.End
  End If 

  if Upload.ErrMsg <> "" then 
    Response.Write(Upload.ErrMsg)
    Response.End()
  end if

  if Upload.Files.Count > 0 then
	Items = Upload.Files.Items
  end if

  Response.Write("您已上传 " & Upload.Files.Count & " 个文件到: " & path & "<hr>")
  for each File in Upload.Files.Items
	'File.SaveAs("c:\" & File.FileName)	''如果要保存，则去掉前面的注释
    Response.Write("文件名: " & File.FileName & "<br>")
    Response.Write("文件大小: " & File.FileSize/1024 & " KB<br>")
    Response.Write("文件类型: " & File.FileType & "<br>")
    Response.Write("客户端路径: " & File.FilePath & "<br>")
    Response.Write("<hr>")
  next
  Response.Write("<br>")
%>
