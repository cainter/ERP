<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	session.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>

	<s:form action="moneybill_%{bankAccount.id==0?'addBankAccount':'edtiBankAccount'}" method="post">
		<s:hidden name="bankAccount.id" value="%{bankAccount.id}"></s:hidden>
		<font style="color: red;">*</font> <s:textfield label="开户名" name="bankAccount.accountName" value="%{bankAccount.accountName}" />
		<br>
		<font style="color: red;">*</font><s:textfield label="开户银行" name="bankAccount.bankName" value="%{bankAccount.bankName}"></s:textfield>
		<br>
		<font style="color: red;">*</font>
		<s:select list="#{'1':'新异','2':'网络'}" headerValue="新异" listKey="key" listValue="value" size="1" name="bankAccount.tallySetId" label="账套"></s:select>
		<br>

		<font style="color: red;">*</font><s:radio label="现金账户" name="bankAccount.isTmp" list="#{'Y':'是','N':'否'}" listKey="key" listValue="value" />
		<br>
		<font style="color: red;">*</font><s:radio label="状态" name="bankAccount.status" list="#{'Y':'正常','N':'停用'}" listKey="key" listValue="value" />
		<br>
		<font style="color: red;">*</font><s:textfield label="序号" name="bankAccount.sequenceCode" value="%{bankAccount.sequenceCode}"></s:textfield>
		<br>
		<s:textfield label="账户余额" readonly="true" name="bankAccount.currentCost" value="%{bankAccount.currentCost}" disabled=""></s:textfield>
		<br>

		<s:submit value="保存"></s:submit>
	</s:form>

</body>
</html>