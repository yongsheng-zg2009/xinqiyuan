<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->

<%
Response.Expires = 0 
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
%> 

<%
Call Header("新闻列表")
Call Content()
Call Footer()

' 开始写入内容
Sub Content()

Dim s_keyword, s_cataid
s_keyword = GetSafeStr(Trim(Request("keyword")))
s_cataid = GetSafeStr(Trim(Request("cataid")))

Dim Pmcount,Pageno
'//设置新闻显示数量
Pmcount = News_Back_Count

%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<br>

<script language="JavaScript">
<!--
function CheckSelect()
{
	var count=0;
	for(i=0;i<document.delnews.elements.length;i++)
	{
		if(document.delnews.elements[i].name=="NewsID")
		{		
			if(document.delnews.elements[i].checked==true)
			{
				count++;					
			}				
		}			
	}
		
	if(count<=0)
	{
		alert("请选择一条要操作的信息！");
		return false;
	}

	return true;
}

function cdel()
{
	if(CheckSelect()==false)
	{
		return false;
	}
	
	if (confirm("你确定要删除这些新闻吗？不可恢复！")){
		document.delnews.action.value = "del";
		document.delnews.submit();
	}
}

function ccheck()
{
	if(CheckSelect()==false)
	{
		return false;
	}
	
	if (confirm("你确定要审核这些信息吗？")){
		document.delnews.action.value = "check";
		document.delnews.submit();
	}
}

function cuncheck()
{
	if(CheckSelect()==false)
	{
		return false;
	}
	
	if (confirm("你确定要撤销这些信息吗？浏览者将看不到这些信息！")){
		document.delnews.action.value = "uncheck";
		document.delnews.submit();
	}
}

function view(newsfile) {
	var gt = unescape('%3e');
	var popup = null;
	var over = "Launch Pop-up Navigator";
	popup = window.open('', 'popupnav', 'width=300,height=160,left=200,top=200,,resizable=no,scrollbars=no');
	if (popup != null) {
		if (popup.opener == null) {
		popup.opener = self;
		}
	popup.location.href = newsfile;
	}
}
function SelectCheckBox()
{
	for(i=0;i<document.delnews.elements.length;i++)
	{
		if(document.all("selectCheck").checked == true)
		{
			document.delnews.elements[i].checked = true;					
		}
		else
		{
			document.delnews.elements[i].checked = false;
		}
	}
}
//-->
</script>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><%=Homepage_title%> - <font color="#FF0000">新闻列表</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#799AE1">
      <tr>
        <form action="LinkList.asp" method="get" name="toGetLinkList" id="Form1">
          <td  height="30" align=left> &nbsp;&nbsp;&nbsp;&nbsp;搜索：
              <input name="keyword" type=text value="<%=s_keyword%>" class="button1">
              <select name="cataid" size="1" style="height:18" onChange="javascript:document.toGetLinkList.submit();" id="Select1">
                <option value="">--&gt;&gt;链接类别&lt;&lt;--</option>
<%
	'开始读取数据库中已经定义的新闻类别
	'其实这么写，感觉太没有效率了，应该定义一个子程序
	
	Dim cRs, cSql, j, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM L_Class where L_Hide=0 ORDER BY L_Sort"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF	
		TempCataStr = "<option value='"&Trim(cRs("L_ID"))&"'"
		If Trim(cRs("L_ID")) = s_cataid Then TempCataStr = TempCataStr&" selected"
		TempCataStr=TempCataStr&">"
		TempCataStr = TempCataStr&"→"&Trim(cRs("L_CName"))&"</option>"
		Response.Write TempCataStr
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
%>
              </select>
              <input type="submit" name="Submit" value=" 搜 索 " class="button2">
          </td>
          <td align=right>
            <div align="center">
              <input name=reloadPage type=button value=" 刷 新 " id="reloadPage" onClick="javascript:window.location.reload();" class="button2">
          </div></td>
        </form>
      </tr>
    </table>
    <br>
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#CCCCCC">
      <tr bgcolor="#799AE1">
        <td width="6%"><div align='center'><font color="#FFFFFF">选定</font></div></td>
        <td width="5%" height="20" bgcolor="#799AE1"><div align="center"><font color="#FFFFFF">序号</font></div></td>
        <td width="25%" height="20" bgcolor="#799AE1"><div align="center"><font color="#FFFFFF">标 题</font></div></td>
        <td width="34%" bgcolor="#799AE1">&nbsp;</td>
        <td width="18%" height="20"><div align="center"><font color="#FFFFFF">状态</font></div></td>
		<%If News_Check = 1 Then%>
        <td width="7%"><div align="center"><font color="#FFFFFF">状态</font></div></td>
		<%End If%>
        <td width="5%"><div align="center"><font color="#FFFFFF">修改</font></div></td>
      </tr>
      <form name="delnews" action="LinkDelete.asp" method=post>
	  <input name="action" type="hidden" value="" id="action">
        <%
