<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="inc/TagLibs.jsp"%>
<c:set var="pageTitle" value="外协单作废" />
<%@ include file="inc/Title.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<script language="javascript">
	function doCancel(){
		parent.ClosePop();
	}
	function doDisabled(id){
		window.location = "/system/CancelReasonNew.ihtm?id="+id+"&cancel_type=cooper";
	}
	function doInit(){
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet modal-dialog" style=" padding-top:10px;" >
<div class="sheet-main" id="bodyDiv" style="width:860px;">
  <div class="sheet-list" style="width:100%">
    <div class="modal-main search-business">
		<div style="width:100%;">
		 	<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
 				<tr>
 					<td style="width:33%" rowspan="2"></td>
 					<td style="width:33%;text-align:center" rowspan="2"><h2>外协单作废</h2></td>
 					<td style="width:34%" class="tr">
 						编号：${record.cooperBill.billCode}
 					</td>
 				</tr>
 				<tr>
 					<td class="tr">外协日期：<fmt:formatDate value="${record.cooperBill.cooperDate}" pattern="yyyy-MM-dd HH:mm"/></td>
 				</tr>
 			</table>
 			
 			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			    <tr>
 					<td class="InfoTitleDivider"></td>
 				</tr>
			</table>
 			
			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
				<tr>
			      	<th style="width:8%">外协单位：</th>
			      	<td style="width:24%">${record.cooperatorName}</td>
			      	<th style="width:8%">联系人：</th>
			     	<td style="width:16%">${record.cooperBill.linkman}</td>
			     	<th style="width:6%">电话：</th>
			     	<td style="width:16%">${record.cooperBill.phone}
			    	<td class="tr" style="width:22%">地址：${record.cooperBill.address}</td>
			    </tr>
			</table>
			
			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			    <tr>
 					<td class="InfoTitleDivider"></td>
 				</tr>
			</table>
								
			<%@ include file="inc/CooperBillItemList.jsp"%>
			
			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			    <tr>
 					<td class="InfoTitleDivider"></td>
 				</tr>
			</table>
						
			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-a2 BillElseInfo">
				<tr>
					<th>部门：</th>
		      		<td >${record.departmentName}</th>
					<th>交货要求：</th>
		      		<td >${record.cooperBill.gatherRequire}</td>
					<th>优惠金额：</th>
		     		<td >${record.cooperBill.favCost}</td>
				</tr>
				<tr>
					<th>业务员：</td>
		      		<td >${record.cooperBill.managerName}</td>
		      		<th>安装要求：</th>
		      		<td >${record.cooperBill.setupRequire}</td>
		      		<th>折后金额：</td>
		     		<td>${record.cooperBill.cost}</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
        			<td>&nbsp;</td>
        			<th>交货日期：</th>
		    		<td ><c:if test="${record.cooperBill.gatherDate!=null}"><fmt:formatDate value="${record.cooperBill.gatherDate}" pattern="yyyy-MM-dd HH:mm"/></c:if></td>
		    		<th>预付款：</th>
		      		<td >${record.cooperBill.imprest}</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center"><div class="InfoDetailDivider"></div></td>
					<th>付款方式：</th>
			      	<td >${record.payModeName}</td>
				</tr>
				<tr>
					<th>摘要：</th>
		      		<td >${record.cooperBill.content}</td>
		      		<th>备注：</th>
		      		<td >${record.cooperBill.mark}</td>
		      		<th>付款账户：</th>
		      		<td >${record.bankAccountName}</td>
				</tr>
			</table>
			
			<c:if test="${fn:length(record.accessories)>0}">
			
			<table border="0" cellspacing="0" cellpadding="0" align="center" class="table-0">
			    <tr>
 					<td class="InfoTitleDivider"></td>
 				</tr>
			</table>
			
			<div class="table-list">	
			<table border="0" cellspacing="0" cellpadding="0" align="center" width="98%" >
				<tr>
					<th width="24%">文件</th>
					<th width="24%">资料路径</th>
					<th width="24%">文件说明</th>
					<th width="10%">上传人</th>
					<th width="14%">上传时间</th>
					<th width="4%">操作</td>
				</tr>
				<c:forEach var="item" items="${record.accessories}" varStatus="i">
				<tr>
					<td >
						<c:if test="${item.fileName!=null && item.fileName!=''}"><a href="${item.fileName}" target="_blank">${item.sourceName}</a></c:if>
						<c:if test="${item.fileName==null || item.fileName==''}">${item.sourceName}</c:if>
					</td>
					<td >${item.customPath}</td>
					<td >${item.mark}</td>
					<td >${item.createrName}</td>
					<td ><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td >
						<c:if test="${item.fileName!=null && item.fileName!=''}"><a href="javascript:doDownload('${item.fileName}','${item.sourceName}');">下载</a></c:if>
						<c:if test="${item.fileName==null || item.fileName==''}">下载</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			</c:if>
			
			<div class="blank12">&nbsp;</div>
			<p class="give">
				<span>开单人：${record.cooperBill.createrName} <c:if test="${record.cooperBill.createTime!=null}"><fmt:formatDate value="${record.cooperBill.createTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></span>
				<span>审核人：<c:if test="${record.cooperBillExt.examinerId!=0}">${record.cooperBillExt.examinerName} <c:if test="${record.cooperBillExt.examineTime!=null}"><fmt:formatDate value="${record.cooperBillExt.examineTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></c:if></span>
				<span>修改人：<c:if test="${record.cooperBill.modifierId!=0}">${record.cooperBill.modifierName} <fmt:formatDate value="${record.cooperBill.modifyTime}" pattern="yyyy-MM-dd HH:mm"/></c:if></span>
				<span>单据帐套：${record.tallySetName}</span>
			</p>
		</div>
  	</div>
  </div>
	<div class="modal-buttom">
		<input type="button" class="buttom-a" value=" 作 废 " onClick="doDisabled('${record.cooperBill.id}');">
		<input type="button" class="buttom-a" value=" 退 出 " onClick="doCancel();">
	</div>  
</div>
</body>
</html>