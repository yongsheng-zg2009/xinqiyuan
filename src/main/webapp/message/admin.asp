<!--#include file="inc_common.asp"-->
<!--#include file="inc_md5.asp"-->
<%


dim adminAct
	adminAct=request.querystring("act")
select case adminAct
case "update"
	call updateSettings()
case "del"
	call delMsg()
case "check"
	call checkMsg()
case else
	sub pageContent()
	if adminAct="batch" then
		BatchMsg()
	else
		SetBook()
	end if
	end sub
	if adminAct="batch" then
		pagename="������������"
	else
		pagename="�������Ա�"
	end if
	call bodySkin()
end select

function SetBook()		'//////// ���Ա�����ҳ��

	if not login then
		errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��"
		call showError()
	else
%>
        <form method="post" action="?act=update">
        <div class="row">
          <div class="row-left">��վ���ƣ�</div>
          <div class="row-right">
          
      <input type="text" name="site" size="29" value="<%=site%>" />
      <br />
          <span class="noteText">���Ա�������վ������ƣ��磺�Ѻ�������</span></div>
        </div>
        <div class="row">
          <div class="row-left">��վ��ַ��</div>
          <div class="row-right">
          
      <input type="text" name="URL" size="29" value="<%=URL%>" />
      <br />
          <span class="noteText">��ע�⣺�����������ĵ�ַ���磺http://www.tqtec.cn/����</span></div>
        </div>
        <div class="row">
          <div class="row-left">����Ա���ƣ�</div>
          <div class="row-right">
          
      <input type="text" name="name" size="29" value="<%=name%>" />
      <br />
          <span class="noteText">�������Լ��ĳƺ���</span></div>
        </div>
        <div class="row">
          <div class="row-left">�޸Ĺ���Ա���룺</div>
          <div class="row-right">
          
      <input type="password" name="password" size="29" />
      <br />
          <span class="noteText">����ϣ���޸ģ����ռ��ɡ�</span></div>
        </div>
        <div class="row">
          <div class="row-left">�ظ����룺</div>
          <div class="row-right">
          
      <input type="password" name="password2" size="29" />
      <br />
          <span class="noteText">ͬ�ϡ�</span></div>
        </div>
        <div class="row">
          <div class="row-left">����ԱEmail��</div>
          <div class="row-right">
          
      <input type="text" name="adminmail" size="29" value="<%=adminmail%>" />
      <br />
          <span class="noteText">�������Լ���email��</span></div>
        </div>
        <div class="row">
          <div class="row-left">ÿҳ��ʾ��������</div>
          <div class="row-right">
          
      <input type="text" name="perpage" size="10" value="<%=perpage%>" />
    </div>
        </div>
        <div class="row">
          <div class="row-left">�������������</div>
          <div class="row-right">
          
      <input type="text" name="maxnum" size="10" value="<%=maxnum%>" />
    </div>
        </div>
        <div class="row">
          <div class="row-left">������ʾ��</div>
          <div class="row-right">
          <textarea rows="5" name="notice" cols="55"><%=notice%></textarea>
      <br />
          <span class="noteText">�����ǻ�ӭ�ʡ����桢վ��˵���ȣ����������ύ����ҳ��Ķ�����֧��UBB���롣</span></div>
        </div>
        <div class="row">
          <div class="row-left">���ܻ�ӭ��IP��</div>
          <div class="row-right">
          <textarea rows="5" name="badip" cols="34"><%=badip%></textarea>
      <br />
          <span class="noteText">���ܻ�ӭ��IP��ַ���޷��������Ա���<b>ÿ��IP��ַ����ռһ��</b>��</span></div>
        </div>
        <div class="row">
          <div class="row-left">�����ˣ�</div>
          <div class="row-right">
          <textarea rows="5" name="adword" cols="34"><%=adword%></textarea>
      <br />
          <span class="noteText">��������ĳһ��������Խ��޷��ύ���������ĳ�����������վ��������йأ��뽫����ı�����ɾȥ��<b>ÿ���������ռһ��</b>��</span></div>
        </div>
        <div class="row">
          <div class="row-left">���ʴ�����</div>
          <div class="row-right">
          
      <input type="text" name="stat" size="10" value="<%=stat%>" />
      &nbsp;<span class="noteText">�޸����Ա��Դ��ļ���������ֵ��</span></div>
        </div>
        <div class="row">
          <div class="row-left">Ƥ���ļ��У�</div>
          <div class="row-right">
          
      <input type="text" name="skinFolder" size="29" value="<%=skinFolder%>" />
      <br />
          <span class="noteText">���Ƥ�����ڵ��ļ��У��� skins/blue</span></div>
        </div>
        <div class="row">
          <div class="row-left">ͼƬ�ļ��У�</div>
          <div class="row-right">
          
      <input type="text" name="imagesFolder" size="29" value="<%=imagesFolder%>" />
      <br />
          <span class="noteText">ϵͳͼƬ���ڵ��ļ��У��� skins/default/images</span></div>
        </div>
        <div class="row">
          <div class="row-left">�����ļ��У�</div>
          <div class="row-right">
          
      <input type="text" name="emotFolder" size="29" value="<%=emotFolder%>" />
      <br />
          <span class="noteText">���Ա������ڵ��ļ��У��� skins/default/emot</span></div>
        </div>
        <div class="row">
          <div class="row-left">ͷ���ļ��У�</div>
          <div class="row-right">
          
      <input type="text" name="userfacesFolder" size="29" value="<%=userfacesFolder%>" />
      <br />
          <span class="noteText">������ͷ�����ڵ��ļ��У��� skins/default/userfaces</span></div>
        </div>
        <div class="row">
          <div class="row-left">�Զ���UBB֧�֣�</div>
          <div class="row-right">
          
      <input type="checkbox" name="UBBcfg" id="UBBcfg_font" value="font"<%if UBBcfg_font=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_font">����</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_size" value="size"<%if UBBcfg_size=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_size">�ֺ�</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_color" value="color"<%if UBBcfg_color=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_color">������ɫ</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_bold" value="bold"<%if UBBcfg_b=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_bold">����</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_italic" value="italic"<%if UBBcfg_i=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_italic">б��</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_underline" value="underline"<%if UBBcfg_u=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_underline">�»���</label><br />
      <input type="checkbox" name="UBBcfg" id="UBBcfg_center" value="center"<%if UBBcfg_center=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_center">����</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_URL" value="URL"<%if UBBcfg_URL=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_URL">������</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_email" value="email"<%if UBBcfg_email=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_email">email����</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_shadow" value="shadow"<%if UBBcfg_shadow=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_shadow">��Ӱ��</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_glow" value="glow"<%if UBBcfg_glow=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_glow">������</label><br />
      <input type="checkbox" name="UBBcfg" id="UBBcfg_pic" value="pic"<%if UBBcfg_pic=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_pic">ͼƬ</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_swf" value="swf"<%if UBBcfg_swf=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_swf">Flash</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_emot" value="emot"<%if UBBcfg_emot=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_emot">����ͼ</label><br />
      <span class="noteText"><b>ע�⣺</b>ĳЩFlash�������ܰ����к��Ľű���������ѡ���Ƿ�֧��Flash��</span></div>
        </div>
        <div class="row">
          <div class="row-left">���Ա�״̬��</div>
          <div class="row-right">
          <input type="radio" value="0" id="lock_off" <%if lock=0 then%>checked="checked" <%end if%>name="lock" /> <label for="lock_off">����</label>&nbsp;&nbsp;
          <input type="radio" value="1" id="lock_on" <%if lock=1 then%>checked="checked" <%end if%>name="lock" /> <label for="lock_on">����</label>&nbsp;&nbsp;<span class="noteText">�����������κ��˶����ܷ������ԣ�</span>
          </div>
        </div>
        <div class="row">
          <div class="row-left">������ˣ�</div>
          <div class="row-right">
          <input type="radio" value="1" <%if needcheck=1 then%>checked="checked" <%end if%>name="needcheck" id="needcheck_on" /> <label for="needcheck_on">��Ҫ</label>&nbsp;&nbsp;
          <input type="radio" value="0" <%if needcheck=0 then%>checked="checked" <%end if%>name="needcheck" id="needcheck_off" /> <label for="needcheck_off">����Ҫ</label>&nbsp;&nbsp;<span class="noteText">��δ����˵����Խ����ᱻ��ʾ��������Ա���Կ�����</span></div>
        </div>
        <div class="row">
          <div class="row-right"><br />
          <input type="submit" class="button" value="�� ��" name="submit" />
      &nbsp;&nbsp;
          <input type="reset" class="button" value="�� ��" name="submit2" />
          </div>
        </div>
        </form>
