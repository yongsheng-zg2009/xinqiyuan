<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<%
Call Header("������Ϣ")
Call Content()
Call Footer()

Sub GetNewsCata()
	Dim cRs, cSql, i, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsCata ORDER BY C_RootID"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF
		if Session("Sys_Level")>=3 then
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
		if cRs("C_RootID")=session("sCataId") or cRs("C_RootID")=request("cataid") then TempCataStr = TempCataStr&"selected "
		TempCataStr = TempCataStr&">&nbsp;|"
		For i=1 To Int(Len(Trim(cRs("C_RootID")))/4)
			TempCataStr = TempCataStr&"&nbsp;|"
		Next
		TempCataStr = TempCataStr&"_"&Trim(cRs("C_Title"))&"&nbsp;("&Trim(cRs("C_RootID"))&")"&"</option>"
		
		Response.Write TempCataStr
		else
		if instr(Session("A_Columns"),trim(cRs("C_RootID"))) then 
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
		if cRs("C_RootID")=session("sCataId") or cRs("C_RootID")=request("cataid") then TempCataStr = TempCataStr&"selected "
		TempCataStr = TempCataStr&">&nbsp;|"
		For i=1 To Int(Len(Trim(cRs("C_RootID")))/4)
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
End Sub

' ��ʼд������
Sub Content()
%>
<!--#include virtual ="admin/Include/Top.asp" -->
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

<form action="NewsAddSave.asp" method="post" name="myform" onSubmit="return doSubmit();">
  <% 'ȡ����ķ������������Ҫ��·������������򣬿���������ı������onchange�¼� %>
  <input type=hidden name=d_savefilename>
  <% 'ȡ������ļ�������·������ʹ�ô�·������������� %>
<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)">

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">������Ϣ</font></b><font color="#FF0000"> (������Ϣ�������Ϣ���ݱ�����д���������Բ��)</font></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">��Ϣ���</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; ��ѡ�� &lt;--</option>
            <%Call GetNewsCata()%>
          </select>
        </td>
      </tr>
      <tr>
        <td>��Ϣ���⣺</td>
        <td>
		<input name="d_title" type="text" class="button1" size="50" maxlength="250">
		<select name='TitleColor' id='select'>
		<option value=''>������ɫ</option>
		<option  value='#ff0000' style="background-color:#ff0000;color: #ffffff">#ff0000</option>
		<option  value='#000000' style="background-color:#000000;color: #ffffff">#000000</option>
		<option  value='#FFFFFF' style="background-color:#ffffff;color: #000000">#FFFFFF</option>
		<option  value='#000099' style="background-color:#000099;color: #ffffff">#000099</option>
		<option  value='#660066' style="background-color:#660066;color: #ffffff">#660066</option>
		<option  value='#FF6600' style="background-color:#FF6600;color: #ffffff">#FF6600</option>
		<option  value='#666666' style="background-color:#666666;color: #ffffff">#666666</option>
		<option  value='#009900' style="background-color:#009900;color: #ffffff">#009900</option>
		<option  value='#0066CC' style="background-color:#0066CC;color: #ffffff">#0066CC</option>
		<option  value='#990000' style="background-color:#990000;color: #ffffff">#990000</option>
		<option  value='#CC9900' style="background-color:#CC9900;color: #ffffff">#CC9900</option>
		<option  value='#CCCCCC' style="background-color:#CCCCCC;color: #000000">#CCCCCC</option>
		<option  value='#99FF00' style="background-color:#99FF00;color: #000000">#99FF00</option>
		<option  value='#0000FF' style="background-color:#0000FF;color: #FFFFFF">#0000FF</option>
		<option  value='#9966CC' style="background-color:#9966CC;color: #FFFFFF">#9966CC</option>
		</select>
		<select name='d_icon' id='select'>
		<option value='' selected>��׺ͼ��(��)</option>
		<option  value='/Admin/News/images/new.gif'>NEW��</option>
		<option  value='/Admin/News/images/hot.gif'>HOT��</option>
		<option  value='/Admin/News/images/imp.gif'>��Ҫ��</option>
		</select>
		</td>
      </tr>
      <tr style="display:none">
        <td>��ϢժҪ��</td>
        <td><textarea name="etitle" cols="67" rows="4" class="button1" id="etitle"></textarea></td>
      </tr>
      <tr>
        <td valign="top">ͼƬ������</td>
        <td><select name="d_picture" size="1"  style="background-color:#ECF3FF;"><option value=''>��</option></select> 
          <font color="#FF0000">���Զ�����������Ҫ��ʾͼƬ�������ϴ������ѡ��</font></td>
      </tr>
      <tr>
        <td valign="top">��Ϣ���ݣ�</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
          <textarea name="d_content" style="display:none"></textarea>
          <iframe ID="eWebEditor1" src="../WebEditor/ewebeditor.asp?id=d_content&style=s_newssystem&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="700" HEIGHT="450"></iframe>        </td>
      </tr>
      <tr>
        <td>����ʱ�䣺</td>
        <td><input name="D_AddTime" type="text" id="D_AddTime" class="button1 Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:false})" value='<%=FormatDateTime(now())%>' size="22"></td>
      </tr>

      <tr>
        <td>��Ϣ��Դ��</td>
        <td><input type="text" name="d_from" class="button1"></td>
      </tr>
      <tr>
        <td>��Ϣ���ߣ�</td>
        <td><input name="d_author" type="text" class="button1" id="d_author"></td>
      </tr>
      <tr>
        <td>�ر���Ϣ��</td>
        <td><label for="tbchk"><input type="checkbox" name="d_special" value="1" id="tbchk"></label></td>
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

