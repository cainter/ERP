<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0054)http://115.28.87.22:8888/business/ReceivableCount.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
			<meta http-equiv="Expires" content="0">
				<title>应收汇总表 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title> <script
					src="js/minierp.js"></script>

				<link rel="stylesheet" type="text/css" href="css/base.css">
					<link href="css/Query.css" rel="stylesheet" type="text/css">
						<script src="js/QueryList.js"></script>
						<script src="js/popup_ext.js"></script>
						<script language="javascript">
							function doSearch() {
								var year = document.getElementById("year").value;
								if (year == null || year == '') {
									ShowAlert('提示框', '请选择年份', 200, 100);
									return;
								}
								var tsId = document.getElementById("ts_id").value;
								window.location = "business/ReceivableCount.html?year="
										+ year + "&ts_id=" + tsId;
							}
							function getSearchCondition() {
								var str = "year=2017&ts_id=1";
								return str;
							}
							function doCancel() {
								window.close();
							}
							function doInit() {
								Window_Onload();
							}
							function doDownload() {
								var str = getSearchCondition();
								window.location = "business/ReceivableCount.html?content_type=EXCEL&"
										+ str;
							}
							function getEndDate(month) {
								if (month == 0) {
									month = 12;
								}
								var d = new Date(2017, month, 1);//下月的1号（month从0开始的）
								d.setDate(d.getDate() - 1);
								return d.getFullYear() + "-"
										+ (d.getMonth() + 1) + "-"
										+ d.getDate();
							}
							function getStartDate(month) {
								if (month == 0) {
									return "2017-01-01";
								} else {
									return "2017-" + month + "-01";
								}
							}
							function showBusList(month) {
								var startDate = getStartDate(month);
								var endDate = getEndDate(month);
								var str = "search_type=1&cb_order_date=1&start_date="
										+ startDate
										+ "&end_date="
										+ endDate
										+ "&cb_examine=1&examined=Y";
								var tsId = "1";
								if (tsId != "" && tsId != "0") {
									str = str + "&cb_ts=1&ts_id=" + tsId;
								}
								showWin(1280, 800,
										"business/BusinessBillSearchResult.html?"
												+ str);
							}
							function showReceivableList(month) {
								var startDate = getStartDate(month);
								var endDate = getEndDate(month);
								var str = "search_type=1&cb_order_date=1&start_date="
										+ startDate + "&end_date=" + endDate;
								var tsId = "1";
								if (tsId != "" && tsId != "0") {
									str = str + "&cb_ts=1&ts_id=" + tsId;
								}
								showWin(1024, 600,
										"business/BusinessBillListForReceive.html?"
												+ str);
							}
						</script>
</head>


<body oncontextmenu="return false" onload="doInit();" class="sheet"
	style="text-align: center;">
	<div class="sheet-main"
		style="width: 860px; text-align: left; margin: auto;">
		<div class="sheet-top">
			<div class="content">
				<h2>应收汇总表</h2>
				<p>统计每月营业额的已收款、应收款</p>
			</div>
		</div>
		<div class="sheet-list">
			<div class="search-business">
				<div class="content">
					<table width="100%">
						<tbody>
							<tr>
								<td align="right">年度： <select name="year" id="year">

										<option value="2010">2010</option>

										<option value="2011">2011</option>

										<option value="2012">2012</option>

										<option value="2013">2013</option>

										<option value="2014">2014</option>

										<option value="2015">2015</option>

										<option value="2016">2016</option>

										<option value="2017" selected="">2017</option>

								</select> 账套： <select name="ts_id" id="ts_id">
										<option value="0">==请选择账套==</option>

										<option value="1" selected="">新异</option>

										<option value="2">网络公司</option>

								</select> <input type="button" value=" 查 询" onclick="doSearch();"
									class="buttom search-but"> <a
										href="javascript:showWin(1024,600,&#39;business/ReceivableList.html&#39;);">按客户查询应收款</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-list">
					<table width="100%">
						<tbody>
							<tr>
								<th width="12%">月份</th>
								<th width="22%">+合同金额</th>
								<th width="22%">+调账金额</th>
								<th width="22%">-已收金额</th>
								<th width="22%">=当月应收款</th>
							</tr>

							<s:iterator value="businessBills" var="businessBill">
								<tr class="query_list_data_tr2" index="12"
									style="cursor: pointer;" onmouseout="javascript:mouseout(this)"
									onmouseover="javascript:mouseover(this)">
									<td><input type="radio" name="query_checkbox" value="12"
										style="display: none"> ${billCode } </td>
									<td><a href="javascript:showBusList(12);">${amount }</a></td>
									<td>${cost }</td>
									<td>${square }</td>
									<td><a href="javascript:showReceivableList(12);">${lengM }</a></td>
								</tr>
							</s:iterator>
							<tr>
								<th>合计</th>
								<th><a href="javascript:showBusList(0);">2147036.6</a></th>
								<th>-765</th>
								<th>984619.6</th>
								<th><a href="javascript:showReceivableList(0);">1161652</a></th>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


</body>
</html>