<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<%
Call Header("������Ϣ")
Call Content()
Call Footer()

' ��ʼд������
Sub Content()
	Dim comurl
	comurl=Request.ServerVariables("HTTP_REFERER")
	' �����������ϢID
	Dim sNewsID
	sNewsID = GetSafeInt(Trim(Request("id")),0)
	If sNewsID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If

	' �����ݿ���ȡ��ʼֵ
	Dim sCataID, sTitle, sContent, sPicture, sSaveFileName, sSavePathFileName,sFrom, sSpecial,eTitle,sAuthor,sTitle_Color,sIcon,sAddtime
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sCataID = oRs("D_CataID")
		sTitle = oRs("D_Title")
		sIcon = oRs("D_Icon")
		sTitle_Color = oRs("D_Title_Color")
		sContent = oRs("D_Content")
		sPicture = oRs("D_Picture")
		sAuthor = oRs("D_Author")
		eTitle = oRs("E_Title")
		sSaveFileName = oRs("D_SaveFileName")
		sSavePathFileName = oRs("D_SavePathFileName")
		sAddtime = oRs("D_Addtime")
		sFrom = oRs("D_From")
		sSpecial = oRs("D_Special")
	Else
		GoError "��Ч����ϢID�����ҳ���ϵ����ӽ��в�����"
	End If
	oRs.Close

	' �Ѵ�"|"���ַ���תΪ���飬���ڳ�ʼ�������
	Dim aSavePathFileName
	aSavePathFileName = Split(sSavePathFileName, "|")

	' ������Ϣ����������ϴ��ļ�Ϊ���ݣ���ʼ�������
	' ����InitSelect����������ֵ����ʼֵ��������������ִ����������startup.asp�ļ��к�����˵������
	Dim sOptionSavePath
	sOptionSavePath = InitSelect("d_picture", aSavePathFileName, aSavePathFileName, sPicture, "", "��")

%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<br>
<Script Language=JavaScript>
	// ���ϴ�ͼƬ���ļ�ʱ����������������ͼƬ·�����ɸ���ʵ����Ҫ���Ĵ˺���
	function doChange(objText, objDrop){
		if (!objDrop) return;
		var str = objText.value;
		var arr = str.split("|");
		var nIndex = objDrop.selectedIndex;
		objDrop.length=1;
		for (var i=0; i<arr.length; i++){
			objDrop.options[objDrop.length] = new Option(arr[i], arr[i]);
		}
		objDrop.selectedIndex = nIndex;
	}

	// ���ύ�ͻ��˼��
	function doSubmit(){
		if (document.myform.d_cataid.value==""){
			alert("��ѡ��һ����Ϣ���");
			document.myform.d_cataid.focus();
			return false;
		}
		
		if (document.myform.d_cataid.value.length < 5){
			alert("��Ŀ¼����������Ϣ��");
			document.myform.d_cataid.focus();
			return false;
		}
		
		if (document.myform.d_title.value==""){
			alert("��Ϣ���ⲻ��Ϊ�գ�");
			document.myform.d_title.focus();
			return false;
		}
		// getHTML()ΪeWebEditor�Դ��Ľӿں���������Ϊȡ�༭��������
		if (eWebEditor1.getHTML()==""){
			alert("��Ϣ���ݲ���Ϊ�գ�");
			return false;
		}
		return true;
//		document.myform.submit();
	}
</Script>

<form action="NewsModifySave.asp?id=<%=sNewsID%>" method="post" name="myform" onSubmit="return doSubmit();">
 <input  type=hidden name=comurl value="<%=comurl%>">
  <% 'ȡ����ķ���������·�����������Ҫ��·������������򣬿���������ı������onchange�¼� %>
  <input type=hidden name=d_savefilename value="<%=sSaveFileName%>">
  <% 'ȡ������ļ�����ʹ�ô�·������������� %>
<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)" value="<%=sSavePathFileName%>">

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">�޸���Ϣ</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">��Ϣ���</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; ��ѡ�� &lt;--</option>
            <%
	'��ʼ��ȡ���ݿ����Ѿ��������Ϣ���
	'��ʵ��ôд���о�̫û��Ч���ˣ�Ӧ�ö���һ���ӳ���
	
	Dim cRs, cSql, j, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsCata  ORDER BY C_RootID"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF
	if Session("Sys_Level")>=3 then
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If cRs("C_RootID") = sCataID Then TempCataStr = TempCataStr&" selected"
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
		TempCataStr = TempCataStr&">&nbsp;|"
		
		For j = 1 To Int(Len(Trim(cRs("C_RootID")))/4)
			TempCataStr = TempCataStr&"&nbsp;|"
		Next

		TempCataStr = TempCataStr&"_"&Trim(cRs("C_Title"))&"</option>"
		Response.Write TempCataStr
		else
		if instr(Session("A_Columns"),trim(cRs("C_RootID"))) then 
				TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If cRs("C_RootID") = sCataID Then TempCataStr = TempCataStr&" selected"
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
		TempCataStr = TempCataStr&">&nbsp;|"
		
		For j = 1 To Int(Len(Trim(cRs("C_RootID")))/4)
			TempCataStr = TempCataStr&"&nbsp;|"
		Next

		TempCataStr = TempCataStr&"_"&Trim(cRs("C_Title"))&"</option>"
		Response.Write TempCataStr
		end if
		end if
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
%>
          </select>
