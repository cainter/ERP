<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0060)http://115.28.87.22:8888cooper/CooperBillListForCancel.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<%@include file="inc/TagLibs.jsp"%>
<c:set var="pageTitle" value="调拨单作废" />
<%@include file="inc/Title.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<script language="javascript">
	function doCancel(){
		parent.ClosePop();
	}
	function doDisabled(id){
		window.location = "/system/CancelReasonNew.ihtm?id="+id+"&cancel_type=alloBill";
	}
</script>
</head>
<body oncontextmenu="return false" class="sheet modal-dialog" style=" padding-top:10px;">
<div class="sheet-main" id="bodyDiv" style="width:860px;">
<form name="frm" method="post">
  <div class="sheet-list" style="width:100%">
    <div class="modal-main search-business">
    	<div style="width:100%;">
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			<tr>
				<td style="width:33%" rowspan="2"></td>
				<td style="width:33%;text-align:center" rowspan="2"><h2>调拨单作废</h2></td>
				<td style="width:34%" class="tr">
					编号：${record.billCode}
				</td>
			</tr>
			<tr>
				<td class="tr">调拨日期：<fmt:formatDate value="${record.alloDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
		    <tr>
				<td class="InfoTitleDivider"></td>
			</tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-a2">
			<tr>
		      	<th>调出仓库：</th>
		      	<td><commonTag:showSimpleObjectName list="${stoList}" objectId="${record.fromStoId}" /></td>
		      	<th>调入仓库：</th>
		     	<td><commonTag:showSimpleObjectName list="${stoList}" objectId="${record.toStoId}" /></td>
		     	<th>经办人：</th>
		     	<td>${record.managerName}</td>
		    </tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
		    <tr>
				<td class="InfoTitleDivider"></td>
			</tr>
		</table>
		
		<div class="table-list">
			<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" id="itemTbl">
				<tbody id="itemRowTbl">
				<tr>
					<th width="15%">材料编号</th>
					<th width="25%">品名规格</th>
					<th width="10%">单位</th>
					<th width="10%">数量</th>
					<th width="10%">单价</th>
					<th width="10%">金额</th>
					<th width="20%">备注</th>
				</tr>
				<c:forEach var="item" items="${itemList}" varStatus="i">
				<tr>
					<td>${item.productCode}</td>
					<td>${item.productName}</td>
					<td>${item.unit}</td>
					<td><div align="right"><commonTag:parseBigDecimal source="${item.alloBillItem.amount}" /></div></td>
					<td><div align="right"><c:if test="${currentUser.user.userType==1 || fn:indexOf(currentUser.privs,';STOR_COST;')!=-1}"><commonTag:parseBigDecimal source="${item.unitPrice}" /></c:if></div></td>
					<td><div align="right"><c:if test="${currentUser.user.userType==1 || fn:indexOf(currentUser.privs,';STOR_COST;')!=-1}"><commonTag:parseBigDecimal source="${item.alloBillItem.cost}" /></c:if></div></td>
					<td>${item.alloBillItem.mark}</td>
				</tr>
				</c:forEach>
				</tbody>
		  	</table>
		</div>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
		    <tr>
				<td class="InfoTitleDivider"></td>
			</tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			<tr>
				<th style="width:9%">摘要：</th>
		    	<td style="width:91%">${record.description}</td>
			</tr>
			<tr>
				<th>备注：</th>
		    	<td>${record.mark}</td>
			</tr>
		</table>

		<div class="blank12">&nbsp;</div>
		<p class="give">
			<span>开单人：${record.createrName} <c:if test="${record.createTime!=null}"><fmt:formatDate value="${record.createTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></span>
    		<span>审核人：<c:if test="${record.examinerId!=0}">${record.examinerName} <c:if test="${record.examineTime!=null}"><fmt:formatDate value="${record.examineTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></c:if></span>
			<span>单据帐套：${ts.title}</span>
		</p>
		</div>
   	</div>
  </div>
	<div class="modal-buttom">
			<input type="button" class="buttom-a" value=" 作 废 " onClick="doDisabled('${record.id}');">
			<input type="button" class="buttom-a" value=" 退 出 " onClick="doCancel();">
	</div>  
</div>
</body>
</html>
