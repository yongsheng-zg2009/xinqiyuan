<!--made by xiasp & 三峡在线 http://www.sxzx.net/-->
<html>
<head>
<title>发送成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb-2312">
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<%
function send_Mail(SenderName,serveraddress,Charset,Subject,body,sender,AddRecipient,ContentType)
	set jmail=server.CreateObject("JMail.SMTPMail")		
	jmail.Priority=3						
	jmail.SenderName=SenderName
'	jmail.serveraddress=serveraddress
	jmail.Charset=Charset					
	jmail.subject=Subject			
	jmail.body=body
	jmail.sender=sender
	jmail.AddRecipient(AddRecipient)	
	jmail.ContentType=ContentType
	jmail.Execute							
	set jmail=nothing				
end function 

'用户提交的信息
success_url	= trim(request("backto"))			'发送成功后转到
mailFrom 		= trim(request("from"))			'发件人
mailTo 			= trim(request("to"))				'收件人
mailSubject 	= trim(request("subject"))			'主题
mailBody 		= trim(request("body")	)			'信体

call send_mail(mailFrom,"cohell.net:25","GB-2312",mailSubject,mailBody,mailTo,mailTo,"text/html")

%>
<div align="center"> 
  <p>&nbsp;</p><p>信息提交成功！</p>
  <p>
    <input type="button" value=" 关闭窗口 " onclick="window.close();" class=button2>
  </p>
</div>
</body>
</html>
