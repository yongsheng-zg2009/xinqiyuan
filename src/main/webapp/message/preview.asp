<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		preview.asp
'**
'** �ļ�˵��������Ԥ��ҳ��
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

pagename="����Ԥ��"
call pageHead()
showPreview()

function showPreview()

dim UBB_super,usercontent
	UBB_super=request.form("UBB_super")

dim re
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\[(.[^\]]*)\])"
%>
        <div id="smallWrapper" style="padding: 12px 6px;">
<%
if len(request.form("usercontent"))>maxnum and UBB_super=0 then
	usercontent="<span class=""Highlight"">�������ݵ��������������ƣ�</span>"
elseif re.Replace(Replace(request.form("usercontent"), CHR(13)&CHR(10), ""),"")="" then
	usercontent="<span class=""Highlight"">����Ϊ�գ�</span>"
else
	usercontent=UBBCode(sql_filter(request.form("usercontent")),UBB_super)
end if
set re=nothing
%>
            <div class="msgTitle">���⣺<h3><%=HTMLencode(request.form("usertitle"))%></h3></div>
						<div class="msgTime" ><%=NOW()%></div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
        </div>
<%
end function
%>