</td>
      </tr>
      <tr>
        <td>��Ϣ���⣺</td>
        <td><input type="text" name="d_title" value="<%=inHTML(sTitle)%>" size="50" class="button1">
          <select name='TitleColor' id='select'>
            <option value=''>������ɫ</option>
            <option  value='#ff0000' <% if sTitle_Color="#ff0000" then response.Write "selected"%> style="background-color:#ff0000;color: #ffffff">#ff0000</option>
            <option  value='#000000' <% if sTitle_Color="#000000" then response.Write "selected"%> style="background-color:#000000;color: #ffffff">#000000</option>
            <option  value='#FFFFFF' <% if sTitle_Color="#FFFFFF" then response.Write "selected"%> style="background-color:#ffffff;color: #000000">#FFFFFF</option>
            <option  value='#000099' <% if sTitle_Color="#000099" then response.Write "selected"%> style="background-color:#000099;color: #ffffff">#000099</option>
            <option  value='#660066' <% if sTitle_Color="#660066" then response.Write "selected"%> style="background-color:#660066;color: #ffffff">#660066</option>
            <option  value='#FF6600' <% if sTitle_Color="#FF6600" then response.Write "selected"%> style="background-color:#FF6600;color: #ffffff">#FF6600</option>
            <option  value='#666666' <% if sTitle_Color="#666666" then response.Write "selected"%> style="background-color:#666666;color: #ffffff">#666666</option>
            <option  value='#009900' <% if sTitle_Color="#009900" then response.Write "selected"%> style="background-color:#009900;color: #ffffff">#009900</option>
            <option  value='#0066CC' <% if sTitle_Color="#0066CC" then response.Write "selected"%> style="background-color:#0066CC;color: #ffffff">#0066CC</option>
            <option  value='#990000' <% if sTitle_Color="#990000" then response.Write "selected"%> style="background-color:#990000;color: #ffffff">#990000</option>
            <option  value='#CC9900' <% if sTitle_Color="#CC9900" then response.Write "selected"%> style="background-color:#CC9900;color: #ffffff">#CC9900</option>
            <option  value='#CCCCCC' <% if sTitle_Color="#CCCCCC" then response.Write "selected"%> style="background-color:#CCCCCC;color: #000000">#CCCCCC</option>
            <option  value='#99FF00' <% if sTitle_Color="#99FF00" then response.Write "selected"%> style="background-color:#99FF00;color: #000000">#99FF00</option>
            <option  value='#0000FF' <% if sTitle_Color="#0000FF" then response.Write "selected"%> style="background-color:#0000FF;color: #FFFFFF">#0000FF</option>
            <option  value='#9966CC' <% if sTitle_Color="#9966CC" then response.Write "selected"%> style="background-color:#9966CC;color: #FFFFFF">#9966CC</option>
                    </select>
		<select name='d_icon' id='select'>
			<option value=''>��׺ͼ��(��)</option>
			<option  value='/Admin/News/images/new.gif' <% if sIcon="/Admin/News/images/new.gif" then response.Write "selected"%>>NEW��</option>
			<option  value='/Admin/News/images/hot.gif' <% if sIcon="/Admin/News/images/hot.gif" then response.Write "selected"%>>HOT��</option>
			<option  value='/Admin/News/images/imp.gif' <% if sIcon="/Admin/News/images/imp.gif" then response.Write "selected"%>>��Ҫ��</option>
		</select>
					</td>
      </tr>
      <tr style="display:none">
        <td>��ϢժҪ��</td>
        <td><textarea name="etitle" cols="67" rows="4" class="button1" id="etitle"><%=eTitle%></textarea></td>
      </tr>
      <tr>
        <td valign="top">ͼƬ������</td>
        <td><%=sOptionSavePath%> <font color="#FF0000">���Զ�����������Ҫ��ʾͼƬ�������ϴ������ѡ��</font></td>
      </tr>
      <tr>
        <td valign="top">��Ϣ���ݣ�</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
          <textarea name="d_content" style="display:none"><%=Server.HtmlEncode(sContent)%></textarea>
          <iframe ID="eWebEditor1" src="../WebEditor/ewebeditor.asp?id=d_content&style=s_newssystem&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="700" HEIGHT="450"></iframe>        </td>
      </tr>
      <tr>
        <td>����ʱ�䣺</td>
        <td><input name="D_AddTime" type="text" id="D_AddTime" class="button1 Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:false})" value='<%=sAddtime%>'></td>
      </tr>
      <tr>
        <td>��Ϣ��Դ��</td>
        <td><input name="d_from" type="text" class="button1" value="<%=inHTML(sFrom)%>"></td>
      </tr>
      <tr>
        <td>��Ϣ���ߣ�</td>
        <td><input name="d_author" type="text" class="button1" id="d_author" value="<%=sAuthor%>"></td>
      </tr>
      <tr>
        <td>�ر���Ϣ��</td>
        <td><input type="checkbox" name="d_special" value="1" <%If sSpecial =1 Then Response.Write("checked")%>></td>
      </tr>
      <tr style="display:None">
        <td>�Ķ�Ȩ�ޣ�</td>
        <td>
          <select name="d_permission" size="1" style="background-color:#ECF3FF;">
            <option value='0' selected>--���������˲鿴--</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <font color="#FF0000">ע�����</font></td>
        <td><font color="#FF0000">������Ϣ�������Ϣ���ݱ�����д���������Բ��</font></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <input type="submit" name="btnSubmit" value=" �� �� " class="button2">
		  &nbsp;&nbsp;<input type="reset" name="btnReset" value=" �� �� " class="button2">
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<%
End Sub
%>

