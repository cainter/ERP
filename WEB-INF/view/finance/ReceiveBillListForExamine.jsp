<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0063)http://115.28.87.22:8888/finance/ReceiveBillListForExamine.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>收款单审核 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doShow(id){
		var url="finance/ReceiveBillInfoForExamine.html?id="+id;
		ShowIframe("收款单审核",url,900,500,"refreshWin()",900,600);
	}
	function refreshWin(){
		if(popRetVal!=null){
			window.location=window.location;
		}
	}
	function doExamineCallBack(id){
		if(popRetVal!=null){
			var url="finance/ReceiveBillExamine.html?id_str="+id+"&flag=1";
			ShowIframe("收款单审核",url,200,200,"refreshWin()");
		}
	}
	function doExamine(id){
		ShowConfirm('确认框','确定审核通过吗？',340,80,"doExamineCallBack('"+id+"',)");
	}
	function doMutiExamine(){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		var cost=0;
		for (i=0;i<ob_arr.length;i++){
			if ((ob_arr[i].checked == true)){
				if(str!=""){
					str=str+";";
				}
				str = str+ob_arr[i].value;
				cost = addMul(cost,ob_arr[i].getAttribute("cost"));
			}
		}
		if(str!=""){
			ShowConfirm('确认框','收款合计'+cost+'元，确定审核通过吗？',340,80,"doExamineCallBack('"+str+"')");
		}else{
			ShowAlert('提示框','请选择要审核的单据',200,100);
		}
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var tsId=document.getElementById("ts_id").value;
		window.location="finance/ReceiveBillListForExamine.html?ts_id="+tsId+"&search_key="+searchKey;
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="finance/ReceiveBillListForExamine.html?ts_id=1&search_key="+searchKey+"&current_page="+pageIndex;
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
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet" style="text-align:center">
<div class="sheet-main" style="width:860px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>收款单审核</h2>
      <p>在这里可以对所有未审核的收款单进行审核操作</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
      <div class="content">
        <table width="748">
          <tbody>
            <tr>
              <td>
              	<div align="right">
					<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="">
					<select name="ts_id" id="ts_id">
						<option value="0">==请选择账套==</option>
						
						<option value="1" selected="">新异</option>
						
						<option value="2">网络公司</option>
						
			  		</select>
					<input type="button" value=" 查 询" onclick="doSearch();" class="buttom search-but"> 
					<input type="button" class="buttom  search-audit" value=" 审核通过" onclick="doMutiExamine();">       
				</div>
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
	  <div class="cue-info">
		<span>金额合计：19006.00元</span>
	  </div>
     <div class="table-list">
        <table width="100%">
          <tbody><tr>   
		  	<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
			<th width="14%">单号</th>
			<th width="10%">收款日期</th>
			<th width="18%">付款单位</th>
			<th width="10%">金额（元）</th>						
			<th width="20%">摘要</th>								
			<th width="10%">经办人</th>
			<th width="18%">操作</th>
			</tr>
			
			<s:iterator value="receiveBills" status="indexs">
				<tr class="query_list_data_tr1" index="9" style="cursor:pointer;" ondblclick="javascript:DoubleClick(this)" onclick="javascript:ClickCheck(this,true)" onmouseout="javascript:mouseout(this)" onmouseover="javascript:mouseover(this)">
					<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1856" cost="99.00"></td>
					<td>${billCode }</td>
					<td>${receiveDate }</td>
					<td>
						<s:iterator value="departments" status="indexs">
							<c:if test="${id == departmentId }">
								${departmentName }
							</c:if>
						</s:iterator>
					</td>
					<td>${cost }</td>
					<td>${mark }</td>
					<td>${managerName }</td>
					<td>
						<a href="ReceiveBill_receiveBillExmin?receiveBill.id=${id }">审核通过</a>
						<a href="javascript:doShow(&#39;1856&#39;);">查看</a>
						
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