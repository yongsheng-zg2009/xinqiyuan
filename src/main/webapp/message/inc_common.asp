
<%Session.CodePage=936%>
<%Response.Buffer = True%>
<%session.timeout=20%>
<!--#include file="inc_connect.asp"-->
<%
'**************************************
'**		inc_common.asp
'**
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************


'//////// ����ͳ��
if not session("in_site") = true then
	set rs= server.createobject("adodb.recordset")
	sql="select top 1 stat from [admin]"
	rs.open sql,conn,3,2
	rs.update
	rs("stat")=rs("stat")+1
	rs.update
	rs.close
	set rs=nothing
	session("in_site") = true
end if

'//////// ����������ȡ
dim name,password,perpage,site,URL,adminmail
dim maxnum,notice,stat,lock,needcheck,badip,adword,UBBcfg
dim skinFolder,imagesFolder,emotFolder,userfacesFolder,needSecurityCode
set rs=server.createobject("adodb.recordset")
sql="select top 1 * from [admin]"
rs.open sql,conn,1,1
	name=trim(rs("name"))
	password=rs("password")
	perpage=trim(rs("perpage"))
	site=trim(rs("site"))
	URL=trim(rs("URL"))
	adminmail=trim(rs("adminmail"))
	maxnum=cint(trim(rs("maxnum")))
	notice=trim(rs("notice"))
	stat=rs("stat")
	lock=rs("lock")
	needcheck=rs("needcheck")
	badip=trim(rs("badip"))
	adword=trim(rs("adword"))
	UBBcfg=rs("UBBconfig")
	skinFolder=trim(rs("skinFolder"))
	imagesFolder=trim(rs("imagesFolder"))
	emotFolder=trim(rs("emotFolder"))
	userfacesFolder=trim(rs("userfacesFolder"))
	needSecurityCode=true

	'//////// �Զ���UBB֧��
	dim UBBcfg_font,UBBcfg_size,UBBcfg_color,UBBcfg_b,UBBcfg_i,UBBcfg_u
	dim UBBcfg_center,UBBcfg_URL,UBBcfg_email,UBBcfg_shadow,UBBcfg_glow
	dim UBBcfg_pic,UBBcfg_swf,UBBcfg_emot
		if instr(UBBcfg,"font")>0 then UBBcfg_font=1
		if instr(UBBcfg,"size")>0 then UBBcfg_size=1
		if instr(UBBcfg,"color")>0 then UBBcfg_color=1
		if instr(UBBcfg,"bold")>0 then UBBcfg_b=1
		if instr(UBBcfg,"italic")>0 then UBBcfg_i=1
		if instr(UBBcfg,"underline")>0 then UBBcfg_u=1
		if instr(UBBcfg,"center")>0 then UBBcfg_center=1
		if instr(UBBcfg,"URL")>0 then UBBcfg_URL=1
		if instr(UBBcfg,"email")>0 then UBBcfg_email=1
		if instr(UBBcfg,"shadow")>0 then UBBcfg_shadow=1
		if instr(UBBcfg,"glow")>0 then UBBcfg_glow=1
		if instr(UBBcfg,"pic")>0 then UBBcfg_pic=1
		if instr(UBBcfg,"swf")>0 then UBBcfg_swf=1
		if instr(UBBcfg,"emot")>0 then UBBcfg_emot=1

rs.close
set rs=nothing

dim user_ip	'//////// ȡ����ʵIP��ַ
if request.servervariables("http_x_forwarded_for")="" then
	user_ip=request.servervariables("remote_addr")
else
	user_ip=request.servervariables("http_x_forwarded_for")
end if

if not badip="" then	'//////// ����IP����
	dim allbadip,i
		allbadip=split(badip,chr(13)&chr(10))
	for i = lbound(allbadip) to ubound(allbadip)
		if user_ip = trim(allbadip(i)) then
			errinfo="<li>����IP�ѱ��赲��"
			call showError()
			response.end
		end if
	next
