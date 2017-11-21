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
	采购单作废
	<br>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>单号</td>
			<td>采购日期</td>
			<td>供应商</td>
			<td>金额</td>
			<td>经办人</td>
			<td>仓库名称</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<s:iterator value="purchaseBillVOs" status="st">
			<tr>
				<td>${billCode }</td>
				<td>${ purchaseDate}</td>
				<td><s:property value="%{establishmentVOs[#st.index].estName}" /></td>
				<td>${cost }</td>
				<td>${ managerName}</td>
				<td><s:property value="%{storehouseVOs[#st.index].stoName}" /></td>
				<s:iterator value="purchaseBillExtVOs[#st.index]">
					<td><s:if test='examined=="Y"'>已审核</s:if> <s:else>未审核</s:else></td>
				</s:iterator>

				<td>
					<s:a action="purchasecanleling_cancelling?purchaseBillExtVO.id=%{purchaseBillExtVOs[#st.index].id}">作废</s:a>
					<s:a action="purchasecanleling_listdetail?purchaseBillVO.id=%{id}">查看</s:a>
					<s:a action="purchasecanleling_guanlian?purchaseBillVO.id=%{id}&establishmentVO.id=%{establishmentVOs[#st.index].id}">关联数据</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>