<%
	end if
	conn.close
	set rs=nothing
end function

sub updateSettings()		'//////// ��������
if not login then
	errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��</li>"
	call showError()
else
	dim new_site,new_URL,new_name,new_password1
	dim new_password2,new_adminmail,new_perpage
	dim new_maxnum,new_notice,new_badip,new_adword
	dim new_stat,new_UBBcfg,new_lock,new_needcheck
	dim new_skinFolder,new_imagesFolder,new_emotFolder,new_userfacesFolder

	new_site=trim(request.form("site"))
	new_URL=trim(request.form("URL"))
	new_name=trim(request.form("name"))
	new_password1=trim(request.form("password"))
	new_password2=trim(request.form("password2"))
	new_adminmail=trim(request.form("adminmail"))
	new_perpage=trim(request.form("perpage"))
	new_maxnum=trim(request.form("maxnum"))
	new_notice=request.form("notice")
	new_badip=trim(request.form("badip"))
	new_adword=trim(request.form("adword"))
	new_stat=trim(request.form("stat"))
	new_UBBcfg=request.form("UBBcfg")
	new_lock=request.form("lock")
	new_needcheck=request.form("needcheck")
	new_skinFolder=trim(request.form("skinFolder"))
	new_imagesFolder=trim(request.form("imagesFolder"))
	new_emotFolder=trim(request.form("emotFolder"))
	new_userfacesFolder=trim(request.form("userfacesFolder"))

	if new_site="" or new_URL="" or new_name="" or new_adminmail="" or new_perpage="" or new_maxnum="" or new_stat="" or new_lock="" or new_skinFolder="" or new_imagesFolder="" or new_emotFolder="" or new_userfacesFolder="" then
		errinfo=errinfo & "<li>������д������������������ʾ��IP�б���������͹��������⣬��������Ǳ����</li>"
	end if

	if new_password1<>new_password2 then
		errinfo=errinfo & "<li>������������벻һ��</li>"
	else
		dim finalPW
		if new_password1="" then
			finalPW=password
		else
			finalPW=MD5(new_password1)
		end if
	end if

	if (not new_perpage="") and not(isnumeric(new_perpage)) then
		errinfo=errinfo & "<li>ÿҳ��ʾ����������Ϊ����</li>"
	end if

	if (not new_maxnum="") and not(isnumeric(new_maxnum)) then
		errinfo=errinfo & "<li>���������������Ϊ����</li>"
	end if

	if (not new_stat="") and not(isnumeric(new_stat)) then
		errinfo=errinfo & "<li>���ʴ�������Ϊ����</li>"
	end if

	call showError()

	set rs= server.createobject("adodb.recordset")
		sql="select top 1 * from [admin]"
		rs.open sql,conn,3,2
		rs.update
		rs("site")=new_site
		rs("URL")=new_URL
		rs("name")=new_name
		rs("password")=finalPW
		rs("adminmail")=new_adminmail
		rs("perpage")=new_perpage
		rs("maxnum")=new_maxnum
		rs("notice")=new_notice
		rs("badip")=new_badip
		rs("adword")=new_adword
		rs("stat")=new_stat
		rs("UBBconfig")=new_UBBcfg
		rs("lock")=new_lock
		rs("needcheck")=new_needcheck
		rs("skinFolder")=new_skinFolder
		rs("imagesFolder")=new_imagesFolder
		rs("emotFolder")=new_emotFolder
		rs("userfacesFolder")=new_userfacesFolder
		rs.update
		rs.close

	response.redirect "index.asp"
	response.flush

