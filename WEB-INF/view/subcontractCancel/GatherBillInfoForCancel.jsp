<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="inc/TagLibs.jsp"%>
<c:set var="pageTitle" value="收货单作废" />
<%@ include file="inc/Title.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<script language="javascript">
	function doCancel(){
		parent.ClosePop();
	}
	function doDisabled(id){
		window.location = "/system/CancelReasonNew.ihtm?id="+id+"&cancel_type=gather";
	}
	function doInit(){
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet modal-dialog" style=" padding-top:10px;">
<div class="sheet-main" id="bodyDiv" style="width:860px;">
  <div class="sheet-list" style="width:100%">
    <div class="modal-main search-business">
    	<div style="width:100%;">
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			<tr>
				<td style="width:33%" rowspan="2"></td>
				<td style="width:33%;text-align:center" rowspan="2"><h2>收货单作废</h2></td>
				<td style="width:34%" class="tr">
					编号：${record.gatherBill.billCode}
				</td>
			</tr>
			<tr>
				<td class="tr">收货日期：<fmt:formatDate value="${record.gatherBill.gatherDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
		    <tr>
				<td class="InfoTitleDivider"></td>
			</tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			<tr>
		      	<th style="width:10%">外协单位：</th>
		      	<td style="width:22%">${record.cooperatorName}</td>
		      	<th style="width:8%">联系人：</th>
		     	<td style="width:16%">${record.gatherBill.linkman}</td>
		     	<th style="width:6%">电话：</th>
		     	<td style="width:16%">${record.gatherBill.phone}
		    	<td class="tr" style="width:22%">外协单号：${record.cbCode}</td>
		    </tr>
		</table>
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
		    <tr>
				<td class="InfoTitleDivider"></td>
			</tr>
		</table>
		
		<div class="table-list">
			<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" id="itemTbl" >
				<tbody id="itemRowTbl">
				<tr>
					<th width="10%">项目类型</th>
					<th width="15%">内容</th>
					<th width="15%">材质</th>
					<th width="15%">规格</th>
					<th width="25%">制作要求</th>
					<th width="10%">外协数量</th>
					<th width="10%">本次收货</th>
				</tr>
				<c:forEach var="item" items="${record.items}" varStatus="i">
				<tr>
					<td >${item.makeTypeName}</td>
					<td >${item.finishedContent}</td>
					<td >${item.productName}</td>
					<td >${item.specification}</td>
					<td >${item.makeRequire}</td>
					<td ><commonTag:parseBigDecimal source="${item.amountTotal}" /></td>
					<td ><commonTag:parseBigDecimal source="${item.gatherBillItem.amount}" /></td>
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
		
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-a2 BillElseInfo">
			<tr>
				<th>业务员：</th>
			    <td>${record.managerName}</td>
			    <th>摘要：</th>
			    <td>${record.gatherBill.content}</td>
			    <th>备注：</th>
			    <td>${record.gatherBill.mark}</td>
			</tr>
		</table>
		
		<div class="blank12">&nbsp;</div>
        <p class="give">
        	<span>开单人：${record.gatherBill.createrName} <c:if test="${record.gatherBill.createTime!=null}"><fmt:formatDate value="${record.gatherBill.createTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></span>
			<span>审核人：<c:if test="${record.gatherBill.examinerId!=0}">${record.gatherBill.examinerName} <c:if test="${record.gatherBill.examineTime!=null}"><fmt:formatDate value="${record.gatherBill.examineTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></c:if></span>
			<span>单据帐套：${record.tallySetName}</span>
         </p>
         </div>    	
    </div>
  </div>
	<div class="modal-buttom">
			<input type="button" class="buttom-a" value=" 作 废 " onClick="doDisabled('${record.gatherBill.id}');">
			<input type="button" class="buttom-a" value=" 退 出 " onClick="doCancel();">			
	</div>  
</div>
</body>
</html>