If s_cataid = "" Then
	If s_keyword <> "" Then
		sSql = "SELECT * FROM L_Link WHERE L_Name LIKE '%"&s_keyword&"%' ORDER BY L_Sort DESC"
    Else
		sSql = "SELECT * FROM L_Link ORDER BY L_Sort DESC"
	End If
Else
	If s_keyword <> "" Then
		sSql = "SELECT * FROM L_Link WHERE L_Class LIKE '"&s_cataid&"%' and L_Name LIKE '%"&s_keyword&"%' ORDER BY L_Sort DESC"
    Else
		sSql = "SELECT * FROM L_Link WHERE L_Class LIKE '"&s_cataid&"%' ORDER BY L_Sort DESC"
	End If
End if

oRs.Open sSql, oConn, 1, 1

Dim Rcount, Loopno, Mpage, i
Rcount = oRs.Recordcount

If Pmcount="" or isempty(Pmcount) or Pmcount<1 then
        Pmcount=20
End If
	oRs.Pagesize = pmcount   	'设置每页数
	Mpage = oRs.Pagecount    	'得到总页数
	Pageno = GetSafeInt(Clng(Request("Pageno")),1)
	
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage

If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何新闻！</td></tr>"
Else
	oRs.Absolutepage = Pageno	'将指针移至指定页的第一条记录
	Loopno = Pmcount
	i=1
	Do While Not oRs.Eof and Loopno > 0
%>
        <tr>
          <td width="6%"><div align="center"><input type="checkbox" name="NewsID" value="<%=Trim(oRs("LID"))%>"></div></td>
          <td width="5%" height="22"><div align="center"><%=( (Pageno-1) * oRs.PageSize) + i%> </div></td>
          <td height="22" style="word-break:break-all;">
            <%
			Response.Write "<a href='"& oRs("L_Url") &"' class='tt4' target='_blank'>"
			If Len(oRs("L_Name"))>30 Then
				Response.Write Left(oRs("L_Name"),30)&"....</a>"
            Else
				Response.Write oRs("L_Name")&"</a>"
            End if
			%>
          </a></td>
          <td style="word-break:break-all;"><a href="<%=oRs("L_Url")%>" target="_blank"><%=oRs("L_Url")%></a></td>
          <td width="18%" height="22"> <div align="center"><%if oRs("L_Hide")=1 then response.write "显示" else response.Write"隐藏" end if%></div></td>
          <td width="7%"><div align='center'><a href="LinkModify.asp?id=<%=oRs("LID")%>&action=modify" class="tt2">修改</a></div></td>
        </tr>
        <%
		oRs.Movenext						
		Loopno=Loopno-1
		i=i+1
		Loop		
		
		oRs.Close
		Set oRs=Nothing
End if
%>
      </form>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <form name="pageform" method="post" action="LinkList.asp">
        <tr>
          <td width="6%" height="25">
            <div align="center">
              <input type='checkbox' name='selectCheck' id=selectCheck2 onclick="SelectCheckBox()">
          </div></td>
          <td width="33%">全部选中
              <input name="delbtn" value="删除" type="button" class="button2" onclick="cdel();">
			  <%If News_Check = 1 Then%>
			  <input name="delbtn" value="审核" type="button" class="button2" onclick="ccheck();">
	          <input name="delbtn" value="撤销" type="button" class="button2" onclick="cuncheck();">
			  <%End If%>
		    </td>
          <td>
		  <div align="right">
			共<%=Cstr(rcount)%>条新闻&nbsp;当前为：<font color="#FF0000"><%=Cstr(Pageno)&"</font>/"&Cstr(Mpage)%>页
			<%If Cint(Pageno)>1 Then%>
				<font face="Webdings" color="#FF0000">7</font>&nbsp;<a href='LinkList.asp?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno-1%>' class="tt5">上一页</a>
			<%End If
			If Cint(Pageno) < Cint(Mpage) Then
			%>
				<font face="Webdings" color="#FF0000">8</font>&nbsp;<a href='LinkList.asp?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno+1%>' class="tt5">下一页</a>
			<%End If%>
			跳到第&nbsp;<input type=text size=3 name="pageno" value="<%=pageno%>" class="button1">&nbsp;页
          	<input type="hidden" name="cataid" value="<%=s_cataid%>">
          	<input type="hidden" name="keyword" value="<%=s_keyword%>">
			<input name="imageField" type="image" src="../Images/Go.gif" border="0" align="absmiddle">
          </div></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<%
End Sub
%>

