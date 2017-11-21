function parseScale(num,len){
	//保留len位小数，4舍5入
	var lenVal=Number(len);
	var str=num.toString();
	var arr=str.split(".");
	if(arr.length>1){
		if(arr[1].length>lenVal){
			str=arr[0]+arr[1].substring(0,lenVal);
			var tailVal=Number(arr[1].substring(lenVal,lenVal+1));
			if(tailVal>=5){
				str=((Number(str)+1)/Math.pow(10,lenVal)).toString();
			}else{
				str=(Number(str)/Math.pow(10,lenVal)).toString();
			}
		}
	}
	return str;
}

function accMul(arg1,arg2){ 
	var m=0,s1=arg1.toString(),s2=arg2.toString(); 
	try{m+=s1.split(".")[1].length}catch(e){} 
	try{m+=s2.split(".")[1].length}catch(e){} 
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m) 
}
function addMul(arg1,arg2){ 
	var m1=0,m2=0,m=0,s1=arg1.toString(),s2=arg2.toString(); 
	try{m1+=s1.split(".")[1].length}catch(e){} 
	try{m2+=s2.split(".")[1].length}catch(e){} 
	if(m1>m2){
		m=m1;
		s1=s1.replace(".","");
		s2=s2.replace(".","");
		for(i=0;i<m1-m2;i++){
			s2=s2+"0";
		}
	}else{
		m=m2;
		s1=s1.replace(".","");
		s2=s2.replace(".","");
		var i;
		for(i=0;i<m2-m1;i++){
			s1=s1+"0";
		}
	}
	return (Number(s1)+Number(s2))/Math.pow(10,m) 
}
function abateMul(arg1,arg2){
	var m1=0,m2=0,m=0,s1=arg1.toString(),s2=arg2.toString(); 
	try{m1+=s1.split(".")[1].length}catch(e){} 
	try{m2+=s2.split(".")[1].length}catch(e){} 
	if(m1>m2){
		m=m1;
		s1=s1.replace(".","");
		s2=s2.replace(".","");
		var i;
		for(i=0;i<m1-m2;i++){
			s2=s2+"0";
		}
	}else{
		m=m2;
		s1=s1.replace(".","");
		s2=s2.replace(".","");
		for(i=0;i<m2-m1;i++){
			s1=s1+"0";
		}
	}
	return (Number(s1)-Number(s2))/Math.pow(10,m) 
}
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
    	var aVersions = ["MSXML2.XMLHttp.5.0","MSXML2.XMLHttp.4.0","MSXML2.XMLHttp.3.0","MSXML2.XMLHttp","Microsoft.XMLHttp"];
    	for(i=0;i<aVersions.length;i++){
    		try{
	    		return new ActiveXObject(aVersions[i]);
	    	}catch(e){}
    	}
    }else if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    }
}
function getBigMoney(num){
	var preStr="";
	if(num-0<0){
		num=(0-num).toString();
		preStr="负";
	}
	var strOutput = "";  
  	var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';  
  	num += "00";  
  	var intPos = num.indexOf('.');  
  	if (intPos >= 0){ 
    	num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
    }  
  	strUnit = strUnit.substr(strUnit.length - num.length);  
  	for (var i=0; i < num.length; i++){  
    	strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i,1),1) + strUnit.substr(i,1);
    }  
    strOutput = strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元"); 
	return preStr+strOutput;
}
/**  
*删除左右两端的空格  
*/  
String.prototype.trim=function(){
    return this.replace(/(^\s*)|(\s*$)/g,"");
}
/**  
*删除左边的空格  
*/  
String.prototype.ltrim=function(){
  return this.replace(/(^s*)/g,"");
}
/**
*删除右边的空格  
*/
String.prototype.rtrim=function(){
  return this.replace(/(s*$)/g,"");
}
String.prototype.endWith=function(oString){  
	var reg=new RegExp(oString+"$");  
	return reg.test(this);
}
function checkIE8(){
	var v=navigator.appVersion;
	var n=navigator.appName;
	var is8=false;
	try{
		if(window.navigator){
			if(n=="Microsoft Internet Explorer"){
				var x=parseFloat(v.substring(v.indexOf("MSIE")+5,v.lastIndexOf("Windows")));
				if(x-0>=8){
					is8=true;
				}
			}
		}
	}catch(e){
	}
	return is8;
}
function checkNavigator(){
	var ua=navigator.userAgent.toLowerCase();
	var rMsie = /.*(msie) ([\w.]+).*/;// ie   
	var rFirefox = /.*(firefox)\/([\w.]+).*/;// firefox   
	var rOpera = /(opera).+version\/([\w.]+)/;// opera   
	var rChrome = /.*(chrome)\/([\w.]+).*/;// chrome   
	var rSafari = /.*version\/([\w.]+).*(safari).*/;// safari
	
	var match = rMsie.exec(ua);
	if (match != null) {
		  return new Array(match[1],match[2]);
	}
	var match = rFirefox.exec(ua);   
	if (match != null) {   
		return new Array(match[1],match[2]);
	}   
	var match = rOpera.exec(ua);   
	if (match != null) {   
		return new Array(match[1],match[2]);
	}   
	var match = rChrome.exec(ua);   
	if (match != null) {   
		return new Array(match[1],match[2]);
	}   
	var match = rSafari.exec(ua);   
	if (match != null) {   
		return new Array(match[2],match[1]);//browser is in match[2]
	}   
	//else
	return new Array("","0");
}

