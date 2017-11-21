<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://115.28.87.22:8888/storehouse/StockSearch.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
			<meta http-equiv="Expires" content="0">
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<%@ taglib prefix="s" uri="/struts-tags"%>
				<title>库存查询 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title> <script
					src="js/minierp.js"></script>
				<link rel="stylesheet" type="text/css" href="css/base.css">
					<link href="css/Query.css" rel="stylesheet" type="text/css">
						<script src="js/QueryList.js"></script>
						<script language="javascript">
							function doSearch() {
								var stoId = document.getElementById("sto_id").value;
								var proTypeId = document
										.getElementById("pro_type_id").value;
								var proCode = encodeURIComponent(document
										.getElementById("pro_code").value
										.trim());
								var proName = encodeURIComponent(document
										.getElementById("pro_name").value
										.trim());
								var stoAmount = document
										.getElementById("sto_amount").value;
								var costType = "";

								costType = document.getElementById("cost_type").value;

								window.location = "/storehouse/StockSearch.ihtm?flag=1&sto_id="
										+ stoId
										+ "&pro_type_id="
										+ proTypeId
										+ "&pro_code="
										+ proCode
										+ "&pro_name="
										+ proName
										+ "&sto_amount="
										+ stoAmount
										+ "&cost_type=" + costType;
							}

							function getSearchCondition() {
								var proCode = encodeURIComponent("");
								var proName = encodeURIComponent("");
								var str = "flag=1&sto_id=1&pro_type_id=&pro_code="
										+ proCode
										+ "&pro_name="
										+ proName
										+ "&sto_amount=&cost_type=NO_COST";
								return str;
							}

							function doCancel() {
								window.close();
							}
							function doInit() {
								Window_Onload();
								if (window.screen.availWidth > 900) {
									var w = window.screen.availWidth * 0.98;
									window.resizeTo(w, 600);
									document.getElementById("mainDiv").style.width = (w - 60)
											+ "px";
									//居中
									var resizeWinTop = (window.screen.availHeight - 600) / 2;
									var resizeWinLeft = (window.screen.availWidth - w) / 2;
									window.moveTo(resizeWinLeft, resizeWinTop);
								}
								document.getElementById("pro_name").focus();
							}
							function checkKey() {
								if (window.event.keyCode == 13) {
									doSearch();
								}
							}
							function doPrint() {
								var str = getSearchCondition();
								showWin(900, 600,
										"/storehouse/StockSearch.ihtm?content_type=PRINT&"
												+ str);
							}
							function doDownload() {
								var str = getSearchCondition();
								window.location = "/storehouse/StockSearch.ihtm?content_type=EXCEL&"
										+ str;
							}
							function DoubleClick() {

							}
						</script>
