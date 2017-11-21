<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0034)http://115.28.87.22:8888/Main.html -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<title>首页 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
	<script src="js/minierp.js"></script>

	<script src="js/popup_ext.js"></script>
	<script src="js/jquery.js"></script>
	<script language="javascript">
		function setIframeDisplay(flag) {
			//nnd,iframe里的东西在平板的触摸屏里模式窗的div挡不住,链接还是有效
			//只好在弹出模式框时隐藏一下iframe
			document.getElementById("MainFrame").style.display = flag;
		}

		function showTsSelect(needTsSelect) {
			if (needTsSelect != null && needTsSelect == "Y") {
				setIframeDisplay("none");
				var url = "system/UserTsSelect.html";
				ShowIframeNoScroll("选择当前帐套", url, 300, 200, "refreshTs()");
			}
		}

		function refreshTs() {
			if (popRetVal != null) {
				document.getElementById("df_ts_span").innerHTML = popRetVal.substring(0, 7);
			}
			setIframeDisplay("");
		}

		function doLogout() {

			setIframeDisplay("none");
			ShowConfirmWithMark('确认框', '是否自动备份数据库？', 340, 80, "doLogoutBackup()",
				'<a href="http://www.ekingcn.com/school/cjwtjjff_1753_253.html" target="_blank">如何设置双重备份到云盘<img src="images/play_button.gif"></a>'
			);

		}

		function doLogoutBackup() {
			if (popRetVal != null) {
				var url = "system/DbBackupNew.html";
				ShowIframe("数据备份", url, 400, 200, "doLogoutCallBack()");
			} else {
				window.location = "/Logout.html";
			}
		}

		function doLogoutCallBack() {
			window.location = "/Logout.html";
		}

		function doCommNew() {
			setIframeDisplay("none");
			var url = "base/EstablishmentCommunicateNew.html?alert_type=NONE";
			ShowIframe("日程", url, 980, 440, "setIframeDisplay('')");
		}

		function refreshDesktopWin() { //Desktop.ihtm使用
			if (popRetVal != null) {
				document.getElementById("MainFrame").contentWindow.refreshWin();
			}
			setIframeDisplay("");
		}

		function showAdvicePage() {
			var name = encodeURIComponent("郑州市新异标识标牌有限公司");
			var linkman = encodeURIComponent("管理员");
			var phone = encodeURIComponent("15238022122");
			document.getElementById("MainFrame").src = "http://www.ekingcn.com/ask_eking_jg.html?name=" + name + "&linkman=" +
				linkman + "&phone=" + phone;
		}

		function showClientDialog() {
			var alertType = "SHOW";

			alertType = "NONE";

			setIframeDisplay("none");
			var url = "customer_toAddCustomer?type=CLIENT&alert_type=" + alertType;
			ShowIframe("客户", url, 980, 500, "showClientDialogCallBack()");
		}

		function showClientDialogCallBack() {
			if (popRetVal != null) {

				ShowConfirm('确认框', '现在是否开业务单？', 340, 80, "showClientDialogCallBackExt(" + popRetVal + ")");

			} else {
				setIframeDisplay("");
			}
		}

		function showClientDialogCallBackExt(id) {
			if (popRetVal != null) {
				doBusinessBillNew(id);
			}
			setIframeDisplay("");
		}

		function doBusinessBillNew(clientId) {
			var url = "business/BusinessBillNew.html?type=CLIENT&client_id=" + clientId + "&alert_type=FORM";
			showWin(1280, 600, url);
		}

		function showEstMoveDialog(estType) {
			setIframeDisplay("none");
			var url = "base/EstablishmentMoveForm-purchase.html?est_type=" + estType;
			var etName = "";
			if (estType == "CLIENT") {
				etName = "客户";
			} else if (estType == "COOPERATOR") {
				etName = "外协商";
			} else if (estType == "PROVIDER") {
				etName = "供应商";
			}
			ShowIframeNoScroll(etName + "移交", url, 340, 220, "setIframeDisplay('')");
		}

		function showBusinessBillDialog() {
			setIframeDisplay("none");
			var url =
				"Business_toBusinessBillSearchResult";
			ShowIframe("选择客户", url, 900, 500, "showBusinessBillDialogCallBack()");
		}

		function showBusinessBillDialogCallBack() {
			if (popRetVal != null) {
				if (popRetVal[12] == "RE_ORDER") {
					var url = "business/BusinessBillListForReorder.html?client_id=" + popRetVal[0];
					ShowIframe("选择业务单", url, 900, 500, "showBusinessBillReorderDialogCallBackExt()");
				} else {
					doBusinessBillNew(popRetVal[0]);
					setIframeDisplay("");
				}
			} else {
				setIframeDisplay("");
			}
		}

		function showBusinessFileDialog() {
			setIframeDisplay("none");
			if (window.applicationCache) { //html5
				ShowIframe("传图下单", "Demo_demo", 560, 340, "showBusinessFileDialogCallBack()");
			} else {
				ShowIframe("传图下单", "business/BusinessFileForm.html", 560, 340, "showBusinessFileDialogCallBack()");
			}
		}

		function showBusinessFileDialogCallBack() {
			if (popRetVal != null) {
				var locFn = popRetVal[0];
				var remFn = popRetVal[1];
				var estName = locFn.split(".")[0];
				var xmlHttp = createXMLHttpRequest();
				var url = "base/GetEstablishment.html?est_type=CLIENT&est_name=" + encodeURIComponent(estName);
				xmlHttp.open("GET", url, true);
				xmlHttp.onreadystatechange = function () {
					if (xmlHttp.readyState == 4) {
						if (xmlHttp.status == 200) {
							var clientId = xmlHttp.responseText;
							if (clientId != "0") {
								url = "business/BusinessBillNew.html?type=FILE&client_id=" + clientId + "&rem_fn=" + encodeURIComponent(
									remFn) + "&alert_type=FORM";
								showWin(1280, 600, url);
							} else {
								setIframeDisplay("none");
								url = "base/EstablishmentListForSelect.html?type=CLIENT&ts_id=DF_TS_ID&order_type=BUS_TIME&search_key=" +
									encodeURIComponent(estName);
								ShowIframe("选择客户", url, 900, 500, "showBusinessFileDialogCallBackExt('" + remFn + "')");
							}
						}
					}
				}
				xmlHttp.send(null);
			}
			setIframeDisplay("");
		}

		function showBusinessFileDialogCallBackExt(remFn) {
			if (popRetVal != null) {
				var url = "business/BusinessBillNew.html?type=FILE&client_id=" + popRetVal[0] + "&rem_fn=" + encodeURIComponent(
					remFn) + "&alert_type=FORM";
				showWin(1280, 600, url);
			}
			setIframeDisplay("");
		}

		function showBusAccountDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=CLIENT&show_all=S&order_type=BUS_TIME";
			ShowIframe("选择客户", url, 900, 500, "showBusAccountDialogCallBack()");
		}

		function showBusAccountDialogCallBack() {
			if (popRetVal != null) {
				var clientId = popRetVal[0];
				var url = "business/BusinessBillListForAccountForm.html";
				ShowIframeNoScroll("业务对帐", url, 340, 400, "showBusAccountDialogCallBackExt(" + clientId + ")");
			} else {
				setIframeDisplay("");
			}
		}

		function showBusAccountDialogCallBackExt(clientId) {
			if (popRetVal != null) {
				var startDate = popRetVal[0];
				var endDate = popRetVal[1];
				var type = popRetVal[2];
				var includeSub = popRetVal[3];
				var orderBy = popRetVal[4];
				var linkman = popRetVal[5];
				var tsId = popRetVal[6];
				showWin(900, 620, 'business/BusinessBillListForAccount.html?client_id=' + clientId + '&start_date=' + startDate +
					'&end_date=' + endDate + '&linkman=' + linkman + '&type=' + type + '&include_sub=' + includeSub + '&order_by=' +
					orderBy + '&ts_id=' + tsId);
			}
			setIframeDisplay("");
		}

		function showDelAccountDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=CLIENT&show_all=S&order_type=BUS_TIME";
			ShowIframe("选择客户", url, 900, 500, "showDelAccountDialogCallBack()");
		}

		function showDelAccountDialogCallBack() {
			if (popRetVal != null) {
				var clientId = popRetVal[0];
				var url = "business/DeliverBillListForAccountForm.html";
				ShowIframeNoScroll("送货对帐", url, 340, 400, "showDelAccountDialogCallBackExt(" + clientId + ")");
			} else {
				setIframeDisplay("");
			}
		}

		function showDelAccountDialogCallBackExt(clientId) {
			if (popRetVal != null) {
				var startDate = popRetVal[0];
				var endDate = popRetVal[1];
				var includeSub = popRetVal[2];
				var orderBy = popRetVal[3];
				var linkman = popRetVal[4];

				showWin(900, 620, 'business/DeliverBillListForAccount.html?client_id=' + clientId + '&start_date=' + startDate +
					'&end_date=' + endDate + '&linkman=' + linkman + '&include_sub=' + includeSub + '&order_by=' + orderBy);
			}
			setIframeDisplay("");
		}

		function showCooperatorDialog() {
			setIframeDisplay("none");
			var alertType = "SHOW";

			alertType = "NONE";

			var url = "base/EstablishmentNew.html?type=COOPERATOR&alert_type=" + alertType;
			ShowIframe("外协商", url, 980, 500, "showCooperatorDialogCallBack()");
		}

		function showCooperatorDialogCallBack() {
			if (popRetVal != null) {

				ShowConfirm('确认框', '现在是否开外协单？', 340, 80, "showCooperatorDialogCallBackExt(" + popRetVal + ")");

			} else {
				setIframeDisplay("");
			}
		}

		function showCooperatorDialogCallBackExt(id) {
			if (popRetVal != null) {
				doCooperBillNew(id);
			}
			setIframeDisplay("");
		}

		function doCooperBillNew(cooperatorId) {
			var url = "cooper/CooperBillNew.html?cooperator_id=" + cooperatorId + "&alert_type=FORM";
			showWin(1280, 600, url);
		}

		function showCooperBillDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=COOPERATOR&ts_id=DF_TS_ID&order_type=BUS_TIME";
			ShowIframe("选择外协商", url, 900, 500, "showCooperBillDialogCallBack()");
		}

		function showCooperBillDialogCallBack() {
			if (popRetVal != null) {
				doCooperBillNew(popRetVal[0]);
			}
			setIframeDisplay("");
		}

		function showCooAccountDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=COOPERATOR&show_all=S&order_type=BUS_TIME";
			ShowIframe("选择外协商", url, 900, 500, "showCooAccountDialogCallBack()");
		}

		function showCooAccountDialogCallBack() {
			if (popRetVal != null) {
				var estId = popRetVal[0];
				var url = "cooper/CooperBillListForAccountForm.html";
				ShowIframeNoScroll("外协对帐", url, 340, 400, "showCooAccountDialogCallBackExt(" + estId + ")");
			} else {
				setIframeDisplay("");
			}
		}

		function showCooAccountDialogCallBackExt(estId) {
			if (popRetVal != null) {
				var startDate = popRetVal[0];
				var endDate = popRetVal[1];
				var type = popRetVal[2];
				var orderBy = popRetVal[3];
				var tsId = popRetVal[4];

				showWin(900, 620, 'cooper/CooperBillListForAccount.html?cooperator_id=' + estId + '&start_date=' + startDate +
					'&end_date=' + endDate + '&type=' + type + '&order_by=' + orderBy + '&ts_id=' + tsId);

			}
			setIframeDisplay("");
		}

		function showGatAccountDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=COOPERATOR&show_all=S&order_type=BUS_TIME";
			ShowIframe("选择外协商", url, 900, 500, "showGatAccountDialogCallBack()");
		}

		function showGatAccountDialogCallBack() {
			if (popRetVal != null) {
				var estId = popRetVal[0];
				var url = "cooper/GatherBillListForAccountForm.html";
				ShowIframeNoScroll("收货对帐", url, 340, 400, "showGatAccountDialogCallBackExt(" + estId + ")");
			} else {
				setIframeDisplay("");
			}
		}

		function showGatAccountDialogCallBackExt(estId) {
			if (popRetVal != null) {
				var startDate = popRetVal[0];
				var endDate = popRetVal[1];
				var orderBy = popRetVal[2];
				showWin(900, 620, 'cooper/GatherBillListForAccount.html?cooperator_id=' + estId + '&start_date=' + startDate +
					'&end_date=' + endDate + '&order_by=' + orderBy);

			}
			setIframeDisplay("");
		}

		function showProviderDialog() {
			setIframeDisplay("none");
			var alertType = "SHOW";

			alertType = "NONE";

			var url = "base/EstablishmentNew-purchase.html?type=PROVIDER&alert_type=" + alertType;
			ShowIframe("供应商", url, 980, 500, "showProviderDialogCallBack()");
		}

		function showProviderDialogCallBack() {
			if (popRetVal != null) {

				ShowConfirm('确认框', '现在是否开采购单？', 340, 80, "showProviderDialogCallBackExt('BUY'," + popRetVal + ")");

			} else {
				setIframeDisplay("");
			}
		}

		function showProviderDialogCallBackExt(type, id) {
			if (popRetVal != null) {
				doPurchaseBillNew(type, id);
			}
			setIframeDisplay("");
		}

		function doPurchaseBillNew(type, providerId) {
			var url = "purchase/PurchaseBillNew.html?type=" + type + "&provider_id=" + providerId + "&alert_type=FORM";
			showWin(1024, 600, url);
		}

		function showPurAccountDialog() {
			setIframeDisplay("none");
			var url = "base/EstablishmentListForSelect.html?type=PROVIDER&show_all=S&order_type=BUS_TIME";
			ShowIframe("选择供应商", url, 900, 500, "showPurAccountDialogCallBack()");
		}

		function showPurAccountDialogCallBack() {
			if (popRetVal != null) {
				var estId = popRetVal[0];
				var url = "purchase/PurchaseBillListForAccountForm.html";
				ShowIframeNoScroll("采购对帐", url, 340, 400, "showPurAccountDialogCallBackExt(" + estId + ")");
			} else {
				setIframeDisplay("");
			}
		}

		function showPurAccountDialogCallBackExt(estId) {
			if (popRetVal != null) {
				var startDate = popRetVal[0];
				var endDate = popRetVal[1];
				var type = popRetVal[2];
				var orderBy = popRetVal[3];
				var tsId = popRetVal[4];
				showWin(900, 620, 'purchase/PurchaseBillListForAccount.html?provider_id=' + estId + '&start_date=' + startDate +
					'&end_date=' + endDate + '&type=' + type + '&order_by=' + orderBy + '&ts_id=' + tsId);
			}
			setIframeDisplay("");
		}

		function showPayBillDialog() {
			setIframeDisplay("none");
			var url = "finance/PayTypeSelect.html";
			ShowIframeNoScroll("选择付款类型", url, 240, 240, "showPayBillDialogCallBack()");
		}

		function showPayBillDialogCallBack() {
			if (popRetVal != null) {
				var url = "finance/PayBillNew.html?alert_type=SHOW&pay_type=" + popRetVal;
				showWin(1024, 600, url);
			}
			setIframeDisplay("");
		}

		function showAdjustBillDialog() {
			setIframeDisplay("none");
			var url = "finance/AdjustTypeSelect.html";
			ShowIframeNoScroll("选择调帐类型", url, 240, 380, "showAdjustBillDialogCallBack()");
		}

		function showAdjustBillDialogCallBack() {
			if (popRetVal != null) {
				var url = "finance/AdjustBillNew.html?adjust_type=" + popRetVal + "&alert_type=SHOW";
				showWin(1024, 600, url);
			}
			setIframeDisplay("");
		}

		function showBusinessBillReorderDialogCallBack() {
			if (popRetVal != null) {
				var url = "business/BusinessBillListForReorder.html?client_id=" + popRetVal[0];
				ShowIframe("选择业务单", url, 900, 500, "showBusinessBillReorderDialogCallBackExt()");
			} else {
				setIframeDisplay("");
			}
		}

		function showBusinessBillReorderDialogCallBackExt() {
			if (popRetVal != null) {
				var url = "business/BusinessBillNew.html?type=TEMPLATE&template_id=" + popRetVal + "&alert_type=FORM";
				showWin(1280, 600, url);
			}
			setIframeDisplay("");
		}

		function showStatus() {
			window.status = "时间：2017-07-04 Tue  当前操作员：管理员  使用单位：郑州市新异标识标牌有限公司";
		}

		function showTsPage() {
			// setTimeout("showTsSelect('Y');", 1000);
		}
		window.onbeforeunload = function () {
			var n = window.event.screenX - window.screenLeft;
			var b = n > document.documentElement.scrollWidth - 20;
			if (b && window.event.clientY < 0 || window.event.altKey) {
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.open("GET", "/Logout.html", true);
				xmlHttp.send(null);
			}
		}

		function doImpo(formUrl, targetUrl) {
			ShowIframe("导入Excel", formUrl, 560, 300, "doImpoCallBack('" + targetUrl + "')");
		}

		function doImpoCallBack(targetUrl) {
			if (popRetVal) {
				document.getElementById("LoadProcess").style.top = (document.body.clientHeight / 2 - 50) + "px";
				document.getElementById("LoadProcess").style.left = (document.body.clientWidth / 2 - 100) + "px";
				document.getElementById("LoadProcess").style.display = "";
				var fileName = popRetVal;
				var url;
				if (targetUrl.indexOf("?") == -1) {
					url = targetUrl + "?file_name=" + encodeURIComponent(fileName);
				} else {
					url = targetUrl + "&file_name=" + encodeURIComponent(fileName);
				}
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.open("GET", url, true);
				xmlHttp.onreadystatechange = function () {
					if (xmlHttp.readyState == 4) {
						if (xmlHttp.status == 200) {
							document.getElementById("LoadProcess").style.display = "none";
							showWin(560, 300, "/ImpoSuccess.html");
						}
					}
				};
				xmlHttp.send(null);
			}
		}

		function showBankLog() {
			var d = new Date();
			var startStr = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
			var endStr = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
			showWin(900, 600, "finance/AccountLogList.html?start_date=" + startStr + "&end_date=" + endStr);
		}

		function showBusinessDragDialog() {
			setIframeDisplay("none");
			ShowIframe("拖图下单", "business/BusinessDragForm.html", 560, 340, "showBusinessDragCallBack()");
		}

		var busiDragJson;

		function showBusinessDragCallBack() {
			setIframeDisplay("");
			if (popRetVal) {
				busiDragJson = popRetVal;
				if (busiDragJson.estId == "0") {
					var url = "base/EstablishmentListForSelect.html?type=CLIENT&ts_id=DF_TS_ID&order_type=BUS_TIME&search_key=" +
						encodeURIComponent(busiDragJson.estName);
					ShowIframe("选择客户", url, 900, 500, "showBusinessDragCallBackExt()");
				} else {
					var dataStr = JSON.stringify(busiDragJson); //dataStr太长,直接用get方式会被截掉
					jQuery.noConflict(); //与prototype.js的$有冲突
					jQuery.post("business/BusinessDragData.html", {
						data: dataStr
					}, function (data, status) {
						parseDragData(data, status);
					});
					//showWin(1280,600,"business/BusinessBillNew.html?type=DRAG&data="+encodeURIComponent(dataStr)+"&alert_type=FORM");
				}
			}
		}

		function showBusinessDragCallBackExt() {
			if (popRetVal) {
				busiDragJson.estId = popRetVal[0];
				busiDragJson.estName = popRetVal[1];
				var dataStr = JSON.stringify(busiDragJson); //dataStr太长,直接用get方式会被截掉
				jQuery.noConflict(); //与prototype.js的$有冲突
				jQuery.post("business/BusinessDragData.html", {
					data: dataStr
				}, function (data, status) {
					parseDragData(data, status);
				});
				//showWin(1280,600,"business/BusinessBillNew.html?type=DRAG&data="+encodeURIComponent(dataStr)+"&alert_type=FORM");
			}
		}

		function parseDragData(data, status) {
			if (status == "success") {
				showWin(1280, 600, "business/BusinessBillNew.html?type=DRAG&alert_type=FORM");
			} else {
				ShowAlert('提示框', '系统错误：' + status, 200, 100);
			}
		}
	</script>
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/defualt.css">
	<link rel="stylesheet" type="text/css" href="css/GlobalMenu.css">
	<script type="text/javascript" src="js/Common.js"></script>
	<script type="text/javascript" src="js/GlobalMenu.js"></script>

	<link href="css/dtree.css" rel="stylesheet" type="text/css">
	<script src="js/dtree.js"></script>

