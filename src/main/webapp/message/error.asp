<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		error.asp
'**
'** �ļ�˵����������Ϣ��ʾ
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

pagename="������"

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
            <a href="javascript:history.go(-1)">&lt; ������һҳ</a>
          </div>
        </div>
<%
end function
%>