function showWin(w,h,url,maxWidth,noScrollBar){
	if(maxWidth){
		if(window.screen.availWidth>w){
			w=window.screen.availWidth*0.98;
		}
	}
    var ww = window.screen.width,  ww1 = ww-40;
    var wh = window.screen.height, wh1 = wh-140;
    if( w > ww1 ) w = ww1;
    if( h > wh1 ) h = wh1;
    var l=(ww-w)/2-8;
    var t=(wh-100-h)/2-8;
    var scroBar='yes';
    if(noScrollBar){
    	scroBar='no';
    }
    var win = window.open(url,'_blank','width='+ w +',height='+ h +',top='+ t +',left='+ l +',status=no,menubar=no,resizable=yes,scrollbars='+scroBar);
}

function resizePopwin(){
	/** ie11的userAgent不包含"msie"了,在桌面的时候没有滚动条导致看不见按钮,先不要
	if(checkNavigator()[0]!="msie" && !window.opener && parent.document.getElementById("dialogBox")){//解决三星平板按钮在iframe滚动后错位问题
		var boxH=document.body.offsetHeight+24+20;//标题:24,最外层div的margin:上下都是10
		var ifrH=document.body.offsetHeight+20;
		parent.document.getElementById("dialogBox").style.height=boxH+"px";
		parent.document.getElementById("dialogTr").style.height=ifrH+"px";
		parent.document.getElementById("ifr_popup0").style.height=ifrH+"px";
		var bgH=parent.document.getElementById("dialogBoxBG").style.height;
		bgH=bgH.substr(0,bgH.length-2);
		if(boxH-bgH>0){
			parent.document.getElementById("dialogBoxBG").style.height=boxH+10+"px";
		}
		parent.popp.show();
		parent.popp.setContent("height",boxH-20);
	}
	**/
}
function getTopPos(inputObj){
	var returnValue = inputObj.offsetTop + inputObj.offsetHeight;
	while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetTop;
	return returnValue;
}