</head>

<body>
	<div class="Wrap">
		<div class="Container">

			<div class="Heading">
				<div class="heading_logo">
					<div class="heading_right">
						<div class="company">
							<a class="select" tabindex="21" onclick="showTsSelect(&#39;Y&#39;);" title="点击切换当前的开单帐套">
								<div>
									<p>
										<span id="df_ts_span">
						                
										新异
						                </span>
									</p>
								</div>
							</a>
						</div>
						<div class="edit">
							<ul class="edit-link">


								<li class="ico-home"><a tabindex="22" href="./communication/Desktop.html" target="MainFrame">桌面</a></li>
								<li class="ico-code"><a href="javascript:showWin(340,300,&#39;system/AccountEdit.html?alert_type=SHOW&#39;);">修改密码</a></li>
								<li class="ico-sms"><a href="javascript:javascript:showWin(500,450,&#39;app/GetAppBarcode.html&#39;);">手机APP</a></li>
								<li class="ico-help"><a href="javascript:showAdvicePage();">帮助</a></li>
								<li class="ico-out"><a tabindex="24" id="lnkExit" href="javascript:doLogout();">退出</a></li>
							</ul>
						</div>
						<ul id="MainMenu" class="GlobalMenu ClearFix">
						</ul>
					</div>
				</div>
			</div>

			<div class="Content">
				<iframe id="MainFrame" name="MainFrame" class="MainFrame" frameborder="0" src="./communication/Desktop.html" style="width: 1583px; height: 702px;"></iframe>
			</div>

		</div>
	</div>








	<script language="javascript">
		function opTab() {
			if (document.getElementById("scrollDiv").style.display == "none") {
				document.getElementById("leftMenuDiv").style.width = "220px";
				document.getElementById("scrollDiv").style.display = "block";
				document.getElementById("arrtxt").innerText = "隐藏菜单";
			} else {
				document.getElementById("leftMenuDiv").style.width = "30px";
				document.getElementById("scrollDiv").style.display = "none";
				document.getElementById("arrtxt").innerText = "显示菜单";
			}
		}

		function doTreeNodeClick(url) {
			document.getElementById("MainFrame").src = url;
		}
	</script>
	<div id="leftMenuDiv" style="position:absolute;top:68px;left:0px;width:30px;height:520px;z-index:20;">
		<div class="nav" id="scrollDiv" style="display:none;height:520px;overflow:auto;padding-top:4px;border-top:2px solid #3282c5;border-bottom:2px solid #3282c5;">
			<h3 class="title">系统菜单</h3>
			<div class="nav-link">
				<div>
					<script language="javascript">
						var d = new dTree('d', 'images');

						d.config.useCookies = false;
						d.config.useLines = true;
						d.config.useIcons = true;

						d.add(0, -1, 'Root');


						d.add(1, 0, '沟通', "javascript:doTreeNodeClick('./communication/Desktop.html');", '', '', '', false);
						d.add(101, 1, '我的日程', "javascript:showWin(1024,600,'MyComm_toEstabComm');", '', '',
							'', false);
						d.add(102, 1, '新日程', "javascript:showWin(1024,600,'MyComm_toNewComm');", '', '', '', false);
						d.add(103, 1, '下级日程', "javascript:showWin(1024,600,'base/EstCommUnderList.html');", '', '', '', false);
						d.add(104, 1, '日历', "javascript:showWin(900,600,'base/EstablishmentCommunicateCalendar.html',true);", '', '',
							'', false);
						d.add(105, 1, '所有公告', "javascript:showWin(1024,600,'main_toMain');", '', '', '', false);
						d.add(106, 1, '发内部消息', "javascript:showWin(1024,600,'message/Main.html?default_url=MessageNew.html');", '', '',
							'', false);
						d.add(107, 1, '收件箱', "javascript:showWin(1024,600,'message/Main.html?default_url=MessageList.html?type=IN');",
							'', '', '', false);
						d.add(108, 1, '发件箱', "javascript:showWin(1024,600,'message/Main.html?default_url=MessageList.html?type=OUT');",
							'', '', '', false);

						d.add(109, 1, '发短信', "javascript:showWin(900,500,'sms/SmsSendForm.html');", '', '', '', false);



						d.add(110, 1, '群发短信', "javascript:showWin(900,500,'sms/SmsSendForm-mul.html?type=MULTI');", '', '', '', false);


						d.add(111, 1, '短信发送记录', "javascript:showWin(900,500,'sms/SmsMyHistoryList.html');", '', '', '', false);
						d.add(112, 1, '我的通讯录', "javascript:showWin(760,400,'phone_toPhoneBookList');", '', '', '', false);
						d.add(113, 1, '公司内部通讯录', "javascript:showWin(1024,640,'phone_toInnerPbMain');", '', '', '', false);
						d.add(114, 1, '谁在线', "javascript:showWin(500,300,'onlineList_toOnlineList');", '', '', '', false);

						d.add(115, 1, '关于管理易', "javascript:showWin(500,320,'aboutEk_toAboutEk');", '', '', '', false);




						d.add(2, 0, '客户业务', "javascript:doTreeNodeClick('base/Desktop.html?type=FLOW');", '', '', '', false);

						d.add(201, 2, '新客户登记', "javascript:showClientDialog(1024,600,'customer_toAddCustomer');", '', '', '', false);


						d.add(202, 2, '我的客户', "javascript:showWin(1024,600,'base/EstablishmentManageList.html?type=CLIENT');", '', '',
							'', false);


						d.add(203, 2, '客户移交', "javascript:showEstMoveDialog('CLIENT');", '', '', '', false);


						d.add(204, 2, '全部客户', "javascript:showWin(1280,600,'base/EstablishmentList.html?type=CLIENT');", '', '', '',
							false);


						d.add(205, 2, '业务接单', "javascript:showBusinessBillDialog();", '', '', '', false);
						d.add(206, 2, '传图下单', "javascript:showBusinessFileDialog();", '', '', '', false);
						d.add(207, 2, '拖图下单', "javascript:showBusinessDragDialog();", '', '', '', false);


						d.add(208, 2, '业务单一览表', "javascript:showWin(1280,800,'ERP/BusinessBillVTO_toBusinessBillListForExamine');", '', '', '',
							false);


						d.add(209, 2, '上传设计文件', "javascript:showWin(900,600,'business/BusinessBillListForAccessory.html');", '', '',
							'', false);


						d.add(210, 2, '上传文件一览表', "javascript:showWin(1024,600,'business/AcceSear.html');", '', '', '', false);


						d.add(211, 2, '业务明细一览表', "javascript:showWin(1024,600,'business/BusinessBillItemSearchResult.html');", '', '',
							'', false);


						d.add(212, 2, '开单人改单', "javascript:showWin(900,600,'business/BusinessBillListForModifySelf.html',true);", '',
							'', '', false);


						d.add(213, 2, '业务单改价格', "javascript:showWin(900,600,'business/BusinessBillListForEditPrice.html');", '', '',
							'', false);


						d.add(215, 2, '价格手册', "javascript:showWin(1024,600,'base/PriceGuideItemList.html?pg_id=1');", '', '', '',
							false);


						d.add(216, 2, '业务单审核', "javascript:showWin(900,600,'ERP/BusinessBillVTO_toBusinessBillListForExamine');", '', '', '',
							false);


						d.add(217, 2, '业务单反审核', "javascript:showWin(1024,600,'business/BusinessBillListForUnExamine.html');", '', '',
							'', false);


						d.add(218, 2, '扫条码查进度', "javascript:showWin(1024,600,'business/BusinessRelBillList.html');", '', '', '', false);


						d.add(219, 2, '送货', "javascript:showWin(1024,600,'business/BusinessBillListForDeliver.html');", '', '', '',
							false);


						d.add(220, 2, '送货单审核', "javascript:showWin(1024,600,'business/DeliverBillListForExamine.html');", '', '', '',
							false);


						d.add(221, 2, '送货单反审核', "javascript:showWin(1024,600,'business/DeliverBillListForUnExamine.html');", '', '',
							'', false);


						d.add(222, 2, '送货单一览表', "javascript:showWin(1024,600,'business/DeliverBillSearchResult.html');", '', '', '',
							false);


						d.add(223, 2, '送货明细一览表', "javascript:showWin(1024,600,'business/DeliverBillItemSearchResult.html');", '', '',
							'', false);


						d.add(224, 2, '安装', "javascript:showWin(1024,600,'business/BusinessBillListForSetu.html');", '', '', '', false);


						d.add(225, 2, '安装单审核', "javascript:showWin(1024,600,'business/SetuBillListForExam.html');", '', '', '', false);


						d.add(226, 2, '安装单反审核', "javascript:showWin(1024,600,'business/SetuBillListForUnExam.html');", '', '', '',
							false);


						d.add(227, 2, '安装单一览表', "javascript:showWin(1024,600,'business/SetuBillSearchResult.html');", '', '', '',
							false);


						d.add(228, 2, '安装单完工', "javascript:showWin(1024,600,'business/SetuBillListForComp.html');", '', '', '', false);


						d.add(229, 2, '安装单反完工', "javascript:showWin(1024,600,'business/SetuBillListForUnComp.html');", '', '', '',
							false);


						d.add(230, 2, '安装完工图一览表', "javascript:showWin(1024,600,'business/SetuAcceList.html');", '', '', '', false);


						d.add(231, 2, '业务对帐', "javascript:showBusAccountDialog();", '', '', '', false);


						d.add(232, 2, '业务单结清', "javascript:showWin(1024,600,'business/BusinessBillListForClose.html');", '', '', '',
							false);


						d.add(233, 2, '业务单反结清', "javascript:showWin(1024,600,'business/BusinessBillListForUnClose.html');", '', '', '',
							false);


						d.add(234, 2, '送货对帐', "javascript:showDelAccountDialog();", '', '', '', false);


						d.add(235, 2, '业务单作废', "javascript:showWin(900,600,'business/BusinessBillListForCancel.html');", '', '', '',
							false);


						d.add(236, 2, '送货单作废', "javascript:showWin(1024,600,'business/DeliverBillListForCancel.html');", '', '', '',
							false);


						d.add(237, 2, '安装单作废', "javascript:showWin(1024,600,'business/SetuBillListForCanc.html');", '', '', '', false);




						d.add(3, 0, '制作', "javascript:doTreeNodeClick('make/Main.html');", '', '', '', false);

						d.add(301, 3, '要制作的业务单', "javascript:showWin(1024,600,'make/BusinessBillListForMake.html');", '', '', '', false);


						d.add(302, 3, '生产进度管理', "javascript:showWin(1024,600,'make/BusinessBillListForTask.html');", '', '', '', false);


						d.add(303, 3, '产量登记', "javascript:showWin(1024,600,'make/BusinessBillListForOutput.html');", '', '', '', false);


						d.add(304, 3, '产量计件明细表', "javascript:showWin(1024,600,'make/OutputSearchResult.html');", '', '', '', false);


						d.add(305, 3, '产量统计表', "javascript:showWin(900,600,'make/OutputCount.html');", '', '', '', false);


						d.add(307, 3, '业务单完工', "javascript:showWin(1024,600,'business/BusinessBillListForComplete.html');", '', '', '',
							false);


						d.add(308, 3, '业务单反完工', "javascript:showWin(900,600,'business/BusinessBillListForUnComplete.html');", '', '',
							'', false);




						d.add(4, 0, '外协', "javascript:doTreeNodeClick('cooper/Main.html');", '', '', '', false);

						d.add(401, 4, '外协商登记', "javascript:showCooperatorDialog();", '', '', '', false);


						d.add(402, 4, '外协商移交', "javascript:showEstMoveDialog('COOPERATOR');", '', '', '', false);


						d.add(403, 4, '全部外协商', "javascript:showWin(1024,600,'base/EstablishmentList.html?type=COOPERATOR');", '', '',
							'', false);



						d.add(404, 4, '要外协的业务单', "javascript:showWin(1024,600,'cooper/BusinessBillListForCooper.html');", '', '', '',
							false);



						d.add(405, 4, '外协单一览表', "javascript:showWin(1280,600,'cooper/CooperBillSearchResult.html');", '', '', '',
							false);


						d.add(406, 4, '外协开单', "javascript:showCooperBillDialog();", '', '', '', false);


						d.add(407, 4, '外协明细一览表', "javascript:showWin(1024,600,'cooper/CooperBillItemSearchResult.html');", '', '', '',
							false);


						d.add(408, 4, '外协单改价格', "javascript:showWin(900,600,'cooper/CooperBillListForEditPrice.html');", '', '', '',
							false);




						d.add(410, 4, '外协价格',
							"javascript:showWin(1024,600,'base/EstPriceList.html?price_type=STA&est_type=COOPERATOR');", '', '', '',
							false);


						d.add(411, 4, '外协单审核', "javascript:showWin(900,600,'cooper/CooperBillListForExamine.html');", '', '', '',
							false);

						d.add(412, 4, '外协单反审核', "javascript:showWin(900,600,'cooper/CooperBillListForUnExamine.html');", '', '', '',
							false);



						d.add(413, 4, '外协收货', "javascript:showWin(900,600,'cooper/CooperBillListForGather.html');", '', '', '', false);


						d.add(414, 4, '收货单审核', "javascript:showWin(900,600,'cooper/GatherBillListForExamine.html');", '', '', '',
							false);



						d.add(415, 4, '收货单反审核', "javascript:showWin(900,600,'cooper/GatherBillListForUnExamine.html');", '', '', '',
							false);



						d.add(416, 4, '收货单一览表', "javascript:showWin(900,600,'cooper/CooperBillSearchResult.html');", '', '', '', false);


						d.add(417, 4, '外协完工', "javascript:showWin(1024,600,'cooper_toCooperComp');", '', '', '',
							false);


						d.add(418, 4, '外协反完工', "javascript:showWin(900,600,'cooperUn_toCooperUnComp');", '', '', '',
							false);



						d.add(419, 4, '外协对账', "javascript:showCooAccountDialog();", '', '', '', false);


						d.add(420, 4, '收货对账', "javascript:showGatAccountDialog();", '', '', '', false);


						d.add(421, 4, '外协单作废', "javascript:showWin(900,600,'cooper/CooperBillListForCancel.html');", '', '', '', false);


						d.add(422, 4, '收货单作废', "javascript:showWin(900,600,'cooper/GatherBillListForCancel.html');", '', '', '', false);




						d.add(5, 0, '采购', "javascript:doTreeNodeClick('purchase/Main.html');", '', '', '', false);

						d.add(501, 5, '供应商登记', "javascript:showProviderDialog();", '', '', '', false);


						d.add(502, 5, '供应商移交', "javascript:showEstMoveDialog('PROVIDER');", '', '', '', false);


						d.add(503, 5, '全部供应商', "javascript:showWin(1024,600,'base/EstablishmentList-AllProduct.html?type=PROVIDER');",
							'', '', '', false);


						d.add(504, 5, '采购单', "javascript:showWin(1024,600,'purchase/PurchaseBillNew.html?type=BUY&alert_type=FORM');",
							'', '', '', false);


						d.add(505, 5, '采购单审核', "javascript:showWin(900,600,'purchase/PurchaseBillListForExamine.html?type=BUY');", '',
							'', '', false);


						d.add(506, 5, '采购单反审核', "javascript:showWin(900,600,'purchase/PurchaseBillListForUnExamine.html?type=BUY');",
							'', '', '', false);



						d.add(508, 5, '采购单一览表', "javascript:showWin(1024,600,'purchase/PurchaseBillSearchResult.html?type=BUY');", '',
							'', '', false);


						d.add(509, 5, '退货单',
							"javascript:showWin(1024,600,'purchase/PurchaseBillNew-return.html?type=BACK&alert_type=FORM');", '', '', '',
							false);


						d.add(510, 5, '退货单审核',
							"javascript:showWin(900,600,'purchase/PurchaseBillListForExamine-return.html?type=BACK');", '', '', '',
							false);


						d.add(511, 5, '退货单反审核',
							"javascript:showWin(900,600,'purchase/PurchaseBillListForUnExamine-return.html?type=BACK');", '', '', '',
							false);



						d.add(514, 5, '退货单一览表',
							"javascript:showWin(1024,600,'purchase/PurchaseBillSearchResult-return.html?type=BACK');", '', '', '', false
						);


						d.add(515, 5, '采购对账', "javascript:showPurAccountDialog();", '', '', '', false);


						d.add(516, 5, '采购明细表', "javascript:showWin(1024,600,'purchase/PurchaseDetailSearchResult.html');", '', '', '',
							false);


						d.add(517, 5, '供应商采购汇总表', "javascript:showWin(1024,600,'purchase/PurcProvCoun.html');", '', '', '', false);


						d.add(518, 5, '材料采购汇总表', "javascript:showWin(1024,600,'purchase/PurcProdCoun-All.html');", '', '', '', false);


						d.add(519, 5, '采购单作废', "javascript:showWin(900,600,'purchase/PurchaseBillListForCancel.html?type=BUY');", '',
							'', '', false);


						d.add(520, 5, '退货单作废',
							"javascript:showWin(900,600,'purchase/PurchaseBillListForCancel-return.html?type=BACK');", '', '', '', false
						);




						d.add(6, 0, '库存', "javascript:doTreeNodeClick('storehouse/Main.html');", '', '', '', false);

						d.add(601, 6, '入库单', "javascript:showWin(1024,600,'InBillNew_toInBillNew');", '', '', '',
							false);


						d.add(602, 6, '入库单审核', "javascript:showWin(900,600,'inStoreExamine_toInStoreExamine');", '', '', '',
							false);


						d.add(603, 6, '入库单反审核', "javascript:showWin(900,600,'inStoreUnExamine_toInStoreUnExamine');", '', '', '',
							false);



						d.add(606, 6, '入库单一览表', "javascript:showWin(1024,600,'inStorehouse_toInBillResult');", '', '', '',
							false);


						d.add(607, 6, '出库单', "javascript:showWin(1024,600,'OutBill_toOutBillNew');", '', '', '',
							false);


						d.add(608, 6, '出库单审核', "javascript:showWin(900,600,'outStoreExamine_toOutStoreExamine');", '', '', '',
							false);


						d.add(609, 6, '出库单反审核', "javascript:showWin(900,600,'outStoreUnExamine_toOutStoreUnExamine');", '', '', '',
							false);



						d.add(612, 6, '出库单一览表', "javascript:showWin(1024,600,'outResult_toOutResult');", '', '', '',
							false);


						d.add(613, 6, '出库明细一览表', "javascript:showWin(1280,600,'outStorehouse_toOutBillList');", '', '', '', false);


						d.add(614, 6, '调拨单', "javascript:showWin(1024,600,'storehouse/AlloBillNew.html?alert_type=FORM');", '', '', '',
							false);


						d.add(615, 6, '调拨单审核', "javascript:showWin(900,600,'storehouse/AlloBillListForExamine.html');", '', '', '',
							false);


						d.add(616, 6, '调拨单反审核', "javascript:showWin(900,600,'storehouse/AlloBillListForUnExamine.html');", '', '', '',
							false);


						d.add(617, 6, '调拨单一览表', "javascript:showWin(900,600,'storehouse/AlloBillSearchResult.html');", '', '', '',
							false);


						d.add(618, 6, '库存查询', "javascript:showWin(900,600,'storehouse/StockSearch.html');", '', '', '', false);


						d.add(619, 6, '收发存明细表', "javascript:showWin(1024,600,'storehouse/InOutList.html');", '', '', '', false);


						d.add(620, 6, '收发存汇总表', "javascript:showWin(1024,600,'storehouse/InOutCount.html');", '', '', '', false);


						d.add(621, 6, '入库单作废', "javascript:showWin(900,600,'storehouse/InBillListForCancel.html');", '', '', '', false);


						d.add(622, 6, '出库单作废', "javascript:showWin(900,600,'storehouse/OutBillListForCancel-out.html');", '', '', '',
							false);


						d.add(623, 6, '调拨单作废', "javascript:showWin(900,600,'storehouse/AlloBillListForCancel.html');", '', '', '',
							false);




						d.add(7, 0, '帐务', "javascript:doTreeNodeClick('..finance/Main.html');", '', '', '', false);


						d.add(701, 7, '收款单', "javascript:showWin(1024,600,'ReceiveBill_toReceiveBillNew');", '', '', '',
							false);


						d.add(702, 7, '收款单审核', "javascript:showWin(900,600,'ReceiveBill_toNoReceiveBillList');", '', '', '',
							false);


						d.add(703, 7, '收款单反审核', "javascript:showWin(900,600,'ReceiveBill_toCanReceiveBillList');", '', '', '',
							false);


						d.add(704, 7, '收款单一览表', "javascript:showWin(1024,600,'ReceiveBill_toReceiveBillResult');", '', '', '',
							false);


						d.add(705, 7, '其他收入单', "javascript:showWin(1024,420,'finance/IncomeBillNew.html?alert_type=SHOW');", '', '',
							'', false);


						d.add(706, 7, '其他收入审核', "javascript:showWin(900,600,'InComeBill_toIncomeBillListForExamine');", '', '', '',
							false);


						d.add(707, 7, '其他收入反审核', "javascript:showWin(900,600,'InComeBill_toUnIncomeBillListForExamine');", '', '', '',
							false);


						d.add(708, 7, '其他收入一览表', "javascript:showWin(1024,600,'InComeBill_toIncomeBillSearchResult');", '', '', '',
							false);



						d.add(709, 7, '付款单', "javascript:showPayBillDialog();", '', '', '', false);


						d.add(710, 7, '付款单审核', "javascript:showWin(900,600,'finance/PayBillListForExamine.html');", '', '', '', false);



						d.add(711, 7, '付款单反审核', "javascript:showWin(900,600,'finance/PayBillListForUnExamine.html');", '', '', '',
							false);



						d.add(712, 7, '付款单一览表', "javascript:showWin(1024,600,'finance/PayBillSearchResult.html');", '', '', '', false);



						d.add(713, 7, '费用单', "javascript:showWin(1024,420,'finance/FeeBillNew.html?alert_type=SHOW');", '', '', '',
							false);



						d.add(714, 7, '费用单审核', "javascript:showWin(900,600,'finance/FeeBillListForExamine.html');", '', '', '', false);


						d.add(715, 7, '费用单反审核', "javascript:showWin(900,600,'finance/FeeBillListForUnExamine.html');", '', '', '',
							false);



						d.add(716, 7, '费用单一览表', "javascript:showWin(1024,600,'finance/FeeBillSearchResult.html');", '', '', '', false);



						d.add(717, 7, '费用明细一览表', "javascript:showWin(1024,600,'finance/FeeBillItemSearchResult.html');", '', '', '',
							false);



						d.add(718, 7, '我的费用单', "javascript:showWin(1024,600,'finance/FeeBillItemMy.html');", '', '', '', false);


						d.add(719, 7, '调账单', "javascript:showAdjustBillDialog();", '', '', '', false);



						d.add(720, 7, '调账单审核', "javascript:showWin(900,600,'finance/AdjustBillListForExamine.html');", '', '', '',
							false);


						d.add(721, 7, '调账单反审核', "javascript:showWin(900,600,'finance/AdjustBillListForUnExamine.html');", '', '', '',
							false);


						d.add(722, 7, '调账单一览表', "javascript:showWin(900,600,'finance/AdjustBillSearchResult.html');", '', '', '',
							false);


						d.add(723, 7, '转账取款单', "javascript:showWin(1024,420,'finance/TransferBillNew.html?alert_type=SHOW');", '', '',
							'', false);


						d.add(724, 7, '转账取款审核', "javascript:showWin(900,600,'finance/TransferBillListForExamine.html');", '', '', '',
							false);


						d.add(725, 7, '转账取款反审核', "javascript:showWin(900,600,'finance/TransferBillListForUnExamine.html');", '', '',
							'', false);


						d.add(726, 7, '转账取款一览表', "javascript:showWin(1024,600,'finance/TransferBillSearchResult.html');", '', '', '',
							false);


						d.add(727, 7, '资金借入单', "javascript:showWin(1024,420,'inLoanBill_toInLoanBill');",
							'', '', '', false);


						d.add(728, 7, '资金借入审核', "javascript:showWin(900,600,'inExamine_toInExamineResult');", '', '',
							'', false);


						d.add(729, 7, '资金借入反审核', "javascript:showWin(900,600,'inUnExamine_toInUnExamineResult');", '',
							'', '', false);


						d.add(730, 7, '资金借入一览表', "javascript:showWin(1024,600,'inDetail_toLoanBillResult');", '', '',
							'', false);


						d.add(731, 7, '资金借出单',
							"javascript:showWin(1024,420,'outLoanBill_toOutLoanBill');", '', '', '', false);


						d.add(732, 7, '资金借出审核', "javascript:showWin(900,600,'outExamine_toOutExamineResult');", '', '',
							'', false);


						d.add(733, 7, '资金借出反审核', "javascript:showWin(900,600,'outUnExamine_toOutUnExamineResult');", '',
							'', '', false);


						d.add(734, 7, '资金借出一览表', "javascript:showWin(1024,600,'finance/LoanBillSearchResult.html?type=OUT');", '', '',
							'', false);


						d.add(735, 7, '收款单作废', "javascript:showWin(900,600,'Accounts_toReceiveBillListForCancel');", '', '', '',
							false);


						d.add(736, 7, '其他收入作废', "javascript:showWin(900,600,'Accounts_toIncomeBillListForCancel');", '', '', '',
							false);

						d.add(720, 7, '调账单审核', "javascript:showWin(900,600,'finance/AdjustBillListForExamine.html');", '', '', '',
							false);


						d.add(721, 7, '调账单反审核', "javascript:showWin(900,600,'finance/AdjustBillListForUnExamine.html');", '', '', '',
							false);


						d.add(722, 7, '调账单一览表', "javascript:showWin(900,600,'finance/AdjustBillSearchResult.html');", '', '', '',
							false);


						d.add(723, 7, '转账取款单', "javascript:showWin(1024,420,'finance/TransferBillNew.html?alert_type=SHOW');", '', '',
							'', false);


						d.add(724, 7, '转账取款审核', "javascript:showWin(900,600,'finance/TransferBillListForExamine.html');", '', '', '',
							false);


						d.add(725, 7, '转账取款反审核', "javascript:showWin(900,600,'finance/TransferBillListForUnExamine.html');", '', '',
							'', false);


						d.add(726, 7, '转账取款一览表', "javascript:showWin(1024,600,'finance/TransferBillSearchResult.html');", '', '', '',
							false);


						d.add(727, 7, '资金借入单', "javascript:showWin(1024,420,'inLoanBill_toInLoanBill');",
							'', '', '', false);


						d.add(728, 7, '资金借入审核', "javascript:showWin(900,600,'inExamine_toInExamineResult');", '', '',
							'', false);


						d.add(729, 7, '资金借入反审核', "javascript:showWin(900,600,'inUnExamine_toInUnExamineResult');", '',
							'', '', false);


						d.add(730, 7, '资金借入一览表', "javascript:showWin(1024,600,'inDetail_toLoanBillResult');", '', '',
							'', false);


						d.add(731, 7, '资金借出单',
							"javascript:showWin(1024,420,'outLoanBill_toOutLoanBill');", '', '', '', false);


						d.add(732, 7, '资金借出审核', "javascript:showWin(900,600,'outExamine_toOutExamineResult');", '', '',
							'', false);


						d.add(733, 7, '资金借出反审核', "javascript:showWin(900,600,'outUnExamine_toOutUnExamineResult');", '',
							'', '', false);


						d.add(734, 7, '资金借出一览表', "javascript:showWin(1024,600,'outDetail_toOutBillResult');", '', '',
							'', false);


						d.add(735, 7, '收款单作废', "javascript:showWin(900,600,'finance/ReceiveBillListForCancel.html');", '', '', '',
							false);


						d.add(736, 7, '其他收入作废', "javascript:showWin(900,600,'Accounts_toIncomeBillListForCancel');", '', '', '',
							false);


						d.add(737, 7, '付款单作废', "javascript:showWin(900,600,'finance/PayBillListForCancel.html');", '', '', '', false);


						d.add(738, 7, '费用单作废', "javascript:showWin(900,600,'finance/FeeBillListForCancel.html');", '', '', '', false);


						d.add(739, 7, '调账单作废', "javascript:showWin(900,600,'finance/AdjustBillListForCancel.html');", '', '', '',
							false);


						d.add(740, 7, '转账取款作废', "javascript:showWin(900,600,'finance/TransferBillListForCancel.html');", '', '', '',
							false);


						d.add(741, 7, '资金借入作废', "javascript:showWin(900,600,'finance/LoanBillListForCancel.html?type=IN');", '', '',
							'', false);


						d.add(742, 7, '资金借出作废', "javascript:showWin(900,600,'finance/LoanBillListForCancel.html?type=OUT');", '', '',
							'', false);





						d.add(8, 0, '产值', "", '', '', '', false);

						d.add(801, 8, '接单产值明细表', "javascript:showWin(900,600,'make/OvBusinessList.html');", '', '', '', false);


						d.add(802, 8, '跟单产值明细表', "javascript:showWin(900,600,'make/OvFollowList.html');", '', '', '', false);


						d.add(803, 8, '产值统计表', "javascript:showWin(1024,600,'make/OvCount.html');", '', '', '', false);


						d.add(804, 8, '设计产值明细表', "javascript:showWin(900,600,'make/OvDesignList.html');", '', '', '', false);


						d.add(805, 8, '制作产值明细表', "javascript:showWin(1024,600,'make/OvMakeList.html');", '', '', '', false);


						d.add(806, 8, '员工计件产值统计表', "javascript:showWin(800,600,'make/OutputWage.html');", '', '', '', false);


						d.add(807, 8, '收欠费产值明细表', "javascript:showWin(900,600,'make/OvReceiveList.html');", '', '', '', false);


						d.add(808, 8, '安装产值明细表', "javascript:showWin(1024,600,'make/OvSetuList.html');", '', '', '', false);


						d.add(809, 8, '营销产值明细表', "javascript:showWin(900,600,'make/OvSaleList.html');", '', '', '', false);


						d.add(810, 8, '产值单', "javascript:showWin(1024,420,'make/OvBillNew.html?alert_type=SHOW');", '', '', '', false);


						d.add(811, 8, '产值单审核', "javascript:showWin(900,600,'make/OvBillListForExamine.html');", '', '', '', false);


						d.add(812, 8, '产值单反审核', "javascript:showWin(900,600,'make/OvBillListForUnExamine.html');", '', '', '', false);


						d.add(813, 8, '产值单一览表', "javascript:showWin(900,600,'make/OvBillSearchResult.html');", '', '', '', false);


						d.add(814, 8, '业务单产值分配规则', "javascript:showWin(500,380,'make/SetOvPercentForm.html');", '', '', '', false);


						d.add(815, 8, '业务单特殊产值规则', "javascript:showWin(1024,600,'make/BusinessBillListForOv.html');", '', '', '',
							false);


						d.add(816, 8, '产值单作废', "javascript:showWin(900,600,'make/OvBillListForCancel.html');", '', '', '', false);




						d.add(9, 0, '统计报表', "", '', '', '', false);

						d.add(901, 9, '销售日报表', "javascript:showWin(900,600,'Report_toBusinessDateCount');", '', '', '', false);


						d.add(902, 9, '项目营业日报表', "javascript:showWin(900,600,'business/MtBusinessDate.html');", '', '', '', false);


						d.add(903, 9, '项目营业汇总表', "javascript:showWin(900,600,'business/MtBusinessCount.html');", '', '', '', false);


						d.add(904, 9, '员工业绩排行表', "javascript:showWin(1024,600,'finance/StafferExploitList.html');", '', '', '', false);


						d.add(905, 9, '客户营业汇总表', "javascript:showWin(1024,600,'business/EstBusinessCount.html');", '', '', '', false);


						d.add(906, 9, '业务单成本表', "javascript:showWin(1024,600,'business/BusinessProfitSearchResult.html');", '', '', '',
							false);


						d.add(907, 9, '利润表', "javascript:showWin(900,600,'finance/ProfitSearch.html');", '', '', '', false);


						d.add(908, 9, '利润汇总表', "javascript:showWin(900,600,'finance/ProfitCount.html');", '', '', '', false);


						d.add(909, 9, '客户应收款', "javascript:showWin(1024,600,'Statistic_toReceivableList');", '', '', '', false);


						d.add(910, 9, '业务单应收款', "javascript:showWin(1024,600,'Statistic_toBusinessBillListForReceive');", '', '', '',
							false);


						d.add(911, 9, '应收汇总表', "javascript:showWin(900,600,'Statistic_toReceivableCount');", '', '', '', false);


						d.add(912, 9, '应收款账龄分布表', "javascript:showWin(1024,600,'Statistic_toReceivableAgeList');", '', '', '', false);


						d.add(913, 9, '采购单应付款', "javascript:showWin(1024,600,'/purchase/PurchaseBillListForPay.html');", '', '', '',
							false);


						d.add(914, 9, '应付账款', "javascript:showWin(900,600,'finance/PayableList.html');", '', '', '', false);


						d.add(915, 9, '应付汇总表', "javascript:showWin(900,600,'finance/PayableCount.html');", '', '', '', false);


						d.add(916, 9, '外协单应付款', "javascript:showWin(1024,600,'cooper/CooperBillListForPay.html');", '', '', '', false);


						d.add(917, 9, '销售回款一览表', "javascript:showWin(1024,600,'finance/BackCostList.html');", '', '', '', false);


						d.add(918, 9, '结欠回款明细表', "javascript:showWin(1280,600,'finance/ReceiveBillItemSearchResult.html');", '', '',
							'', false);



						d.add(919, 9, '客户回款汇总表', "javascript:showWin(1024,600,'finance/EstBackCount.html');", '', '', '', false);


						d.add(920, 9, '采购付款一览表', "javascript:showWin(1024,600,'Statistic_toPurPayCostList');", '', '', '', false);



						d.add(921, 9, '现金银行', "javascript:showWin(1024,600,'finance/AccountBalanceList.html?is_tmp=Y');", '', '', '',
							false);



						d.add(922, 9, '外协付款一览表', "javascript:showWin(1024,600,'Statistic_toCooPayCostList');", '', '', '', false);


						d.add(923, 9, '资金借入统计', "javascript:showWin(700,600,'Accounts_toLoanBillListForCancel');", '', '', '', false);


						d.add(924, 9, '资金借出统计', "javascript:showWin(700,600,'finance/LoanBillCount.html?type=OUT');", '', '', '',
							false);





						d.add(10, 0, '基础数据', "javascript:doTreeNodeClick('/ERP/MakeType_toMain');", '', '', '', false);

						d.add(1001, 10, '部门与员工', "javascript:showWin(900,640,'departStaff_toMain');", '', '', '', false);


						d.add(1002, 10, '单位类别', "javascript:showWin(400,350,'/ERP/customerLevel_toCustomLevelMain');", '', '', '', false);


						d.add(1003, 10, '客户等级', "javascript:showWin(400,350,'/ERP/customerType_toCustomTypeMain');", '', '', '', false);


						d.add(1004, 10, '地区管理', "javascript:showWin(540,350,'base/AreaList.html');", '', '', '', false);


						d.add(1005, 10, '项目类型', "javascript:showWin(680,500,'ERP/MakeType_toMakeTypeList');", '', '', '', false);


						d.add(1006, 10, '制作要求', "javascript:showWin(600,500,'ERP/MakeRequire_toMakeRequireList');", '', '', '', false);


						d.add(1007, 10, '文件说明', "javascript:showWin(600,500,'ERP/AccessoryMark_toAccessoryMarkList');", '', '', '', false);


						d.add(1008, 10, '工作中心', "javascript:showWin(600,400,'base/WorkCenterList.html');", '', '', '', false);


						d.add(1009, 10, '付款方式', "javascript:showWin(400,300,'base/PayModeList.html');", '', '', '', false);


						d.add(1010, 10, '价格手册', "javascript:showWin(680,500,'base/PriceGuideList.html');", '', '', '', false);


						d.add(1011, 10, '材料', "javascript:showWin(1024,640,''product_toProductMain');", '', '', '', false);


						d.add(1012, 10, '计量单位', "javascript:showWin(400,300,'unit_toUnitList');", '', '', '', false);


						d.add(1013, 10, '仓库', "javascript:showWin(600,400,'base/StorehouseList.html');", '', '', '', false);


						d.add(1014, 10, '入库类型', "javascript:showWin(600,500,'base/InTypeList.html');", '', '', '', false);


						d.add(1015, 10, '出库类型', "javascript:showWin(600,500,'base/OutTypeList.html');", '', '', '', false);


						d.add(1016, 10, '银行账户', "javascript:showWin(900,400,'base/BankAccountList.html');", '', '', '', false);


						d.add(1017, 10, '收入类型', "javascript:showWin(600,400,'base/IncomeTypeList.html');", '', '', '', false);


						d.add(1018, 10, '费用类型', "javascript:showWin(600,400,'base/FeeTypeList.html');", '', '', '', false);




						d.add(11, 0, '系统管理', "javascript:doTreeNodeClick('/ERP/UserRole_toMain');", '', '', '', false);

						d.add(1101, 11, '系统配置', "javascript:showWin(900,620,'system/EnterpriseInfoEdit.html');", '', '', '', false);


						d.add(1102, 11, '消息提醒设置', "javascript:showWin(520,640,'sms/SmsSubscribe.html');", '', '', '', false);


						d.add(1103, 11, '用户权限', "javascript:showWin(600,530,'/ERP/UserRole_toUserRole');", '', '', '', false);



						d.add(1105, 11, '主数据编号规则', "javascript:showWin(900,530,'system/CodeRuleMain.html?list_type=1');", '', '', '',
							false);


						d.add(1106, 11, '单据编号与打印说明', "javascript:showWin(900,530,'system/CodeRuleMainTwo.html?list_type=2');", '', '',
							'', false); 
		


						d.add(1107, 11, '单据作废历史', "javascript:showWin(900,600,'system/CancelLogList.html');", '', '', '', false);


						d.add(1108, 11, '业务单改单历史', "javascript:showWin(1024,600,'business/BusinessLogList.html');", '', '', '', false);


						d.add(1109, 11, '客户修改历史', "javascript:showWin(1024,600,'base/EstablishmentLogSearchResult.html');", '', '', '',
							false);


						d.add(1110, 11, '短信消费历史', "javascript:showWin(900,500,'sms/SmsHistoryList.html');", '', '', '', false);


						d.add(1111, 11, '登录历史', "javascript:showWin(900,500,'systemsystemLogList.html');", '', '', '', false);


						d.add(1112, 11, '现金日志', "javascript:showBankLog();", '', '', '', false);


						d.add(1113, 11, '导入客户',
							"javascript:doImpo('base/EstImpoForm.html?type=CLIE','base/EstImpo.html?type=CLIE');", '', '', '', false);

						d.add(1114, 11, '导入外协商',
							"javascript:doImpo('base/EstImpoFormOut.html?type=COOP','base/EstImpo.html?type=COOP');", '', '', '',
							false);


						d.add(1115, 11, '导入供应商',
							"javascript:doImpo('base/EstImpoFormIn.html?type=PROV','base/EstImpo.html?type=PROV');", '', '', '',
							false);



						d.add(1116, 11, '导入员工', "javascript:doImpo('base/StafImpoForm.html','base/StafImpo.html');", '', '', '',
							false);


						d.add(1117, 11, '导入材料', "javascript:doImpo('base/ProductUploadForm.html','base/ProductImport.html');", '',
							'', '', false);


						d.add(1118, 11, '导入项目类型', "javascript:doImpo('base/MakeTypeImpoForm.html','base/MakeTypeImpo.html');", '',
							'', '', false);


						d.add(1119, 11, '导入业务项目价格',
							"javascript:doImpo('base/EstPricImpoForm.html?type=CLIE','base/EstPricImpo.html?type=CLIE');", '', '', '',
							false);


						d.add(1120, 11, '导入外协项目价格',
							"javascript:doImpo('base/EstPricImpoForm.html?type=COOP','base/EstPricImpo.html?type=COOP');", '', '', '',
							false);


						d.add(1121, 11, '导入客户期初欠款',
							"javascript:doImpo('base/EstBegiImpoForm.html?type=CLIE','base/EstBegiImpo.html?type=CLIE');", '', '', '',
							false);



						d.add(1122, 11, '导入外协商期初欠款',
							"javascript:doImpo('base/EstBegiImpoFormOut.html?type=COOP','base/EstBegiImpo.html?type=COOP');", '', '',
							'', false);


						d.add(1123, 11, '导入供应商期初欠款',
							"javascript:doImpo('base/EstBegiImpoFormIn.html?type=PROV','base/EstBegiImpo.html?type=PROV');", '', '',
							'', false);



						d.add(1124, 11, '数据库备份', "javascript:showWin(900,550,'system/DbBackupList.html');", '', '', '', false);


						d.add(1125, 11, '帐套管理', "javascript:showWin(400,300,'system/TallySetList.html');", '', '', '', false);



						document.write(d);
						d.closeAll();
					</script>

					<div class="dtree">
					</div>
				</div>
			</div>
		</div>
		<div id="arrow" style="position:relative;top:19px;height:110px;width:20px;padding-left:2px;float:left;cursor:pointer;font-family: Arial, &#39;宋体&#39;; font-size: 12px; color:#ffffff;background-color: #18afe7;"
		    onclick="opTab()">
			<br>
			<span id="arrtxt" style="writing-mode:lr-tb">显示菜单</span>
		</div>
	</div>


	<div id="LoadProcess" style="position:absolute; left:50%;top:50%; width:200px; height:100px; margin-top:-50px;margin-left:-100px;z-index:1; border:solid #000 5px;background-color:White;display:none">
		<table border="0" align="center" style="height:100%;">
			<tbody>
				<tr>
					<td style="valign:middle">
						<img src="images/loading.gif"> 请稍候...
					</td>
				</tr>
			</tbody>
		</table>
	</div>



	<!-- 文件太大,不能编译,只好拆分出来(为什么BusinessBillForm.jsp就不会?这里的最大限度应该是指jsp编译后的servlet的单个function的大小,而不是jsp) -->
	<!-- 不能用@include方式(未编译前的饱含),jsp:include是输出后的包含 -->








	<script type="text/javascript">
		// type:
		//   0 - Normal    2 - Else
		//   1 - Primary   3 - Weak
		var GM_Data = [

			{
				code: '01',
				name: '沟通',
				title: '',
				url: './communication/Desktop.html'
			},
			{
				code: '02',
				name: '客户业务',
				title: '',
				url: 'base/Desktop.html?type=FLOW'
			},
			{
				code: '03',
				name: '制作',
				title: '',
				url: 'make/Main.html'
			},
			{
				code: '04',
				name: '外协',
				title: '',
				url: 'cooper/Main.html'
			},
			{
				code: '05',
				name: '采购',
				title: '',
				url: 'purchase/Main.html'
			},
			{
				code: '06',
				name: '库存',
				title: '',
				url: 'storehouse/Main.html'
			},
			{
				code: '07',
				name: '帐务',
				title: '',
				url: 'finance/Main.html'
			},
			{
				code: '08',
				name: '产值',
				title: '',
				url: ''
			},
			{
				code: '09',
				name: '统计报表',
				title: '',
				url: ''
			},
			{
				code: '10',
				name: '基础数据',
				title: '',
				url: '/ERP/MakeType_toMain'
			},
			{
				code: '11',
				name: '系统管理',
				title: '',
				url: '/ERP/UserRole_toMain'
			},


			{
				code: '0101',
				name: '日程',
				title: ''
			},
			{
				code: '010111',
				type: 1,
				name: '我的日程',
				title: '',
				url: 'javascript:showWin(1024,600,"MyComm_toEstabComm");'
			},
			{
				code: '010112',
				type: 2,
				name: '新日程',
				spareName: '',
				title: '',
				url: 'javascript:showWin(1024,600,"MyComm_toNewComm");'
			},
			{
				code: '010113',
				type: 0,
				name: '下级日程',
				spareName: '',
				title: '',
				url: 'javascript:showWin(1024,600,"base/EstCommUnderList.html");'
			},
			{
				code: '010191',
				type: 1,
				name: '日历',
				spareName: '日程日历',
				title: '',
				url: 'javascript:showWin(900,600,"base/EstablishmentCommunicateCalendar.html",true);'
			},

			{
				code: '0102',
				name: '公告',
				title: ''
			},
			{
				code: '010211',
				type: 0,
				name: '所有公告',
				title: '',
				url: 'javascript:showWin(1024,600,"main_toMain");'
			},
			{
				code: '0103',
				name: '消息',
				title: ''
			},
			{
				code: '010311',
				type: 0,
				name: '发内部消息www.',
				title: '',
				url: 'messageSendAndReceive_toIndex'
			},
			{
				code: '010312',
				type: 2,
				name: '收件箱www.',
				spareName: '消息收件箱',
				title: '',
				url: 'messageSendAndReceive_findAllMessageVOsAndReceiverDeleteIsN'
			},
			{
				code: '010313',
				type: 2,
				name: '发件箱www.',
				spareName: '消息发件箱',
				title: '',
				url: 'messageSendAndReceive_findAllMessageVOsAndSendDeleteIsN'
			},

			{
				code: '0104',
				name: '短信',
				title: ''
			},
			{
				code: '010411',
				type: 0,
				name: '发短信',
				title: '',
				url: 'javascript:showWin(900,500,"sms/SmsSendForm.html");'
			},
			{
				code: '010412',
				type: 2,
				name: '群发短信',
				title: '',
				url: 'javascript:showWin(900,500,"sms/SmsSendForm.html?type=MULTI");'
			},
			{
				code: '010491',
				type: 0,
				name: '短信发送记录',
				title: '',
				url: 'javascript:showWin(900,500,"sms/SmsMyHistoryList.html");'
			},

			{
				code: '0105',
				name: '通讯录',
				title: ''
			},
			{
				code: '010511',
				type: 1,
				name: '我的通讯录',
				title: '',
				url: 'javascript:showWin(760,400,"phone_toPhoneBookList");'
			},
			{
				code: '010512',
				type: 2,
				name: '公司内部通讯录',
				title: '',
				url: 'javascript:showWin(1024,640,"phone_toInnerPbMain");'
			},
			{
				code: '0106',
				name: '其他',
				title: ''
			},
			{
				code: '010611',
				type: 0,
				name: '谁在线',
				title: '',
				url: 'javascript:showWin(500,300,"onlineList_toOnlineList");'
			},
			{
				code: '010612',
				type: 1,
				name: '关于管理易',
				title: '',
				url: 'javascript:showWin(500,320,"aboutEk_toAboutEk");'
			},


			{
				code: '0201',
				name: '客户',
				title: ''
			},
			{
				code: '020111',
				type: 0,
				name: '新客户登记',
				title: '',
				url: 'javascript:showClientDialog();'
			},
			{
				code: '020112',
				type: 2,
				name: '我的客户',
				title: '',
				url: 'javascript:showWin(1024,600,"base/EstablishmentManageList.html?type=CLIENT");'
			},
			{
				code: '020113',
				type: 2,
				name: '客户移交',
				title: '',
				url: 'javascript:showEstMoveDialog("CLIENT");'
			},
			{
				code: '020191',
				type: 0,
				name: '全部客户',
				title: '',
				url: 'javascript:showWin(1280,600,"base/EstablishmentList.html?type=CLIENT");'
			},

			{
				code: '0202',
				name: '业务',
				title: ''
			},

			{
				code: '020211',
				type: 1,
				name: '业务接单',
				title: '',
				url: 'javascript:showBusinessBillDialog();'
			},
			{
				code: '020212',
				type: 2,
				name: '传图下单',
				title: '',
				url: 'javascript:showBusinessFileDialog();'
			},
			{
				code: '020213',
				type: 2,
				name: '拖图下单',
				title: '',
				url: 'javascript:showBusinessDragDialog();'
			},

			{
				code: '020291',
				type: 1,
				name: '业务单一览表',
				title: '',
				url: 'javascript:showWin(1280,800,"ERP/BusinessBillVTO_toBusinessBillListForExamine");'
			},

			{
				code: '020221',
				type: 0,
				name: '上传设计文件',
				title: '',
				url: 'javascript:showWin(900,600,"business/BusinessBillListForAccessory.html");'
			},
			{
				code: '020222',
				type: 2,
				name: '上传文件一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/AcceSear.html");'
			},
			{
				code: '020292',
				type: 0,
				name: '业务明细一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillItemSearchResult.html");'
			},

			{
				code: '020231',
				type: 0,
				name: '开单人改单',
				title: '',
				url: 'javascript:showWin(900,600,"business/BusinessBillListForModifySelf.html",true);'
			},
			{
				code: '020232',
				type: 2,
				name: '改价格',
				title: '',
				url: 'javascript:showWin(900,600,"business/BusinessBillListForEditPrice.html");'
			},
			{
				code: '020293',
				type: 1,
				name: '价格手册www.',
				title: '',
				url: 'javascript:showWin(1024,600,"base/PriceGuideItemList.html?pg_id=1");'
			},

			{
				code: '020241',
				type: 0,
				name: '业务单审核',
				title: '',
				url: 'javascript:showWin(900,600,"ERP/BusinessBillVTO_toBusinessBillListForExamine");'
			},
			{
				code: '020242',
				type: 2,
				name: '反审核',
				spareName: '业务单反审核',
				title: '',
				url: 'javascript:showWin(1024,600,"BusinessBillVTO_toBusinessBillListForUnExamine");'
			},
			{
				code: '020294',
				type: 0,
				name: '扫条码查进度',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessRelBillList.html");'
			},


			{
				code: '0203',
				name: '送货',
				title: ''
			},
			{
				code: '020311',
				type: 0,
				name: '送货',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillListForDeliver.html");'
			},
			{
				code: '020312',
				type: 2,
				name: '审核',
				spareName: '送货单审核',
				title: '',
				url: 'javascript:showWin(1024,600,"business/DeliverBillListForExamine.html");'
			},
			{
				code: '020313',
				type: 2,
				name: '反审核',
				spareName: '送货单反审核',
				title: '',
				url: 'javascript:showWin(1024,600,"BusinessBillVTO_toBusinessBillListForExamine");'
			},
			{
				code: '020391',
				type: 0,
				name: '送货单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/DeliverBillSearchResult.html");'
			},

			{
				code: '020392',
				type: 0,
				name: '送货明细一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/DeliverBillItemSearchResult.html");'
			},


			{
				code: '0204',
				name: '安装',
				title: ''
			},
			{
				code: '020411',
				type: 0,
				name: '安装',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillListForSetu.html");'
			},
			{
				code: '020412',
				type: 2,
				name: '审核',
				spareName: '安装单审核',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillListForExam.html");'
			},
			{
				code: '020413',
				type: 2,
				name: '反审核',
				spareName: '安装单反审核',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillListForUnExam.html");'
			},
			{
				code: '020491',
				type: 0,
				name: '安装单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillSearchResult.html");'
			},

			{
				code: '020422',
				type: 2,
				name: '完工',
				spareName: '安装单完工',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillListForComp.html");'
			},
			{
				code: '020423',
				type: 2,
				name: '反完工',
				spareName: '安装单反完工',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillListForUnComp.html");'
			},
			{
				code: '020492',
				type: 0,
				name: '安装完工图一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuAcceList.html");'
			},


			{
				code: '0205',
				name: '结账',
				title: ''
			},
			{
				code: '020511',
				type: 1,
				name: '业务对帐',
				title: '',
				url: 'javascript:showBusAccountDialog();'
			},
			{
				code: '020512',
				type: 2,
				name: '送货对帐',
				title: '',
				url: 'javascript:showDelAccountDialog();'
			},

			{
				code: '020521',
				type: 0,
				name: '业务单结清',
				spareName: '业务单结清',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillListForClose.html");'
			},
			{
				code: '020522',
				type: 2,
				name: '反结清',
				spareName: '业务单反结清',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillListForUnClose.html");'
			},


			{
				code: '0206',
				name: '作废',
				title: ''
			},
			{
				code: '020611',
				type: 3,
				name: '业务单作废',
				title: '',
				url: 'javascript:showWin(900,600,"business/BusinessBillListForCancel.html");'
			},
			{
				code: '020612',
				type: 3,
				name: '送货单作废',
				title: '',
				url: 'javascript:showWin(1024,600,"business/DeliverBillListForCancel.html");'
			},
			{
				code: '020613',
				type: 3,
				name: '安装单作废',
				title: '',
				url: 'javascript:showWin(1024,600,"business/SetuBillListForCanc.html");'
			},




			{
				code: '0301',
				name: '制作',
				title: ''
			},
			{
				code: '030111',
				type: 1,
				name: '要制作的业务单www.',
				title: '',
				url: 'makebill_listUI'
			},
			{
				code: '030112',
				type: 0,
				name: '生产进度管理www.',
				title: '',
				url: 'javascript:showWin(1024,600,"make/BusinessBillListForTask.html");'
			},


			{
				code: '0302',
				name: '产量',
				title: ''
			},
			{
				code: '030211',
				type: 0,
				name: '产量登记www.',
				title: '',
				url: 'chanLiangRegister_listUI'
			},
			{
				code: '030291',
				type: 0,
				name: '产量计件明细表www.',
				title: '',
				url: 'ouputDetail_listUI'
			},
			{
				code: '030292',
				type: 0,
				name: '产量统计表',
				title: '',
				url: 'javascript:showWin(900,600,"make/OutputCount.html");'
			},


			{
				code: '0303',
				name: '完工',
				title: ''
			},
			{
				code: '030311',
				type: 0,
				name: '业务单完工',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessBillListForComplete.html");'
			},
			{
				code: '030312',
				type: 2,
				name: '反完工',
				spareName: '业务单反完工',
				title: '',
				url: 'javascript:showWin(900,600,"business/BusinessBillListForUnComplete.html");'
			},





			{
				code: '0401',
				name: '外协商',
				title: ''
			},
			{
				code: '040111',
				type: 0,
				name: '外协商登记',
				title: '',
				url: 'javascript:showCooperatorDialog();'
			},
			{
				code: '040112',
				type: 2,
				name: '外协商移交',
				title: '',
				url: 'javascript:showEstMoveDialog("COOPERATOR");'
			},
			{
				code: '040191',
				type: 0,
				name: '全部外协商',
				title: '',
				url: 'javascript:showWin(1024,600,"base/EstablishmentList.html?type=COOPERATOR");'
			},


			{
				code: '0402',
				name: '外协',
				title: ''
			},
			{
				code: '040211',
				type: 1,
				name: '要外协的业务单',
				title: '',
				url: 'javascript:showWin(1024,600,"cooper/BusinessBillListForCooper.html");'
			},
			{
				code: '040291',
				type: 0,
				name: '外协单一览表',
				title: '',
				url: 'javascript:showWin(1280,600,"cooper/CooperBillSearchResult.html");'
			},

			{
				code: '040221',
				type: 0,
				name: '外协开单',
				title: '',
				url: 'javascript:showCooperBillDialog();'
			},
			{
				code: '040292',
				type: 0,
				name: '外协明细一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"cooper/CooperBillItemSearchResult.html");'
			},

			{
				code: '040231',
				type: 0,
				name: '外协单改价格',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/CooperBillListForEditPrice.html");'
			},
			{
				code: '040293',
				type: 1,
				name: '外协价格',
				title: '',
				url: 'javascript:showWin(1024,600,"base/EstPriceList.html?price_type=STA&est_type=COOPERATOR");'
			},

			{
				code: '040241',
				type: 0,
				name: '外协单审核www.',
				title: '',
				url: 'javascript:showWin(900,600,"CooperAgaincheck_listUI?isCheck=1");'
			},
			{
				code: '040242',
				type: 2,
				name: '反审核www.',
				spareName: '外协单反审核',
				title: '',
				url:  'javascript:showWin(900,600,"CooperAgaincheck_listUI?isCheck=0");'
			},


			{
				code: '0403',
				name: '收货',
				title: ''
			},
			{
				code: '040311',
				type: 0,
				name: '外协收货',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/CooperBillListForGather.html");'
			},
			{
				code: '040312',
				type: 2,
				name: '审核',
				spareName: '收货单审核',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/GatherBillListForExamine.html");'
			},
			{
				code: '040313',
				type: 2,
				name: '反审核',
				spareName: '收货单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/GatherBillListForUnExamine.html");'
			},
			{
				code: '040391',
				type: 0,
				name: '收货单一览表',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/CooperBillSearchResult.html");'
			},


			{
				code: '0404',
				name: '完工',
				title: ''
			},
			{
				code: '040411',
				type: 0,
				name: '外协完工',
				title: '',
				url: 'javascript:showWin(1024,600,"cooper_toCooperComp");'
			},
			{
				code: '040412',
				type: 2,
				name: '外协反完工',
				title: '',
				url: 'javascript:showWin(900,600,"cooperUn_toCooperUnComp");'
			},


			{
				code: '0405',
				name: '结帐',
				title: ''
			},
			{
				code: '040511',
				type: 1,
				name: '外协对账www.',
				title: '',
				url: 'reciveingcheck_firstlistSelectUI'
			},
			{
				code: '040512',
				type: 2,
				name: '收货对账www.',
				title: '',
				url: 'reciveingcheck_firstlistSelectUI'
			},



			{
				code: '0406',
				name: '作废',
				title: ''
			},
			{
				code: '040611',
				type: 3,
				name: '外协单作废',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/CooperBillListForCancel.html");'
			},
			{
				code: '040612',
				type: 3,
				name: '收货单作废',
				title: '',
				url: 'javascript:showWin(900,600,"cooper/GatherBillListForCancel.html");'
			},





			{
				code: '0501',
				name: '供应商',
				title: ''
			},
			{
				code: '050111',
				type: 0,
				name: '供应商登记www.',
				title: '',
				url: 'gongyingshang_dengjiUI'
			},
			{
				code: '050112',
				type: 2,
				name: '供应商移交www.',
				title: '',
				url: 'gongyingshang_yijiao'
			},
			{
				code: '050191',
				type: 0,
				name: '全部供应商www.',
				title: '',
				url: 'gongyingshang_listUI'
			},

			{
				code: '0502',
				name: '采购',
				title: ''
			},
			{
				code: '050211',
				type: 1,
				name: '采购单www.',
				title: '',
				url: 'javascript:showWin(1024,600,"purchase/PurchaseBillNew.html?type=BUY&alert_type=FORM");'
			},
			{
				code: '050212',
				type: 2,
				name: '审核www.',
				spareName: '采购单审核',
				title: '',
				url: 'caigoudanshenhe_findAll'
			},
			{
				code: '050213',
				type: 2,
				name: '反审核www.',
				spareName: '采购单反审核',
				title: '',
				url: 'caigoudanfanshenhe_findAll'
			},
			{
				code: '050291',
				type: 0,
				name: '采购单一览表www.',
				title: '',
				url: 'caigoudanyilanbiao_findAll'
			},



			{
				code: '0503',
				name: '退货',
				title: ''
			},
			{
				code: '050311',
				type: 0,
				name: '退货单www.',
				title: '',
				url: 'tuihuodanyilanbiao_findAll'
			},
			{
				code: '050312',
				type: 2,
				name: '审核www.',
				spareName: '退货单审核',
				title: '',
				url: 'tuihuodanshenhe_findAll'
			},
			{
				code: '050313',
				type: 2,
				name: '反审核www.',
				spareName: '退货单反审核',
				title: '',
				url: 'tuihuodanfanshenhe_findAll'
			},
			{
				code: '050391',
				type: 0,
				name: '退货单一览表www.',
				title: '',
				url: 'tuihuodanyilanbiao_findAll'
			},


			{
				code: '0504',
				name: '对账',
				title: ''
			},
			{
				code: '050411',
				type: 1,
				name: '采购对账www.',
				title: '',
				url: 'caigouduizhang_findAll'
			},
			{
				code: '050491',
				type: 0,
				name: '采购明细表www.',
				title: '',
				url: 'caigoumingxi_findAll'
			},
			{
				code: '050492',
				type: 0,
				name: '供应商采购汇总表www.',
				title: '',
				url: 'caigouhuizongbiao_findAll'
			},
			{
				code: '050493',
				type: 0,
				name: '材料采购汇总表www.',
				title: '',
				url: 'javascript:showWin(1024,600,"purchase/PurcProdCoun-All.html");'
			},


			{
				code: '0505',
				name: '作废',
				title: ''
			},
			{
				code: '050511',
				type: 3,
				name: '采购单作废www.',
				title: '',
				url: 'purchasecanleling_list'
			},
			{
				code: '050512',
				type: 3,
				name: '退货单作废www.',
				title: '',
				url: 'tuikuancanleling_listtuikuan'
			},





			{
				code: '0601',
				name: '入库',
				title: ''
			},
			{
				code: '060111',
				type: 0,
				name: '入库单',
				title: '',
				url: 'javascript:showWin(1024,600,"InBillNew_toInBillNew");'
			},
			{
				code: '060112',
				type: 2,
				name: '审核',
				spareName: '入库单审核',
				title: '',
				url: 'javascript:showWin(900,600,"inStoreExamine_toInStoreExamine");'
			},
			{
				code: '060113',
				type: 2,
				name: '反审核',
				spareName: '入库单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"inStoreUnExamine_toInStoreUnExamine");'
			},
			{
				code: '060191',
				type: 0,
				name: '入库单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"inStorehouse_toInBillResult");'
			},



			{
				code: '0602',
				name: '出库',
				title: ''
			},
			{
				code: '060211',
				type: 1,
				name: '出库单',
				title: '',
				url: 'javascript:showWin(1024,600,"OutBill_toOutBillNew");'
			},
			{
				code: '060212',
				type: 2,
				name: '审核',
				spareName: '出库单审核',
				title: '',
				url: 'javascript:showWin(900,600,"outStoreExamine_toOutStoreExamine");'
			},
			{
				code: '060213',
				type: 2,
				name: '反审核',
				spareName: '出库单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"outStoreUnExamine_toOutStoreUnExamine");'
			},
			{
				code: '060291',
				type: 0,
				name: '出库单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"outResult_toOutResult");'
			},

			{
				code: '060292',
				type: 0,
				name: '出库明细一览表',
				title: '',
				url: 'javascript:showWin(1280,600,"outStorehouse_toOutBillList");'
			},


			{
				code: '0603',
				name: '调拨',
				title: ''
			},
			{
				code: '060311',
				type: 0,
				name: '调拨单',
				title: '',
				url: 'javascript:showWin(1024,600,"storehouse/AlloBillNew.html?alert_type=FORM");'
			},
			{
				code: '060312',
				type: 2,
				name: '审核',
				spareName: '调拨单审核',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/AlloBillListForExamine.html");'
			},
			{
				code: '060313',
				type: 2,
				name: '反审核',
				spareName: '调拨单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/AlloBillListForUnExamine.html");'
			},
			{
				code: '060391',
				type: 0,
				name: '调拨单一览表',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/AlloBillSearchResult.html");'
			},


			{
				code: '0604',
				name: '库存',
				title: ''
			},
			{
				code: '060411',
				type: 1,
				name: '库存查询',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/StockSearch.html");'
			},
			{
				code: '060412',
				type: 0,
				name: '收发存明细表',
				title: '',
				url: 'javascript:showWin(1024,600,"storehouse/InOutList.html");'
			},
			{
				code: '060491',
				type: 0,
				name: '收发存汇总表',
				title: '',
				url: 'javascript:showWin(1024,600,"storehouse/InOutCount.html");'
			},


			{
				code: '0605',
				name: '作废',
				title: ''
			},
			{
				code: '060511',
				type: 3,
				name: '入库单作废',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/InBillListForCancel.html");'
			},
			{
				code: '060512',
				type: 3,
				name: '出库单作废',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/OutBillListForCancel-out.html");'
			},
			{
				code: '060513',
				type: 3,
				name: '调拨单作废',
				title: '',
				url: 'javascript:showWin(900,600,"storehouse/AlloBillListForCancel.html");'
			},





			{
				code: '0701',
				name: '收入',
				title: ''
			},
			{
				code: '070111',
				type: 1,
				name: '收款单',
				title: '',
				url: 'javascript:showWin(1024,600,"ReceiveBill_toReceiveBillNew");'
			},
			{
				code: '070112',
				type: 2,
				name: '审核',
				spareName: '收款单审核',
				title: '',
				url: 'javascript:showWin(900,600,"ReceiveBill_toNoReceiveBillList");'
			},
			{
				code: '070113',
				type: 2,
				name: '反审核',
				spareName: '收款单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"ReceiveBill_toCanReceiveBillList");'
			},
			{
				code: '070121',
				type: 0,
				name: '其他收入单',
				title: '',
				url: 'javascript:showWin(1024,420,"InComeBill_toNewInComeBill");'
			},
			{
				code: '070122',
				type: 2,
				name: '审核',
				spareName: '其他收入审核',
				title: '',
				url: 'javascript:showWin(900,600,"InComeBill_toIncomeBillListForExamine");'
			},
			{
				code: '070123',
				type: 2,
				name: '反审核',
				spareName: '其他收入反审核',
				title: '',
				url: 'javascript:showWin(900,600,"InComeBill_toUnIncomeBillListForExamine");'
			},
			{
				code: '070191',
				type: 0,
				name: '收款单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"ReceiveBill_toReceiveBillResult");'
			},
			{
				code: '070192',
				type: 0,
				name: '其他收入一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"InComeBill_toIncomeBillSearchResult");'
			},


			{
				code: '0702',
				name: '支出',
				title: ''
			},
			{
				code: '070211',
				type: 1,
				name: '付款单',
				title: '',
				url: 'javascript:showPayBillDialog();'
			},
			{
				code: '070212',
				type: 2,
				name: '审核',
				spareName: '付款单审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/PayBillListForExamine.html");'
			},
			{
				code: '070213',
				type: 2,
				name: '反审核',
				spareName: '付款单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/PayBillListForUnExamine.html");'
			},
			{
				code: '070221',
				type: 0,
				name: '费用单',
				title: '',
				url: 'javascript:showWin(1024,420,"finance/FeeBillNew.html?alert_type=SHOW");'
			},
			{
				code: '070222',
				type: 2,
				name: '审核',
				spareName: '费用单审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/FeeBillListForExamine.html");'
			},
			{
				code: '070223',
				type: 2,
				name: '反审核',
				spareName: '费用单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/FeeBillListForUnExamine.html");'
			},
			{
				code: '070291',
				type: 0,
				name: '付款单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/PayBillSearchResult.html");'
			},
			{
				code: '070292',
				type: 0,
				name: '费用单一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/FeeBillSearchResult.html");'
			},
			{
				code: '070293',
				type: 0,
				name: '费用明细一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/FeeBillItemSearchResult.html");'
			},

			{
				code: '070294',
				type: 0,
				name: '我的费用单',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/FeeBillItemMy.html");'
			},


			{
				code: '0703',
				name: '调转取',
				title: ''
			},
			{
				code: '070311',
				type: 0,
				name: '调账单',
				title: '',
				url: 'javascript:showAdjustBillDialog();'
			},
			{
				code: '070312',
				type: 2,
				name: '审核',
				spareName: '调账单审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/AdjustBillListForExamine.html");'
			},
			{
				code: '070313',
				type: 2,
				name: '反审核',
				spareName: '调账单反审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/AdjustBillListForUnExamine.html");'
			},
			{
				code: '070321',
				type: 0,
				name: '转账取款单',
				title: '',
				url: 'javascript:showWin(1024,420,"finance/TransferBillNew.html?alert_type=SHOW");'
			},
			{
				code: '070322',
				type: 2,
				name: '审核',
				spareName: '转账取款审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/TransferBillListForExamine.html");'
			},
			{
				code: '070323',
				type: 2,
				name: '反审核',
				spareName: '转账取款反审核',
				title: '',
				url: 'javascript:showWin(900,600,"finance/TransferBillListForUnExamine.html");'
			},
			{
				code: '070391',
				type: 0,
				name: '调账单一览表',
				title: '',
				url: 'javascript:showWin(900,600,"finance/AdjustBillSearchResult.html");'
			},
			{
				code: '070392',
				type: 0,
				name: '转账取款一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/TransferBillSearchResult.html");'
			},


			{
				code: '0704',
				name: '借入出',
				title: ''
			},
			{
				code: '070411',
				type: 0,
				name: '资金借入单',
				title: '',
				url: 'javascript:showWin(1024,420,"inLoanBill_toInLoanBill");'
			},
			{
				code: '070412',
				type: 2,
				name: '审核',
				spareName: '资金借入审核',
				title: '',
				url: 'javascript:showWin(900,600,"inExamine_toInExamineResult");'
			},
			{
				code: '070413',
				type: 2,
				name: '反审核',
				spareName: '资金借入反审核',
				title: '',
				url: 'javascript:showWin(900,600,"inUnExamine_toInUnExamineResult");'
			},
			{
				code: '070421',
				type: 0,
				name: '资金借出单',
				title: '',
				url: 'javascript:showWin(1024,420,"outLoanBill_toOutLoanBill");'
			},
			{
				code: '070422',
				type: 2,
				name: '审核',
				spareName: '资金借出审核',
				title: '',
				url: 'javascript:showWin(900,600,"outExamine_toOutExamineResult");'
			},
			{
				code: '070423',
				type: 2,
				name: '反审核',
				spareName: '资金借出反审核',
				title: '',
				url: 'javascript:showWin(900,600,"outUnExamine_toOutUnExamineResult");'
			},
			{
				code: '070491',
				type: 0,
				name: '资金借入一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"inDetail_toLoanBillResult");'
			},
			{
				code: '070492',
				type: 0,
				name: '资金借出一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"outDetail_toOutBillResult");'
			},


			{
				code: '0705',
				name: '作废',
				title: '',
				isColMerge: true
			},
			{
				code: '070511',
				type: 3,
				name: '收款单作废',
				title: '',
				url: 'javascript:showWin(900,600,"Accounts_toReceiveBillListForCancel");'
			},
			{
				code: '070512',
				type: 3,
				name: '其他收入单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/IncomeBillListForCancel.html");'
			},
			{
				code: '070513',
				type: 3,
				name: '付款单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/PayBillListForCancel.html");'
			},
			{
				code: '070514',
				type: 3,
				name: '费用单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/FeeBillListForCancel.html");'
			},
			{
				code: '070521',
				type: 3,
				name: '调账单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/AdjustBillListForCancel.html");'
			},
			{
				code: '070522',
				type: 3,
				name: '转账取款单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/TransferBillListForCancel.html");'
			},
			{
				code: '070523',
				type: 3,
				name: '资金借入单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/LoanBillListForCancel.html?type=IN");'
			},
			{
				code: '070524',
				type: 3,
				name: '资金借出单作废',
				title: '',
				url: 'javascript:showWin(900,600,"finance/LoanBillListForCancel.html?type=OUT");'
			},





			{
				code: '0801',
				name: '岗位',
				title: ''
			},
			{
				code: '080111',
				type: 0,
				name: '接单产值明细',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvBusinessList.html");'
			},
			{
				code: '080112',
				type: 0,
				name: '跟单产值明细',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvFollowList.html");'
			},
			{
				code: '080191',
				type: 1,
				name: '产值统计表',
				title: '',
				url: 'javascript:showWin(1024,600,"make/OvCount.html");'
			},

			{
				code: '080121',
				type: 0,
				name: '设计产值明细',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvDesignList.html");'
			},
			{
				code: '080122',
				type: 0,
				name: '制作产值明细',
				title: '',
				url: 'javascript:showWin(1024,600,"make/OvMakeList.html");'
			},
			{
				code: '080192',
				type: 0,
				name: '员工计件产值统计表',
				title: '',
				url: 'javascript:showWin(800,600,"make/OutputWage.html");'
			},

			{
				code: '080131',
				type: 0,
				name: '收欠费产值明细',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvReceiveList.html");'
			},
			{
				code: '080132',
				type: 0,
				name: '安装产值明细',
				title: '',
				url: 'javascript:showWin(1024,600,"make/OvSetuList.html");'
			},

			{
				code: '080141',
				type: 0,
				name: '营销产值明细',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvSaleList.html");'
			},


			{
				code: '0802',
				name: '产值',
				title: ''
			},
			{
				code: '080211',
				type: 1,
				name: '产值单',
				title: '',
				url: 'javascript:showWin(1024,420,"make/OvBillNew.html?alert_type=SHOW");'
			},
			{
				code: '080212',
				type: 2,
				name: '审核',
				title: '',
				spareName: '产值单审核',
				url: 'javascript:showWin(900,600,"make/OvBillListForExamine.html");'
			},
			{
				code: '080213',
				type: 2,
				name: '反审核',
				title: '',
				spareName: '产值单反审核',
				url: 'javascript:showWin(900,600,"make/OvBillListForUnExamine.html");'
			},
			{
				code: '080291',
				type: 0,
				name: '产值单一览表',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvBillSearchResult.html");'
			},


			{
				code: '0803',
				name: '规则',
				title: '',
				isColMerge: true
			},
			{
				code: '080311',
				type: 0,
				name: '业务单产值分配规则',
				title: '',
				url: 'javascript:showWin(500,380,"make/SetOvPercentForm.html");'
			},
			{
				code: '080312',
				type: 0,
				name: '业务单特殊产值规则',
				title: '',
				url: 'javascript:showWin(1024,600,"make/BusinessBillListForOv.html");'
			},


			{
				code: '0804',
				name: '作废',
				title: '',
				isColMerge: true
			},
			{
				code: '080411',
				type: 3,
				name: '产值单作废',
				title: '',
				url: 'javascript:showWin(900,600,"make/OvBillListForCancel.html");'
			},





			{
				code: '0901',
				name: '营业',
				title: ''
			},
			{
				code: '090111',
				type: 1,
				name: '销售日报表',
				title: '',
				url: 'javascript:showWin(900,600,"Report_toBusinessDateCount");'
			},
			{
				code: '090112',
				type: 0,
				name: '项目营业日报表',
				title: '',
				url: 'javascript:showWin(900,600,"busi	ness/MtBusinessDate.html");'
			},
			{
				code: '090191',
				type: 0,
				name: '项目营业汇总表',
				title: '',
				url: 'javascript:showWin(900,600,"business/MtBusinessCount.html");'
			},

			{
				code: '090121',
				type: 0,
				name: '员工业绩排行表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/StafferExploitList.html");'
			},
			{
				code: '090192',
				type: 1,
				name: '客户营业汇总表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/EstBusinessCount.html");'
			},


			{
				code: '0902',
				name: '利润',
				title: ''
			},
			{
				code: '090211',
				type: 0,
				name: '业务单成本表',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessProfitSearchResult.html");'
			},
			{
				code: '090212',
				type: 0,
				name: '利润表',
				title: '',
				url: 'javascript:showWin(900,600,"finance/ProfitSearch.html");'
			},
			{
				code: '090291',
				type: 0,
				name: '利润汇总表',
				title: '',
				url: 'javascript:showWin(900,600,"finance/ProfitCount.html");'
			},


			{
				code: '0903',
				name: '应收',
				title: ''
			},
			{
				code: '090311',
				type: 1,
				name: '客户应收款',
				title: '',
				url: 'javascript:showWin(1024,600,"Statistic_toReceivableList");'
			},
			{
				code: '090312',
				type: 0,
				name: '业务单应收款',
				title: '',
				url: 'javascript:showWin(1024,600,"Statistic_toBusinessBillListForReceive");'
			},
			{
				code: '090391',
				type: 0,
				name: '应收汇总表',
				title: '',
				url: 'javascript:showWin(900,600,"Statistic_toReceivableCount");'
			},
			{
				code: '090321',
				type: 0,
				name: '应收款账龄分布表',
				title: '',
				url: 'javascript:showWin(1024,600,"Statistic_toReceivableAgeList");'
			},


			{
				code: '0904',
				name: '应付',
				title: ''
			},
			{
				code: '090411',
				type: 0,
				name: '采购单应付款',
				title: '',
				url: 'javascript:showWin(1024,600,"purchase/PurchaseBillListForPay.html");'
			},
			{
				code: '090412',
				type: 0,
				name: '应付账款',
				title: '',
				url: 'javascript:showWin(900,600,"finance/PayableList.html");'
			},
			{
				code: '090491',
				type: 0,
				name: '应付汇总表',
				title: '',
				url: 'javascript:showWin(900,600,"finance/PayableCount.html");'
			},

			{
				code: '090421',
				type: 0,
				name: '外协单应付款',
				title: '',
				url: 'javascript:showWin(1024,600,"cooper/CooperBillListForPay.html");'
			},


			{
				code: '0905',
				name: '回款',
				title: ''
			},
			{
				code: '090511',
				type: 1,
				name: '销售回款一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/BackCostList.html");'
			},
			{
				code: '090512',
				type: 0,
				name: '结欠回款明细表',
				title: '',
				url: 'javascript:showWin(1280,600,"finance/ReceiveBillItemSearchResult.html");'
			},
			{
				code: '090591',
				type: 0,
				name: '客户回款汇总表',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/EstBackCount.html");'
			},


			{
				code: '0906',
				name: '付款',
				title: '',
				isColMerge: true
			},
			{
				code: '090611',
				type: 0,
				name: '采购付款一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"Statistic_toPurPayCostList");'
			},
			{
				code: '090612',
				type: 0,
				name: '外协付款一览表',
				title: '',
				url: 'javascript:showWin(1024,600,"Statistic_toCooPayCostList");'
			},


			{
				code: '0907',
				name: '资金',
				title: ''
			},
			{
				code: '090711',
				type: 1,
				name: '现金银行',
				title: '',
				url: 'javascript:showWin(1024,600,"finance/AccountBalanceList.html?is_tmp=Y");'
			},
			{
				code: '090712',
				type: 0,
				name: '资金借入统计',
				title: '',
				url: 'javascript:showWin(700,600,"Accounts_toLoanBillListForCancel");'
			},
			{
				code: '090791',
				type: 0,
				name: '资金借出统计',
				title: '',
				url: 'javascript:showWin(700,600,"finance/LoanBillCount.html?type=OUT");'
			},













			{
				code: '1001',
				name: '员工',
				title: ''
			},
			{
				code: '100111',
				type: 1,
				name: '部门与员工',
				title: '',
				url: 'javascript:showWin(900,640,"departStaff_toMain");'
			},


			{
				code: '1002',
				name: '客户',
				title: ''
			},
			{
				code: '100211',
				type: 0,
				name: '单位类别',
				title: '',
				url: 'javascript:showWin(400,350,"/ERP/customerLevel_toCustomLevelMain");'
			},
			{
				code: '100212',
				type: 0,
				name: '客户等级',
				title: '',
				url: 'javascript:showWin(400,350,"/ERP/customerType_toCustomTypeMain");'
			},
			{
				code: '100213',
				type: 0,
				name: '地区管理',
				title: '',
				url: 'javascript:showWin(540,350,"place_listUI");'
			},


			{
				code: '1003',
				name: '业务',
				title: ''
			},
			{
				code: '100311',
				type: 1,
				name: '项目类型',
				title: '',
				url: 'javascript:showWin(680,500,"ERP/MakeType_toMakeTypeList");'
			},
			{
				code: '100312',
				type: 0,
				name: '制作要求',
				title: '',
				url: 'javascript:showWin(600,500,"ERP/MakeRequire_toMakeRequireList");'
			},
			{
				code: '100313',
				type: 0,
				name: '文件说明',
				title: '',
				url: 'javascript:showWin(600,500,"AccessoryMark_toAccessoryMarkList");'
			},

			{
				code: '100321',
				type: 0,
				name: '工作中心',
				title: '',
				url: 'javascript:showWin(600,400,"base/WorkCenterList.html");'
			},
			{
				code: '100322',
				type: 0,
				name: '付款方式',
				title: '',
				url: 'javascript:showWin(400,300,"base/PayModeList.html");'
			},
			{
				code: '100323',
				type: 0,
				name: '价格手册',
				title: '',
				url: 'javascript:showWin(680,500,"estprice_EstPriceUI");'
			},


			{
				code: '1004',
				name: '材料',
				title: ''
			},
			{
				code: '100411',
				type: 0,
				name: '材料',
				title: '',
				url: 'javascript:showWin(1024,640,"product_toProductMain");'
			},
			{
				code: '100412',
				type: 0,
				name: '计量单位',
				title: '',
				url: 'javascript:showWin(400,300,"unit_toUnitList");'
			},


			{
				code: '1005',
				name: '仓库',
				title: ''
			},
			{
				code: '100511',
				type: 0,
				name: '仓库',
				title: '',
				url: 'javascript:showWin(600,400,"base/StorehouseList.html");'
			},
			{
				code: '100512',
				type: 0,
				name: '入库类型',
				title: '',
				url: 'javascript:showWin(600,500,"base/InTypeList.html");'
			},
			{
				code: '100513',
				type: 0,
				name: '出库类型',
				title: '',
				url: 'javascript:showWin(600,500,"base/OutTypeList.html");'
			},


			{
				code: '1006',
				name: '账务',
				title: ''
			},
			{
				code: '100611',
				type: 0,
				name: '银行账户www.',
				title: '',
				url: 'javascript:showWin(900,400,"moneybill_BankAccountUI");'
			},
			{
				code: '100612',
				type: 0,
				name: '收入类型www.',
				title: '',
				url: 'javascript:showWin(600,400,"incometype_IncomeTypeUI");'
			},
			{
				code: '100613',
				type: 0,
				name: '费用类型www.',
				title: '',
				url: 'javascript:showWin(600,400,"feetype_FeeTypeUI");'
			},




			{
				code: '1101',
				name: '配置',
				title: ''
			},
			{
				code: '110111',
				type: 0,
				name: '系统配置',
				title: '',
				url: 'javascript:showWin(900,620,"system/EnterpriseInfoEdit.html");'
			},
			{
				code: '110112',
				type: 0,
				name: '消息提醒设置',
				title: '',
				url: 'javascript:showWin(520,640,"sms/SmsSubscribe.html");'
			},


			{
				code: '1102',
				name: '账户',
				title: ''
			},
			{
				code: '110211',
				type: 1,
				name: '用户权限',
				title: '',
				url: 'javascript:showWin(600,530,"/ERP/UserRole_toUserRole");'
			},



			{
				code: '1103',
				name: '规则',
				title: ''
			},
			{
				code: '110311',
				type: 0,
				name: '主数据编号规则',
				title: '',
				url: 'javascript:showWin(900,530,"system/CodeRuleMain.html?list_type=1");'
			},
			{
				code: '110312',
				type: 0,
				name: '单据编号与打印说明',
				title: '',
				url: 'javascript:showWin(900,530,"system/CodeRuleMainTwo.html?list_type=2");'
			},


			{
				code: '1104',
				name: '历史',
				title: ''
			},
			{
				code: '110411',
				type: 1,
				name: '单据作废历史',
				title: '',
				url: 'javascript:showWin(900,600,"system/CancelLogList.html");'
			},
			{
				code: '110412',
				type: 0,
				name: '业务单改单历史',
				title: '',
				url: 'javascript:showWin(1024,600,"business/BusinessLogList.html");'
			},
			{
				code: '110413',
				type: 0,
				name: '客户修改历史',
				title: '',
				url: 'javascript:showWin(1024,600,"base/EstablishmentLogSearchResult.html");'
			},

			{
				code: '110421',
				type: 0,
				name: '短信消费历史',
				title: '',
				url: 'javascript:showWin(900,600,"sms/SmsHistoryList.html");'
			},
			{
				code: '110422',
				type: 0,
				name: '登录历史',
				title: '',
				url: 'javascript:showWin(900,600,"system/systemLogList.html");'
			},
			{
				code: '110423',
				type: 0,
				name: '现金日志',
				title: '',
				url: 'javascript:showBankLog();'
			},


			{
				code: '1105',
				name: '导入',
				title: ''
			},
			{
				code: '110511',
				type: 1,
				name: '导入客户',
				title: '',
				url: 'javascript:doImpo("base/EstImpoForm.html?type=CLIE","base/EstImpo.html?type=CLIE");'
			},
			{
				code: '110512',
				type: 0,
				name: '导入外协商',
				title: '',
				url: 'javascript:doImpo("base/EstImpoFormOut.html?type=COOP","base/EstImpo.html?type=COOP");'
			},
			{
				code: '110513',
				type: 0,
				name: '导入供应商',
				title: '',
				url: 'javascript:doImpo("base/EstImpoFormIn.html?type=PROV","base/EstImpo.html?type=PROV");'
			},

			{
				code: '110521',
				type: 0,
				name: '导入员工',
				title: '',
				url: 'javascript:doImpo("base/StafImpoForm.html","base/StafImpo.html");'
			},
			{
				code: '110522',
				type: 0,
				name: '导入材料',
				title: '',
				url: 'javascript:doImpo("base/ProductUploadForm.html","base/ProductImport.html");'
			},
			{
				code: '110523',
				type: 0,
				name: '导入项目类型',
				title: '',
				url: 'javascript:doImpo("base/MakeTypeImpoForm.html","base/MakeTypeImpo.html");'
			},

			{
				code: '110531',
				type: 0,
				name: '导入业务项目价格',
				title: '',
				url: 'javascript:doImpo("base/EstPricImpoForm.html?type=CLIE","base/EstPricImpo.html?type=CLIE");'
			},
			{
				code: '110532',
				type: 0,
				name: '导入外协项目价格',
				title: '',
				url: 'javascript:doImpo("base/EstPricImpoForm.html?type=COOP","base/EstPricImpo.html?type=COOP");'
			},


			{
				code: '1106',
				name: '期初',
				title: ''
			},
			{
				code: '110611',
				type: 0,
				name: '导入客户期初欠款www.',
				title: '',
				url: 'qichuqiankuan_DaoRu'
			},
			{
				code: '110612',
				type: 0,
				name: '导入外协商期初欠款www.',
				title: '',
				url: 'waixieqichuqiankuan_DaoRu'
			},
			{
				code: '110621',
				type: 0,
				name: '导入供应商期初欠款www.',
				title: '',
				url: 'javascript:doImpo("base/EstBegiImpoFormIn.html?type=PROV","base/EstBegiImpo.html?type=PROV");'
			},


			{
				code: '1107',
				name: '其他',
				title: ''
			},
			{
				code: '110711',
				type: 0,
				name: '数据库备份',
				title: '',
				url: 'javascript:showWin(900,550,"system/DbBackupList.html");'
			},
			{
				code: '110712',
				type: 0,
				name: '帐套管理',
				title: '',
				url: 'javascript:showWin(400,300,"system/TallySetList.html");'
			},


			null
		];
	</script>


	<script language="javascript">
		function OnResize() {
			var cw = document.documentElement.clientWidth;
			var ch = document.documentElement.clientHeight;
			MainFrame.style.width = (cw) + 'px';
			MainFrame.style.height = (ch - 68) + 'px';
		};

		var MainFrame = $('MainFrame');
		var MainMenu = $('MainMenu');

		(function () {
			window.onresize = OnResize;
			OnResize();

			var gmm = new GlobalMenuMgr(MainMenu, GM_Data, MainFrame);

			showStatus();
			showTsPage();
		})();
	</script>
	<audio controls="controls" style="display: none;"></audio><span id="dialogCase"><div id="dialogBoxBG" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 721px; z-index: 10001; opacity: 0.4; background-color: rgb(0, 0, 0); display: none;"></div><div id="dialogBox" style="border: 1px solid rgb(230, 239, 248); z-index: 10003; position: absolute; width: 300px; left: 640.5px; top: 272px; display: none;"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"><tbody><tr height="24" id="dialogBoxTitleTr" bgcolor="#E6EFF8"><td><table style="-moz-user-select:none;height:24px;" width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="6" height="24"></td><td id="dialogBoxTitle" style="color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; text-align: left; cursor: move;">选择当前帐套&nbsp;</td><td id="dialogClose" width="20" align="right" valign="middle"><img id="dialogBoxClose" src="images/dialogclose.gif" border="0" align="absmiddle" style="cursor:pointer;" title="关闭"></td><td width="6"></td></tr></tbody></table></td></tr><tr id="dialogTr" style="height:200px" valign="top"><td id="dialogBody" style="position:relative;"></td></tr></tbody></table></div><div id="dialogBoxShadow" style="z-index: 10001; position: absolute; background: rgb(0, 0, 0); opacity: 0.2; top: 276px; left: 645px; width: 302px; height: 226px; display: none;"></div></span></body>
