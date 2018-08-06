//DIV模拟下拉框
 function drop_mouseout(obj){
	 document.getElementById(obj).style.display="none";
}

function drop_mouseover(obj){
	 document.getElementById(obj).style.display="";
	}


function color_mouseout(str)
	 {str.className="down_Css";
	 }

function color_mouseover(str)
	 {str.className="move_Css";
	 }

function onclick_value(obj,k_value,key)
	 {document.getElementById(obj).style.display="none";
	  document.getElementById(k_value).value=key;
	 
	 }

// 修改编辑栏高度
function admin_Size(num,objname)
{
	var obj=document.getElementById(objname)
	if (parseInt(obj.rows)+num>=1) {
		obj.rows = parseInt(obj.rows) + num;	
	}
	if (num>0)
	{
		obj.width="90%";
	}
}

//表单选取
function CheckSel(Voption,Value)
{
	var obj = document.getElementById(Voption);
	for (i=0;i<obj.length;i++){
		if (obj.options[i].value==Value){
		obj.options[i].selected=true;
		break;
		}
	}
}

//单选表单选取
function chkradio(Obj,Val)
{
	if (Obj)
	{
	for (i=0;i<Obj.length;i++){
		if (Obj[i].value==Val){
		Obj[i].checked=true;
		break;
		}
	}
	}
}

//多选表单选取 Obj 表单名，VAL所选的值
function chkcheckbox(Obj,Val){
	if (Obj){
		Val = Val.replace(/\s*/g,"");
		Val = ","+Val+",";
		if (Obj.length==null){
			if(Val.indexOf(","+Obj.value+",")!=-1){
				Obj.checked=true;
			}
		}
		for (i=0;i<Obj.length;i++){
			if(Val.indexOf(","+Obj[i].value+",")!=-1){
				Obj[i].checked=true;
			}
		}
	}
}

function del_neirong(str)
{
	var sc=window.confirm(str);
	if (sc)
	{return true;}
	else
	{return false;}
	
	}
function left_menu(meval)
{
  var left_n=eval(meval);
  if (left_n.style.display=="none")
  { eval(meval+".style.display='';"); }
  else
  { eval(meval+".style.display='none';"); }
}


function SelectImage(url,width,height,lx){
	
	showModalDialog(url,window,"dialogWidth:"+width+"px;dialogHeight:"+height+"px;help:yes;scroll:"+lx+";status:no");
}



function TableMouseOver(Obj){
	Obj.style.backgroundColor="#ffffff";
}

function TableMouseOut(Obj){
	Obj.style.backgroundColor='';
}
function TableBgLock(Obj){
	if(!Obj.checked){
		Obj.style.backgroundColor='';
	}else{
		Obj.style.backgroundColor='#DFEEFF';
	}
}

function CheckOthers(form) {
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i];
		if (e.type=='checkbox')
			if (e.checked == true)
			{e.checked=false;}
		    else{e.checked=true;}
		TableBgLock(e);
	}
}

function CheckAll(form) {
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i];
		if (e.type=='checkbox')
			e.checked = true;
			TableBgLock(e);
	}
}


//图片传接
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

function trim(inputString) {
	   
              if (typeof inputString != "string") { return inputString; }
              var retValue = inputString;
              var ch = retValue.substring(0, 1);
              while (ch == " ") { 
	          //?ì2é×?·?′??aê?2?·?μ?????
                  retValue = retValue.substring(1, retValue.length);
                  ch = retValue.substring(0, 1);
              }
              ch = retValue.substring(retValue.length-1, retValue.length);
              while (ch == " ") {
                 //?ì2é×?·?′??áê?2?·?μ?????
                 retValue = retValue.substring(0, retValue.length-1);
                 ch = retValue.substring(retValue.length-1, retValue.length);
              }
              while (retValue.indexOf("  ") != -1) { 
	         //????×??D???à???àá?μ?????±??aò???????
                 retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); 
              }
              return retValue;
           } 
		  function textCounter(field, maxlimit) { 
	           if (field.value.length > maxlimit) 
		       field.value = field.value.substring(0, maxlimit); 
	           else 
		        form1.remLen.value = maxlimit - field.value.length;
              }

