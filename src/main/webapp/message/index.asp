<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
dim currentpage,page_count,Pcount
dim totalrec,endpage
if Request.QueryString("page")="" then
	currentPage=1
else
	currentPage=cint(Request.QueryString("page"))
end if

if login then
	pagename="��������"
else
	pagename="�鿴����"
end if

call bodySkin()
sub pageContent()
	showMsg()
end sub

function showMsg()

if login then
	sql="select * from [topic] order by top desc,usertime desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
else
	sql="select * from [topic] where checked=1 order by top desc,usertime desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
end if

if rs.eof and rs.bof then
	rs.close
	set rs=nothing
	errinfo="<li>��û���κ����ԡ�</li>"
	call showError()
end if

	rs.pagesize = perpage
	rs.absolutepage=currentpage
	page_count=0
	totalrec=rs.recordcount

if not totalrec mod perpage=0 then
	if currentPage > (totalrec/perpage)+1 then response.redirect "?page=" & Int((totalrec/perpage))+1
else
	if currentPage > (totalrec/perpage) then response.redirect "?page=" & Int((totalrec/perpage))
end if

call pages()

while (not rs.eof) and (not page_count = rs.pagesize)

dim username,userURL,usermail,userqq,usertitle,usertime,usercontent,recontent,retime
	username = HTMLencode(rs("username"))
	userURL = HTMLencode(rs("userURL"))
	usermail = HTMLencode(rs("usermail"))
	userqq = HTMLencode(rs("userqq"))
	usertitle = HTMLencode(rs("usertitle"))
	usertime = rs("usertime")
	usercontent = UBBCode(rs("usercontent"),rs("top"))
	recontent = UBBCode(rs("recontent"),1)
	retime = rs("retime")
%>
        <a id="msg<%=rs("id")%>">
        <div class="msgArea">
         <%if rs("whisper")="1" and (not login) then%>
          <div class="msgArea-left">
            <ul>
              <li class="userFace"><img class="face-normal" src="<%=userfacesFolder%>/whisper.gif" alt="���Ļ�" /></li>
              <li class="userName"><%=username%></li>
            </ul>
          </div>
          <div class="msgArea-right">
            <div class="msgTitle">
             <span class="msgTitle-whisper">���Ļ�����</span>
            </div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="msgContent">
              <div class="msgContent-whisper">
              �����Խ�����Ա�ɼ���<br />
              <%if rs("replycode")<>"" then%>
					    <%if rs("reply")=1 then
					    call viewreply(rs("id"))
					    else%>״̬��δ���ظ���<%end if
					    else%>״̬���޷����ظ���<%end if%>
              </div>
            </div>
          </div>
         <%else%>
          <div class="msgArea-left"> <!-- 	ͷ�񡢳ƺ�  -->
            <ul >
              <li class="userFace"><%if rs("top")=1 then%><img class="face-bulletin" src="<%=userfacesFolder%>/bulletin.gif" alt="����Ա" /><%else%><img src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" alt="<%=username%>" /><%end if%></li>
              <li class="userName"><%if rs("top")=1 then%><span class="userName-istop">����Ա</span><%else%><%=username%><%end if%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!-- 	���⡢ʱ�䡢�������ݡ��ظ�  -->
            <div class="msgTitle"><%if rs("top")=1 then%><span class="msgTitle-istop">���棺</span><%else%><%end if%></div>
            <div class="userContact">
               ǩдʱ��:<%=usertime%></div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
            <%if rs("reply")=1 then%>
            <div class="msgReply">
              <div class="msgReply-top"><b>����Ա�ظ� : </b>( <%=retime%> )</div>
              <div class="msgReply-content"><table><tr><td><FONT COLOR="#CC0033"><%=recontent%></FONT></td></tr></table></div>
            </div>
            <%end if%>
          </div>
          <%if login then%>
           <div class="adminLinks">
           <%if rs("checked")=0 then%>
           <a href="javascript:go('admin.asp?act=check&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','��ȷ��Ҫͨ����ˣ�')"><span class="Highlight">ͨ�����</span></a>&nbsp;&nbsp;
           <%end if%>
           <a href="javascript:go('admin.asp?act=del&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','��ȷ��Ҫɾ����')">ɾ��</a>&nbsp;&nbsp;
           <%if rs("whisper")=1 and rs("replycode")="" then%>
           <span class="Highlight">�޷��ظ������Ļ�</span>
           <%else%>
           <a href="reply.asp?id=<%=rs("id")%>"><%if rs("whisper")=1 then%><span class="Highlight">���Ļ��ظ�/�༭�ظ�</span><%else%>�ظ�/�༭�ظ�<%end if%></a><%end if%>&nbsp;&nbsp;<a href="edit.asp?id=<%=rs("id")%>">�༭</a>&nbsp;&nbsp;����IP��<%=rs("ip")%>
           </div>
          <%end if%>
         <%end if%>
         <div class="msgArea-clear"></div>
        </div>
<%
	page_count = page_count + 1
	rs.movenext
wend
%>
        <div class="divLine"></div>
<%
call pages()
rs.close
set rs=nothing
end function

sub viewreply(id) '//////// �鿴�ظ��ı�
%>
			<form action="viewreply.asp" method="post">
			  �ظ��鿴�룺<input name="replycode" type="password" size="10" maxlength="100" />&nbsp;
        <input type="hidden" name="id" value="<%=id%>" />
        <input type="submit" class="button" name="viewreply" value="�鿴�ظ�" />
			</form>
<%
end sub

sub pages()	'//////// ��ҳ����
%>
	<div class="page">
	<%
	dim ii,p,n
	if totalrec mod perpage=0 then
		n= totalrec \ perpage
	else
		n= totalrec \ perpage+1
	end if
	p=(currentpage-1) \ 5
	%>
	ҳ�Σ�<b><%=currentpage%>/<%=n%></b>ҳ��ÿҳ<b><%=rs.pagesize%></b>������<b><%=totalrec%></b>��&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>��ҳ&nbsp;
	<%else%><a href="index.asp?page=1" title="��ҳ">��ҳ</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="index.asp?page=<%=cstr(p*5)%>" title="����ҳ">�Ϸ�</a>&nbsp;
	<%end if
	for ii=p*5+1 to p*5+5
	if ii=currentpage then%><span class="currtNum"><%=cstr(ii)%></span>
	<%else%><a href="index.asp?page=<%=cstr(ii)%>"><%=cstr(ii)%></a>
	<%end if
	if ii=n then exit for
	next
	if ii<n then%>&nbsp;<a href="index.asp?page=<%=cstr(ii)%>" title="����ҳ">�·�</a><%end if%>
	<%if currentpage=n then%>&nbsp;βҳ
	<%else%>&nbsp;<a href="index.asp?page=<%=cstr(n)%>" title="βҳ">βҳ</a>
	<%end if%>
	</div>
<%
end sub
%>