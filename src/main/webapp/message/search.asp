<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		search.asp
'**
'** �ļ�˵��������ҳ��
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

dim key
	key=sql_filter(left(Trim(Request.QueryString("key")),15))

dim currentpage,page_count,Pcount
dim totalrec,endpage

if Request.QueryString("page")="" then
	currentPage=1
else
	if (not isnumeric(Request.QueryString("page"))) then
		errinfo="<li>�Ƿ���ҳ�������</li>"
		call showError()
	end if
	currentPage=cint(Request.QueryString("page"))
end if

pagename="��������"

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
          <input type="text" name="key" size="20">&nbsp;<input type="submit" class="button" value="��  ��"><br />
          <span class="noteText">������Χ�������������ߵĳƺ������Ա��⡢�����Լ��ظ�</span>
          </form>
        </div>
<%
end function

function searchResult()


if len(sql_filter(Trim(Request.Form("key")))) = 1 or len(key) = 1 then
	errinfo="<li>�ؼ��ֹ��̡�</li>"
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
	errinfo="<li>û���ҵ�������"&back_filter(key)&"�������ԣ���򻯹ؼ��ֺ���������</li>"
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
              <li class="userFace"><img class="face-normal" src="<%=userfacesFolder%>/whisper.gif" alt="���Ļ�" /></li>
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
              <li class="userFace"><%if rs("top")=1 then%><img class="face-bulletin" src="<%=userfacesFolder%>/bulletin.gif" alt="����Ա" /><%else%><img class="face-normal" src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" alt="<%=HTMLencode(rs("username"))%>" /><%end if%></li>
              <li class="userName"><%if rs("top")=1 then%><span class="userName-istop">����Ա</span><%else%><%=username%><%end if%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!-- 	���⡢ʱ�䡢�������ݡ��ظ�  -->
            <div class="msgTitle"><%if rs("top")=1 then%><span class="msgTitle-istop">���棺</span><%else%>���⣺<%end if%><h3><%=usertitle%></h3></div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="userContact">
             <%if not rs("userURL")="" then%><a target="_blank" href="<%=userURL%>"><img class="imgLink" src="<%=imagesFolder%>/homepage.gif" alt="���ʡ�<%=HTMLencode(rs("username"))%>������վ" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/homepage_grey.gif" alt="" />
             <%end if%>
             <%if not rs("usermail")="" then%><a href="mailto:<%=usermail%>"><img class="imgLink" src="<%=imagesFolder%>/email.gif" alt="����<%=HTMLencode(rs("username"))%>�����͵����ʼ�" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/email_grey.gif" alt="" />
             <%end if%>
             <%if not rs("userqq")="" then%><a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=<%=userqq%>&Site=<%=site%>&Menu=yes"><img class="imgLink" src="<%=imagesFolder%>/qq.gif" alt="��<%=HTMLencode(rs("username"))%>����QQ������ʱ�Ự��QQ����뿪����" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/qq_grey.gif" alt="" />
             <%end if%>
            </div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
            <%if rs("reply")=1 then%>
            <div class="msgReply">
              <div class="msgReply-top"><b>����Ա�ظ� : </b>( <%=retime%> )</div>
              <div class="msgReply-content"><table><tr><td><%=recontent%></td></tr></table></div>
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
	������<span class="Highlight"><%=back_filter(key)%></span>��&nbsp;&nbsp;ҳ�Σ�<b><%=currentpage%>/<%=n%></b>ҳ��ÿҳ<b><%=rs.pagesize%></b>������<b><%=totalrec%></b>��&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>��ҳ&nbsp;
	<%else%><a href="?key=<%=back_filter(key)%>&page=1" title="��ҳ">��ҳ</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="?key=<%=back_filter(key)%>&page=<%=cstr(p*5)%>" title="����ҳ">�Ϸ�</a>&nbsp;
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
	&nbsp;<a href="?key=<%=back_filter(key)%>&page=<%=cstr(ii)%>" title="����ҳ">�·�</a>
	<%end if%>
	<%if currentpage=n then%>
	&nbsp;βҳ
	<%else%>
	&nbsp;<a href="?key=<%=back_filter(key)%>&page=<%=cstr(n)%>" title="βҳ">βҳ</a>
	<%end if%>
	</div>
<%
end sub

Function Boldkey(strContent,key)	'//////// �����ؼ���
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