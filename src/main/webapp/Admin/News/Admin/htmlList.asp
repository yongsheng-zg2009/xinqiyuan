<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->


<%
Response.Expires = 0 
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
%> 

<%
Call Header("�����б�")
Call Content()
Call Footer()
On Error Resume Next
' ��ʼд������
Sub Content()

Dim s_keyword, s_cataid
s_keyword = GetSafeStr(Trim(Request("keyword")))
s_cataid = GetSafeStr(Trim(Request("cataid")))

Dim Pmcount,Pageno
'//����������ʾ����
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
		alert("��ѡ��һ��Ҫ��������Ϣ��");
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
	
	if (confirm("��ȷ��Ҫɾ����Щ�����𣿲��ɻָ���")){
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
	
	if (confirm("��ȷ��Ҫ�����Щ��Ϣ��")){
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
	
	if (confirm("��ȷ��Ҫ������Щ��Ϣ������߽���������Щ��Ϣ��")){
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
    <td height="25"><b><%=Homepage_title%> - <font color="#FF0000">�����б�</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#799AE1">
      <tr>
        <form action="HtmlList.asp" method="post" name="toGetNewsList" id="Form1">
          <td  height="30" align=left> &nbsp;&nbsp;&nbsp;&nbsp;������
              <input name="keyword" type=text value="<%=s_keyword%>" class="button1">
              <select name="cataid" size="1" style="height:18" onChange="javascript:document.toGetNewsList.submit();" id="Select1">
                <option value="">--&gt;&gt;�������&lt;&lt;--</option>
<%
	'��ʼ��ȡ���ݿ����Ѿ�������������
	'��ʵ��ôд���о�̫û��Ч���ˣ�Ӧ�ö���һ���ӳ���
	
	Dim cRs, cSql, j, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsCata ORDER BY C_RootID"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF	
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If Trim(cRs("C_RootID")) = s_cataid Then TempCataStr = TempCataStr&" selected"
		TempCataStr = TempCataStr&">"
		TempCataStr = TempCataStr&"&nbsp;|"
		
		For j =1 To Int(Len(Trim(cRs("C_RootID")))/4)
			TempCataStr = TempCataStr&"&nbsp;|"
		Next

		TempCataStr = TempCataStr&"_"&Trim(cRs("C_Title"))&"</option>"
		Response.Write TempCataStr
			
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
%>
              </select>
              <input type="submit" name="Submit" value=" �� �� " class="button2">
          </td>
          <td align=right>
            <div align="center">
              <input name=reloadPage type=button value=" ˢ �� " id="reloadPage" onClick="javascript:window.location.reload();" class="button2">
          </div></td>
        </form>
      </tr>
    </table>

<%
If s_cataid = "" Then
	If s_keyword <> "" Then
		sSql = "SELECT * FROM NewsData WHERE D_Title LIKE '%"&s_keyword&"%' ORDER BY D_SortID DESC"
    Else
		sSql = "SELECT * FROM NewsData ORDER BY D_SortID DESC"
	End If
Else
	If s_keyword <> "" Then
		sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Title LIKE '%"&s_keyword&"%' ORDER BY D_SortID DESC"
    Else
		sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' ORDER BY D_SortID DESC"
	End If
End if
dim scataid,sNewsid,cata,html,others,sfrom,sTitle,sContent,filename
oRs.Open sSql, oConn, 1, 1
Do While Not oRs.Eof
scataid=oRs("D_CataId")
sNewsid=oRs("D_ID")
sfrom=oRs("D_From")
sTitle=oRs("D_Title")
sContent=oRs("D_content")
if oRs("D_filename")="" then
filename=makename(now)
else
filename=oRs("D_filename")
end if
cata=Getcata(scataid)
Html=ReadTextFile
others=other(sCataid,sNewsid)
Html=Replace(Html,"$cata$",cata)
Html=Replace(Html,"$from$",sfrom)
Html=Replace(Html,"$addtime$",now)
Html=Replace(Html, "$title$",sTitle)
Html=Replace(Html,"$other$",others)
Html=Replace(Html, "$content$",sContent)
call WriteTextFile(filename,Html)
oRs.Movenext						
Loop		
oRs.Close
Set oRs=Nothing
%>
<%
End Sub
%>

