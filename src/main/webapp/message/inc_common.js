// SranM Guestbook Version 2.2
// Common JavaScript


// ��ȷ�ϵĳ�����
function go(URL,cfmText)
{
	var ret;
	ret = confirm(cfmText);
	if(ret!=false)window.location=URL;
}

// ���Զ��崰��
function openwin(URL, width, height)
	{
	var win = window.open(URL,"openscript",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=1,menubar=0,status=1');
	}

// �򿪲鿴�ظ��Ĵ���
function openreply()
	{
	document.viewreply.replycodes.value=document.replyform.replycode.value;
	var popupwin = window.open('viewreply.asp', 'viewreply_page', 'scrollbars=yes,width=700,height=450');
	document.viewreply.submit()
	}

// ��������
function Submitcheck()
	{
	if (document.lw_form.username.value.length==0){
	alert("���������ĳƺ�����Ϊ�����");
	document.lw_form.username.focus();
	return false;
		}
	if (document.lw_form.usercontent.value.length==0){
	alert("�������������ģ���Ϊ�����");
	document.lw_form.usercontent.focus();
	return false;
		}
	if (document.lw_form.SecurityCode.value.length==0){
	alert("��������֤�룬��Ϊ�����");
	document.lw_form.SecurityCode.focus();
	return false;
		}
	return true
	}

// ѡ��ȫ����ѡ��
function CheckAll(form)
	{
	for (var i=0;i<form.elements.length;i++){
	var e = form.elements[i];
	if (e.name != 'chkall')
		e.checked = form.chkall.checked;
		}
	}

// ҳ����ת
function MM_jumpMenu(targ,selObj,restore)
	{
	eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	if (restore) selObj.selectedIndex=0;
	}

// ȷ����������
function SetSubmitType(sub_type)
	{
	if (confirm("ȷ��Ҫִ������������")){
	SetSubmitType = sub_type;
		}
	}

// ѡ���������
function Submit_all(theForm)
	{
	var flag = false;
		if ( SetSubmitType == 'del'){
			flag = true;
			theForm.action = theForm.action + "del";
		}
		else if (SetSubmitType == 'check'){
			flag = true;
			theForm.action = theForm.action + "check";
		}
	return flag;
	}