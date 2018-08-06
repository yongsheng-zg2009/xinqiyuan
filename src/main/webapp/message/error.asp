<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		error.asp
'**
'** 文件说明：错误信息显示
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

pagename="出错了"

call bodySkin()
sub pageContent()
	showError()
end sub

function showError()
%>
        <div id="errorBox">
          <ul>
            <%response.write request.querystring("errinfo")%>
          </ul>
          <div class="backText">
            <a href="javascript:history.go(-1)">&lt; 返回上一页</a>
          </div>
        </div>
<%
end function
%>