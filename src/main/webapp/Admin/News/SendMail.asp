<!--made by xiasp & ��Ͽ���� http://www.sxzx.net/-->
<html>
<head>
<title>���ͳɹ�</title>
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

'�û��ύ����Ϣ
success_url	= trim(request("backto"))			'���ͳɹ���ת��
mailFrom 		= trim(request("from"))			'������
mailTo 			= trim(request("to"))				'�ռ���
mailSubject 	= trim(request("subject"))			'����
mailBody 		= trim(request("body")	)			'����

call send_mail(mailFrom,"cohell.net:25","GB-2312",mailSubject,mailBody,mailTo,mailTo,"text/html")

%>
<div align="center"> 
  <p>&nbsp;</p><p>��Ϣ�ύ�ɹ���</p>
  <p>
    <input type="button" value=" �رմ��� " onclick="window.close();" class=button2>
  </p>
</div>
</body>
</html>