end if

dim login	'//////// �ж��Ƿ��½
if session("SranM_login") = true then
	login=true
else
	if Request.Cookies("SranM_mypassword") = password then
		login=true
	else
		login=false
	end if
end if

dim pagename
dim code_version
	code_version="2.30" '//////// �汾��


sub pageHead() '//////// ҳ��ͷ����Ϣ
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta name="Description" content="�����ǵ�ӰԺ��Ƭ������������<%=code_version%>" />
<meta name="Keywords" content="<%=site%>,��Ƭ�������������Ա�" />
<meta http-equiv="content-language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style> html { overflow-x:hidden; } </style> 
<%if pagename="�鿴����" then%><title>���Ա� - <%=site%></title>
<%else%><title><%=pagename%> - <%=site%></title><%end if%>
<link rel="stylesheet" type="text/css" href="<%=skinFolder%>/style.css" />
<script type="text/javascript" src="inc_common.js"></script>
</head>
<%
end sub

sub bodySkin() '//////// ͨ�ý���
call pageHead()
sql="select id from [topic] order by usertime desc"
set rs=server.createobject("ADODB.recordset")
rs.open sql,conn,1,1

dim totalMsg
totalMsg=rs.recordcount
rs.close
set rs=nothing
%>
<body>
<div id="wrapper"> 
  <div id="wrapperInner"> <!-- 	begin wrapperInner  -->
    <div id="topArea">
      <div id="gbInfo">
        <div id="gbInfo-info">
        <%if not login then%>
        <%else%>
        ��ӭ&nbsp;<b><%=name%></b>&nbsp;&nbsp;
        <a href="bulletin.asp">��������</a>&nbsp;&nbsp;
        <a href="index.asp">��������</a>&nbsp;&nbsp;
        <a href="admin.asp?act=batch">����</a>&nbsp;&nbsp;
        <a href="admin.asp?act=main">�������Ա�</a>&nbsp;&nbsp;
        <a href="login.asp?act=logout">�˳���½</a>&nbsp;&nbsp;
        <%end if%>
        </div>
      </div>
    </div>
    <div id="nav"> <!--  begin nav  -->
      <div id="navLink">
        <ul>
          <li><a title="�鿴����" href="index.asp"<%if pagename="�鿴����" or pagename="��������" then%> class="selected"<%end if%>>�鿴����</a></li>
          <li><a title="д����" href="new.asp"<%if pagename="д����" then%> class="selected"<%end if%>>д����</a></li>
          <li><a title="��������" href="search.asp"<%if pagename="��������" or pagename="�������" then%> class="selected"<%end if%>>��������</a></li>
          <li><a title="���԰���" href="help.asp"<%if pagename="���԰���" then%> class="selected"<%end if%>>���԰���</a></li>
          <li><%if not login then%><a title="�����½" href="login.asp"<%if pagename="�����½" then%> class="selected"<%end if%>>�����½</a><%else%><a title="�˳���½" href="login.asp?act=logout">�˳���½</a><%end if%></li>
        </ul>
      </div>
    </div> <!--  end nav  -->
    <div id="mainContent"> <!-- 	begin mainContent  -->
      <div id="gbcontent">
      <%call pageContent()%>
      </div>
    </div> <!--  end mainContent  -->
</body>
</html>
<%
end sub

dim errinfo	'//////// ������Ϣ
errinfo=""
sub showError()
	if not errinfo="" then
		response.redirect "error.asp?errinfo="&errinfo
		response.flush
	end if
end sub

sub getEmot()	'//////// ��ȡ����ͼ
	dim ii,i
	for i=1 to 42
		if len(i)=1 then ii="0" & i else ii=i%><a href="javascript:insertemot('[emot<%=ii%>]')"><img src="<%=emotFolder%>/<%=ii%>.gif" class="emot" /></a>&nbsp;<%
		if i=15 or i=30 then response.write "<br />"
	next
end sub

