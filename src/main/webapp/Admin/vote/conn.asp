<%
dim db,conn,stime
stime=timer()
db="tqtecvote.mdb"
set conn=server.createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0;data source="&server.mappath(db)

'����ر����ݿ�
sub closedb()
	conn.close
	set conn=nothing
end sub

'�������html��ǩ
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

'�û���½��֤
function chklogin(ustring)
	if not isnull(ustring) then
		if instr(ustring,"'") or instr(ustring,"=") or instr(ustring,"""") or instr(ustring,"&") or instr(ustring,"+") or instr(ustring,"%") then
		Response.Write "<script>alert('�û����������벻��ȷ��');history.back();</script>"
		Response.End
		End If
	chklogin=ustring
	end if
end function


'ȥ��html��ǩ����

Function RemoveHTML(strHTML)
Dim objRegExp, Match, Matches 
Set objRegExp = New Regexp

objRegExp.IgnoreCase = True
objRegExp.Global = True
'ȡ�պϵ�<>
objRegExp.Pattern = "<.+?>"
'����ƥ��
Set Matches = objRegExp.Execute(strHTML)

' ����ƥ�伯�ϣ����滻��ƥ�����Ŀ
For Each Match in Matches 
strHtml=Replace(strHTML,Match.Value,"")
Next
RemoveHTML=strHTML
Set objRegExp = Nothing
End Function

%>
                                                                                              