<style type="text/css">
	#yddContainer {
		display: block;
		font-family: Microsoft YaHei;
		position: relative;
		width: 100%;
		height: 100%;
		top: -4px;
		left: -4px;
		font-size: 12px;
		border: 1px solid
	}

	#yddTop {
		display: block;
		height: 22px
	}

	#yddTopBorderlr {
		display: block;
		position: static;
		height: 17px;
		padding: 2px 28px;
		line-height: 17px;
		font-size: 12px;
		color: #5079bb;
		font-weight: bold;
		border-style: none solid;
		border-width: 1px
	}

	#yddTopBorderlr .ydd-sp {
		position: absolute;
		top: 2px;
		height: 0;
		overflow: hidden
	}

	.ydd-icon {
		left: 5px;
		width: 17px;
		padding: 0px 0px 0px 0px;
		padding-top: 17px;
		background-position: -16px -44px
	}

	.ydd-close {
		right: 5px;
		width: 16px;
		padding-top: 16px;
		background-position: left -44px
	}

	#yddKeyTitle {
		float: left;
		text-decoration: none
	}

	#yddMiddle {
		display: block;
		margin-bottom: 10px
	}

	.ydd-tabs {
		display: block;
		margin: 5px 0;
		padding: 0 5px;
		height: 18px;
		border-bottom: 1px solid
	}

	.ydd-tab {
		display: block;
		float: left;
		height: 18px;
		margin: 0 5px -1px 0;
		padding: 0 4px;
		line-height: 18px;
		border: 1px solid;
		border-bottom: none
	}

	.ydd-trans-container {
		display: block;
		line-height: 160%
	}

	.ydd-trans-container a {
		text-decoration: none;
	}

	#yddBottom {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 22px;
		line-height: 22px;
		overflow: hidden;
		background-position: left -22px
	}

	.ydd-padding010 {
		padding: 0 10px
	}

	#yddWrapper {
		color: #252525;
		z-index: 10001;
		background: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);
	}

	#yddContainer {
		background: #fff;
		border-color: #4b7598
	}

	#yddTopBorderlr {
		border-color: #f0f8fc
	}

	#yddWrapper .ydd-sp {
		background-image: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)
	}

	#yddWrapper a,
	#yddWrapper a:hover,
	#yddWrapper a:visited {
		color: #50799b
	}

	#yddWrapper .ydd-tabs {
		color: #959595
	}

	.ydd-tabs,
	.ydd-tab {
		background: #fff;
		border-color: #d5e7f3
	}

	#yddBottom {
		color: #363636
	}

	#yddWrapper {
		min-width: 250px;
		max-width: 400px;
	}
</style>
</html>