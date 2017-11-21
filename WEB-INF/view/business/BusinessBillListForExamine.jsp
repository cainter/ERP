<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0065)http://115.28.87.22:8888/business/BusinessBillListForExamine.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>业务单审核 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doShow(id){
		var url="business/BusinessBillInfoForExamine.html?id="+id;
		ShowIframe("业务单审核",url,1024,500,"refreshWin()",900,600);
	}
	function refreshWin(){
		if(popRetVal!=null){
			window.location=window.location;
		}
	}
	function doExamine(id){
		ShowConfirm('确认框','确定审核通过吗？',340,80,"doExamineCallBack('"+id+"')");
	}
	function doExamineCallBack(id){
		if(popRetVal!=null){
			var url="business/BusinessBillExamine.html?id_str="+id+"&flag=MULTI_EXA";
			ShowIframe("业务单审核",url,200,200,"refreshWin()");
		}
	}
	function doMutiExamine(){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		for (i=0;i<ob_arr.length;i++){
			if ((ob_arr[i].checked == true)){
				if(str!=""){
					str=str+";";
				}
				str = str+ob_arr[i].value;
			}
		}
		
		if(str!=""){
			doExamine(str);
		}else{
			ShowAlert('提示框','请选择要审核通过的业务单',200,100);
		}
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var costType=document.getElementById("cost_type").value;
		var tsId=document.getElementById("ts_id").value;
		window.location="business/BusinessBillListForExamine.html?ts_id="+tsId+"&cost_type="+costType+"&search_key="+searchKey;
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="business/BusinessBillListForExamine.html?ts_id=1&cost_type=&search_key="+searchKey+"&current_page="+pageIndex;
	}
	function doJump(pageIndex){
		if(window.event.keyCode==13){
			doGo(pageIndex);
		}
	}
	function DoubleClick(it){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		if(ob_arr.length>=it.getAttribute("index")){
			str=ob_arr[it.getAttribute("index")-1].value;
		}
		
		if(str==""){
			return;
		}
		doShow(str);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		//Window_Onload();
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doPrint(id,type){
		showWin(900,600,"business/BusinessBillPrint.html?id="+id+"&type="+type);
	}
	function showPrintSelect(id){
		ShowIframeNoScroll("选择打印类型","business/BusinessBillPrintSelect.html",240,280,"showPrintSelectCallBack("+id+")");
	}
	function showPrintSelectCallBack(id){
		if(popRetVal!=null){
			doPrint(id,popRetVal);
		}
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet" style="text-align:center">
<div class="sheet-main" style="width:860px;text-align:left;margin:auto">
  <div class="sheet-top">
    <div class="content">
      <h2>业务单审核</h2>
      <p>在这里可以对所有未审核的业务单进行审核操作，可以直接修改业务单</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
      <div class="content">
        <table width="748">
          <tbody>
            <tr>
				<td align="right">
	              <input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" style="width:100px" value="" title="以客户名称、客户拼音字头、摘要、业务单号进行模糊查询">
	              <select name="cost_type" id="cost_type">
	              	<option value="">==全部==</option>
	              	<option value="NOT_ZERO">金额不为0</option>
	              	<option value="ZERO">金额为0</option>
	              </select>
	              <select name="ts_id" id="ts_id">
					<option value="0">==请选择账套==</option>
					
					<option value="1" selected="">新异</option>
					
					<option value="2">网络公司</option>
					
		  		  </select>
	              <input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以客户名称、客户拼音字头、摘要、业务单号进行模糊查询">
	              <input type="button" class="buttom  search-audit" value=" 审核通过" onclick="doMutiExamine();">
				</td>
            </tr>    
           </tbody>      
        </table>
      </div>
	  
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
	  <div class="table-list">
        <table width="100%">      
				<tbody><tr>
					<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
					<th width="16%">单号</th>
					<th width="10%">订货日期</th>
					<th width="16%">订货单位</th>
					<th width="16%">摘要</th>
					<th width="10%">金额</th>
					<th width="10%">交货日期</th>
					<th width="14%">跟单员</th>
					<th width="8%">操作</th>
				</tr>
				
					
					<s:iterator value="businessBillVTOs" status="indexs">
					
						<tr class="query_list_data_tr1" index="1" style="cursor:pointer;" ondblclick="javascript:DoubleClick(this)" onclick="javascript:ClickCheck(this,true)" onmouseout="javascript:mouseout(this)" onmouseover="javascript:mouseover(this)">
							<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="3270"></td>
							<td>
								${businessBill.billCode }
							</td>
							<td>${businessBill.createTime }</td>
							<td>${establishment.estName }(${establishment.linkman })</td>
							<td>${businessBill.content }</td>
							<td>${businessBill.cost }</td>
							<td>
								${businessBill.orderDate }
							</td>
							<td>${businessBill.followerNameStr }</td>
							<td>
								<a href="BusinessBillVTO_examine?id=${businessBill.id }">审核通过</a>
								<br>
								<a href="javascript:doShow(&#39;3270&#39;);">查看</a>
								<a href="javascript:showPrintSelect(&#39;3270&#39;);">打印</a>
							</td>
						</tr>
			    	</s:iterator>
			</tbody></table>
				
    <div class="table-bot">
    	
    	
    	 
    	  <img src="images/but001.gif">
    	  <img src="images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="1" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共1页
		
		
        <img src="images/but003.gif">
        <img src="images/but004.gif">
		
    </div>
      </div>
    </div>
  </div>
</div>


</body></html>