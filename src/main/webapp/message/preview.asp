<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		preview.asp
'**
'** 文件说明：留言预览页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

pagename="留言预览"
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
	usercontent="<span class=""Highlight"">留言内容的字数超过了限制！</span>"
elseif re.Replace(Replace(request.form("usercontent"), CHR(13)&CHR(10), ""),"")="" then
	usercontent="<span class=""Highlight"">留言为空！</span>"
else
	usercontent=UBBCode(sql_filter(request.form("usercontent")),UBB_super)
end if
set re=nothing
%>
            <div class="msgTitle">标题：<h3><%=HTMLencode(request.form("usertitle"))%></h3></div>
						<div class="msgTime" ><%=NOW()%></div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
        </div>
<%
end function
%>