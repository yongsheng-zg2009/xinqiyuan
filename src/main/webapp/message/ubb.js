var Bold  = 0;
var Italic = 0;
var Underline = 0;
var Center = 0;
var Swf = 0;
var text_enter_url      = "������������ַ";
var text_enter_txt      = "����������˵��";
var text_enter_image    = "������ͼƬ��ַ";
var text_enter_swf      = "������FLASH������ַ";
var text_enter_email    = "�������ʼ���ַ";
var error_no_url        = "������������ַ";
var error_no_txt        = "��������������˵��";
var error_no_email      = "�����������ʼ���ַ";
var error_no_gset       = "������ȷ���ո�ʽ���룡";
var error_no_gtxt       = "�����������֣�";
var text_enter_guang1   = "���ֵĳ��ȡ���ɫ�ͱ߽��С";
var text_enter_guang2   = "���������֣�";

function commentWrite(NewCode) {
document.lw_form.usercontent.value+=NewCode;
document.lw_form.usercontent.focus();
return;
}
function storeCaret(text) {
if (text.createTextRange) {
text.caretPos = document.selection.createRange().duplicate();
}
if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('�������ڷ����������ĵȴ���');return false;}this.document.form.submit();}
}
function AddText(text) {
if (document.lw_form.usercontent.createTextRange && document.lw_form.usercontent.caretPos) {
var caretPos = document.lw_form.usercontent.caretPos;
caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?
text + ' ' : text;
}
else document.lw_form.usercontent.value += text;
document.lw_form.usercontent.focus(caretPos);
}
function inputs(str)
{
AddText(str);
}
function Curl() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_url, "http://");
var enterTxT   = prompt(text_enter_txt, enterURL);
if (!enterURL)    {
FoundErrors += "\n" + error_no_url;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_txt;
}
if (FoundErrors)  {
alert("����"+FoundErrors);
return;
}
var ToAdd = "[URL="+enterURL+"]"+enterTxT+"[/URL]";
document.lw_form.usercontent.value+=ToAdd;
document.lw_form.usercontent.focus();
}
function Cimage() {
var FoundErrors = '';
var enterURL   = prompt(text_enter_image, "http://");
if (!enterURL) {
FoundErrors += "\n" + error_no_url;
}
if (FoundErrors) {
alert("����"+FoundErrors);
return;
}
var ToAdd = "[IMG]"+enterURL+"[/IMG]";
document.lw_form.usercontent.value+=ToAdd;
document.lw_form.usercontent.focus();
}
function Cemail() {
var emailAddress = prompt(text_enter_email,"");
if (!emailAddress) { alert(error_no_email); return; }
var ToAdd = "[EMAIL]"+emailAddress+"[/EMAIL]";
commentWrite(ToAdd);
}
function Cswf() {
if (helpstat){
alert("Flash\nFlash ����.\n�÷�: [FLASH=���, �߶�]Flash �ļ��ĵ�ַ[/FLASH]");
} else if (basic) {
AddTxt="[FLASH=400,300][/FLASH]";
AddText(AddTxt);
} else {
txt2=prompt("Flash �����Ŀ�ȡ��߶ȣ������ó���999��","400,300");
if (txt2!=null) {
txt=prompt("Flash �����ļ��ĵ�ַ","http://");
if (txt!=null) {
if (txt2=="") {
AddTxt="[FLASH=400,300]"+txt;
AddText(AddTxt);
AddTxt="[/FLASH]";
AddText(AddTxt);
} else {
AddTxt="[FLASH="+txt2+"]"+txt;
AddText(AddTxt);
AddTxt="[/FLASH]";
AddText(AddTxt);
}
}
}
}
}
function Cbold() {
fontbegin="[B]";
fontend="[/B]";
fontchuli();
}
function Citalic() {
fontbegin="[I]";
fontend="[/I]";
fontchuli();
}
function Cunder() {
fontbegin="[U]";
fontend="[/U]";
fontchuli();
}
function Ccenter() {
fontbegin="[center]";
fontend="[/center]";
fontchuli();
}

