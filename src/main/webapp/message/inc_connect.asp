<%
'**************************************
'**		inc_connect.asp
'**
'** �ļ�˵�������ݿ������ļ�
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************
dim inDebug
	inDebug=false	'��������������ݿ�������ʾ�����޸Ĵ˴�Ϊtrue

if inDebug=false then
	On Error Resume Next
end if

'�뽫����ڶ����еġ�#database.asp���滻Ϊ���Լ�������������ݿ��ַ
dim db,conn,connstr,sql,rs
	db="data/#S%8087tqtec.asp"
	set conn = server.createobject("ADODB.connection")
	connstr="provider=microsoft.JET.OLEDB.4.0;data source=" & server.mappath(db)
	conn.open connstr

If Err and inDebug=false Then
	Err.Clear
	Set conn = Nothing
	Response.Write "<style>body{font-size:12px;font-family: Tahoma, Arial, Helvetica, sans-serif;} .cText{color:#003399; font-style:italic;} a {color:#CC3333;}</style>"
	Response.Write "<title>����</title><p><strong>�������ݿ��ʱ�����</strong></p>"
	Response.Write "���������վ����Ա�����޸����Ա������ <span class=""cText"">inc_connect.asp</span> ����<br />"
	Response.Write "<span class=""cText"">inDebug=false</span><br />��Ϊ<br /><span class=""cText"">inDebug=true</span><br />"
	Response.Write "Ȼ���ٷ��ʣ������ݾ���Ĵ�����ʾ���н��������������Ҫ�����޸� <span class=""cText"">inDebug</span> ��ֵΪ <span class=""cText"">false</span> ��<br />"
	Response.Write "����޷������Ҳ���Ե��ٷ���վѯ�ʣ�<br />"
	Response.Write "<a href=""http://www.zengbaoyi.com/book/"" target=""_blank"">http://www.zengbaoyi.com/book/</a>"
	Response.End
End If
%>