<!--#include file = "Include/DBClass.inc.asp"-->
<!--#include file = "Include/SysLoginCheck.inc.asp" -->
<%
Dim action, voteincdir, fs, ts, H_Level 
action = GetSafeStr(Trim(Request("action")))
H_Level = Session("Sys_Level")
'��ӳ����û�
If action="ok" then
	If H_Level <> 3 Then
		Call AlertMsg("����Ȩ�޲������д˲�����")
	Else
		address= GetSafeStr(Trim(Trim(Request.form("address"))))
		Tel=GetSafeStr(Trim(Trim(Request.form("Tel"))))
		postcode=GetSafeStr(Trim(Trim(Request.form("postcode"))))
		Homepage_Title = GetSafeStr(Trim(Trim(Request.form("homepage_title"))))
		Homepage_Link = GetSafeStr(Trim(Trim(Request.form("homepage_link"))))
		Your_Email = GetSafeStr(Trim(Trim(Request.form("your_email"))))
		CreatTime = GetSafeStr(Trim(Trim(Request.form("creattime"))))
		Audio = GetSafeStr(Trim(Trim(Request.form("Audio"))))
		News_Back_Count = GetSafeInt(Trim(Request.form("news_back_count")),8)
		News_Front_Count = GetSafeInt(Trim(Request.form("news_front_count")),8)
		News_Check = GetSafeInt(Trim(Request.form("newscheck")),0)
		fax = GetSafeStr(Trim(Request.form("fax")))
		ad1 = GetSafeStr(Trim(Request.form("ad1")))
		ad2 = GetSafeStr(Trim(Request.form("ad2")))
		mobile = GetSafeStr(Trim(Request.form("mobile")))
		copyright = GetSafeStr(Trim(Request.form("copyright")))
		contact = GetSafeStr(Trim(Request.form("contact")))
		miibeian = GetSafeStr(Trim(Request.form("miibeian")))
		ad_case = GetSafeStr(Trim(Request.form("ad_case")))
		float_ad = GetSafeStr(Trim(Request.form("float_ad")))
		float_img = GetSafeStr(Trim(Request.form("float_img")))
		float_link_url = GetSafeStr(Trim(Request.form("float_link_url")))
		voteincdir = server.mappath("Include/SetUp.asp")
		Const ForReading =1, ForWriting = 2
		set fs = CreateObject("Scripting.FileSystemObject")
		set ts = fs.OpenTextFile(voteincdir,ForWriting, True)
		ts.Write ""
		ts.Write "<"
		ts.Write "%"& vbCrLf
		ts.Write "Dim Homepage_Title, Homepage_Link, Your_Email, CreatTime, Audio,News_Back_Count, News_Front_Count, News_Check,address,postcode,tel,fax,mobile,copyright,contact,miibeian,ad_case,ad1,ad2"& vbCrLf
		ts.Write "Dim float_img,float_link_url,float_ad"& vbCrLf
		ts.Write "Homepage_Title = "&""""&Homepage_Title&""""& vbCrLf 
		ts.Write "Homepage_Link = "&""""&Homepage_Link&""""& vbCrLf
		ts.Write "Your_Email = "&""""&Your_Email&""""& vbCrLf
		ts.Write "CreatTime = "&""""&CreatTime&""""& vbCrLf
		ts.Write "Audio = "&""""&Audio&""""& vbCrLf
		ts.Write "News_Back_Count = "&News_Back_Count& vbCrLf
		ts.Write "News_Front_Count = "&News_Front_Count& vbCrLf
		ts.Write "News_Check = "&News_Check& vbCrLf
		ts.Write "address = "&""""&address&""""& vbCrLf
		ts.Write "postcode = "&""""&postcode&""""& vbCrLf
		ts.Write "tel = "&""""&tel&""""& vbCrLf		
		ts.Write "fax = "&""""&fax&""""& vbCrLf	
		ts.Write "ad1 = "&""""&ad1&""""& vbCrLf	
		ts.Write "ad2 = "&""""&ad2&""""& vbCrLf	
		ts.Write "mobile = "&""""&mobile&""""& vbCrLf	
		ts.Write "contact = "&""""&contact&""""& vbCrLf	
		ts.Write "miibeian = "&""""&miibeian&""""& vbCrLf	
		ts.Write "ad_case = "&""""&ad_case&""""& vbCrLf	
		ts.Write "float_ad = "&""""&float_ad&""""& vbCrLf	
		ts.Write "float_img = "&""""&float_img&""""& vbCrLf	
		ts.Write "float_link_url = "&""""&float_link_url&""""& vbCrLf	
		ts.Write "%"
		ts.Write ">"
		ts.close
		Call AlertMsg("ϵͳ���óɹ���")
	End If
End if

Call Header("ϵͳ����")
Call Content()
Call Footer()

