<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<%
Call Header("增加信息")
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

' 开始写入内容
Sub Content()
%>
<!--#include virtual ="admin/Include/Top.asp" -->
<br>
<Script Language=JavaScript>
	// 当上传图片等文件时，往下拉框中填入图片路径，可根据实际需要更改此函数
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

	// 表单提交客户端检测
	function doSubmit(){
		if (document.myform.d_cataid.value==""){
			alert("请选择一个信息类别！");
			document.myform.d_cataid.focus();
			return false;
		}
		
		if (document.myform.d_cataid.value.length < 5){
			alert("根目录不允许发布信息！");
			document.myform.d_cataid.focus();
			return false;
		}
		
		if (document.myform.d_title.value==""){
			alert("信息标题不能为空！");
			document.myform.d_title.focus();
			return false;
		}
		// getHTML()为eWebEditor自带的接口函数，功能为取编辑区的内容
		if (eWebEditor1.getHTML()==""){
			alert("信息内容不能为空！");
			return false;
		}
		return true;
//		document.myform.submit();
	}
</Script>

<form action="NewsAddSave.asp" method="post" name="myform" onSubmit="return doSubmit();">
  <% '取保存的方件名，如果不要带路径的填充下拉框，可以在下面的表单项加入onchange事件 %>
  <input type=hidden name=d_savefilename>
  <% '取保存的文件名（带路径），使用带路径的填充下拉框 %>
<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)">

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">发布信息</font></b><font color="#FF0000"> (以下信息标题和信息内容必须填写，其他可以不填。)</font></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">信息类别：</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; 请选择 &lt;--</option>
            <%Call GetNewsCata()%>
          </select>
        </td>
      </tr>
      <tr>
        <td>信息标题：</td>
        <td>
		<input name="d_title" type="text" class="button1" size="50" maxlength="250">
		<select name='TitleColor' id='select'>
		<option value=''>字体颜色</option>
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
		<option value='' selected>后缀图标(无)</option>
		<option  value='/Admin/News/images/new.gif'>NEW！</option>
		<option  value='/Admin/News/images/hot.gif'>HOT！</option>
		<option  value='/Admin/News/images/imp.gif'>重要！</option>
		</select>
		</td>
      </tr>
      <tr style="display:none">
        <td>信息摘要：</td>
        <td><textarea name="etitle" cols="67" rows="4" class="button1" id="etitle"></textarea></td>
      </tr>
      <tr>
        <td valign="top">图片附件：</td>
        <td><select name="d_picture" size="1"  style="background-color:#ECF3FF;"><option value=''>无</option></select> 
          <font color="#FF0000">将自动填充此下拉框，要显示图片，请在上传后必须选择。</font></td>
      </tr>
      <tr>
        <td valign="top">信息内容：</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
          <textarea name="d_content" style="display:none"></textarea>
          <iframe ID="eWebEditor1" src="../WebEditor/ewebeditor.asp?id=d_content&style=s_newssystem&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="700" HEIGHT="450"></iframe>        </td>
      </tr>
      <tr>
        <td>发布时间：</td>
        <td><input name="D_AddTime" type="text" id="D_AddTime" class="button1 Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:false})" value='<%=FormatDateTime(now())%>' size="22"></td>
      </tr>

      <tr>
        <td>信息来源：</td>
        <td><input type="text" name="d_from" class="button1"></td>
      </tr>
      <tr>
        <td>信息作者：</td>
        <td><input name="d_author" type="text" class="button1" id="d_author"></td>
      </tr>
      <tr>
        <td>特别信息：</td>
        <td><label for="tbchk"><input type="checkbox" name="d_special" value="1" id="tbchk"></label></td>
      </tr>
      <tr style="display:None">
        <td>阅读权限：</td>
        <td>
          <select name="d_permission" size="1" style="background-color:#ECF3FF;">
            <option value='0' selected>--允许所有人查看--</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <font color="#FF0000">注意事项：</font></td>
        <td><font color="#FF0000">以上信息标题和信息内容必须填写，其他可以不填。</font></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <input type="submit" name="btnSubmit" value=" 提 交 " class="button2">
		  &nbsp;&nbsp;<input type="reset" name="btnReset" value=" 重 填 " class="button2">
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<%
End Sub
%>

