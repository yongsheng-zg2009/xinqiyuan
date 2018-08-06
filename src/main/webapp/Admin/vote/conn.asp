<%
dim db,conn,stime
stime=timer()
db="tqtecvote.mdb"
set conn=server.createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0;data source="&server.mappath(db)

'定义关闭数据库
sub closedb()
	conn.close
	set conn=nothing
end sub

'定义过滤html标签
function htmlencode(hstring)
	if not isnull(hstring) then
	hstring=Replace(hstring,"<","&lt;")
	hstring=Replace(hstring,">","&gt;")
	hstring=Replace(hstring,chr(32),"&nbsp;")
	hstring=Replace(hstring,chr(9),"&nbsp;")
	hstring=Replace(hstring,chr(13),"<br>")
	hstring=Replace(hstring,chr(39),"&#39;")
	hstring=Replace(hstring,chr(34),"&quot;")
	hstring=Replace(hstring,chr(10)&chr(10),"<p></p>")
	htmlencode=hstring
	end if
end function

'用户登陆验证
function chklogin(ustring)
	if not isnull(ustring) then
		if instr(ustring,"'") or instr(ustring,"=") or instr(ustring,"""") or instr(ustring,"&") or instr(ustring,"+") or instr(ustring,"%") then
		Response.Write "<script>alert('用户名密码输入不正确！');history.back();</script>"
		Response.End
		End If
	chklogin=ustring
	end if
end function


'去除html标签正则

Function RemoveHTML(strHTML)
Dim objRegExp, Match, Matches 
Set objRegExp = New Regexp

objRegExp.IgnoreCase = True
objRegExp.Global = True
'取闭合的<>
objRegExp.Pattern = "<.+?>"
'进行匹配
Set Matches = objRegExp.Execute(strHTML)

' 遍历匹配集合，并替换掉匹配的项目
For Each Match in Matches 
strHtml=Replace(strHTML,Match.Value,"")
Next
RemoveHTML=strHTML
Set objRegExp = Nothing
End Function

%>
                                                                                              
