<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0055)http://115.28.87.22:8888/finance/BusinessDateCount.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>销售日报表 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doSearch(){
		var startDate=document.getElementById("start_date").value;
		var endDate=document.getElementById("end_date").value;
		var tsId=document.getElementById("ts_id").value;
		
		if(startDate!=null && startDate!=''){
			var arr=startDate.split("-");
			if(arr.length==null || arr.length!=3){
				ShowAlert('提示框','开始日期格式不正确',200,100);
				return;
			}else if(isNaN(arr[0]) || isNaN(arr[1]) || isNaN(arr[2])){
				ShowAlert('提示框','开始日期格式不正确',200,100);
				return;
			}
		}else{
			ShowAlert('提示框','请选择开始日期',200,100);
			return;
		}
		if(endDate!=null && endDate!=''){
			var arr=endDate.split("-");
			if(arr.length==null || arr.length!=3){
				ShowAlert('提示框','结束日期格式不正确',200,100);
				return;
			}else if(isNaN(arr[0]) || isNaN(arr[1]) || isNaN(arr[2])){
				ShowAlert('提示框','结束日期格式不正确',200,100);
				return;
			}
		}else{
			ShowAlert('提示框','请选择结束日期',200,100);
			return;
		}
		
		window.location="finance/BusinessDateCount.html?start_date="+startDate+"&end_date="+endDate+"&ts_id="+tsId;
	}
	
	function getSearchCondition(){
		var startDate="2017-07-09";
		var endDate="2017-07-09";
		var tsId="1";
		var str="start_date="+startDate+"&end_date="+endDate+"&ts_id="+tsId;
		return str;
	}
	function doPrint(){
		var str=getSearchCondition();
		showWin(900,600,"finance/BusinessDateCount.html?content_type=PRINT&"+str);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		Window_Onload();
	}
	function checkInput(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function showEstBusCount(){
		var startDate="2017-07-09";
		var endDate="2017-07-09";
		var tsId="1";
		var str="search_type=1&cb_order_date=1&start_date="+startDate+"&end_date="+endDate;
		if(tsId!="" && tsId!="0"){
			str=str+"&cb_ts=1&ts_id="+tsId;
		}
		showWin(1024,600,'business/EstBusinessCount.html?'+str);
	}
	function showEstBackCount(){
		var startDate="2017-07-09";
		var endDate="2017-07-09";
		var tsId="1";
		var str="search_type=1&cb_order_date=1&start_date="+startDate+"&end_date="+endDate;
		if(tsId!="" && tsId!="0"){
			str=str+"&cb_ts=1&ts_id="+tsId;
		}
		showWin(1024,600,'finance/EstBackCount.html?'+str);
	}
	function showRecItemList(receType){
		var startDate="2017-07-09";
		var endDate="2017-07-09";
		var tsId="1";
		var str="search_type=1&cb_rece_date=1&start_date="+startDate+"&end_date="+endDate;
		if(tsId!="" && tsId!="0"){
			str=str+"&cb_ts=1&ts_id="+tsId;
		}
		if(receType!=null && receType!=""){
			str=str+"&cb_rece_type=1&rece_type="+receType;
		}
		showWin(1280,600,'finance/ReceiveBillItemSearchResult.html?'+str);
	}
	function showBackCostList(backType){
		var startDate="2017-07-09";
		var endDate="2017-07-09";
		var tsId="1";
		var str="search_type=1&cb_back_date=1&start_date="+startDate+"&end_date="+endDate;
		if(tsId!="" && tsId!="0"){
			str=str+"&cb_ts=1&ts_id="+tsId;
		}
		if(backType!=null && backType!=""){
			str=str+"&cb_back_type=1&back_type="+backType;
		}
		showWin(1024,600,'finance/BackCostList.html?'+str);
	}
	function setDate(type){
		var d=new Date();
		var startStr="";
		var endStr="";
		if(type=="CURRENT_MONTH"){
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-01";
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="PREVIEW_MONTH"){
			d=new Date(d.getFullYear(),d.getMonth(),1);
			d.setDate(d.getDate()-1);
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-1";
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="TODAY"){
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="YESTERDAY"){
			d.setDate(d.getDate()-1);
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}
		document.getElementById("start_date").value=startStr;
		document.getElementById("end_date").value=endStr;
	}
</script>
</head>


<body class="sheet" style="text-align:center;">
<div class="sheet-main" style="width:860px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>销售日报表</h2>
      <p>统计指定期间的合同金额与回款、合同单数、预付单数、结欠单数</p>
    </div>
  </div>
  <div class="sheet-list">
    	<div class="search-business">
	      <div class="content">
	        <table width="100%">
	          <tbody>
	            <tr>
	              <td align="right">
					日期：
					<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" id="start_date" name="start_date" value="2017-07-09">
					<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;start_date&#39;),&#39;yyyy-mm-dd&#39;,this);">
					至<input class="TextBox Datetime" type="text" maxlength="15" onkeyup="checkInput();" id="end_date" name="end_date" value="2017-07-09">
					<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;end_date&#39;),&#39;yyyy-mm-dd&#39;,this);">											
					<a href="javascript:setDate(&#39;CURRENT_MONTH&#39;);">本月</a>
					<a href="javascript:setDate(&#39;TODAY&#39;);">今天</a>
					<a href="javascript:setDate(&#39;YESTERDAY&#39;);">昨天</a>
					<a href="javascript:setDate(&#39;PREVIEW_MONTH&#39;);">上月</a>
					<select name="ts_id" id="ts_id">
						<option value="0">==请选择帐套==</option>
						
							<option value="1" selected="">新异</option>
						
							<option value="2">网络公司</option>
						
		  			</select>
					<input type="button" value=" 查 询" onclick="doSearch();" class="buttom search-but">
					<input type="button" value=" 打 印" onclick="doPrint();" class="buttom search-print">
				   </td>
	            </tr>    
	            </tbody>      
	        </table>      	 
	      </div>

	      <div class="table-list">					
			  <table width="100%">
			    
				<tbody><tr>
					<th width="50%"><div align="left">&nbsp;&nbsp;合同金额：<a>${cost }</a></div></th>
					<th width="50%"><div align="left">&nbsp;&nbsp;回款金额：<a href="javascript:showEstBackCount();">0</a></div></th>
				</tr>
				
				
				<tr>
					<td width="50%">
						<div align="left">
						&nbsp;&nbsp;------&nbsp;当期应收款：0
						<br><br>
						&nbsp;&nbsp;------&nbsp;合同单数：${inComeBillNum }笔
						</div>
					</td>
					<td width="50%">
						<div align="left">
						&nbsp;&nbsp;------&nbsp;预付金额：<a href="javascript:showBackCostList(&#39;IMPREST&#39;);">0</a>
						&nbsp;&nbsp;预付单数：<a href="javascript:showBackCostList(&#39;IMPREST&#39;);">0</a>笔
						<br><br>
						&nbsp;&nbsp;------&nbsp;结欠金额：<a href="javascript:showRecItemList(&#39;&#39;);">0</a>
						&nbsp;&nbsp;结欠单数：<a href="javascript:showRecItemList(&#39;&#39;);">0</a>笔
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;------&nbsp;当月回款：<a href="javascript:showRecItemList(&#39;MONT&#39;);">0</a>
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;------&nbsp;历史回款：<a href="javascript:showRecItemList(&#39;HIST&#39;);">0</a>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="left">
						<br><br>
						<span class="give">注：1. 当期应收款：合同金额 + 调账金额 – 已收金额 2. 结欠金额：收到之前业务单的欠款 3. 结欠单数：结欠的业务单单数  4.  当月回款：当月业务单产生的回款  5. 历史回款：其他月份业务单产生的回款</span>
						</div>
					</td>
				</tr>
			  </tbody></table>
			</div>
		
 		</div>
  </div>
<div>

</div></div></body></html>