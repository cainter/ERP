<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	${purchaseBillVOs }
<hr color="green">
	${ establishmentVOs}

	<hr color="green">
	${bankAccountVOs }  --%>
--%>
	<hr>
		<h1 align="center">采购付款单</h1>
		<s:select label="收款单位" list="establishmentVOs" listKey="id" listValue="estName" headerKey="请选择账套" name="estName"></s:select>
		<s:select label="付款账户" list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" headerKey="请选择账套" name="estName"></s:select>
		付款金额前台来自前台计算
		<hr>
		<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr height="10%">
				<td>单号</td>
				<td>日期</td>
				<td>摘要</td>
				<td>金额</td>
				<td>余额</td>
				<td>本次付款</td>
				<td>操作</td>
			</tr>
			<s:iterator value="purchaseBillVOs" status="st">
			 <input type="hidden" name="purchaseBillVOs[${st.index}].id" value="${id}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].billType   value="${ billType}">
						<input type="hidden" name="purchaseBillVOs[${st.index}].purchaseDate   value="${ purchaseDate}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].storehouseId   value="${storehouseId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].providerId  value="${providerId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].managerId   value="${managerId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].managerName   value="${managerName}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].contractCode  value="${ contractCode}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].bankAccountId   value="${ bankAccountId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].imprest   value="${ imprest}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].createrId   value="${createrId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].createTime   value="${ createrName}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].square   value="${ createTime}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].tallySetId   value="${ tallySetId}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].updateTime  value="${updateTime}">
				<input type="hidden" name="purchaseBillVOs[${st.index}].attachFile   value="${attachFile}">
				<tr>
					<td><input type="text"  name="purchaseBillVOs[${st.index}].billCode"    value="${billCode}"></td>
					<td><input type="text"  name="purchaseBillVOs[${st.index}].purchaseDate"    value="${purChaseDate}"></td>
					<td><input type="text"  name="purchaseBillVOs[${st.index}].content"    value="${content}"></td>
					<td><input type="text"  name="purchaseBillVOs[${st.index}].cost"   value="${cost}"></td>
					<td>未找到</td>
					<td>未找到</td>
				</tr>
			</s:iterator>
		</table>
		经办人：<input type="button" value="选择"> &nbsp;&nbsp; 部门：待做 &nbsp;&nbsp;付款类型：采购付款
		<hr>
		<hr>
		<s:textarea label="摘要" name="description"></s:textarea>
		<br>
		<s:textarea label="备注" name="mark"></s:textarea>
		<br>
		<s:file label="上传"></s:file>
		<br> <br>
		<s:submit value="保存"></s:submit>
</body>
</html>