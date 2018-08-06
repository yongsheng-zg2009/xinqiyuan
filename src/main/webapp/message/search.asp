<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		search.asp
'**
'** 文件说明：搜索页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

dim key
	key=sql_filter(left(Trim(Request.QueryString("key")),15))

dim currentpage,page_count,Pcount
dim totalrec,endpage

if Request.QueryString("page")="" then
	currentPage=1
else
	if (not isnumeric(Request.QueryString("page"))) then
		errinfo="<li>非法的页面参数！</li>"
		call showError()
	end if
	currentPage=cint(Request.QueryString("page"))
end if

pagename="搜索留言"

call bodySkin()
sub pageContent()
	if Request.Form("key")="" and key="" then
		fillForm()
	else
		searchResult()
	end if
end sub

function fillForm()
%>
        <div id="searchForm">
          <form action="search.asp" method="post">
          <input type="text" name="key" size="20">&nbsp;<input type="submit" class="button" value="搜  索"><br />
          <span class="noteText">搜索范围将包括：留言者的称呼、留言标题、正文以及回复</span>
          </form>
        </div>
<%
end function

function searchResult()


if len(sql_filter(Trim(Request.Form("key")))) = 1 or len(key) = 1 then
	errinfo="<li>关键字过短。</li>"
	call showError()
else
	if (not sql_filter(Trim(Request.Form("key")))="") and key=""	then
		Response.Redirect "?key="&Trim(Request.Form("key"))
		Response.Flush
	end if
end if

if login then
	sql = "Select * from [topic] where (usertitle like '%"&key&"%' or usercontent like '%"&key&"%' or username like '%"&key&"%' or recontent like '%"&key&"%') order by top desc,usertime desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
else
	sql = "Select * from [topic] where checked=1 and whisper=0 and (usertitle like '%"&key&"%' or usercontent like '%"&key&"%' or username like '%"&key&"%' or recontent like '%"&key&"%') order by top desc,usertime desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
end if

if rs.eof or rs.bof then
	rs.close
	set rs=nothing
	errinfo="<li>没有找到包含“"&back_filter(key)&"”的留言，请简化关键字后再搜索。</li>"
	call showError()
end if

	rs.PageSize = perpage
	rs.AbsolutePage=currentpage
	page_count=0
	totalrec=rs.recordcount

if not totalrec mod perpage=0 then
	if currentPage > (totalrec/perpage)+1 then response.redirect "?key="&key&"&page=" & Int((totalrec/perpage))+1
else
	if currentPage > (totalrec/perpage) then response.redirect "?key="&key&"&page=" & Int((totalrec/perpage))
end if

call pages()

while (not rs.eof) and (not page_count = rs.PageSize)

dim username,userURL,usermail,userqq,usertitle,usertime,usercontent,recontent,retime
	username =  Boldkey(HTMLencode(rs("username")),key)
	userURL = HTMLencode(rs("userURL"))
	usermail = HTMLencode(rs("usermail"))
	userqq = HTMLencode(rs("userqq"))
	usertitle = Boldkey(HTMLencode(rs("usertitle")),key)
	usertime = rs("usertime")
	usercontent = Boldkey(UBBCode(rs("usercontent"),rs("top")),key)
	recontent = Boldkey(UBBCode(rs("recontent"),1),key)
	retime = rs("retime")
%>
        <a id="<%=rs("id")%>">
        <div class="msgArea">
         <%if rs("whisper")="1" and (not login) then%>
          <div class="msgArea-left">
            <ul >
              <li class="userFace"><img class="face-normal" src="<%=userfacesFolder%>/whisper.gif" alt="悄悄话" /></li>
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
              <li class="userFace"><%if rs("top")=1 then%><img class="face-bulletin" src="<%=userfacesFolder%>/bulletin.gif" alt="管理员" /><%else%><img class="face-normal" src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" alt="<%=HTMLencode(rs("username"))%>" /><%end if%></li>
              <li class="userName"><%if rs("top")=1 then%><span class="userName-istop">管理员</span><%else%><%=username%><%end if%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!-- 	标题、时间、留言内容、回复  -->
            <div class="msgTitle"><%if rs("top")=1 then%><span class="msgTitle-istop">公告：</span><%else%>标题：<%end if%><h3><%=usertitle%></h3></div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="userContact">
             <%if not rs("userURL")="" then%><a target="_blank" href="<%=userURL%>"><img class="imgLink" src="<%=imagesFolder%>/homepage.gif" alt="访问“<%=HTMLencode(rs("username"))%>”的网站" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/homepage_grey.gif" alt="" />
             <%end if%>
             <%if not rs("usermail")="" then%><a href="mailto:<%=usermail%>"><img class="imgLink" src="<%=imagesFolder%>/email.gif" alt="给“<%=HTMLencode(rs("username"))%>”发送电子邮件" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/email_grey.gif" alt="" />
             <%end if%>
             <%if not rs("userqq")="" then%><a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=<%=userqq%>&Site=<%=site%>&Menu=yes"><img class="imgLink" src="<%=imagesFolder%>/qq.gif" alt="向“<%=HTMLencode(rs("username"))%>”的QQ发起临时会话（QQ软件须开启）" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/qq_grey.gif" alt="" />
             <%end if%>
            </div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
            <%if rs("reply")=1 then%>
            <div class="msgReply">
              <div class="msgReply-top"><b>管理员回复 : </b>( <%=retime%> )</div>
              <div class="msgReply-content"><table><tr><td><%=recontent%></td></tr></table></div>
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
	搜索“<span class="Highlight"><%=back_filter(key)%></span>”&nbsp;&nbsp;页次：<b><%=currentpage%>/<%=n%></b>页，每页<b><%=rs.pagesize%></b>条，共<b><%=totalrec%></b>条&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>首页&nbsp;
	<%else%><a href="?key=<%=back_filter(key)%>&page=1" title="首页">首页</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="?key=<%=back_filter(key)%>&page=<%=cstr(p*5)%>" title="上五页">上翻</a>&nbsp;
	<%end if
	for ii=p*5+1 to p*5+5
	if ii=currentpage then%>
	<span class="currtNum"><%=cstr(ii)%></span>
	<%else%>
	<a href="?key=<%=back_filter(key)%>&page=<%=cstr(ii)%>"><%=cstr(ii)%></a>
	<%end if
	if ii=n then exit for
	next
	%>
	<%if ii<n then%>
	&nbsp;<a href="?key=<%=back_filter(key)%>&page=<%=cstr(ii)%>" title="下五页">下翻</a>
	<%end if%>
	<%if currentpage=n then%>
	&nbsp;尾页
	<%else%>
	&nbsp;<a href="?key=<%=back_filter(key)%>&page=<%=cstr(n)%>" title="尾页">尾页</a>
	<%end if%>
	</div>
<%
end sub

Function Boldkey(strContent,key)	'//////// 加亮关键字
	dim B_key
	Set B_key=new RegExp
	B_key.IgnoreCase =true
	B_key.Global=True
	B_key.Pattern="(" & key & ")"
	strContent=B_key.Replace(strContent,"<span class=""keyword"">$1</span>" )
	Set B_key=Nothing
	Boldkey=strContent
End Function
%>