<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0096)http://115.28.87.22:8888/business/BusinessBillNew.ihtm?type=CLIENT&client_id=757&alert_type=FORM -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>业务单 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<%-- <script src="js/minierp.js.下载"></script>

<!-- 是否可以编辑附件 -->
<!-- 保存按钮是否可点击 -->
<!-- 编码框是否可点击 -->
<!-- 编码框颜色 -->
<!-- 材料框是否可点击 -->
<!-- 材料框颜色 -->
<!-- 除编码材料框外的控件的disabled状态 -->
<!-- 除编码材料框外的控件的readonly状态 -->
<!-- 除编码材料框外的控件的颜色 -->
<!-- 是否可以编辑日期 -->
<!-- 是否查看别人单据 -->
<!-- 禁止改单时修改金额 -->

<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillEdit.css">
<script src="js/popup_ext.js"></script><style>html, * {-webkit-user-select:text!important; -moz-user-select:text!important;}</style>
<script src="js/jquery.js"></script>
<script src="js/EkImgParser.js"></script>
<script src="js/exif.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script> --%>
<%-- <script language="javascript">
	function doSave(contFlag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=contFlag;
		
		var clientId=document.getElementById("businessBill.clientId").value;
		var cost=document.getElementById("businessBill.cost").value;
		var url="/business/GetCreditAlert.ihtm?bb_id=0&ts_id=2&client_id="+clientId+"&cost="+cost;
		var xmlHttp=createXMLHttpRequest();
		xmlHttp.open("GET", url, false);
		xmlHttp.onreadystatechange = function(){
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var ret=xmlHttp.responseText;
	      			if(ret!="0"){
						ShowAlert('提示框','客户欠款已超过信用额度！',200,100,'showCreditAlertCallBack()');
	      			}else{
	      				frm.submit();
	      			}
				}
			}
		};
		xmlHttp.send(null);
	}
	function showCreditAlertCallBack(){
		frm.submit();
	}
	function doCancel(){
		if(window.opener){
			window.close();
		}else{
			parent.ClosePop();
		}
	}
	function doCodeCopy(){
		try{
			var code=document.getElementById("businessBill.billCode").value;
			window.clipboardData.setData("Text",code);
			ShowAlert('提示框','业务单号已复制到剪帖板！',200,100);
		}catch(e){
			ShowAlert('提示框','对不起，当前浏览器不支持剪帖板功能！',200,100);
		}
	} 
	function elementOnChange(){
		checkItemChange(this.getAttribute("index"),this.id);
	}
	function icOnChnage(){
		if(this.checked){
			document.getElementById("is_coop_"+this.getAttribute("index")).value="Y";
		}else{
			document.getElementById("is_coop_"+this.getAttribute("index")).value="N";
		}
		checkItemChange(this.getAttribute("index"));
	}
	function isOnChnage(){
		if(this.checked){
			document.getElementById("is_setu_"+this.getAttribute("index")).value="Y";
		}else{
			document.getElementById("is_setu_"+this.getAttribute("index")).value="N";
		}
		checkItemChange(this.getAttribute("index"));
	}
	function mtAddOnClick(){
		selectMakeType(this.getAttribute("index"));
	}
	function mtDelOnClick(){
		var index=this.getAttribute("index");
		doClear("make_type_id_"+index,"make_type_name_"+index,index,"wc_id_"+index,"wc_name_"+index);
	}
	function inputOnMouseOver(){
		this.title=this.value;
	}
	function proAddOnClick(){
		selectProduct(this.getAttribute("index"));
	}
	function proSeleStaOnClick(){
		doPriceSelectInde("STA",this.getAttribute("index"));
	}
	function proSeleEstOnClick(){
		doPriceSelectInde("EST",this.getAttribute("index"));
	}
	function wcAddOnClick(){
		selectWc(this.getAttribute("index"));
	}
	function wcDelOnClick(){
		var index=this.getAttribute("index");
		doClear("wc_id_"+index,"wc_name_"+index,index);
	}
	function changeIc(index){
		if(document.getElementById("ic_"+index).checked){
			document.getElementById("is_coop_"+index).value="Y";
		}else{
			document.getElementById("is_coop_"+index).value="N";
		}
		checkItemChange(index);
	}
	function changeIs(index){
		if(document.getElementById("is_"+index).checked){
			document.getElementById("is_setu_"+index).value="Y";
		}else{
			document.getElementById("is_setu_"+index).value="N";
		}
		checkItemChange(index);
	}
	function selectWc(index){
		var url="/base/WorkCenterListForSelect.ihtm";
		ShowIframe("选择工作中心",url,600,400,"selectWcCallBack("+index+")");
	}
	function selectWcCallBack(index){
		if(popRetVal!=null){
			document.getElementById("wc_id_"+index).value=popRetVal[0];
			document.getElementById("wc_name_"+index).value=popRetVal[1];
			checkItemChange(index);
		}
	}
	function requireButtonOnClick(){
		selectMakeRequire(this.getAttribute("index"));
	}
	function unitButtonOnClick(){
		selectUnit(this.getAttribute("index"));
	}
	function mrOnFocus(){
		this.style.height="150px";
	}
	function mrOnBlur(){
		this.style.height="34px";
	}
	function mrTaOnFocus(obj){
		obj.style.height="150px";
	}
	function mrTaOnBlur(obj){
		obj.style.height="34px";
	}
	function doLengTypeChange(index){
		if(document.getElementsByName("lt_"+index)[0].checked){
			document.getElementById("leng_type_"+index).value="M";
		}else{
			if(document.getElementById("price_type_"+index).value=="AREA"){
				document.getElementById("leng_type_"+index).value="MM";
			}else{
				document.getElementById("leng_type_"+index).value="CM";
			}
		}
		checkItemChange(index,"length_"+index);
	}
	function ltOnChange(){
		doLengTypeChange(this.getAttribute("index"));
	}
	function doProNameChange(index){
		document.getElementById("proFlagSpan_"+index).style.display="none";
		checkItemChange(index);
	}
	function pnOnChange(){
		doProNameChange(this.getAttribute("index"));
	}
	function selectProduct(index){
		var url="/base/ProductMainForSelect.ihtm";
		ShowIframe("选择材料",url,900,500,"selectProductCallBack("+index+")");
	}
	function selectProductCallBack(index){
		if(popRetVal!=null){
			var estId=document.getElementById("businessBill.clientId").value;
			var mtId=document.getElementById("make_type_id_"+index).value;
			var proId=popRetVal[0];
			var proName=popRetVal[2];
			var proUnit=popRetVal[3];
			
			
			
			
				document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("pro_name_"+index))+50+"px";
				document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("pro_name_"+index))+100+"px";
				$("#LoadProcess").show();
				$.post("/base/GetEstPric.ihtm",{est_type:"CLIENT",price_type:"EST",est_id:estId,mt_id:mtId,pro_name:proName,get_sta:"Y"},function(data,status){
					parsePriceData(data,status,proId,proName,proUnit,index);
				});
			
		}
	}
	function parsePriceData(data,status,proId,proName,proUnit,index){
		if(status=="success"){
			var obj=$.parseJSON(data);
			if(obj.status=="ERROR"){
				$("#LoadProcess").hide();
				ShowAlert('提示框',obj.errMsg,200,100);
			}else{
				$("#pro_id_"+index).val(proId);
				$("#pro_name_"+index).val(proName);
				if($("#price_type_"+index).val()=="AMOUNT"){
					$("#unit_"+index).val(proUnit);
				}
				$("#unit_price_"+index).val(obj.pric);
				
				document.getElementById("proFlagSpan_"+index).style.display="";
				checkItemChange(index);
				
				$("#LoadProcess").hide();
			}
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function selectMakeRequire(index){
		var url="/base/MakeRequireListForSelect.ihtm";
		ShowIframe("选择制作要求",url,900,500,"selectMakeRequireCallBack("+index+")");
	}
	function selectMakeRequireCallBack(index){
		if(popRetVal!=null){
			var theValue=document.getElementById("make_require_"+index).value;
			for(i=0;i<popRetVal.length;i++){
				if(theValue!=null && theValue!=""){
					theValue=theValue+"\n";
				}
				theValue=theValue+popRetVal[i][0];
			}
			document.getElementById("make_require_"+index).value=theValue;
			checkItemChange(index);
		}
	}
	function selectUnit(index){
		var url="/base/UnitListForSelect.ihtm";
		ShowIframe("选择单位",url,300,400,"selectUnitCallBack("+index+")");
	}
	function selectUnitCallBack(index){
		if(popRetVal!=null){
			document.getElementById("unit_"+index).value=popRetVal[1];
			checkItemChange(index);
		}
	}
	function selectMakeType(index){
		var url="/base/MakeTypeListForSelect.ihtm";
		ShowIframe("选择项目类型",url,310,500,"selectMakeTypeCallBack("+index+")");
	}
	function selectMakeTypeCallBack(index){
		if(popRetVal!=null){
			document.getElementById("make_type_id_"+index).value=popRetVal[0];
			document.getElementById("make_type_name_"+index).value=popRetVal[1];
			document.getElementById("wc_id_"+index).value=popRetVal[2];
			document.getElementById("wc_name_"+index).value=popRetVal[3];
			if(document.getElementById("unit_"+index)!=null){
				document.getElementById("unit_"+index).value=popRetVal[4];
			}
			var mtType = popRetVal[5];
			if(mtType=='2'){
			   document.getElementById("ic_"+index).checked=true;
			   document.getElementById("is_coop_"+index).value="Y";
			}else{
			   document.getElementById("ic_"+index).checked=false;
			   document.getElementById("is_coop_"+index).value="N";
			}
			checkItemChange(index);
		}
	}
	
	function doItemSelect(priceType){
		var clientId=document.getElementById("businessBill.clientId").value;
		var url="/business/BusinessBillItemListForSelect.ihtm?id="+clientId+"&price_type="+priceType+"&ts_id=2";
		ShowIframe("选择历史价格",url,1024,500,"doItemSelectCallBack('"+priceType+"')");
	}
	function doItemSelectCallBack(priceType){
		if(popRetVal!=null){
			for(i=0;i<popRetVal.length;i++){
				if(priceType=="AREA"){
					doAreaItemAdd(popRetVal[i]);
				}else if(priceType=="AMOUNT"){
					doAmountItemAdd(popRetVal[i]);
				}else if(priceType=="LENGTH"){
					doLengthItemAdd(popRetVal[i]);
				}
			}
		}
	}
	function doPriceSelect(itemPriceType,estPriceType){
		var clientId=document.getElementById("businessBill.clientId").value;
		var url;
		var titl;
		if(estPriceType=='EST'){
			titl="选择客户价格";
			url="/base/EstPriceListForSelect.ihtm?type=MULTI&est_type=CLIENT&price_type=EST&est_id="+clientId;
		}else{
			titl="选择标准价格";
			url="/base/PgItemListForSelect.ihtm?type=MULTI&est_id="+clientId;
		}
		ShowIframe(titl,url,900,500,"doPriceSelectCallBack('"+itemPriceType+"')");
	}
	function doPriceSelectCallBack(itemPriceType){
		if(popRetVal!=null){
		    for(i=0;i<popRetVal.length;i++){
				var arr=new Array();
				arr[0]=popRetVal[i][0];
				arr[1]=popRetVal[i][1];
				arr[2]=popRetVal[i][2];
				arr[3]=popRetVal[i][3];
				if(popRetVal[i][9]==""){
					arr[4]="0";
				}else{
					arr[4]=popRetVal[i][9];
				}
				if(popRetVal[i][10]==""){
					arr[5]="0";
				}else{
					arr[5]=popRetVal[i][10];
				}
				arr[6]=popRetVal[i][11];
				arr[7]="";
				arr[8]=popRetVal[i][4];
				arr[9]=popRetVal[i][5];
				arr[10]="0";
				arr[11]=popRetVal[i][6];
				arr[12]="0";
				arr[13]="0";
				arr[14]="0";
				arr[15]="0";
				arr[16]="0";
				arr[21]="N";//安装
				if(popRetVal[i][12]=="1"){//自制
					arr[17]="N";
					arr[18]=popRetVal[i][7];
					arr[19]=popRetVal[i][8];
				}else{//外协
					arr[17]="Y";
					arr[18]="0";
					arr[19]="";
				}
				if(itemPriceType=="AREA"){
					arr[20]="M";//area type
					doAreaItemAdd(arr);
				}else if(itemPriceType=="AMOUNT"){
					arr[20]="";
					doAmountItemAdd(arr);
				}else if(itemPriceType=="LENGTH"){
					arr[20]="M";//leng type
					doLengthItemAdd(arr);
				}
			}
		}
	}
	function doPriceSelectInde(estPriceType,index){
		var clientId=document.getElementById("businessBill.clientId").value;
		var mtId=document.getElementById("make_type_id_"+index).value;
		var url;
		var titl;
		if(estPriceType=='EST'){
			titl="选择客户价格";
			url="/base/EstPriceListForSelect.ihtm?est_type=CLIENT&price_type=EST&est_id="+clientId+"&mt_id="+mtId;
		}else{
			titl="选择标准价格"
			url="/base/PgItemListForSelect.ihtm?est_id="+clientId+"&mt_id="+mtId;
		}
		ShowIframe(titl,url,900,500,"doPriceSelectIndeCallBack('"+index+"')");
	}
	function doPriceSelectIndeCallBack(index){
		if(popRetVal!=null){
			//document.getElementById("make_type_id_"+index).value=popRetVal[0];
			//document.getElementById("make_type_name_"+index).value=popRetVal[1];
			document.getElementById("pro_id_"+index).value=popRetVal[2];
			document.getElementById("pro_name_"+index).value=popRetVal[3];
			//document.getElementById("specification_"+index).value=popRetVal[11];
			//document.getElementById("make_require_"+index).value=popRetVal[4];
			
			document.getElementById("unit_price_"+index).value=popRetVal[6];
			/**
			if(popRetVal[12]=="1"){//mtType自制
				document.getElementById("is_coop_"+index).value="N";
				document.getElementById("wc_id_"+index).value=popRetVal[7];
				document.getElementById("wc_name_"+index).value=popRetVal[8];
			}else{//外协
				document.getElementById("is_coop_"+index).value="Y";
				document.getElementById("wc_id_"+index).value="0";
				document.getElementById("wc_name_"+index).value="";
			}
		
			if(document.getElementById("length_"+index)){
				if(popRetVal[9]==""){
					document.getElementById("length_"+index).value="0";
				}else{
					document.getElementById("length_"+index).value=popRetVal[9];
				}
				if(popRetVal[10]==""){
					document.getElementById("width_"+index).value="0";
				}else{
					document.getElementById("width_"+index).value=popRetVal[10];
				}
			}
			if(document.getElementById("unit_"+index)){
				document.getElementById("unit_"+index).value=popRetVal[5];
			}
			**/
			if(document.getElementById("pro_id_"+index).value=="0"){
				document.getElementById("proFlagSpan_"+index).style.display="none";
			}else{
				document.getElementById("proFlagSpan_"+index).style.display="";
			}
			checkItemChange(index);
		}
	}
	function doAreaItemAdd(defVals){
		var entAreaType="M";
		var tbl=document.getElementById("areaItemRowTbl");
		var itemNum=document.getElementById("item_num").value-0;

		var tr=document.createElement("tr");
		tr.setAttribute("className","ListTr");
		tr.setAttribute("class","ListTr");
		tr.setAttribute("id","itemTr"+itemNum);
		
		var td;
		var input;

		createItemPublicStartPart(tr,itemNum,defVals);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","length_"+itemNum);
		input.setAttribute("id","length_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[4]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		td.appendChild(document.createTextNode(" x "));
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","width_"+itemNum);
		input.setAttribute("id","width_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[5]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createElement("br"));
		input=document.createElement("input");
		input.setAttribute("type","radio");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","lt_"+itemNum);
		input.onclick=ltOnChange;//radio在onchange时,在ie取得是change前的值,所以这里不能用onchange
		if(defVals!=null){
			if(defVals[20]=="M"){
				input.setAttribute("checked",true);
			}
		}else{
			if(entAreaType=="M"){
				input.setAttribute("checked",true);
			}
		}
		td.appendChild(input);
		td.appendChild(document.createTextNode("m"));
		input=document.createElement("input");
		input.setAttribute("type","radio");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","lt_"+itemNum);
		input.onclick=ltOnChange;
		if(defVals!=null){
			if(defVals[20]=="MM"){
				input.setAttribute("checked",true);
			}
		}else{
			if(entAreaType=="MM"){
				input.setAttribute("checked",true);
			}
		}
		td.appendChild(input);
		td.appendChild(document.createTextNode("mm"));
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","leng_type_"+itemNum);
		input.setAttribute("id","leng_type_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value",defVals[20]);
		}else{
			input.setAttribute("value",entAreaType);
		}
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="66px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","specification_"+itemNum);
		input.setAttribute("id","specification_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.value=defVals[6];
			//input.setAttribute("value",defVals[6]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="90px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","make_require_"+itemNum);
		input.setAttribute("id","make_require_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.onfocus=mrOnFocus;
		input.onblur=mrOnBlur;
		if(defVals!=null){
			input.value=defVals[8];
			//input.setAttribute("value",defVals[8]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=requireButtonOnClick;
		td.appendChild(input);
		
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="44px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","amount_"+itemNum);
		input.setAttribute("id","amount_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[10]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","square_num_"+itemNum);
		input.setAttribute("id","square_num_"+itemNum);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		if(defVals!=null){
			input.setAttribute("value",defVals[12]);
		}else{
			input.setAttribute("value","0");
		}
		input.setAttribute("readOnly",true);
		td.appendChild(input);
		tr.appendChild(td);
		
		createItemPublicEndPart(tbl,tr,itemNum,defVals,"AREA");
	}
	
	function doAmountItemAdd(defVals){
		var tbl=document.getElementById("amountItemRowTbl");
		var itemNum=document.getElementById("item_num").value-0;

		var tr=document.createElement("tr");
		tr.setAttribute("className","ListTr");
		tr.setAttribute("class","ListTr");
		tr.setAttribute("id","itemTr"+itemNum);
		
		var td;
		var input;

		createItemPublicStartPart(tr,itemNum,defVals);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="100px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","specification_"+itemNum);
		input.setAttribute("id","specification_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.value=defVals[6];
			//input.setAttribute("value",defVals[6]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="150px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","make_require_"+itemNum);
		input.setAttribute("id","make_require_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.onfocus=mrOnFocus;
		input.onblur=mrOnBlur;
		if(defVals!=null){
			input.value=defVals[8];
			//input.setAttribute("value",defVals[8]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=requireButtonOnClick;
		td.appendChild(input);
		
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","unit_"+itemNum);
		input.setAttribute("id","unit_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[9]);
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=unitButtonOnClick;
		td.appendChild(input);
		
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","amount_"+itemNum);
		input.setAttribute("id","amount_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[10]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		createItemPublicEndPart(tbl,tr,itemNum,defVals,"AMOUNT");
	}
	
	function doLengthItemAdd(defVals){
		var entLengType="M";
		var tbl=document.getElementById("lengthItemRowTbl");
		var itemNum=document.getElementById("item_num").value-0;

		var tr=document.createElement("tr");
		tr.setAttribute("className","ListTr");
		tr.setAttribute("class","ListTr");
		tr.setAttribute("id","itemTr"+itemNum);
		
		var td;
		var input;

		createItemPublicStartPart(tr,itemNum,defVals);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","length_"+itemNum);
		input.setAttribute("id","length_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[4]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		td.appendChild(document.createTextNode(" x "));
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","width_"+itemNum);
		input.setAttribute("id","width_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[5]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="66px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","specification_"+itemNum);
		input.setAttribute("id","specification_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.value=defVals[6];
			//input.setAttribute("value",defVals[6]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="90px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","make_require_"+itemNum);
		input.setAttribute("id","make_require_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.onfocus=mrOnFocus;
		input.onblur=mrOnBlur;
		if(defVals!=null){
			input.value=defVals[8];
			//input.setAttribute("value",defVals[8]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=requireButtonOnClick;
		td.appendChild(input);
		
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="44px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","amount_"+itemNum);
		input.setAttribute("id","amount_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[10]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","square_num_"+itemNum);
		input.setAttribute("id","square_num_"+itemNum);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		if(defVals!=null){
			input.setAttribute("value",defVals[12]);
		}else{
			input.setAttribute("value","0");
		}
		input.setAttribute("readOnly",true);
		td.appendChild(input);
		
		td.appendChild(document.createElement("br"));
		input=document.createElement("input");
		input.setAttribute("type","radio");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","lt_"+itemNum);
		input.onclick=ltOnChange;//radio在onchange时,在ie取得是change前的值,所以这里不能用onchange
		if(defVals!=null){
			if(defVals[20]=="M"){
				input.setAttribute("checked",true);
			}
		}else{
			if(entLengType=="M"){
				input.setAttribute("checked",true);
			}
		}
		td.appendChild(input);
		td.appendChild(document.createTextNode("m"));
		input=document.createElement("input");
		input.setAttribute("type","radio");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","lt_"+itemNum);
		input.onclick=ltOnChange;
		if(defVals!=null){
			if(defVals[20]=="CM"){
				input.setAttribute("checked",true);
			}
		}else{
			if(entLengType=="CM"){
				input.setAttribute("checked",true);
			}
		}
		td.appendChild(input);
		td.appendChild(document.createTextNode("cm"));
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","leng_type_"+itemNum);
		input.setAttribute("id","leng_type_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value",defVals[20]);
		}else{
			input.setAttribute("value",entLengType);
		}
		td.appendChild(input);
		tr.appendChild(td);
		
		createItemPublicEndPart(tbl,tr,itemNum,defVals,"LENGTH");
	}
	
	function createItemPublicStartPart(tr,itemNum,defVals){
		var td;
		var input;
		var busiProd="SELECT";
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="80px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","make_type_name_"+itemNum);
		input.setAttribute("id","make_type_name_"+itemNum);
		input.onmouseover=inputOnMouseOver;
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		if(defVals!=null){
			input.setAttribute("value",defVals[1]);
		}else{
			input.setAttribute("value","");
		}
		input.setAttribute("readOnly",true);
		td.appendChild(input);
		
		td.appendChild(document.createElement("br"));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=mtAddOnClick;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_del.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=mtDelOnClick;
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","make_type_id_"+itemNum);
		input.setAttribute("id","make_type_id_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value",defVals[0]);
		}else{
			input.setAttribute("value","0");
		}
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("textarea");
		input.style.width="206px";
		input.style.height="34px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","finished_content_"+itemNum);
		input.setAttribute("id","finished_content_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.value=defVals[7];
			//input.setAttribute("value",defVals[7]);//textarea时safari不支持
		}else{
			input.setAttribute("value","");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="80px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","pro_name_"+itemNum);
		input.setAttribute("id","pro_name_"+itemNum);
		input.onmouseover=inputOnMouseOver;
		if(busiProd=="SELECT"){
			input.setAttribute("className","TextBox readonly");
			input.setAttribute("class","TextBox readonly");
			input.setAttribute("readOnly",true);
		}else{
			input.setAttribute("className","TextBox");
			input.setAttribute("class","TextBox");
		}
		if(defVals!=null){
			input.setAttribute("value",defVals[3]);
		}else{
			input.setAttribute("value","");
		}
		input.onchange=pnOnChange;
		td.appendChild(input);
		
		td.appendChild(document.createElement("br"));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.setAttribute("title","直接录入多个材质组合，如果是单一材质，可以直接从材料档案中选择");
		input.onclick=proAddOnClick;
		td.appendChild(input);
		
		
			td.appendChild(document.createTextNode(" "));
			input=document.createElement("img");
			input.setAttribute("src","/images/a27.gif");
			input.setAttribute("index",itemNum);
			input.style.cursor="pointer";
			input.setAttribute("title","选择标准价格");
			input.onclick=proSeleStaOnClick;
			td.appendChild(input);
		
		
		
			td.appendChild(document.createTextNode(" "));
			input=document.createElement("img");
			input.setAttribute("src","/images/ico-bar.gif");
			input.setAttribute("index",itemNum);
			input.style.cursor="pointer";
			input.setAttribute("title","选择客户价格");
			input.onclick=proSeleEstOnClick;
			td.appendChild(input);
		
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("span");
		input.setAttribute("id","proFlagSpan_"+itemNum);
		input.setAttribute("className","MustInput");
		input.setAttribute("class","MustInput");
		input.appendChild(document.createTextNode("*"));
		if(defVals==null || defVals[2]=="0"){
			input.style.display="none";
		}
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","pro_id_"+itemNum);
		input.setAttribute("id","pro_id_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value",defVals[2]);
		}else{
			input.setAttribute("value","0");
		}
		td.appendChild(input);
		tr.appendChild(td);
	}
	
	function createItemPublicEndPart(tbl,tr,itemNum,defVals,priceType){
		var td;
		var input;
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="44px";
		input.setAttribute("maxLength","19");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","unit_price_"+itemNum);
		input.setAttribute("id","unit_price_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		if(defVals!=null){
			input.setAttribute("value",defVals[11]);
		}else{
			input.setAttribute("value","0");
		}
		input.onchange=elementOnChange;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="44px";
		input.setAttribute("maxLength","19");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","cost_"+itemNum);
		input.setAttribute("id","cost_"+itemNum);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		if(defVals!=null){
			input.setAttribute("value",defVals[13]);
		}else{
			input.setAttribute("value","0");
		}
		input.setAttribute("readOnly",true);
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","checkbox");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","ic_"+itemNum);
		input.setAttribute("id","ic_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.setAttribute("value","1");
		input.onchange=icOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","checkbox");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","is_"+itemNum);
		input.setAttribute("id","is_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.setAttribute("value","1");
		input.onchange=isOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="56px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","wc_name_"+itemNum);
		input.setAttribute("id","wc_name_"+itemNum);
		input.onmouseover=inputOnMouseOver;
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		if(defVals!=null){
			input.setAttribute("value",defVals[19]);
		}else{
			input.setAttribute("value","");
		}
		input.setAttribute("readOnly",true);
		td.appendChild(input);
		
		td.appendChild(document.createElement("br"));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.setAttribute("title","项目选择了工作中心,就会出现在制作管理中");
		input.onclick=wcAddOnClick;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_del.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=wcDelOnClick;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		var delLink=document.createElement("a");
		delLink.setAttribute("href","javascript:doItemDelete("+itemNum+");");
		delLink.appendChild(document.createTextNode("删除"));
		td.appendChild(delLink);
		td.appendChild(document.createElement("br"));
		var copyLink=document.createElement("a");
		copyLink.setAttribute("href","javascript:doItemCopy("+itemNum+",'"+priceType+"');");
		copyLink.appendChild(document.createTextNode("复制"));
		td.appendChild(copyLink);

		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","status_"+itemNum);
		input.setAttribute("id","status_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value","NEW");
		}else{
			input.setAttribute("value","UNCHANGE");
		}
		td.appendChild(input);
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","price_type_"+itemNum);
		input.setAttribute("id","price_type_"+itemNum);
		input.setAttribute("value",priceType);
		td.appendChild(input);
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","id_"+itemNum);
		input.setAttribute("id","id_"+itemNum);
		input.setAttribute("value","0");
		td.appendChild(input);
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","wc_id_"+itemNum);
		input.setAttribute("id","wc_id_"+itemNum);
		if(defVals!=null){
			input.setAttribute("value",defVals[18]);
		}else{
			input.setAttribute("value","0");
		}
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","is_coop_"+itemNum);
		input.setAttribute("id","is_coop_"+itemNum);
		if(defVals!=null && defVals[17]=="Y"){
			input.setAttribute("value","Y");
		}else{
			input.setAttribute("value","N");
		}
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","is_setu_"+itemNum);
		input.setAttribute("id","is_setu_"+itemNum);
		if(defVals!=null && defVals[21]=="Y"){
			input.setAttribute("value","Y");
		}else{
			input.setAttribute("value","N");
		}
		td.appendChild(input);
		tr.appendChild(td);

		tbl.appendChild(tr);
		document.getElementById("item_num").value=itemNum+1;
		
		if(defVals!=null && defVals[17]=="Y"){
			document.getElementById("ic_"+itemNum).checked=true;//必须加在checkbox已经append到dom后才能设置
		}
		if(defVals!=null && defVals[21]=="Y"){
			document.getElementById("is_"+itemNum).checked=true;//必须加在checkbox已经append到dom后才能设置
		}
		
		if(defVals!=null){
			checkItemChange(itemNum);
			//doCount();
		}else{
			selectMakeType(itemNum);//空白的才弹出
		}
		
		resizePopwin();
	}
	
	function doItemDelete(index){
		ShowConfirm('确认框','确定删除吗？',340,80,"doItemDeleteCallBack("+index+")");
	}
	function doItemDeleteCallBack(index){
		if(popRetVal!=null){
			document.getElementById("itemTr"+index).style.display="none";
			document.getElementById("status_"+index).value="DELETE";
			doCount();
			
			resizePopwin();
		}
	}
	function doItemCopy(index,priceType){
		var defVals=new Array();
		defVals[0]=document.getElementById("make_type_id_"+index).value;
		defVals[1]=document.getElementById("make_type_name_"+index).value;
		defVals[2]=document.getElementById("pro_id_"+index).value;
		defVals[3]=document.getElementById("pro_name_"+index).value;
		defVals[6]=document.getElementById("specification_"+index).value;
		defVals[7]=document.getElementById("finished_content_"+index).value;
		defVals[8]=document.getElementById("make_require_"+index).value;
		defVals[10]=document.getElementById("amount_"+index).value;
		defVals[11]=document.getElementById("unit_price_"+index).value;
		defVals[13]=document.getElementById("cost_"+index).value;
		defVals[14]="0";
		defVals[15]="0";
		defVals[16]="0";
		defVals[17]=document.getElementById("is_coop_"+index).value;
		defVals[18]=document.getElementById("wc_id_"+index).value;
		defVals[19]=document.getElementById("wc_name_"+index).value;
		defVals[21]=document.getElementById("is_setu_"+index).value;
		if(priceType=="AREA"){
			defVals[4]=document.getElementById("length_"+index).value;
			defVals[5]=document.getElementById("width_"+index).value;
			defVals[9]="";
			defVals[12]=document.getElementById("square_num_"+index).value;
			defVals[20]=document.getElementById("leng_type_"+index).value;
			doAreaItemAdd(defVals);
		}else if(priceType=="AMOUNT"){
			defVals[4]="0";
			defVals[5]="0";
			defVals[9]=document.getElementById("unit_"+index).value;
			defVals[12]="0";
			defVals[20]="";
			doAmountItemAdd(defVals);
		}else if(priceType=="LENGTH"){
			defVals[4]=document.getElementById("length_"+index).value;
			defVals[5]=document.getElementById("width_"+index).value;
			defVals[9]="";
			defVals[12]=document.getElementById("square_num_"+index).value;
			defVals[20]=document.getElementById("leng_type_"+index).value;
			doLengthItemAdd(defVals);
		}
	}
	function checkItemChange(index,id){
		if(document.getElementById("id_"+index).value=="" || document.getElementById("id_"+index).value=="0"){
			document.getElementById("status_"+index).value="NEW";
		}else{
			document.getElementById("status_"+index).value="EDIT";
		}
		
		var priceType=document.getElementById("price_type_"+index).value;
		var itemAmount=document.getElementById("amount_"+index).value;
		var itemUnitPrice=document.getElementById("unit_price_"+index).value;
		var itemCost=document.getElementById("cost_"+index).value;
		if(priceType=="AREA"){
			var itemLength=document.getElementById("length_"+index).value;
			var itemWidth=document.getElementById("width_"+index).value;
			var itemSquareNum=document.getElementById("square_num_"+index).value;
			//平方数
			if(!isNaN(itemLength) && !isNaN(itemWidth) && !isNaN(itemAmount)){
				itemSquareNum=accMul(accMul(itemLength,itemWidth),itemAmount);
				if(document.getElementById("leng_type_"+index).value=="MM"){
					itemSquareNum=itemSquareNum/1000000;
				}
				itemSquareNum=parseScale(itemSquareNum,3);
				document.getElementById("square_num_"+index).value=itemSquareNum;
			}
			//规格
			if(id=="length_"+index || id=="width_"+index){
				if(!isNaN(itemLength) && !isNaN(itemWidth)){
					var lt=document.getElementById("leng_type_"+index).value.toLowerCase();;
					var speStr="";
					if(itemLength-0!=0){
						speStr=itemLength+lt;
					}
					if(itemWidth-0!=0){
						if(speStr!=""){
							speStr=speStr+" x ";
						}
						speStr=speStr+itemWidth+lt;
					}
					document.getElementById("specification_"+index).value=speStr+"高";
				}
			}
			//金额
			if(!isNaN(itemSquareNum) && !isNaN(itemUnitPrice)){
				itemCost=accMul(itemSquareNum,itemUnitPrice);
				document.getElementById("cost_"+index).value=parseScale(itemCost,2);
			}
		}else if(priceType=="AMOUNT"){
			//金额
			if(!isNaN(itemAmount) && !isNaN(itemUnitPrice)){
				itemCost=accMul(itemAmount,itemUnitPrice);
				document.getElementById("cost_"+index).value=parseScale(itemCost,2);
			}
		}else if(priceType=="LENGTH"){
			var itemLength=document.getElementById("length_"+index).value;
			var itemWidth=document.getElementById("width_"+index).value;
			var itemSquareNum=document.getElementById("square_num_"+index).value;
			var lengType="MAX";
			//长度
			if(!isNaN(itemLength) && !isNaN(itemWidth) && !isNaN(itemAmount)){
				if(lengType=="WIDTH"){
					itemSquareNum=accMul(itemLength,itemAmount);
				}else if(lengType=="TALL"){
					itemSquareNum=accMul(itemWidth,itemAmount);
				}else{
					if(Number(itemLength)>Number(itemWidth)){
						itemSquareNum=accMul(itemLength,itemAmount);
					}else{
						itemSquareNum=accMul(itemWidth,itemAmount);
					}
				}
				itemSquareNum=parseScale(itemSquareNum,3);
				document.getElementById("square_num_"+index).value=itemSquareNum;
			}
			//规格
			if(id=="length_"+index || id=="width_"+index){
				if(!isNaN(itemLength) && !isNaN(itemWidth)){
					var lt=document.getElementById("leng_type_"+index).value.toLowerCase();;
					var speStr="";
					if(itemLength-0!=0){
						speStr=itemLength+lt;
					}
					if(itemWidth-0!=0){
						if(speStr!=""){
							speStr=speStr+" x ";
						}
						speStr=speStr+itemWidth+lt;
					}
					document.getElementById("specification_"+index).value=speStr;
				}
			}
			//金额
			if(!isNaN(itemSquareNum) && !isNaN(itemUnitPrice)){
				itemCost=accMul(itemSquareNum,itemUnitPrice);
				document.getElementById("cost_"+index).value=parseScale(itemCost,2);
			}
		}
		doCount();
	}
	
	function doCount(){
		var itemNum=document.getElementById("item_num").value-0;
		var costTotal=0;
		var cost=0;
		var itemCost;
		var itemAmount;
		
		var priceType;
		var lengItemNum=0,areaItemNum=0,amouItemNum=0;
		var lengMTotal=0,lengCmTotal=0,areaTotal=0,amountTotal=0;
		var lengthCost=0,areaCost=0,amountCost=0;
		
		for(var i=0;i<itemNum;i++){
			if(document.getElementById("status_"+i).value!="DELETE"){
				itemCost=document.getElementById("cost_"+i).value;
				if(!isNaN(itemCost)){
					costTotal=addMul(costTotal,itemCost);
				}
				
				priceType=document.getElementById("price_type_"+i).value;
				if(priceType=="AMOUNT"){
					if(!isNaN(itemCost)){
						amountCost=addMul(amountCost,itemCost);
					}
					itemAmount=document.getElementById("amount_"+i).value;
					if(!isNaN(itemAmount)){
						amountTotal=addMul(amountTotal,itemAmount);
					}
					amouItemNum=amouItemNum+1;
				}else if(priceType=="AREA"){
					if(!isNaN(itemCost)){
						areaCost=addMul(areaCost,itemCost);
					}
					var itemArea=document.getElementById("square_num_"+i).value;
					if(!isNaN(itemArea)){
						areaTotal=addMul(areaTotal,itemArea);
					}
					areaItemNum=areaItemNum+1;
				}else if(priceType=="LENGTH"){
					if(!isNaN(itemCost)){
						lengthCost=addMul(lengthCost,itemCost);
					}
					var itemLength=document.getElementById("square_num_"+i).value;
					if(!isNaN(itemLength)){
						if(document.getElementById("leng_type_"+i).value=="M"){
							lengMTotal=addMul(lengMTotal,itemLength);
						}else{
							lengCmTotal=addMul(lengCmTotal,itemLength);
						}
					}
					lengItemNum=lengItemNum+1;
				}
			}
		}
		
		var favCost=document.getElementById("favCostStr").value;
		if(!isNaN(favCost)){
			cost=abateMul(costTotal,favCost);
		}
		document.getElementById("costTotal").value=costTotal;
		document.getElementById("businessBill.cost").value=cost;
		if(document.getElementById("areaTotalSpan")!=null){
			document.getElementById("areaTotalSpan").innerHTML="记录："+areaItemNum+"条&nbsp;面积："+areaTotal+"平方米&nbsp;金额："+areaCost+"元";
		}
		if(document.getElementById("amountTotalSpan")!=null){
			document.getElementById("amountTotalSpan").innerHTML="记录："+amouItemNum+"条&nbsp;数量："+amountTotal+"&nbsp;金额："+amountCost+"元";
		}
		if(document.getElementById("lengTotalSpan")!=null){
			document.getElementById("lengTotalSpan").innerHTML="记录："+lengItemNum+"条&nbsp;长度："+lengMTotal+"米&nbsp;"+lengCmTotal+"公分&nbsp;金额："+lengthCost+"元";
		}
	}
	
	function selectStaffer(idObjId,nameObjId){
		var url="/base/StafferMainForSelect.ihtm";
		ShowIframe("选择员工",url,800,500,"selectStafferCallBack('"+idObjId+"','"+nameObjId+"')");
	}
	function selectStafferCallBack(idObjId,nameObjId){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById(idObjId).value=arr[0];
			document.getElementById(nameObjId).value=arr[1];
		}
	}
	
	function selectStafferRate(type,idObjId,nameObjId){
		var url="/base/StafferMainForSelect.ihtm?type=MULTI";
		ShowIframe("选择员工",url,800,500,"selectStafferRateCallBack('"+type+"','"+idObjId+"','"+nameObjId+"')");	
	}
	function selectStafferRateCallBack(type,idObjId,nameObjId){
		if(popRetVal!=null){
			var idStr="";
			var nameStr="";
			for(i=0;i<popRetVal.length;i++){
				if(idStr!=""){
					idStr=idStr+";";
					nameStr=nameStr+";";
				}
				idStr=idStr+popRetVal[i][0];
				nameStr=nameStr+popRetVal[i][2];
			}
			if(idStr!=""){
				var url="/business/SetStafferRate.ihtm?type="+type+"&id_str="+idStr+"&name_str="+encodeURIComponent(nameStr);
				ShowIframe("设置占比",url,335,250,"selectStafferRateCallBackExt('"+idObjId+"','"+nameObjId+"')");
			}
		}
	}
	function selectStafferRateCallBackExt(idObjId,nameObjId){
		if(popRetVal!=null){
			//var idStr=document.getElementById(idObjId).value;
			//var nameStr=document.getElementById(nameObjId).value;
			var idStr="";
			var nameStr="";
			if(idStr==""){
				idStr=";"+popRetVal[0]+";";
				nameStr=popRetVal[1];
			}else{
				idStr=idStr+popRetVal[0]+";";
				nameStr=nameStr+";"+popRetVal[1];
			}
			document.getElementById(idObjId).value=idStr;
			document.getElementById(nameObjId).value=nameStr;
		}
	}
	
	function clearStafferRate(idObjId,nameObjId){
		document.getElementById(idObjId).value="";
		document.getElementById(nameObjId).value="";
	}
	function doPrint(id,type){
		showWin(900,600,"/business/BusinessBillPrint.ihtm?id="+id+"&type="+type);
	}
	function doDownload(id){
		window.location="/business/BusinessBillPrint.ihtm?content_type=EXCEL&id="+id;
	}
	function selectContact(){
		if(document.getElementById("canSelectContact").value=="Y"){
			var estId=document.getElementById("businessBill.clientId").value;
			var url="/base/ContactListForSelect.ihtm?est_id="+estId;
			ShowIframe("选择联系人",url,500,320,"selectContactCallBack()");
		}else{
			ShowAlert('提示框','订货单位不是您权限范围内的客户，不能选择联系人！',200,100);
		}
	}
	function selectContactCallBack(){
		if(popRetVal!=null){
			document.getElementById("businessBill.linkman").value=popRetVal[0];
			document.getElementById("businessBill.phone").value=popRetVal[1];
		}
	}
	function selectClient(){
		var url="/base/EstablishmentListForSelect.ihtm?type=CLIENT&ts_id=2&order_type=BUS_TIME";
		ShowIframe("选择客户",url,900,500,"selectClientCallBack()");
	}
	function selectClientCallBack(){
		if(popRetVal!=null){
			document.getElementById("businessBill.clientId").value=popRetVal[0];
			document.getElementById("clientName").value=popRetVal[1];
			document.getElementById("estMngId").value=popRetVal[2];
			if(popRetVal[2]!="0"){
				document.getElementById("businessBill.managerId").value=popRetVal[2];
				document.getElementById("businessBill.managerName").value=popRetVal[3];
			}
			document.getElementById("canSelectContact").value=popRetVal[4];
			document.getElementById("businessBill.address").value=popRetVal[6];
			if(popRetVal[4]=="Y"){
				document.getElementById("businessBill.linkman").value=popRetVal[7];
				document.getElementById("businessBill.phone").value=popRetVal[8];
			}else{
				document.getElementById("businessBill.linkman").value="";
				document.getElementById("businessBill.phone").value=popRetVal[5];
			}
			
			var pmObj=document.getElementById("businessBill.payModeId");
			for(var i=0;i<pmObj.options.length;i++){
				if(popRetVal[13]==pmObj.options[i].value){
					pmObj.options[i].selected=true;
					break;
				}
			}
			
			
			setFocus("businessBill.linkman");
		}
	}
	function changeTimeSelect(obj,targetName){
		document.getElementById(targetName).value=obj.value;
	}
	
	function doClear(idObjId,nameObjId,index,extIdObjId,extNameObjId){
		if(idObjId!=null && idObjId!=''){
		}
		if(nameObjId!=null && nameObjId!=''){
			document.getElementById(nameObjId).value="";
		}
		if(extIdObjId!=null && extIdObjId!=''){
		}
		if(extNameObjId!=null && extNameObjId!=''){
			document.getElementById(extNameObjId).value="";
		}
		if(index!=null){//奶奶的，js里面0跟''比较是相等的，所以这里不能用index!=''，否则index为0时有问题
			checkItemChange(index);
		}
	}
	function doInit(){
		
		if(document.addEventListener){
			var fdArea=document.getElementById("filedrag_area");
			if(fdArea){
				fdArea.addEventListener("dragover",function(e){fileDragHover(e,fdArea.id,"AREA")},false);
				fdArea.addEventListener("dragleave",function(e){fileDragHover(e,fdArea.id,"AREA")},false);
				fdArea.addEventListener("drop",function(e){fileSelectHandler(e,fdArea.id,"AREA")},false);
			}
			
			var fdLeng=document.getElementById("filedrag_leng");
			if(fdLeng){
				fdLeng.addEventListener("dragover",function(e){fileDragHover(e,fdLeng.id,"LENGTH")},false);
				fdLeng.addEventListener("dragleave",function(e){fileDragHover(e,fdLeng.id,"LENGTH")},false);
				fdLeng.addEventListener("drop",function(e){fileSelectHandler(e,fdLeng.id,"LENGTH")},false);
			}
			
			var fdAmou=document.getElementById("filedrag_amou");
			if(fdAmou){
				fdAmou.addEventListener("dragover",function(e){fileDragHover(e,fdAmou.id,"AMOUNT")},false);
				fdAmou.addEventListener("dragleave",function(e){fileDragHover(e,fdAmou.id,"AMOUNT")},false);
				fdAmou.addEventListener("drop",function(e){fileSelectHandler(e,fdAmou.id,"AMOUNT")},false);
			}
		}
		
		setFocus("businessBill.linkman");
		showFormErrorMsg();
		resizePopwin();
	}
	
	var dragFiles,dragProp,dragFlags;
	function fileDragHover(e,divId,type){
		e.stopPropagation();//停止事件的传播,阻止它被分派到其他 Document 节点
		e.preventDefault();//通知浏览器不要执行与事件关联的默认动作(否则浏览器会显示文件)
		var elem=e.target;
		while(elem.id!=divId){
			elem=elem.parentNode;
		}
		elem.className=(e.type=="dragover"?"DragOver":"");
	}
	function fileSelectHandler(e,divId,type){
		fileDragHover(e,divId,type);
		dragFiles=e.dataTransfer.files;
		var clientId=document.getElementById("businessBill.clientId").value;
		ShowIframeNoScroll("设置图片的制作属性","/business/BusinessDragProp.ihtm?est_type=CLIENT&est_id="+clientId,400,320,"fileSelectHandlerExt('"+type+"')");
	}
	function fileSelectHandlerExt(type){
		if(popRetVal){
			dragProp=popRetVal;
			dragFlags=new Array();
			for(var i=0;i<dragFiles.length;i++){
				dragFlags[i]="N";
			}
			var posiObj;
			if(type=="AMOUNT"){
				posiObj="filedrag_amou";
			}else if(type=="AREA"){
				posiObj="filedrag_area";
			}else{
				posiObj="filedrag_leng";
			}
			document.getElementById("LoadProcess").style.top=getTopPos(posiObj)+50+"px";
			document.getElementById("LoadProcess").style.left=getleftPos(posiObj)+100+"px";
			$("#LoadProcess").show();
			setTimeout("checkDragStatus()",1000);
			
			for(var i=0;i<dragFiles.length;i++){
				checkFile(dragFiles[i],type,i);
			}
		}
	}
	function checkDragStatus(){
		var comp=true;
		for(var i=0;i<dragFlags.length;i++){
			if(dragFlags[i]=="N"){
				comp=false;
				break;
			}
		}
		if(comp){
			$("#LoadProcess").hide();
		}else{
			setTimeout("checkDragStatus()",1000);
		}
	}
	function checkFile(file,type,index){
		var cont=file.name;
		var lastInde=cont.lastIndexOf(".");
		if(lastInde!=-1){
			cont=cont.substring(0,lastInde);
		}
		var reader = new FileReader();
		reader.onload = function(e){
			var json=EkImgParser.parse(e.target.result);//ArrayBuffer
			addItemByDragFile(type,cont,json.width,json.height,index);
		};
		reader.readAsArrayBuffer(file);
	}
	
	function addItemByDragFile(type,cont,widt,heig,index){
		var defVals=new Array();
		defVals[0]=dragProp[0];
		defVals[1]=dragProp[1];
		defVals[2]=dragProp[2];
		defVals[3]=dragProp[3];
		defVals[7]=cont;
		defVals[8]=dragProp[4];
		defVals[9]=dragProp[6];
		defVals[10]=dragProp[5];
		defVals[11]=dragProp[7];
		defVals[12]="0";
		defVals[13]="0";
		defVals[14]="0";
		defVals[15]="0";
		defVals[16]="0";
		defVals[17]=dragProp[10];
		defVals[18]=dragProp[8];
		defVals[19]=dragProp[9];
		defVals[21]="N";
		if(type=="AREA"){
			var entAreaType="M";
			defVals[6]="";
			if(widt!=""){
				if(entAreaType=="M"){
					widt=parseScale(widt/100,3);
					heig=parseScale(heig/100,3);
					defVals[6]=widt+"m x "+heig+"m";
				}else{//MM
					widt=parseScale(accMul(widt,10),3);
					heig=parseScale(accMul(heig,10),3);
					defVals[6]=widt+"mm x "+heig+"mm";
				}
			}
			defVals[4]=widt;
			defVals[5]=heig;
			defVals[20]=entAreaType;
			doAreaItemAdd(defVals);
		}else if(type=="AMOUNT"){
			defVals[4]="0";
			defVals[5]="0";
			defVals[6]="";
			if(widt!=""){
				defVals[6]=parseScale(widt,3)+"cm x "+parseScale(heig,3)+"cm";
			}
			defVals[20]="";
			doAmountItemAdd(defVals);
		}else if(type=="LENGTH"){
			var entLengType="M";
			defVals[6]="";
			if(widt!=""){
				if(entLengType=="M"){
					widt=parseScale(widt/100,3);
					heig=parseScale(heig/100,3);
					defVals[6]=widt+"m x "+heig+"m高";
				}else{//CM
					widt=parseScale(widt,3);
					heig=parseScale(heig,3);
					defVals[6]=widt+"cm x "+heig+"cm高";
				}
			}
			defVals[4]=widt;
			defVals[5]=heig;
			defVals[20]=entLengType;
			doLengthItemAdd(defVals);
		}
		dragFlags[index]="Y";
	}
	
	function doFav(){
		var costTotal=document.getElementById("costTotal").value;
		if(!isNaN(costTotal)){
			var favCost="0";
			var cost=costTotal;
			var arr=costTotal.split(".");
			if(arr.length>1){
				favCost="0."+arr[1];
				cost=arr[0];
			}
			document.getElementById("businessBill.cost").value=cost;
			document.getElementById("favCostStr").value=favCost;
		}
	}
	function doRound(){
		var costTotal=document.getElementById("costTotal").value;
		if(!isNaN(costTotal)){
			var cost=Math.round(costTotal);
			var favCost=abateMul(costTotal,cost);
			document.getElementById("businessBill.cost").value=cost;
			document.getElementById("favCostStr").value=favCost;
		}
	}
	function doExceImpo(priceType){
		ShowIframe("导入Excel","/business/BusinessBillImpoForm.ihtm?price_type="+priceType,560,300,"doExceImpoCallBack('"+priceType+"')");
	}
	function doExceImpoCallBack(priceType){
		if(popRetVal){
			var posiObjId;
			if(priceType=="AMOUNT"){
				posiObjId="uplo_amou";
			}else if(priceType=="LENGTH"){
				posiObjId="uplo_leng";
			}else{
				posiObjId="uplo_area";
			}
		
			document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById(posiObjId))+50+"px";
			document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById(posiObjId))+100+"px";
			document.getElementById("LoadProcess").style.display="";

			var fileName = popRetVal;
			$.post("/business/ImpoBusinessBillItem.ihtm",{price_type:priceType,file_name:fileName},function(data,status){
				parseExceImpoData(data,status,priceType);
			});
		}
	}
	function parseExceImpoData(data,status,priceType){
		if(status=="success"){
			var obj=$.parseJSON(data);
			if(obj.status=="ERROR"){
				$("#LoadProcess").hide();
				ShowAlert('提示框',obj.errMsg,200,100);
			}else{
				$.each(obj.items,function(index,item){
					var defVals=new Array();
					defVals[0]=item.mtId;
					defVals[1]=item.mtName;
					defVals[2]=item.prodId;
					defVals[3]=item.prodName;
					defVals[6]=item.spec;
					defVals[7]=item.cont;
					defVals[8]=item.mr;
					defVals[10]=item.amou;
					defVals[11]=item.up;
					defVals[13]=item.cost;
					defVals[14]="0";
					defVals[15]="0";
					defVals[16]="0";
					defVals[17]=item.isCoop;
					defVals[18]=item.wcId;
					defVals[19]=item.wcName;
					defVals[21]="N";
					if(priceType=="AREA"){
						defVals[4]=item.leng;
						defVals[5]=item.widt;
						defVals[9]="";
						defVals[12]=item.squa;
						defVals[20]=item.lengType;
						doAreaItemAdd(defVals);
					}else if(priceType=="AMOUNT"){
						defVals[4]="0";
						defVals[5]="0";
						defVals[9]=item.unit;
						defVals[12]="0";
						defVals[20]="";
						doAmountItemAdd(defVals);
					}else if(priceType=="LENGTH"){
						defVals[4]=item.leng;
						defVals[5]=item.widt;
						defVals[9]="";
						defVals[12]=item.squa;
						defVals[20]=item.lengType;
						doLengthItemAdd(defVals);
					}
				});
				$("#LoadProcess").hide();
			}
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function addLinkman(){
		var estId=document.getElementById("businessBill.clientId").value;
		var linkman=document.getElementById("businessBill.linkman").value.trim();
		var phone=document.getElementById("businessBill.phone").value.trim();
		if(estId=="" || estId=="0"){
			ShowAlert('提示框','请先选择客户！',200,100);
		}else if(linkman=="" || phone==""){
			ShowAlert('提示框','联系人姓名与电话不能空！',200,100);
		}else{
			var url="/base/EstContAdd.ihtm?est_id="+estId+"&linkman="+encodeURIComponent(linkman)+"&phone="+encodeURIComponent(phone);
			var xmlHttp=createXMLHttpRequest();
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = function(){
				if (xmlHttp.readyState == 4) {
		      		if (xmlHttp.status == 200) {
		      			var resTxt=xmlHttp.responseText;
		      			if(resTxt=="CONT_EXIST"){
		      				ShowAlert('提示框','联系人已经存在！',200,100);
		      			}else{
		      				ShowAlert('提示框','添加成功！',200,100);
		      			}
		      		}
		      	}
		    };
		    xmlHttp.send(null);
		}
	}
	function setDate(type){
		var d=new Date();
		var str="";
		if(type=="TOMORROW"){
			d.setDate(d.getDate()+1);
			str=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="AFTER_TOMO"){
			d.setDate(d.getDate()+2);
			str=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}
		document.getElementById("deliverDateStr").value=str;
	}
	//AccessoryList使用
	function refreshAccWin(){
		if(popRetVal!=null){
			document.getElementById("accessoryFrm").contentWindow.refreshWin();
		}
	}
	function doDelAcc(id){
		if(popRetVal!=null){
			document.getElementById("accessoryFrm").contentWindow.doDelAct(id);
		}
	}
	function doCopAcc(id){
		if(popRetVal!=null){
			document.getElementById("accessoryFrm").contentWindow.doCopAct(id);
		}
	}
	function showAccImg(fileName){
		var img=new Image();//要new一个变量而不能直接用document.getElementById("accImg")来设置,否则设置一次width后就不会变了
		img.src=fileName;
		if(img.complete){//缓存中读取
			img.onload=null;
			accLoadCallback(img,fileName);
		}else{
			img.onload = function () {
				accLoadCallback(img,fileName);
			}
		}
	}
	function accLoadCallback(img,fileName){
		var obj=document.getElementById("accImg");
		obj.width=img.width>800?800:img.width;
		obj.src=fileName;
		document.getElementById("accImgSpan").style.display="";
	}
</script> --%>
</head>
<body onload="doInit();">
<div class="Wrap1280">
	<form action="BusinessBillVTO_saveBusiness" method="post">
	<div class="Container">
		<div class="Contnet Paper">
			<!-- 提示信息 -->
			
<%-- <script language="javascript">
	var formErrorIndex=0;
	var formErrorMsg="";
	var formErrorObjId="";
	function setFormErrorMsg(msg,index,objId){
		if(formErrorIndex==0 || formErrorIndex>index){
			if(msg!=null && msg!=""){
				formErrorIndex=index;
				formErrorMsg=msg;
				formErrorObjId=objId;
			}
		}
	}
	function showFormErrorMsg(){
		if(formErrorIndex!=0){
			document.getElementById("errorMsgTr").style.display="";
			document.getElementById("errorMsgDiv").innerHTML=formErrorMsg;
			if(formErrorObjId!=null && formErrorObjId!=""){
				document.getElementById(formErrorObjId).focus();
			}
		}
	}
	function goNextInput(objId){
		var obj=null;
		if(objId!=null && objId!=''){
			obj=document.getElementById(objId);
		}
		if(window.event.keyCode==13){
			if(obj!=null){
				obj.focus();
			}else if(window.doSave){
				doSave();
			}
		}
	}
</script> --%>
<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td colspan="2">
	  	<div class="msg-error" id="errorMsgDiv">
      	
      	</div>
	  </td>
	</tr>
</tbody></table>
			
			<!--业务单 标题-->
			<br>
	        <table class="BillHeading" cellspacing="0" cellpadding="0">
	        	<tbody><tr>
		            <td width="387px;" rowspan="2"><div class="CorpLogo"><img src="img/1_1456975049379login.gif"></div></td>
		            <td width="387px;" rowspan="2"><h1>新增业务单</h1></td>
		            <td width="387px;" class="tr vb codeTd">
		                <span class="MustInput">*</span>编号：
		                
				    	<input type="text" class="tbBillCode TextBox readonly" readonly="readonly" maxlength="30" onkeyup="goNextInput(&#39;orderDateStr&#39;);" id="businessBill.billCode" name="businessBill.billCode" value="">
				    	<script language="javascript">
							setFormErrorMsg('',1,'businessBill.billCode');
						</script>
			     		
		            </td>
	        	</tr>
	        	<tr>
	            	<td class="tr">
		            	<span class="MustInput">*</span>订货日期：
		           	
		                    <input type="text" class="tbBillDate TextBox " maxlength="15" onkeyup="goNextInput(&#39;businessBill.linkman&#39;);" id="orderDateStr" name="businessBill.orderDate" value="2017-09-08">
		                    <img src="img/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;orderDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;orderDateStr&#39;));">
  		                   <select id="orderDateHourSelect" class="ddlDateHour" onchange="changeTimeSelect(this,&#39;orderDateHour&#39;);">
		                        <option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11" selected="">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
		                    </select>
		                    <select id="orderDateMinuteSelect" class="ddlDateMinute" onchange="changeTimeSelect(this,&#39;orderDateMinute&#39;);">
		                        <option value="00">00</option><option value="01">01</option><option value="02" selected="">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
		                    </select>
		                    <script language="javascript">
						    	setFormErrorMsg('',2,'orderDateStr');
						    </script>
		                
	            	</td>
	        	</tr>
	        </tbody></table>

			<!-- 业务单 头信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillHeadInfo" cellspacing="0" cellpadding="0">
	        		<tbody><tr>
	            		<td width="400px;">
	                		<span class="MustInput">*</span>客户：
	                		
	                    	<!-- <input class="tbHead1 TextBox readonly" readonly="readonly" type="text" id="clientName" name="clientName" value="格力电器"> -->
	                		
	                				<s:iterator value="establishments" status="indexs">
										 <option <c:if test="${businesses.id == id}">selected="selected"</c:if> value ="${id }">${estName }</option>
		                			</s:iterator>
								</select>
							
					      		<img class="make-a" src="img/make-a.gif" style="cursor:pointer;" onclick="selectClient();">
	                    	<script language="javascript">
						    	setFormErrorMsg('',3);
						    </script>
	                		
	                		<span id="spClientInfo" class="lbClientNote">大客户</span>
	            		</td>
	            		<td width="471px;">
	                		联系人：
	                		
	                    	<input type="text" class="tbHead2_1_short TextBox " maxlength="15" onkeyup="goNextInput(&#39;businessBill.phone&#39;);" id="businessBill.linkman" name="businessBill.linkman" value="">
	                    	<img class="make-a" src="img/make-a.gif" style="cursor:pointer;" onclick="selectContact();">
	                		<script language="javascript">
								setFormErrorMsg('',4,'businessBill.linkman');
							</script>
	                		
	                		电话：
	                		
	                    	<input type="text" class="tbHead2_2 TextBox " maxlength="40" onkeyup="goNextInput(&#39;businessBill.contractCode&#39;);" id="businessBill.phone" name="businessBill.phone" value="">
	                    	<script language="javascript">
						    	setFormErrorMsg('',5,'businessBill.phone');
						    </script>
	                		
	            		</td>
	            		<td width="290px;" class="tr">
	                		合同号：
	                		
	                    	<input type="text" class="tbHead3 TextBox " maxlength="50" onkeyup="goNextInput(&#39;businessBill.setupRequire&#39;);" id="businessBill.contractCode" name="businessBill.contractCode" value="">
	                    	<script language="javascript">
						    	setFormErrorMsg('',6,'businessBill.contractCode');
						    </script>
	                		
	            		</td>
	        		</tr>
	        	</tbody></table>
	        </div>
	        <span id="accImgSpan" style="width:100%;float:left;text-align:center;display:none"><img id="accImg"></span>
	        <!-- 业务单 明细 -->
	        
	        <div id="filedrag_area">
	        <table id="BillDetails" class="BillDetails" width="100%" cellspacing="0" cellpadding="0" border="1">
	        	<tbody id="areaItemRowTbl">
	        	<tr>
		            <th width="8%">项目类型</th>
					<th width="19%">内容</th>
					<th width="8%">材质</th>
					<th width="10%">宽x高</th>
					<th width="7%">规格</th>
					<th width="11%">制作要求</th>
					<th width="5%">数量</th>
					<th width="6%">平方数</th>
					<th width="5%">元/平</th>
					<th width="5%">金额</th>
					<th width="3%">外协</th>
					<th width="3%">安装</th>
					<th width="6%">自制</th>
	        	</tr>
	        	<tr>
	        		<td>
	        				<select id="businessBill.introducerName" name="area[0].makeTypeId">
	            				<s:iterator value="makeTypes" status="indexs">
	            					<option value="${id }">${typeName }</option>
	            				</s:iterator>
	            			</select>
		        	</td>
		        	<td><input name="area[0].finishedContent" type="text"/></td>
		        	<td><input name="area[0].proName" type="text"/></td>
		        	<td><input name="area[0].length" type="text"/>
		        		<input name="area[0].width" type="text"/>cm</td>
		        	<td><input name="area[0].specification" type="text"/></td>
		        	<td><input name="area[0].makeRequire" type="text"/></td>
		        	<td><input name="area[0].amount" type="text"/></td>
		        	<td><input /></td>
		        	<td><input name="area[0].unitPrice" type="text"/></td>
		        	<td><input name="area[0].cost" type="text"/></td>
		        	<td><input name="area[0].isCoop" type="text"/></td>
		        	<td><input name="area[0].isSetu" type="text"/></td>
		        	<td><input /></td>
	        	</tr>
	        	<tr>
	        		<td>
	        				<select id="businessBill.introducerName" name="area[1].makeTypeId">
	            				<s:iterator value="makeTypes" status="indexs">
	            					<option value="${id }">${typeName }</option>
	            				</s:iterator>
	            			</select>
		        	</td>
		        	<td><input name="area[1].finishedContent" type="text"/></td>
		        	<td><input name="area[1].proName" type="text"/></td>
		        	<td><input name="area[1].length" type="text"/>
		        		<input name="area[1].width" type="text"/>cm</td>
		        	<td><input name="area[1].specification" type="text"/></td>
		        	<td><input name="area[1].makeRequire" type="text"/></td>
		        	<td><input name="area[1].amount" type="text"/></td>
		        	<td><input /></td>
		        	<td><input name="area[1].unitPrice" type="text"/></td>
		        	<td><input name="area[1].cost" type="text"/></td>
		        	<td><input name="area[1].isCoop" type="text"/></td>
		        	<td><input name="area[1].isSetu" type="text"/></td>
		        	<td><input /></td>
	        	</tr>
	        	</tbody>
	        </table>
			</div>
			<br>
	        
	        
	        
	        <div id="filedrag_leng">
	        <table id="BillDetails" class="BillDetails" width="100%" cellspacing="0" cellpadding="0">
	        	<tbody id="lengthItemRowTbl">
				<tr>
					<th width="8%">项目类型</th>
					<th width="19%">内容</th>
					<th width="8%">材质</th>
					<th width="10%">宽x高</th>
					<th width="7%">规格</th>
					<th width="11%">制作要求</th>
					<th width="5%">数量</th>
					<th width="6%">总长度</th>
					<th width="5%">单价</th>
					<th width="5%">金额</th>
					<th width="3%">外协</th>
					<th width="3%">安装</th>
					<th width="6%">自制</th>
				</tr>
				<tr>
	        		<td>
	        				<select id="businessBill.introducerName" name="length[0].makeTypeId">
	            				<s:iterator value="makeTypes" status="indexs">
	            					<option value="${id }">${typeName }</option>
	            				</s:iterator>
	            			</select>
		        	</td>
		        	<td><input name="length[0].finishedContent" type="text"/></td>
		        	<td><input name="length[0].proName" type="text"/></td>
		        	<td><input name="length[0].length" type="text"/>
		        		<input name="length[0].width" type="text"/>cm</td>
		        	<td><input name="length[0].specification" type="text"/></td>
		        	<td><input name="length[0].makeRequire" type="text"/></td>
		        	<td><input name="length[0].amount" type="text"/></td>
		        	<td><input /></td>
		        	<td><input name="length[0].unitPrice" type="text"/></td>
		        	<td><input name="length[0].cost" type="text"/></td>
		        	<td><input name="length[0].isCoop" type="text"/></td>
		        	<td><input name="length[0].isSetu" type="text"/></td>
		        	<td><input /></td>
	        	</tr>
	        	</tbody>
	        </table>
			</div>
	        <br>
	        
	        
	        
	        <div id="filedrag_amou">
	        <table id="BillDetails" class="BillDetails" width="100%" cellspacing="0" cellpadding="0">
	        	<tbody id="amountItemRowTbl">
				<tr>
					<th width="8%">项目类型</th>
					<th width="19%">内容</th>
					<th width="8%">材质</th>
					<th width="10%">规格</th>
					<th width="16%">制作要求</th>
					<th width="7%">单位</th>
					<th width="6%">数量</th>
					<th width="5%">单价</th>
					<th width="5%">金额</th>
					<th width="3%">外协</th>
					<th width="3%">安装</th>
					<th width="6%">自制</th>
				</tr>
				<tr>
	        		<td>
	        				<select id="businessBill.introducerName" name="amount[0].makeTypeId">
	            				<s:iterator value="makeTypes" status="indexs">
	            					<option value="${id }">${typeName }</option>
	            				</s:iterator>
	            			</select>
		        	</td>
		        	<td><input name="amount[0].finishedContent" type="text"/></td>
		        	<td><input name="amount[0].proName" type="text"/></td>
		        	<td><input name="amount[0].length" type="text"/>
		        		<input name="amount[0].width" type="text"/>cm</td>
		        	<td><input name="amount[0].specification" type="text"/></td>
		        	<td><input name="amount[0].makeRequire" type="text"/></td>
		        	<td><input name="amount[0].amount" type="text"/></td>
		        	<td><input /></td>
		        	<td><input name="amount[0].unitPrice" type="text"/></td>
		        	<td><input name="amount[0].cost" type="text"/></td>
		        	<td><input name="amount[0].isCoop" type="text"/></td>
		        	<td><input name="amount[0].isSetu" type="text"/></td>
		        	<td><input /></td>
	        	</tr>
				</tbody>
			 </table>
			</div>
			<br>
	        
	        
		    	<script language="javascript">
		        	setFormErrorMsg('',7);
		    	</script>
			
	        
	        <!-- 业务单 附加信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillElseInfo" cellspacing="0" cellpadding="0">
	        		<tbody><tr>
	            		<th width="84px">业务来源：</th>
	            		<td width="286px">
	            			
	            			<select id="businessBill.introducerName" name="businessBill.introducerName">
	            				<s:iterator value="staffers" status="indexs">
	            					<option value="${id }">${stafferName }</option>
	            				</s:iterator>
	            			</select>
	            		</td>
	            		<th width="84px">安装要求：</th>
	            		<td width="359px">
	            			
	                		<input type="text" class="tbInfo2 TextBox " style="width:338px" maxlength="50" onkeyup="goNextInput(&#39;businessBill.ladingRequire&#39;);" id="businessBill.setupRequire" name="businessBill.setupRequire" value="">
	                		<script language="javascript">
								setFormErrorMsg('',9,'businessBill.setupRequire');
							</script>
	            			
	            		</td>
	            		<th width="84px">合计金额：</th>
	            		<td width="265px">
	            			
	            			<input type="text" class="tbInfo3 TextBox readonly" readonly="readonly" maxlength="10" name="" id="costTotal" value="0">
					        
	            		</td>
	        		</tr>
	        		<tr>
	            		<th>部门：</th>
			            
			            
            			
            			<td>
            				<select id="businessBill.departmentId" name="businessBill.departmentId" class="ddlInfo1">
                    			<s:iterator value="departments" status="indexs">
									<option value="${id }">${departmentName }</option>
                    			</s:iterator>
								
                			</select>
                			<script language="javascript">
						    	setFormErrorMsg('',10);
						    </script>
            			</td>
            			
            			<th>提货要求：</th>
            			
                		<td>
                			<input type="text" class="tbInfo2 TextBox " style="width:338px" maxlength="50" onkeyup="goNextInput(&#39;businessBill.address&#39;);" id="businessBill.ladingRequire" name="businessBill.ladingRequire" value="">
                			<script language="javascript">
					          	setFormErrorMsg('',11,'businessBill.ladingRequire');
					        </script>
                		</td>
            			
            			<th>优惠金额：</th>
            			
            			<td>
            				<input type="text" class="tbInfo3 TextBox " maxlength="10" name="favCostStr" id="favCostStr" value="0" onchange="doCount();">
            				
            				<a href="javascript:doFav();">抹零</a>
            				<a href="javascript:doRound();">四舍五入</a>
            				
            				<script language="javascript">
					          	setFormErrorMsg('',12,'favCostStr');
					        </script>
            			</td>
            			
        			</tr>
        			<tr>
            			<th>业务员：</th>
            			<td>
            				<select id="businessBill.managerName" name="businessBill.managerName">
	            				<s:iterator value="staffers" status="indexs">
	            					<option value="${id }">${stafferName }</option>
	            				</s:iterator>
	            			</select>
            			</td>
            			<th><span class="MustInput">*</span>交货日期：</th>
        				
    					<td>
    						<input type="text" class="tbBillDate TextBox " maxlength="15" onkeyup="goNextInput(&#39;businessBill.address&#39;);" id="deliverDateStr" name="businessBill.orderDate" value="2017-09-08">
    						<img src="img/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;deliverDateStr&#39;),&#39;yyyy-mm-dd&#39;,this);">
							<select id="deliverDateHourSelect" class="ddlDateHour" onchange="changeTimeSelect(this,&#39;deliverDateHour&#39;);">
                				<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11" selected="">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<select id="deliverDateMinuteSelect" class="ddlDateMinute" onchange="changeTimeSelect(this,&#39;deliverDateMinute&#39;);">
                				<option value="00">00</option><option value="01">01</option><option value="02" selected="">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
							<a href="javascript:setDate(&#39;TOMORROW&#39;);">明天</a>
							<a href="javascript:setDate(&#39;AFTER_TOMO&#39;);">后天</a>
							<script language="javascript">
						    	setFormErrorMsg('',14,'deliverDateStr');
						    </script>
    					</td>
    					
        				<th>折后金额：</th>
        				
        				<td>
        					<input type="text" class="tbInfo3 TextBox readonly" readonly="readonly" maxlength="10" name="businessBill.cost" id="businessBill.cost" value="0">
        					<script language="javascript">
						    	setFormErrorMsg('',15,'businessBill.cost');
						    </script>
        				</td>
        				
    				</tr>
    				<tr>
        				<th>跟单员：</th>
        				<td>
        					<select id="businessBill.followerNameStr" name="businessBill.followerNameStr">
	            				<s:iterator value="staffers" status="indexs">
	            					<option value="${id }">${stafferName }</option>
	            				</s:iterator>
	            			</select>
        				</td>
        				<th>送货地址：</th>
        				
        				<td>
        					<input type="text" class="tbInfo2 TextBox " style="width:338px" maxlength="250" onkeyup="goNextInput(&#39;businessBill.content&#39;);" id="businessBill.address" name="businessBill.address" value="">
        					<script language="javascript">
				          		setFormErrorMsg('',17,'businessBill.address');
				          	</script>
        				</td>
        				
        				<th>预付款：</th>
        				
        				<td>
        					<input type="text" class="tbInfo3 TextBox " maxlength="10" id="imprestStr" name="imprestStr" value="0">
        					<script language="javascript">
				          		setFormErrorMsg('',18,'imprestStr');
				          	</script>
        				</td>
        				
    				</tr>
    				<tr>
        				<td colspan="4"><div class="Divider1280"></div></td>
        				<th>付款方式：</th>
        				
        				<td>
        					<select id="businessBill.payModeId" name="businessBill.payModeId" class="ddlInfo3">
                				<s:iterator value="payModes" status="indexs">
                					<option value="${id }">${modeName }</option>
                				</s:iterator>
                				
                				
                				
            				</select>
            				<script language="javascript">
						    	setFormErrorMsg('',19);
						    </script>
        				</td>
        				
    				</tr>
    				<tr>
        				<th>设计类型：</th>
        				
        				<td>
        					<select class="ddlInfo1" id="businessBill.designType" name="businessBill.designType">
                				<option value="SELF">公司设计</option>
                				<option value="CLIENT">客户来稿</option>
            				</select>
        				</td>
        				
        				<th>摘要：</th>
        				
        				<td>
        					<input type="text" class="tbInfo2 TextBox " style="width:338px" maxlength="200" onkeyup="goNextInput(&#39;businessBill.mark&#39;);" id="businessBill.content" name="businessBill.content" value="">
        					<script language="javascript">
				          		setFormErrorMsg('',20,'businessBill.content');
				          	</script>
        				</td>
        				
        				<th>收款账户：</th>
        				
        				<td>
        					<select id="businessBill.bankAccountId" name="businessBill.bankAccountId" class="ddlInfo3_long">
                				
                				
            				</select>
            				<script language="javascript">
						    	setFormErrorMsg('',21);
						    </script>
        				</td>
        				
    				</tr>
    				<tr>
        				<th>设计员：</th>
        				<td>
        					<select  id="businessBill.designerNameStr" name="businessBill.designerNameStr">
	            				<s:iterator value="staffers" status="indexs">
	            					<option value="${id }">${stafferName }</option>
	            				</s:iterator>
	            			</select>
        				</td>
        				<th>备注：</th>
        				
        				<td>
        					<input type="text" class="tbInfo2 TextBox " style="width:338px" maxlength="200" id="businessBill.mark" name="businessBill.mark" value="">
        					<script language="javascript">
					          	setFormErrorMsg('',23,'businessBill.mark');
					        </script>
        				</td>
        				
        				<th><span class="MustInput">*</span>结账日期：</th>
        				
        				<td>
            				<input type="text" class="tbInfo3 TextBox" maxlength="15" id="checkDateStr" name="businessBill.checkDate" value="2017-09-08">
            				<img src="img/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;checkDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;checkDateStr&#39;));">
            				<script language="javascript">
					       		setFormErrorMsg('',24,'checkDateStr');
					        </script>
        				</td>
        				
    				</tr>
    			</tbody></table>
    		</div>
        	
        	<!-- 业务单 附件 -->
    		<br>
    		<div class="BillNotes">
                <span>开单人：杨海波 2017-09-08 11:02</span>
                <span>审核人：</span>
                <span>结清： </span>
                <span>最后打印：</span>
                <span>修改人：</span>
                <span>单据帐套：网络公司</span>
			    	<script language="javascript">
			          	setFormErrorMsg('',1);
			    	</script>
			</div>
		</div>
		
		<!-- 业务单 底栏按钮 -->
		<div class="Footer">
			<div id="buttonDiv">
				
	            <input type="submit" class="buttom-a" value=" 保 存 ">
	            <input type="hidden" name="continue_flag" id="continue_flag" value="">
				
	            <input type="button" class="buttom-a" value=" 保存并新增 " onclick="doSave(&#39;NEW&#39;);">
	            <input type="button" class="buttom-a" value=" 保存并关闭 " onclick="doSave(&#39;CLOSE&#39;);">
	            <input type="button" class="buttom-a" value=" 保存并打印 " onclick="doSave(&#39;PRINT&#39;);">
				
	            <input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
	            <input type="hidden" id="tmpCode" name="tmpCode" value="22_1504839745332">
	            <input type="hidden" id="orderDateHour" name="orderDateHour" value="11">
	            <input type="hidden" id="orderDateMinute" name="orderDateMinute" value="02">
	            <input type="hidden" id="deliverDateHour" name="deliverDateHour" value="11">
	            <input type="hidden" id="deliverDateMinute" name="deliverDateMinute" value="02">
	            <input type="hidden" id="canSelectContact" name="canSelectContact" value="Y">
	            <input type="hidden" id="estMngId" name="estMngId" value="-1">
			</div>
			<div id="waitDiv" style="display:none">
    			<span>请稍候...</span>
			</div>
		</div>
		
	</div>
	</form>
</div>

<div id="LoadProcess" style="position:absolute; left:50%;top:50%; width:200px; height:100px; margin-top:-50px;margin-left:-100px;z-index:1; border:solid #000 5px;background-color:White;display:none">
	<table border="0" align="center" style="height:100%;">
		<tbody><tr>
			<td style="valign:middle">
				<img src="img/loading.gif">
				请稍候...
			</td>
		</tr>
	</tbody></table>
</div>


</body></html>