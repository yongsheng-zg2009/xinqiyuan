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

Dim sCurrDir, sAction

Call Header("�ϴ��ļ�����")
Call Content()
Call Footer()


Sub Content()
%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<br>
<script language="JavaScript">
<!--
function CheckSelect()
{
	var count=0;
	for(i=0;i<document.myform.elements.length;i++)
	{
		if(document.myform.elements[i].name=="delfilename")
		{		
			if(document.myform.elements[i].checked==true)
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
	
	if (confirm("��ȷ��Ҫ�����Щ�ļ��𣿲��ɻָ���")){
		document.myform.submit();
	}
}

function cclean()
{
	if (confirm("�˰���������һЩϵͳ�е�����ͼƬ����ʱ�����ţ�")){
//		document.myform2.submit();
	}
}

function SelectCheckBox()
{
	for(i=0;i<document.myform.elements.length;i++)
	{
		if(document.all("selectCheck").checked == true)
		{
			document.myform.elements[i].checked = true;					
		}
		else
		{
			document.myform.elements[i].checked = false;
		}
	}
}
//-->
</script>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><% = Homepage_title%> - <font color="#FF0000">�ϴ��ļ�����</font></b></td>
  </tr>
  <form action="UploadFile.asp?action=del" method="post" name="myform">
  <tr>
    <td>
	<%
	If IsObjInstalled("Scripting.FileSystemObject") = False Then
		Response.Write "�˹���Ҫ�������֧���ļ�ϵͳ����FSO�������㵱ǰ�ķ�������֧�֣�"
		Exit Sub
	End If

	sAction = GetSafeStr(Trim(Request.QueryString("action")))
	sCurrDir = "../UploadFile/"
	
	If sAction ="del" Then
		' ɾ��ָ���ļ�
		Call DoDel()
	End If

	' ��ʾ�ļ��б�
	Call ShowList()
End Sub

' UploadFileĿ¼�µ������ļ��б�
Sub ShowList()
	
	If sCurrDir = "" Then Exit Sub
%>
	<table width='100%' border='1' cellspacing='0' cellpadding='0' bordercolordark='#FFFFFF' bordercolorlight='#CCCCCC'>
		<tr align=center  bgcolor='#799AE1'>
			<td width='7%'><font color='#FFFFFF'>ѡ��</font></td>
			<td width='8%' height="20"><font color='#FFFFFF'>����</font></td>
			<td width='27%'><font color='#FFFFFF'>�ļ���ַ</font></td>
			<td width='10%'><font color='#FFFFFF'>��С</font></td>
			<td width='24%'><font color='#FFFFFF'>������</font></td>
			<td width='24%'><font color='#FFFFFF'>�ϴ�����</font></td>
	</tr>
<%
	Dim sCurrPage, nCurrPage, nFileNum, nPageNum, nPageSize
	sCurrPage = Trim(Request("page"))
	nPageSize = 20
	If sCurrpage = "" Or Not IsNumeric(sCurrPage) Then
		nCurrPage = 1
	Else
		nCurrPage = CLng(sCurrPage)
	End If

	Dim oFSO, oUploadFolder, oUploadFiles, oUploadFile, sFileName

	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	On Error Resume Next
	Set oUploadFolder = oFSO.GetFolder(Server.MapPath(sCurrDir))
	If Err.Number>0 Then
		Response.Write "<tr><td colspan=6>��Ч��Ŀ¼��</td></tr>"
		Exit Sub
	End If
	
	Set oUploadFiles = oUploadFolder.Files

	nFileNum = oUploadFiles.Count
	nPageNum = Int(nFileNum / nPageSize)
	If nFileNum Mod nPageSize > 0 Then
		nPageNum = nPageNum+1
	End If
	If nCurrPage > nPageNum Then
		nCurrPage = 1
	end If

	Dim i
	i = 0
	For Each oUploadFile In oUploadFiles
		i = i + 1
		If i > (nCurrPage - 1) * nPageSize And i <= nCurrPage * nPageSize Then
			sFileName = oUploadFile.Name
%>
			<tr align=center>
				<td><input type="checkbox" name="delfilename" value="<%=sFileName%>"></td>
				<td><%=FileName2Pic(sFileName)%></td>
				<td align=left><a href="<%=sCurrDir & sFileName%>" target="_blank"><img src="<%=sCurrDir & sFileName%>" height="100" border="0"></a></td>
				<td><%=oUploadFile.size%> B</td>
				<td><%=oUploadFile.datelastaccessed%></td>
				<td><%=oUploadFile.datecreated%></td>
			</tr>
<%
		Elseif i > nCurrPage * nPageSize Then
			Exit For
		End If
	Next
	Set oUploadFolder = Nothing
	Set oUploadFiles = Nothing

	If nFileNum <= 0 Then
		Response.Write "<tr><td colspan=6>ָ��Ŀ¼�����ڻ�û���ļ���</td></tr>"
	End If
%>
	</table>
   </td>
  </tr>
  <tr>
    <td align="right">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" width="7%"><div align="center">
            <input type='checkbox' name='selectCheck' id=selectCheck2 onclick="SelectCheckBox()">
          </div></td>
		  <td><input type="button" name="b" value="ɾ���ļ�" class="button2" onclick="cdel();">&nbsp;<!-- <input type="button" name="b" value="��������" class="button2" onclick="cclean();"> --></td>
          <td align="right">
<%
	If nFileNum > 0 Then
		' ��ҳ
		Response.Write "<table border=0 cellpadding=3 cellspacing=0 width='100%'><tr><td align='right'>"
		If nCurrPage > 1 Then
			Response.Write "<a href='?page=1'>��ҳ</a>&nbsp;&nbsp;<a href='?page="& nCurrPage - 1 & "'>��һҳ</a>&nbsp;&nbsp;"
		Else
			Response.Write "��ҳ&nbsp;&nbsp;��һҳ&nbsp;&nbsp;"
		End If
		If nCurrPage < i / nPageSize Then
			Response.Write "<a href='?page=" & nCurrPage + 1 & "'>��һҳ</a>&nbsp;&nbsp;<a href='?page=" & nPageNum & "'>βҳ</a>"
		Else
			Response.Write "��һҳ&nbsp;&nbsp;βҳ"
		End If
		Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;��<b>" & nFileNum & "</b>��&nbsp;&nbsp;ҳ��:<b><span class=highlight2>" & nCurrPage & "</span>/" & nPageNum & "</b>&nbsp;&nbsp;<b>" & nPageSize & "</b>���ļ�/ҳ"
		Response.Write "</td></tr></table>"
	End If
%>		  </td>
        </tr>
      </table></td>
  </tr>
 </form>
</table>
<%
End Sub

' ɾ��ָ�����ļ�
Sub DoDel()
	On Error Resume Next
	Dim sFileName, oFSO, sMapFileName
	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	For Each sFileName In Request.Form("delfilename")
		sMapFileName = Server.MapPath(sCurrDir & sFileName)
		If oFSO.FileExists(sMapFileName) Then
			oFSO.DeleteFile(sMapFileName)
		End If
	Next
	Set oFSO = Nothing
End Sub

' ���������Ƿ�֧��ĳһ����
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function


' ���ļ���ȡͼ
Function FileName2Pic(sFileName)
	Dim sExt, sPicName
	sExt = UCase(Mid(sFileName, InstrRev(sFileName, ".")+1))
	Select Case sExt
	Case "TXT"
		sPicName = "txt.gif"
	Case "CHM", "HLP"
		sPicName = "hlp.gif"
	Case "DOC"
		sPicName = "doc.gif"
	Case "PDF"
		sPicName = "pdf.gif"
	Case "MDB"
		sPicName = "mdb.gif"
	Case "GIF"
		sPicName = "gif.gif"
	Case "JPG"
		sPicName = "jpg.gif"
	Case "BMP"
		sPicName = "bmp.gif"
	Case "PNG"
		sPicName = "pic.gif"
	Case "ASP", "JSP", "JS", "PHP", "PHP3", "ASPX"
		sPicName = "code.gif"
	Case "HTM", "HTML", "SHTML"
		sPicName = "htm.gif"
	Case "ZIP"
		sPicName = "zip.gif"
	Case "RAR"
		sPicName = "rar.gif"
	Case "EXE"
		sPicName = "exe.gif"
	Case "AVI"
		sPicName = "avi.gif"
	Case "MPG", "MPEG", "ASF"
		sPicName = "mp.gif"
	Case "RA", "RM"
		sPicName = "rm.gif"
	Case "MP3"
		sPicName = "mp3.gif"
	Case "MID", "MIDI"
		sPicName = "mid.gif"
	Case "WAV"
		sPicName = "audio.gif"
	Case "XLS"
		sPicName = "xls.gif"
	Case "PPT", "PPS"
		sPicName = "ppt.gif"
	Case "SWF"
		sPicName = "swf.gif"
	Case Else
		sPicName = "unknow.gif"
	End Select
	FileName2Pic = "<img border=0 src='../WebEditor/sysimage/file/" & sPicName & "'>"
End Function
%>

