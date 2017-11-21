<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0067)http://115.28.87.22:8888/finance/LoanBillListForCancel.html?type=IN -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
			<meta http-equiv="Expires" content="0">
				<title>资金借入单作废 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title> <script
					src="js/minierp.js"></script>
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<%@ taglib prefix="s" uri="/struts-tags"%>
				<link rel="stylesheet" type="text/css" href="css/base.css">
					<link href="css/Query.css" rel="stylesheet" type="text/css">
						<script src="js/QueryList.js"></script>
						<script src="js/jquery.js"></script>
						<script src="js/popup_ext.js"></script>
						<script language="javascript">
							function doShow(id) {
								var url = "finance/LoanBillInfoForCancel.html?id="
										+ id;
								ShowIframe("资金借入单作废", url, 900, 300,
										"refreshWin()", 900, 600);
							}
							function refreshWin() {
								if (popRetVal != null) {
									window.location = window.location;
								}
							}
							function doDisabled(id) {
								var url = "system/CancelReasonNew.html";
								ShowIframe("资金借入单作废", url, 600, 260,
										"doDisabledCallback(" + id + ")");
							}
							function doDisabledCallback(id) {
								if (popRetVal != null) {
									$.post("finance/LoanBillCancel.html", {
										id : id,
										reason : popRetVal,
										show_aler : "Y"
									}, function(data, status) {
										parseDisaData(data, status);
									});
								}
							}
							function parseDisaData(data, status) {
								if (status == "success") {
									window.location = window.location;
								} else {
									ShowAlert('提示框', '系统错误：' + status, 200, 100);
								}
							}
							function doSearch() {
								var searchKey = encodeURIComponent(document
										.getElementById("search_key").value
										.trim());
								var type = "IN";
								var tsId = document.getElementById("ts_id").value;
								window.location = "finance/LoanBillListForCancel.html?ts_id="
										+ tsId
										+ "&type="
										+ type
										+ "&search_key=" + searchKey;
							}
							function doGo(pageIndex) {
								var searchKey = encodeURIComponent("");
								var type = "IN";
								window.location = "finance/LoanBillListForCancel.html?ts_id=1&type="
										+ type
										+ "&search_key="
										+ searchKey
										+ "&current_page=" + pageIndex;
							}
							function doJump(pageIndex) {
								if (window.event.keyCode == 13) {
									doGo(pageIndex);
								}
							}
							function DoubleClick(it) {
								var ob_arr = document
										.getElementsByName("query_checkbox");
								var str = "";
								if (ob_arr.length >= it.getAttribute("index")) {
									str = ob_arr[it.getAttribute("index") - 1].value;
								}
								if (str == "") {
									return;
								}
								doShow(str);
							}
							function doCancel() {
								window.close();
							}
							function doInit() {
								Window_Onload();
								document.getElementById("search_key").focus();
							}
							function checkSearchKey() {
								if (window.event.keyCode == 13) {
									doSearch();
								}
							}
						</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet"
	style="text-align: center;">
	<div class="sheet-main"
		style="width: 860px; text-align: left; margin: auto;">
		<div class="sheet-top">
			<div class="content">
				<h2>资金借入单作废</h2>
				<p>资金借入单作废相当于删除操作，一旦作废，该资金借入单将不可以恢复</p>
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
										<input type="text" class="TextBox" id="search_key"
											name="search_key" onkeyup="checkSearchKey();" value=""
											title="以经办人、单号进行模糊查询"> <select name="ts_id"
											id="ts_id">
												<option value="0">==请选择账套==</option>

												<option value="1" selected="">新异</option>

												<option value="2">网络公司</option>

										</select> <input type="button" value=" 查 询" onclick="doSearch();"
											class="buttom search-but" title="以经办人、单号进行模糊查询">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<table width="98%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr id="errorMsgTr" style="display: none">
							<td>
								<div class="msg-error" id="errorMsgTd"></div>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="TopToolBar">
					<table class="ListNoteInfo" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td>金额合计：0元</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="table-list">
					<table width="100%">
						<tbody>
							<tr>
								<th width="15%">单号</th>
								<th width="10%">日期</th>
								<th width="12%">借款人</th>
								<th width="10%">金额</th>
								<th width="27%">摘要</th>
								<th width="9%">经办人</th>
								<th width="7%">状态</th>
								<th width="10%">操作</th>
							</tr>

							<s:iterator value="loanBills" var="loanBill">
								<tr>
									<td>${billCode }</td>
									<td><s:date name="feeDate" format="yyyy-MM-dd"></s:date></td>
									<td>${receiverName }</td>
									<td>${cost }</td>
									<td>${mark }</td>
									<td>${managerName }</td>
									<td><s:if test=' #incomeBill.examined.equals("Y") '>
										已审核
										</s:if> <s:elseif test=' #incomeBill.examined.equals("N") '>
　　										未审核
										</s:elseif></td>
									<td>
										<a href="Accounts_disabledInLoanBill?loanBill.id=${ id }">作废</a>
										<a href="Accounts_toDisabledInLoanBill?loanBill.id=${id }">查看</a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>

					<div class="table-bot">



						<img src="images/but001.gif"> <img src="images/but002.gif">

								第 <input type="text" name="pageNumber" style="width: 30px"
								value="0" onkeydown="javascript:doJump(this.value);"
								class="TextBox"> 页 共0页 <img src="images/but003.gif">
										<img src="images/but004.gif">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>