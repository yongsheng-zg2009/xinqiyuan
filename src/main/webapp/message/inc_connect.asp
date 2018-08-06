<%
'**************************************
'**		inc_connect.asp
'**
'** 文件说明：数据库连接文件
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************
dim inDebug
	inDebug=false	'如果出现链接数据库出错的提示，请修改此处为true

if inDebug=false then
	On Error Resume Next
end if

'请将下面第二行中的“#database.asp”替换为你自己重命名后的数据库地址
dim db,conn,connstr,sql,rs
	db="data/#S%8087tqtec.asp"
	set conn = server.createobject("ADODB.connection")
	connstr="provider=microsoft.JET.OLEDB.4.0;data source=" & server.mappath(db)
	conn.open connstr

If Err and inDebug=false Then
	Err.Clear
	Set conn = Nothing
	Response.Write "<style>body{font-size:12px;font-family: Tahoma, Arial, Helvetica, sans-serif;} .cText{color:#003399; font-style:italic;} a {color:#CC3333;}</style>"
	Response.Write "<title>错误</title><p><strong>连接数据库的时候出错！</strong></p>"
	Response.Write "如果你是网站管理员，请修改留言本程序的 <span class=""cText"">inc_connect.asp</span> ，将<br />"
	Response.Write "<span class=""cText"">inDebug=false</span><br />改为<br /><span class=""cText"">inDebug=true</span><br />"
	Response.Write "然后再访问，并根据具体的错误提示自行解决。解决问题后，需要重新修改 <span class=""cText"">inDebug</span> 的值为 <span class=""cText"">false</span> 。<br />"
	Response.Write "如果无法解决，也可以到官方网站询问：<br />"
	Response.Write "<a href=""http://www.zengbaoyi.com/book/"" target=""_blank"">http://www.zengbaoyi.com/book/</a>"
	Response.End
End If
%>