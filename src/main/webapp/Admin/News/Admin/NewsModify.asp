<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<script language="JavaScript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<%
Call Header("增加信息")
Call Content()
Call Footer()

' 开始写入内容
Sub Content()
	Dim comurl
	comurl=Request.ServerVariables("HTTP_REFERER")
	' 传入参数：信息ID
	Dim sNewsID
	sNewsID = GetSafeInt(Trim(Request("id")),0)
	If sNewsID < 1 Then
		GoError "请通过页面上的链接进行操作，不要试图进行任何非法操作。"
	End If

	' 从数据库中取初始值
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
		GoError "无效的信息ID，请点页面上的链接进行操作！"
	End If
	oRs.Close

	' 把带"|"的字符串转为数组，用于初始下拉框表单
	Dim aSavePathFileName
	aSavePathFileName = Split(sSavePathFileName, "|")

	' 根据信息内容中相关上传文件为数据，初始下拉框表单
	' 函数InitSelect，根据数组值及初始值返回下拉框输出字串，具体请见startup.asp文件中函数的说明部分
	Dim sOptionSavePath
	sOptionSavePath = InitSelect("d_picture", aSavePathFileName, aSavePathFileName, sPicture, "", "无")

%>
<!--#include virtual ="/admin/Include/Top.asp" -->
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

<form action="NewsModifySave.asp?id=<%=sNewsID%>" method="post" name="myform" onSubmit="return doSubmit();">
 <input  type=hidden name=comurl value="<%=comurl%>">
  <% '取保存的方件名（带路径），如果不要带路径的填充下拉框，可以在下面的表单项加入onchange事件 %>
  <input type=hidden name=d_savefilename value="<%=sSaveFileName%>">
  <% '取保存的文件名，使用带路径的填充下拉框 %>
<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)" value="<%=sSavePathFileName%>">

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">修改信息</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">信息类别：</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; 请选择 &lt;--</option>
            <%
	'开始读取数据库中已经定义的信息类别
	'其实这么写，感觉太没有效率了，应该定义一个子程序
	
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
        <td>信息标题：</td>
        <td><input type="text" name="d_title" value="<%=inHTML(sTitle)%>" size="50" class="button1">
          <select name='TitleColor' id='select'>
            <option value=''>字体颜色</option>
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
			<option value=''>后缀图标(无)</option>
			<option  value='/Admin/News/images/new.gif' <% if sIcon="/Admin/News/images/new.gif" then response.Write "selected"%>>NEW！</option>
			<option  value='/Admin/News/images/hot.gif' <% if sIcon="/Admin/News/images/hot.gif" then response.Write "selected"%>>HOT！</option>
			<option  value='/Admin/News/images/imp.gif' <% if sIcon="/Admin/News/images/imp.gif" then response.Write "selected"%>>重要！</option>
		</select>
					</td>
      </tr>
      <tr style="display:none">
        <td>信息摘要：</td>
        <td><textarea name="etitle" cols="67" rows="4" class="button1" id="etitle"><%=eTitle%></textarea></td>
      </tr>
      <tr>
        <td valign="top">图片附件：</td>
        <td><%=sOptionSavePath%> <font color="#FF0000">将自动填充此下拉框，要显示图片，请在上传后必须选择。</font></td>
      </tr>
      <tr>
        <td valign="top">信息内容：</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
          <textarea name="d_content" style="display:none"><%=Server.HtmlEncode(sContent)%></textarea>
          <iframe ID="eWebEditor1" src="../WebEditor/ewebeditor.asp?id=d_content&style=s_newssystem&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="700" HEIGHT="450"></iframe>        </td>
      </tr>
      <tr>
        <td>发布时间：</td>
        <td><input name="D_AddTime" type="text" id="D_AddTime" class="button1 Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:false})" value='<%=sAddtime%>'></td>
      </tr>
      <tr>
        <td>信息来源：</td>
        <td><input name="d_from" type="text" class="button1" value="<%=inHTML(sFrom)%>"></td>
      </tr>
      <tr>
        <td>信息作者：</td>
        <td><input name="d_author" type="text" class="button1" id="d_author" value="<%=sAuthor%>"></td>
      </tr>
      <tr>
        <td>特别信息：</td>
        <td><input type="checkbox" name="d_special" value="1" <%If sSpecial =1 Then Response.Write("checked")%>></td>
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