helpstat = false;
stprompt = true;
basic = false;
function thelp(swtch){
if (swtch == 1){
basic = false;
stprompt = false;
helpstat = true;
} else if (swtch == 0) {
helpstat = false;
stprompt = false;
basic = true;
} else if (swtch == 2) {
helpstat = false;
basic = false;
stprompt = true;
}
}

function paste(text) {
if (opener.document.lw_form.usercontent.createTextRange && opener.document.lw_form.usercontent.caretPos) {
var caretPos = opener.document.lw_form.usercontent.caretPos;
caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?
text + ' ' : text;
}
else opener.document.lw_form.usercontent.value += text;
opener.document.lw_form.usercontent.focus(caretPos);
}

function showsize(size){
fontbegin="[size="+size+"]";
fontend="[/size]";
fontchuli();
}

function showfont(font){
fontbegin="[face="+font+"]";
fontend="[/face]";
fontchuli();
}

function showcolor(color){
fontbegin="[color="+color+"]";
fontend="[/color]";
fontchuli();
}

function fontchuli(){
if ((document.selection)&&(document.selection.type == "Text")) {
var range = document.selection.createRange();
var ch_text=range.text;
range.text = fontbegin + ch_text + fontend;
}
else {
document.lw_form.usercontent.value=fontbegin+document.lw_form.usercontent.value+fontend;
document.lw_form.usercontent.focus();
}
}

function Cguang() {
var FoundErrors = '';
var enterSET   = prompt(text_enter_guang1, "255,red,2");
var enterTxT   = prompt(text_enter_guang2, "���ڴ˴���������");
if (!enterSET)    {
FoundErrors += "\n" + error_no_gset;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_gtxt;
}
if (FoundErrors)  {
alert("����"+FoundErrors);
return;
}
var ToAdd = "[GLOW="+enterSET+"]"+enterTxT+"[/GLOW]";
document.lw_form.usercontent.value+=ToAdd;
document.lw_form.usercontent.focus();
}

function Cying() {
var FoundErrors = '';
var enterSET   = prompt(text_enter_guang1, "255,blue,1");
var enterTxT   = prompt(text_enter_guang2, "���ڴ˴���������");
if (!enterSET)    {
FoundErrors += "\n" + error_no_gset;
}
if (!enterTxT)    {
FoundErrors += "\n" + error_no_gtxt;
}
if (FoundErrors)  {
alert("����"+FoundErrors);
return;
}
var ToAdd = "[SHADOW="+enterSET+"]"+enterTxT+"[/SHADOW]";
document.lw_form.usercontent.value+=ToAdd;
document.lw_form.usercontent.focus();
}

ie = (document.all)? true:false
if (ie){
function ctlent(eventobject){if(event.ctrlKey && window.event.keyCode==13){this.document.lw_form.submit();}}
}

function storeCaret(cursorPosition) {
	if (cursorPosition.createTextRange) cursorPosition.caretPos = document.selection.createRange().duplicate();
}

function insertemot(emotCode) {
	var txtarea = document.lw_form.usercontent;
	emotCode = ' ' + emotCode + ' ';
	if (txtarea.createTextRange && txtarea.caretPos) {
	var caretPos = txtarea.caretPos;
	caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? emotCode + ' ' : emotCode;
	txtarea.focus();
	} else {
	txtarea.value  += emotCode;
	txtarea.focus();
	}
}

function openpreview()
{
document.preview.usercontent.value=document.lw_form.usercontent.value;
document.preview.usertitle.value=document.lw_form.usertitle.value;
document.preview.UBB_super.value=document.lw_form.UBB_super.value;
var popupWin = window.open('preview.asp', 'preview_page', 'scrollbars=yes,width=600,height=450');
document.preview.submit()
}