<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	作废关联单 退货单${purchaseBillVO.billCode}
	<br>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>付款单号</td>
			<td>日期</td>
			<td>摘要</td>
			<td>开单人</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<s:iterator value="payBillVOs" status="st">
			<tr>
				<td>${billCode }</td>
				<td>${ payDate}</td>
				<td>${description }</td>
				<td>${createrName }</td>
				<td>
					<s:if test='examined=="Y"'>已审核</s:if>
					<s:else>未审核</s:else>
				</td>
				<td>
					<s:a action="">作废</s:a>
					<s:a action="">查看</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
	
	<br>
	
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>调账单号</td>
			<td>日期</td>
			<td>摘要</td>
			<td>开单人</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<s:iterator value="adjustBillVOs" status="st">
			<tr>
				<td>${billCode }</td>
				<td>${ adjustDate}</td>
				<td>${description }</td>
				<td>${createrName }</td>
				<td>
					<s:if test='examined=="Y"'>已审核</s:if>
					<s:else>未审核</s:else>
				</td>
				<td>
					<s:a action="">作废</s:a>
					<s:a action="">查看</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
	
	
</body>
</html>