end if
end sub

function BatchMsg()		'//////// ������������

	dim currentpage,page_count,pcount
	dim totalrec,endpage
	if request.querystring("page")="" then
		currentpage=1
	else
		currentpage=cint(request.querystring("page"))
	end if

	if not login then
		errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��</li>"
		call showError()
	end if

	if (not isnumeric(request.querystring("page"))) or (not isnumeric(request.querystring("page_num"))) then
		errinfo="<li>�Ƿ���ҳ�������</li>"
		call showError()
	end if

	dim view,page_num
		view=request.querystring("view")
		if request.querystring("page_num")="" then
			page_num=20
		else
			page_num=request.querystring("page_num")
		end if

	select case request.querystring("view")
		case "1"
			sql="select * from [topic] where (not checked=1) order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
		case "2"
			sql="select * from [topic] where (not reply=1) order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
		case else
			sql="select * from [topic] order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
	end select

	if rs.eof and rs.bof then
		errinfo="<li>û�д������ԡ�</li>"
		call showError()
	else
		rs.pagesize = page_num
		rs.absolutepage=currentpage
		page_count=0
		totalrec=rs.recordcount

%>
        <form action="admin.asp?act=" method="post" name="batch_form" id="batch_form" onsubmit="return Submit_all(batch_form);">
        <div class="row">
          <div class="batchArea-right" style="text-align: right;">
          ��ʾ��<select name="menu_view" onChange="MM_jumpMenu('parent',this,0)">
          <option value="?act=batch&page_num=<%=page_num%>"<%if view="" then%> selected="selected"<%end if%>>��������</option>
          <option value="?act=batch&view=1&page_num=<%=page_num%>"<%if view="1" then%> selected="selected"<%end if%>>����δͨ����˵�����</option>
          <option value="?act=batch&view=2&page_num=<%=page_num%>"<%if view="2" then%> selected="selected"<%end if%>>����δ���ظ�������</option>
          </select>&nbsp;ÿҳ��ʾ��<select name="menu_page_num" onChange="MM_jumpMenu('parent',this,0)">
          <option value="?act=batch&view=<%=view%>&page_num=10"<%if page_num="10" then%> selected="selected"<%end if%>>10��</option>
          <option value="?act=batch&view=<%=view%>&page_num=20"<%if page_num="20" then%> selected="selected"<%end if%>>20��</option>
          <option value="?act=batch&view=<%=view%>&page_num=50"<%if page_num="50" then%> selected="selected"<%end if%>>50��</option>
          <option value="?act=batch&view=<%=view%>&page_num=100"<%if page_num="100" then%> selected="selected"<%end if%>>100��</option>
          </select>
          </div>
        </div>
        <div class="row">
          <div class="batchArea-left">
			     <input type="hidden" value="<%=Request.ServerVariables("HTTP_URL")%>" name="Referer" />
			     <input type="checkbox" value="on" name="chkall" onclick="CheckAll(this.form)" /><br />
           ȫѡ</div>
          <div class="batchArea-topRight">
           <input type="submit" class="button" name="Submit_Del" value="����ɾ��" onclick="SetSubmitType('del');" />
           <input type="submit" class="button" name="Submit_Check" value="�������" onclick="SetSubmitType('check');" />&nbsp;&nbsp;
           <%call pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)%>
          </div>
        </div>
        <div class="row"><hr /></div>
		    <%while (not rs.eof) and (not page_count = rs.pagesize)%>
        <a id="msg<%=rs("id")%>">
        <div class="row">
          <div class="batchArea-left">
			     <input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" />
          </div>
          <div class="batchArea-right">
			     <label for="id_<%=rs("id")%>"><b>����</b>��<%=batchEncode(rs("usertitle"))%></label><br />
           <label for="id_<%=rs("id")%>"><b>ʱ��</b>��<%=rs("usertime")%></label><br /><hr />
           <label for="id_<%=rs("id")%>"><b>���ݴ���</b>��</label><table><tr><td><label for="id_<%=rs("id")%>"><%=batchEncode(rs("usercontent"))%></label></td></tr></table>
          </div>
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
        </div>
		    <%
        page_count = page_count + 1
		    rs.movenext
		    wend
        %>
        <div class="row">
          <div class="batchArea-left">
			     <input type="checkbox" value="on" name="chkall2" id="chkall2" onclick="javascript:chkall.click()" /><br />ȫѡ</div>
          <div class="batchArea-topRight">
           <input type="submit" class="button" name="Submit_Del" value="����ɾ��" onclick="SetSubmitType('del');" />
           <input type="submit" class="button" name="Submit_Check" value="�������" onclick="SetSubmitType('check');" />&nbsp;&nbsp;
           <%call pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)%>
          </div>
        </div>
