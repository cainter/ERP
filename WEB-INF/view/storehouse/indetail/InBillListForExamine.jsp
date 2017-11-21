<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://115.28.87.22:8888/storehouse/InBillListForExamine.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>入库单审核 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doShow(id){
		var url="/storehouse/InBillInfoForExamine.ihtm?id="+id;
		ShowIframe("入库单审核",url,900,500,"refreshWin()",900,600);
	}
	function refreshWin(){
		if(popRetVal!=null){
			window.location=window.location;
		}
	}
	function doExamineCallBack(id){
		if(popRetVal!=null){
			var url="/storehouse/InBillExamine.ihtm?id_str="+id+"&flag=1";
			ShowIframe("入库单审核",url,200,200,"refreshWin()");
		}
	}
	function doExamine(id){
		ShowConfirm('确认框','确定审核通过吗？',340,80,"doExamineCallBack('"+id+"')");
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
			ShowAlert('提示框','请选择要审核的单据',200,100);
		}
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var tsId=document.getElementById("ts_id").value;
		window.location="inExamine_toInExamine?ts_id="+tsId+"&search_key="+searchKey;
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="inStoreExamine_toInStoreExamine?ts_id=1&search_key="+searchKey+"&current_page="+pageIndex;
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
      <h2>入库单审核</h2>
      <p>在这里可以对所有未审核的入库单进行审核操作</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
      <div class="content">
        <table width="100%">
          <tbody>
            <tr>
              <td align="right">
				<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="">
				<select name="ts_id" id="ts_id">
					<option value="0">==请选择账套==</option>
					
					<option value="1" selected="">新异</option>
					
					<option value="2">网络公司</option>
					
		  		</select>
				<input type="button" value=" 查 询" onclick="doSearch();" class="buttom search-but"> 
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
						<th width="12%">入库日期</th>
						<th width="14%">仓库名称</th>
						<th width="12%">入库类型</th>
						<th width="22%">供方单位</th>
						<th width="12%">经办人</th>
						<th width="12%">操作</th>
					</tr>
			    <!-- 前台迭代获得后台从数据库传过来的值 -->
				<s:iterator value="inBills" status="inBills">
				<tr>
				    <td></td>
					<td>${billCode }</td>
					<td>${inDate }</td>
					<td>
					   <s:iterator value="storehouses" status="storehouses">
					   		<c:if test="${storehouseId == id }">${stoName }</c:if>
					   </s:iterator>
					</td>
					<td>
					   <s:iterator value="inTypes" status="inTypes">
					   		<c:if test="${id == inTypeId }">${typeName }</c:if>
					   </s:iterator>
					</td>
					<td></td>
					<td>${managerName }</td>
					<td>
						<a href="">审核通过</a>
						<a href="">查看</a>
					</td>
				</tr>
				</s:iterator>
					
					
				</tbody></table>
				
    <div class="table-bot">
    	
    	
    	 
    	  <img src="images/but001.gif">
    	  <img src="images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="0" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共0页
		
		
        <img src="images/but003.gif">
        <img src="images/but004.gif">
		
    </div>
      </div>     
    </div>
  </div>
</div>


<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>