function checkIMG( oIMG ) {
	
	if (oIMG.height>parseInt(oIMG.size)){
	
 	   if( oIMG.height>oIMG.width){oIMG.height=parseInt(oIMG.size);}
	    else
	    {
		   oIMG.width=parseInt(oIMG.size);
	     }
	}
	else
		if (oIMG.width>parseInt(oIMG.size)){
	
 	   if( oIMG.height>oIMG.width){oIMG.height=parseInt(oIMG.size);}
	    else
	    {
		   oIMG.width=parseInt(oIMG.size);
	     }
	}
	
 }
 
 function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}


//颜色选取
function Getcolor(img_val,input_val){
	var obj = document.getElementById("colourPalette");
	ColorImg = img_val;
	ColorValue = document.getElementById(input_val);
	if (obj){
	obj.style.left = getOffsetLeft(ColorImg) + "px";
	obj.style.top = (getOffsetTop(ColorImg) + ColorImg.offsetHeight) + "px";
	if (obj.style.visibility=="hidden")
	{
	obj.style.visibility="visible";
	}else {
	obj.style.visibility="hidden";
	}
	}
}



function setAblum(ablum_value)
{
	if (blumValue){blumValue.value = ablum_value;}
	if (img_value){img_value.src = web_path2+ablum_value;}
	document.getElementById("div_ablum").style.display="none";
}


//div位置
function Getimg(img_val,div_id,iframe_path,iframe_id,div_width,div_height){
	var obj = document.getElementById(div_id);
	var iframe = document.getElementById(iframe_id);
	ColorImg = img_val;
	if (obj){
	obj.style.left = (getOffsetLeft(ColorImg) + div_width)+ "px";
	obj.style.top = (getOffsetTop(ColorImg) - div_height) + "px";
	if (obj.style.display=="none")
	{
	obj.style.display="";
	  if (iframe){iframe.src=iframe_path;}
	}else {
	obj.style.display="none";
	}
	}
}



function div_close(str)
   {str.style.display = "none"}
   
function getOffsetTop(elm) {
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent){
		mOffsetTop += mOffsetParent.offsetTop;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetTop;
}

function getOffsetLeft(elm) {
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent) {
		mOffsetLeft += mOffsetParent.offsetLeft;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetLeft;
}



function setColor(color)
{
	if (ColorValue){ColorValue.value = color;}
	if (ColorImg){ColorImg.style.backgroundColor = color;}
	document.getElementById("colourPalette").style.visibility="hidden";
}


function IntOnly()
{
if ( !(((window.event.keyCode >= 48) && (window.event.keyCode <= 57))|| (window.event.keyCode == 13)))

{
window.event.keyCode = 0 ;
}
}
function NumberOnly()
{
if ( !(((window.event.keyCode >= 48) && (window.event.keyCode <= 57))|| (window.event.keyCode == 13)|| (window.event.keyCode == 46)))

{
window.event.keyCode = 0 ;
}
}
function EnglishOnly()
{
if ( !((((window.event.keyCode >= 48) && (window.event.keyCode <= 57)) || ((window.event.keyCode >= 65) && (window.event.keyCode <= 90)) || ((window.event.keyCode >= 97) && (window.event.keyCode <= 122)) || (window.event.keyCode == 46) || (window.event.keyCode == 45))|| (window.event.keyCode == 13)))

{
window.event.keyCode = 0 ;
}
}

function DateOnly()
{
if ( !((((window.event.keyCode >= 48) && (window.event.keyCode <= 57)) || (window.event.keyCode == 45))|| (window.event.keyCode == 13)))

{
window.event.keyCode = 0 ;
}
}

function NoSpace()
{
if ((window.event.keyCode == 32))

{
window.event.keyCode = 0 ;
}
}

function Locked()
{
window.event.keyCode = 0 ;
}



function HanziOnly()
{
window.event.keyCode = 0 ;
}

//调用方法： style="CURSOR: default;" onkeypress="Locked();"

