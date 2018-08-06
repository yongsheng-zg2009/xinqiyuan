<!--#include file="../Admin/Include/DBClass.inc.asp" -->
<!--#include file="../Admin/News/Sub.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<LINK href="/css/common.css" type=text/css rel=STYLESHEET>
</HEAD>
<BODY leftMargin=0 topMargin=0>
<TITLE>留言本--<%=homepage_title%></TITLE>
<DIV align=center>
  <!--#include file="../head.asp" -->
  <TABLE cellSpacing=0 cellPadding=0 width=1004 bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=203 background=/img/profile_13.gif>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD><IMG height=47 alt="" 
                  src="/img/profile_product_02.gif" 
              width=203></TD></TR>
              <TR>
                <TD vAlign=top align=left height=105>
                  <TABLE cellSpacing=0 cellPadding=0 width="94%" border=0>
                    <TBODY>
                    <TR>
                      <TD width=17 height=5></TD>
                      <TD width="174"></TD>
                    </TR>
                    <TR>
                      <TD>&nbsp;</TD>
                      <TD vAlign=top align=left><% call GetCataList("A0087")%>
                          </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD><IMG height=12 alt="" src="/img/profile_06.gif" 
            width=203></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR vAlign=top>
                      <TD vAlign=top><IMG height=132 alt="" 
                        src="/img/profile_07.gif" width=203 
                        useMap=#ny border=0>
                        <MAP name=ny>
                        <AREA shape=RECT 
                          target="" coords=61,15,163,44><AREA 
                          shape=RECT coords=61,49,164,79 href="/NewsDir.asp?cataid=A0089" target="">
                        <AREA 
                          shape=RECT target="" coords=61,90,165,117 
                          href="/message/">
                      </MAP></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD><IMG height=12 alt="" src="/img/profile_06.gif" 
            width=203></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top height=110>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR vAlign=top>
                      <TD vAlign=top><IMG height=110 alt="" 
                        src="/img/profile_09.gif" width=203 
                        useMap=#button border=0>
                        <MAP name=button>
                          <AREA 
                          shape=RECT target="" coords=13,9,171,54 
                          href="/honor.asp?cataid=A0090">
                        <AREA 
                          shape=RECT target="" coords=13,57,171,103 
                          href="#">
                      </MAP></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD><IMG height=12 alt="" src="/img/profile_06.gif" 
            width=203></TD></TR>
        <TR>
          <TD vAlign=top>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR vAlign=top>
                <TD vAlign=top>
                  <TABLE cellSpacing=0 cellPadding=0 width="90%" border=0>
                    <TBODY>
                    <TR>
                      <TD width=17 height=8></TD>
                      <TD></TD></TR>
                    <TR>
                      <TD></TD>
                      <TD>
                        <P><STRONG>联系方式：</STRONG></P></TD></TR>
                    <TR>
                      <TD height=9></TD>
                      <TD></TD></TR>
                    <TR>
                      <TD></TD>
                      <TD class=add><p>地址:<%=address%><BR>
                         手机:<%=mobile%><br>
                            TEL:<%=tel%>
                        <br>E-mail:<%=your_email%><BR>
                        <BR>
                          </p></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=top><IMG height=12 alt="" 
            src="/img/profile_06.gif" 
      width=203></TD></TR></TBODY></TABLE><div align="left"><IMG alt="" 
            src="/img/left.jpg" 
      ></div></TD>
    <TD vAlign=top background=/img/linebbb.gif>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD><IMG height=116 alt="" 
            src="/img/message.jpg" width=801></TD>
        </TR>
        <TR>
          <TD vAlign=top align=left background=/img/profile_05.gif 
          height=579><table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td><iframe width=720 height=750 name=msg frameborder=0 scrolling=auto src="index.asp"></iframe></td>
            </tr>
          </table></TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<!--#include file="../foot.asp" -->
</DIV></BODY></HTML>