</form>
<%
	end if
	rs.close
	set rs=nothing
end function

sub pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)	'// ��ҳ����
	dim ii,p,n
	if totalrec mod page_num=0 then
		n= totalrec \ page_num
	else
		n= totalrec \ page_num+1
	end if
	p=(currentpage-1) \ 5
	%>
	ҳ�Σ�<b><%=currentpage%>/<%=n%></b>ҳ����<b><%=totalrec%></b>��&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>��ҳ&nbsp;
	<%else%><a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=1" title="��ҳ">��ҳ</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(p*5)%>" title="����ҳ">�Ϸ�</a>&nbsp;
	<%end if
	for ii=p*5+1 to p*5+5
	if ii=currentpage then%>
	<span class="currtNum"><%=cstr(ii)%></span>
	<%else%>
	<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(ii)%>"><%=cstr(ii)%></a>
	<%end if
	if ii=n then exit for
	next
	%>
	<%if ii<n then%>
	&nbsp;<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(ii)%>" title="����ҳ">�·�</a>
	<%end if%>
	<%if currentpage=n then%>
	&nbsp;βҳ
	<%else%>
	&nbsp;<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(n)%>" title="βҳ">βҳ</a>
	<%
  end if
end sub

function batchEncode(fString)
	if not isnull(fString) then
		fString = back_filter(fString)
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")
		fString = Replace(fString, "''", "'")
		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(36), "&#36;")
		batchEncode = fString
	end if