Function RndCode()	'//////// ������λ���漴����
Dim Codetype, vCode, vCodes
Dim CodeAmount
Codetype = "0123456789"
CodeAmount = Len(Codetype)
Randomize
For i = 1 To 4
vCode = Int(Rnd * CodeAmount)
vCodes = vCodes & Mid(Codetype, vCode + 1, 1)
Next
RndCode = vCodes
End Function

function sql_filter(text)	'//////// ���ύ����ʱ����SQL����
	if isnull(text) then
		sql_filter=""
		exit function
	end if

	dim Replace_words
	Set Replace_words=new RegExp
	Replace_words.IgnoreCase =True
	Replace_words.Global=True

	Replace_words.Pattern="(')"
	text=Replace_words.Replace(text,"''")
	Replace_words.Pattern="(;)"
	text=Replace_words.Replace(text,"��")
	Replace_words.Pattern="(%)"
	text=Replace_words.Replace(text,"��")
	Replace_words.Pattern="(and)"
	text=Replace_words.Replace(text,"����")
	Replace_words.Pattern="(exec)"
	text=Replace_words.Replace(text,"������")
	Replace_words.Pattern="(execute)"
	text=Replace_words.Replace(text,"�����������")
	Replace_words.Pattern="(insert)"
	text=Replace_words.Replace(text,"�������")
	Replace_words.Pattern="(select)"
	text=Replace_words.Replace(text,"�������")
	Replace_words.Pattern="(delete)"
	text=Replace_words.Replace(text,"��������")
	Replace_words.Pattern="(update)"
	text=Replace_words.Replace(text,"���������")
	Replace_words.Pattern="(count)"
	text=Replace_words.Replace(text,"�������")
	Replace_words.Pattern="(chr)"
	text=Replace_words.Replace(text,"����")
	Replace_words.Pattern="(mid)"
	text=Replace_words.Replace(text,"����")
	Replace_words.Pattern="(master)"
	text=Replace_words.Replace(text,"��������")
	Replace_words.Pattern="(truncate)"
	text=Replace_words.Replace(text,"������������")
	Replace_words.Pattern="(char)"
	text=Replace_words.Replace(text,"�����")
	Replace_words.Pattern="(declare)"
	text=Replace_words.Replace(text,"��������")

	Set Replace_words=Nothing
	sql_filter = text
end function

function back_filter(text)	'//////// ����ʾ����ʱ��ԭ���滻�����ı�
	if isnull(text) then
		back_filter=""
		exit function
	end if
	text = Replace(text,"''","'")
	text = Replace(text,"��",";")
	text = Replace(text,"��","%")
	text = Replace(text,"����","and")
	text = Replace(text,"������","exec")
	text = Replace(text,"�����������","execute")
	text = Replace(text,"�������","insert")
	text = Replace(text,"�������","select")
	text = Replace(text,"��������","delete")
	text = Replace(text,"���������","update")
	text = Replace(text,"�������","count")
	text = Replace(text,"����","chr")
	text = Replace(text,"����","mid")
	text = Replace(text,"��������","master")
	text = Replace(text,"������������","truncate")
	text = Replace(text,"�����","char")
	text = Replace(text,"��������","declare")
	back_filter = text
end function

function formatNum(number)	'//////// ������ת��Ϊǧ��λ��ʽ
	if not(isnumeric(number)) or number = 0 then
		result = 0
		elseif len(fix(number)) < 4 then
		result = number
	else
		dim pos,res,loopcount,tempresult,dec,result
		pos = instr(1,number,".")
		if pos > 0 then
			dec = mid(number,pos)
		end if
		res = strreverse(fix(number))
		loopcount = 1
		while loopcount <= len(res)
			tempresult = tempresult + mid(res,loopcount,3)
			loopcount = loopcount + 3
			if loopcount <= len(res) then
			tempresult = tempresult + ","
			end if
		wend
		result = strreverse(tempresult) + dec
	end if
	formatNum = result
end function
%>