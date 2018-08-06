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
	pagename="管理留言"
else
	pagename="查看留言"
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
	errinfo="<li>还没有任何留言。</li>"
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
              <li class="userFace"><img class="face-normal" src="<%=userfacesFolder%>/whisper.gif" alt="悄悄话" /></li>
              <li class="userName"><%=username%></li>
            </ul>
          </div>
          <div class="msgArea-right">
            <div class="msgTitle">
             <span class="msgTitle-whisper">悄悄话留言</span>
            </div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="msgContent">
              <div class="msgContent-whisper">
              此留言仅管理员可见。<br />
              <%if rs("replycode")<>"" then%>
					    <%if rs("reply")=1 then
					    call viewreply(rs("id"))
					    else%>状态：未被回复。<%end if
					    else%>状态：无法被回复。<%end if%>
              </div>
            </div>
          </div>
         <%else%>
          <div class="msgArea-left"> <!-- 	头像、称呼  -->
            <ul >
              <li class="userFace"><%if rs("top")=1 then%><img class="face-bulletin" src="<%=userfacesFolder%>/bulletin.gif" alt="管理员" /><%else%><img src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" alt="<%=username%>" /><%end if%></li>
              <li class="userName"><%if rs("top")=1 then%><span class="userName-istop">管理员</span><%else%><%=username%><%end if%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!-- 	标题、时间、留言内容、回复  -->
            <div class="msgTitle"><%if rs("top")=1 then%><span class="msgTitle-istop">公告：</span><%else%><%end if%></div>
            <div class="userContact">
               签写时间:<%=usertime%></div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
            <%if rs("reply")=1 then%>
            <div class="msgReply">
              <div class="msgReply-top"><b>管理员回复 : </b>( <%=retime%> )</div>
              <div class="msgReply-content"><table><tr><td><FONT COLOR="#CC0033"><%=recontent%></FONT></td></tr></table></div>
            </div>
            <%end if%>
          </div>
          <%if login then%>
           <div class="adminLinks">
           <%if rs("checked")=0 then%>
           <a href="javascript:go('admin.asp?act=check&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','您确定要通过审核？')"><span class="Highlight">通过审核</span></a>&nbsp;&nbsp;
           <%end if%>
           <a href="javascript:go('admin.asp?act=del&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','您确定要删除？')">删除</a>&nbsp;&nbsp;
           <%if rs("whisper")=1 and rs("replycode")="" then%>
           <span class="Highlight">无法回复的悄悄话</span>
           <%else%>
           <a href="reply.asp?id=<%=rs("id")%>"><%if rs("whisper")=1 then%><span class="Highlight">悄悄话回复/编辑回复</span><%else%>回复/编辑回复<%end if%></a><%end if%>&nbsp;&nbsp;<a href="edit.asp?id=<%=rs("id")%>">编辑</a>&nbsp;&nbsp;留言IP：<%=rs("ip")%>
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

sub viewreply(id) '//////// 查看回复的表单
%>
			<form action="viewreply.asp" method="post">
			  回复查看码：<input name="replycode" type="password" size="10" maxlength="100" />&nbsp;
        <input type="hidden" name="id" value="<%=id%>" />
        <input type="submit" class="button" name="viewreply" value="查看回复" />
			</form>
<%
end sub

sub pages()	'//////// 分页代码
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
	页次：<b><%=currentpage%>/<%=n%></b>页，每页<b><%=rs.pagesize%></b>条，共<b><%=totalrec%></b>条&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>首页&nbsp;
	<%else%><a href="index.asp?page=1" title="首页">首页</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="index.asp?page=<%=cstr(p*5)%>" title="上五页">上翻</a>&nbsp;
	<%end if
	for ii=p*5+1 to p*5+5
	if ii=currentpage then%><span class="currtNum"><%=cstr(ii)%></span>
	<%else%><a href="index.asp?page=<%=cstr(ii)%>"><%=cstr(ii)%></a>
	<%end if
	if ii=n then exit for
	next
	if ii<n then%>&nbsp;<a href="index.asp?page=<%=cstr(ii)%>" title="下五页">下翻</a><%end if%>
	<%if currentpage=n then%>&nbsp;尾页
	<%else%>&nbsp;<a href="index.asp?page=<%=cstr(n)%>" title="尾页">尾页</a>
	<%end if%>
	</div>
<%
end sub
%>