' ��ʼд������
Sub Content()
%>
<!--#include file="Include/Top.asp" -->
<br>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="25"><b><%=Homepage_Title%> - <font color="#FF0000">ϵͳ����</font></b></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="1" cellpadding="3"  align=center>
  <form name="form1" method="post" action="sysset.asp?action=ok">
    <tr bgcolor="#AABFEC"> 
      <td colspan=2><b>�� �������� </b>�� ϵͳ�е�һЩ������Ϣ ��</td>
    </tr>
    <tr> 
      <td width="180"  bgcolor="#F3F3F3" height="25"> 
        <div align="right">��ҳ���ƣ� </div>      </td>
      <td  bgcolor="#F3F3F3"> 
        <input type="text" name="homepage_title" class="button1" size="40" value="<%=Homepage_Title%>"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"> 
        <div align="right">��ҳ��ַ�� </div>      </td>
      <td align=left bgcolor="#F3F3F3"> 
        <input type="text" name="homepage_link" class="button1" size="40" value="<%=Homepage_Link%>"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"> 
        <div align="right">ϵͳ�ʼ���ַ�� </div>      </td>
      <td width="783" align=left bgcolor="#F3F3F3"> 
      <input type="text" name="your_email" class="button1" size="40" value="<%=Your_Email%>"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right">��վ����ʱ�䣺 </div></td>
      <td align=left bgcolor="#F3F3F3"><input type="text" name="creattime" class="button1" size="40" value="<%=CreatTime%>"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><span class="td">��˾��ַ</span>�� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="address" type="text" class="button1" id="address" value="<%=address%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><span class="td">��˾�ʱ�</span>�� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="postcode" type="text" class="button1" id="postcode" value="<%=postcode%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><span class="td">��˾�绰</span>�� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="tel" type="text" class="button1" id="tel" value="<%=tel%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><span class="td">FAX</span>�� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="fax" type="text" class="button1" id="fax" value="<%=fax%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right">�ֻ��� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="mobile" type="text" class="button1" id="mobile" value="<%=mobile%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right">��ϵ�ˣ� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="contact" type="text" class="button1" id="contact" value="<%=contact%>" size="40"></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right">��վ�����ţ� </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="miibeian" type="text" class="button1" id="miibeian" value="<%=miibeian%>" size="40"></td>
    </tr>
    <tr bgcolor="#AABFEC">
      <td height="23" align=left colspan="2"><b>�� ������� </b>������������� ��</td>
    </tr>
      <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><B>��Ƶ����ַ��</B> </div></td>
      <td align=left bgcolor="#F3F3F3"><input name="Audio" type="text" class="button1" id="Audio" value="<%=Audio%>" size="60"></td>
    </tr>  <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><strong><span class="td">�����������</span>�� </strong></div></td>
      <td align=left bgcolor="#F3F3F3">      <span class="td">
        <select name="ad_case" id="ad_case">
          <% if ad_case="1" then %>
          <option value="1" selected>��</option>
          <option value="0">�ر�</option>
          <% else %>
          <option value="1">��</option>
          <option value="0" selected>�ر�</option>
          <% end if %>
        </select> 
        (�ߴ�:��ȡ�110)</span></td>
    </tr>
    <tr>
      <td height="25" align=right bgcolor="#F3F3F3"><span class="td">�����<strong></strong></span>�� </td>
      <td align=left bgcolor="#F3F3F3"><input name="ad1" type="text" class="button1" id="qq3" value="<%=ad1%>" size="30">        </td>
    </tr>
    <tr>
      <td height="25" align=right bgcolor="#F3F3F3"><span class="td">�Ҷ���<strong></strong></span>�� </td>
      <td align=left bgcolor="#F3F3F3"><input name="ad2" type="text" class="button1" id="qq2" value="<%=ad2%>" size="30">      </td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3"><div align="right"><strong><span class="td">�����������</span>�� </strong></div></td>
      <td align=left bgcolor="#F3F3F3"> <span class="td">
        <select name="float_ad" id="float_ad">
          <% if float_ad="1" then %>
          <option value="1" selected>��</option>
          <option value="0">�ر�</option>
          <% else %>
          <option value="1">��</option>
          <option value="0" selected>�ر�</option>
          <% end if %>
        </select>
      </span></td>
    </tr>
    <tr>
      <td height="25" align=left bgcolor="#F3F3F3">&nbsp;</td>
      <td align=left bgcolor="#F3F3F3"><input name="float_img" type="text" class="button1" id="ad2" value="<%=float_img%>" size="30">
        �������ӣ�
        <input name="float_link_url" type="text" class="button1" id="float_img" value="<%=float_link_url%>" size="30"></td>
    </tr>
    <tr bgcolor="#AABFEC"> 
      <td height="23" align=left colspan="2"><b>�� 
        �������� </b>��������Ŀ�Ļ������� ��</td>
    </tr>
    <tr> 
      <td height="25" align=left bgcolor="#F3F3F3"> 
      <div align="right">��̨ÿҳ��ʾ������Ŀ��</div>      </td>
      <td align=left bgcolor="#F3F3F3"> 
        <input type="text" name="news_back_count" class="button1" size="10" value="<%=News_Back_Count%>">
        ��СΪ8��      </td>
    </tr>
    <tr> 
      <td height="25" align=left bgcolor="#F3F3F3"> 
        <div align="right">ǰ̨ÿҳ��ʾ������Ŀ��</div>      </td>
      <td align=left bgcolor="#F3F3F3"> 
        <input type="text" name="news_front_count" class="button1" size="10" value="<%=News_Front_Count%>">
      ��СΪ8��      </td>
    </tr>
    <tr> 
      <td height="25" align=left bgcolor="#F3F3F3"> 
        <div align="right">�Ƿ��������ģʽ��</div>      </td>
      <td align=left bgcolor="#F3F3F3"> 
        <input name="newscheck" type="radio" value="1" <%If News_Check = 1 Then Response.Write "checked"%>>
        ��
        <input name="newscheck" type="radio" value="0" <%If News_Check = 0 Then Response.Write "checked"%>>
      ��</td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td height="30" align=left>&nbsp;</td>
      <td height="30" align=left><input type="submit" name="Submit" value="  �� ��  " class="button2"></td>
    </tr>
  </form>
</table>
<%
End Sub
%>