function getleftPos(inputObj){
	var returnValue = inputObj.offsetLeft;
	while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetLeft;
	return returnValue;
}
function setFocus(objId){
	var obj=document.getElementById(objId);
	var objValue=obj.value;
	obj.value="";
	obj.focus();
	obj.value=objValue;
	obj.focus();
}
function printContent(ttl,type,defaW,w){
	var htmlStr="<!DOCTYPE html>"+document.getElementsByTagName("html")[0].innerHTML+"</html>";
	
	LODOP=getLodop();
	LODOP.PRINT_INIT(ttl);
	
	//top left width height,根据height分页
	//LODOP.ADD_PRINT_URL(0,0,600,"98%",url);//[url需要登录,ADD_PRINT_URL没法登录]
	if(w){
		LODOP.ADD_PRINT_HTM(0,0,w,"100%",htmlStr);
		LODOP.SET_PRINT_STYLEA(0,"Horient",2);
	}else{
		if(defaW=='FIXED'){
			LODOP.ADD_PRINT_HTM(0,0,680,"100%",htmlStr);
			LODOP.SET_PRINT_STYLEA(0,"Horient",2);
		}else{//ALL
			LODOP.ADD_PRINT_HTM(0,0,"100%","100%",htmlStr);
		}
	}
	
	//问:打印同一个页面,预览时有的机器是正常的,有的图片只显示一部分是什么原因?浏览器都是IE11
	//答:在htm打印语句下加个延迟加载语句，300 毫秒
	//LODOP.SET_PRINT_STYLEA(0,"HtmWaitMilSecs",300);
	
	if(type=='PRINT'){
		LODOP.SET_SHOW_MODE("NP_NO_RESULT",true);//lodop6.198以后才有效
		LODOP.PRINT();
	}else if(type=='SELECT'){
		if(LODOP.SELECT_PRINTER()>=0){
			LODOP.SET_SHOW_MODE("NP_NO_RESULT",true);
			LODOP.PRINT();
		}
	}else if(type=='PREVIEW'){
		LODOP.SET_SHOW_MODE("NP_NO_RESULT",true);
		LODOP.PREVIEW();
	}
}
function iePrint(ieObjId,type){
	var HKEY_Root = "HKEY_CURRENT_USER"
    var HKEY_Path = "\\software\\Microsoft\\Internet Explorer\\PageSetup\\";
    var head,foot,top,bottom,left,right;
	try{
		var Wsh=new ActiveXObject("WScript.Shell");
		//取得默认值
		/**
		head = Wsh.RegRead(HKEY_Root+HKEY_Path+"header");//页眉
		foot = Wsh.RegRead(HKEY_Root+HKEY_Path+"footer");//页脚
		bottom = Wsh.RegRead(HKEY_Root+HKEY_Path+"margin_bottom");//下页边距
		left = Wsh.RegRead(HKEY_Root+HKEY_Path+"margin_left");//左页边距
		right = Wsh.RegRead(HKEY_Root+HKEY_Path+"margin_right");//右页边距
		top = Wsh.RegRead(HKEY_Root+HKEY_Path+"margin_top");//上页边距
		**/
		//设置
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"header","");
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"footer","");
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_bottom","0.1");
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_left","0.1");
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_right","0.1");
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_top","0.1");
	}catch(oe){
		//alert("设置页眉页脚及打印边距失败，请注册WScript.Shell并将浏览器安全级别设置为低，或者在浏览器的打印->页面设置中手工设置。");
	}
	
	var ieObj=document.getElementById(ieObjId);
	if(type=='PRINT'){
		ieObj.execwb(6,1);
	}else if(type=='SELECT'){
		ieObj.execwb(6,6);
	}else if(type=='PREVIEW'){
		ieObj.execwb(7,1);
	}
	/**打印有延迟，还原设置会造成前面的设置实效，先不还原
	try{
		var Wsh=new ActiveXObject("WScript.Shell");
		//还原
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"header",head);
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"footer",foot);
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_bottom",bottom);
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_left",left);
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_right",right);
		Wsh.RegWrite(HKEY_Root+HKEY_Path+"margin_top",top);
	}catch(oe){
		//alert(oe);
	}
	**/
}
function parseFileSize(size){
	var sizeStr = "0";
	if (size > 1024 * 1024){
		sizeStr = (Math.round(size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
	}else{
		sizeStr = (Math.round(size * 100 / 1024) / 100).toString() + 'KB';
	}
	return sizeStr;
}
function checkDate(date) {
	//var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	var result = date.match(/^(\d{1,4})(-)(\d{1,2})\2(\d{1,2})$/);
    if (result == null){
		return false;
    }
	var d = new Date(result[1], result[3] - 1, result[4]);
	return (d.getFullYear() == result[1] && (d.getMonth() + 1) == result[3] && d.getDate() == result[4]);
}
function checkDateStr(dateStr,alertName){//ShowAlert需要popup_ext.js
	if(dateStr==null || dateStr==''){
		ShowAlert('提示框','请选择'+alertName,200,100);
		return false;
	}else if(!checkDate(dateStr)){
		ShowAlert('提示框',alertName+'格式不正确',200,100);
		return false;
	}
	return true;
}
