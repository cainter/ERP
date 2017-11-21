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

	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>单号</td>
			<td>日期</td>
			<td>收款单位</td>
			<td>金额</td>
			<td>摘要</td>
			<td>经办人</td>
			<td>操作</td>
		</tr>
		<s:iterator value="payBillVOs" status="st">
			<tr>
				<td>${billCode}</td>

				<td>${payDate}</td>
	<td><s:property value="%{establishmentVOs[#st.index].estName}" />
				<td>${cost}</td>
				<td>${mark}</td>
				<td>${managerName}</td>
				<td><s:a action="paybillshenhe_ExaminedTongGuo?payBillVO.id=%{id}">审核通过</s:a><s:a action="paybillshenhe_ChaZhaoByPayBillId?payBillVO.id=%{id}">查看</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>