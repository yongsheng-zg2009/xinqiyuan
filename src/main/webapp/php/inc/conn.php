<?php
$db_server="localhost"; 
$db_user_name="pursuer"; 
$db_user_password="acpmpursuer"; 
$db_name="pursuer"; 
$conn=@mysql_connect($db_server,$db_user_name,$db_user_password) or die("�������ݿ�����뿴�û���������");
mysql_select_db($db_name,$conn);
mysql_query('set names"gbk"');

$nametitle="����������ͨ���繤���������ι�˾";
$url="http://www.wxtwl.net";
$mail="admin@wxtwl.net";
$tel="0711-3211376";
$keywords="test";
$description="test";