end function

sub delMsg()		'////////////// ɾ������
	dim id
	id = request("id")

dim re,Referer
	Referer=request("Referer")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	re.Pattern="[^A-Za-z0-9]$"
	Referer=re.Replace(Referer,"")
	set re=nothing

	if not login then
		errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��</li>"
		call showError()
	else
		if id="" then
			errinfo="<li>��δѡ���κ����ԡ�</li>"
			call showError()
		end if

		sql="select id from [topic] where id in ("&id&")"
		set rs=server.createobject("adodb.recordset")
		rs.open sql,conn,1,3

		if rs.eof and rs.bof then
		rs.close
		set rs=nothing
		errinfo="<li>�����Բ����ڡ�</li>"
		call showError()
		end if

		rs.close
		set rs=nothing

		sql="delete from [topic] where id in ("&id&")"
		conn.execute(sql)
		conn.close

		if request.querystring("page")="" then
			response.redirect Referer
		else
			response.redirect Referer & "&page=" & request.querystring("page")
		end if
		response.flush

	end if
end sub

sub checkMsg()		'///////////// �������
	dim id
	id = request("id")

dim re,Referer
	Referer=request("Referer")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	re.Pattern="[^A-Za-z0-9]$"
	Referer=re.Replace(Referer,"")
	set re=nothing

	if not login then
		errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��</li>"
		call showError()
	else
		if id="" then
			errinfo="<li>��δѡ���κ����ԡ�</li>"
			call showError()
		end if

		sql="select id from [topic] where id in ("&id&")"
		set rs=server.createobject("adodb.recordset")
		rs.open sql,conn,1,3
		if rs.eof and rs.bof then
			rs.close
			set rs=nothing
			errinfo="<li>�����Բ����ڡ�</li>"
			call showError()
		end if

		rs.close
		set rs=nothing

		sql="update topic set checked='1' where id in ("&id&")"
		conn.execute(sql)
		conn.close

		if request.querystring("page")="" then
			response.redirect Referer
		else
			response.redirect Referer & "&page=" & request.querystring("page")
		end if
		response.flush

	end if
end sub
%>