</head>
<body oncontextmenu="return false" onload="doInit();" class="sheet">
	<div class="sheet-main" style="width: 860px" id="mainDiv">
		<div class="sheet-top">
			<div class="content">
				<h2>库存查询</h2>
				<p>查询当前库存量、低于安全库存的材料、超过最高库存的材料，支持以材料名称、材料名称拼音字头进行模糊查询</p>
			</div>
		</div>
		<div class="sheet-list">
			<div class="search-business">
				<div class="content">
					<table width="100%" id="searchTbl">
						<tbody>
							<tr>
								<td align="right"><select name="sto_id" id="sto_id"
									style="width: 120px">
										<option value="">==请选择仓库==</option>
										<option value="1" selected="">标识加工仓库</option>
										<option value="2">中力门店仓库</option>
										<option value="3">车间型材仓库</option>
										<option value="4">车间耗材仓库</option>
										<option value="5">车间工具仓库</option>
										<option value="6">你好，仓库</option>
								</select> <select name="pro_type_id" id="pro_type_id"
									style="width: 180px">
										<option value="">==请选择材料类别==</option>

										<option value="72">01喷绘材料</option>
										<option value="73">02写真材料</option>
										<option value="74">03辅助材料</option>
										<option value="93">06展示器材</option>
										<option value="94">07光电产品</option>
										<option value="42">板材类</option>
										<option value="83">玻璃镜子</option>
										<option value="69">标牌配件</option>
										<option value="88">扁铁圆钢</option>
										<option value="89">不锈钢方管</option>
										<option value="90">不锈钢矩管</option>
										<option value="91">不锈钢圆管</option>
										<option value="64">成品标牌</option>
										<option value="82">磁性板</option>
										<option value="84">镀锌方管</option>
										<option value="85">镀锌矩管</option>
										<option value="86">镀锌圆管</option>
										<option value="45">低值易耗品</option>
										<option value="80">钢板材类</option>
										<option value="92">钢材辅料类</option>
										<option value="70">管材类</option>
										<option value="79">工程用板</option>
										<option value="65">光电产品</option>
										<option value="87">角钢槽钢</option>
										<option value="75">KT板类</option>
										<option value="27">铝型材</option>
										<option value="81">木板类</option>
										<option value="95">每月定时出库材料</option>
										<option value="77">PVC雪弗板</option>
										<option value="78">有机板</option>
										<option value="76">亚克力板</option>
										<option value="44">油漆类</option>
								</select> <select name="sto_amount" id="sto_amount">
										<option value="">==全部库存==</option>
										<option value="LOWER_MIN">低于安全库存</option>
										<option value="UPPER_MAX">高于最高库存</option>
										<option value="UPPER_ZERO">库存大于0</option>
								</select> <select name="cost_type" id="cost_type">
										<option value="NO_COST" selected="">不显示单价</option>
										<option value="SHOW_COST">显示单价</option>
								</select> 材料编号：<input type="text" class="TextBox" id="pro_code"
									name="pro_code" onkeyup="checkKey();" style="width: 68px"
									value=""> 品名规格：<input type="text" class="TextBox"
										id="pro_name" name="pro_name" onkeyup="checkKey();"
										style="width: 68px" value=""> <input type="button"
											value=" 查 询" onclick="doSearch();" class="buttom search-but">

												<input type="button" value=" 导 出" onclick="doDownload();"
												class="buttom  search-out"> <input type="button"
													value=" 打 印" onclick="doPrint();"
													class="buttom search-print"></td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="table-list">
					<table width="100%">
						<tbody>
							<tr>
								<th width="10%">材料类别</th>
								<th width="10%">材料编号</th>
								<th width="24%">品名规格</th>
								<th width="10%">单位</th>
								<th width="10%">数量</th>
								<th width="10%">安全库存</th>
								<th width="10%">最高库存</th>
								<th width="16%">所在仓库</th>
							</tr>
							<s:iterator value="products">
							<tr class="query_list_data_tr1" index="483"
								defaultfontcolor="#000000"
								style="cursor: pointer; color: #000000;"
								ondblclick="javascript:DoubleClick(this)"
								onclick="javascript:ClickCheck(this)"
								onmouseout="javascript:mouseout(this)"
								onmouseover="javascript:mouseover(this)">
								<td><input type="radio" name="query_checkbox" value="483"
									style="display: none">${productName } </td>
								<td>${ pnSpell}</td>
								<td>品名规格</td>
								<td>${ unit}</td>
								<td>${barCode }</td>
								<td>${minLimit }</td>
								<td>${maxLimit}</td>
								<td>所在仓库</td>
							</tr>
							</s:iterator>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<audio controls="controls" style="display: none;"></audio>
</body>
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
	background:
		url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);
}

#yddContainer {
	background: #fff;
	border-color: #4b7598
}

#yddTopBorderlr {
	border-color: #f0f8fc
}

#yddWrapper .ydd-sp {
	background-image:
		url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)
}

#yddWrapper a, #yddWrapper a:hover, #yddWrapper a:visited {
	color: #50799b
}

#yddWrapper .ydd-tabs {
	color: #959595
}

.ydd-tabs, .ydd-tab {
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