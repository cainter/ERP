<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://115.28.87.22:8888/base/EstablishmentTypeEdit.ihtm?id=1 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
			<meta http-equiv="Expires" content="0">
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<%@ taglib prefix="s" uri="/struts-tags"%>
				<title>单位类别 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
	<link href="css/Query.css" rel="stylesheet" type="text/css">
		<script src="js/QueryList.js"></script>
		<script language="javascript">
			function doInit() {
				Window_Onload();
			}
			function DoubleClick(it) {

			}
			function doEnabled(id) {
				window.location = "../base/EstablishmentEnabled.html?id=" + id
						+ "&from_url=" + encodeURIComponent(window.location);
			}
		</script>
</head>
<body oncontextmenu="return false" scroll="auto" onload="doInit();"
	class="sheet">
	<div class="sheet-main" style="width: 550px">
		<div class="sheet-top">
			<div class="content">
				<h2>客户名称检查</h2>
				<p>关键字：a</p>
			</div>
		</div>
		<div class="sheet-list">
			<div class="search-business">

				<table width="98%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr id="errorMsgTr" style="display: none">
							<td>
								<div class="msg-error" id="errorMsgTd"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="table-list">
					<table width="100%">
						<tbody>
							<tr>
								<th width="18%">编号</th>
								<th width="32%">名称</th>
								<th width="15%">经办人</th>
								<th width="10%">状态</th>
								<th width="15%">创建日期</th>
								<th width="10%">操作</th>
							</tr>
							<s:iterator value="establishments" status="indexs" var="establishment">
							<tr class="query_list_data_trSelected" style="color: #000000"
								index="1" ondblclick="javascript:DoubleClick(this)"
								onclick="javascript:ClickCheck(this)"
								onmouseout="javascript:mouseout(this)"
								onmouseover="javascript:mouseover(this)">
								<td>${estCode } <input type="radio"
									onclick="javascript:ClickCheck(this);" name="query_checkbox"
									value="762" style="display: none"></td>
								<td>${estName }</td>
								<td>${managerName }</td>
								<td>
								<s:if test=' #establishment.status.equals("Y") '>
									正常
								</s:if>
								<s:elseif test=' #establishment.status.equals("N") '>
　　									停用
								</s:elseif>
								</td>
								<td><s:date name="busTime" format="yyyy-MM-dd hh:mm:ss"/></td>
								<td></td>
							</tr>
								</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>