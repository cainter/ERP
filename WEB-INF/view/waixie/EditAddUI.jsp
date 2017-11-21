<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("path", request.getContextPath());%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>


<s:form action="moneybill_%{bankAccount.id==null?'addBankAccount':'edtiBankAccount'}" method="post">
<s:hidden name="bankAccount.id" value="%{bankAccount.id}"></s:hidden>
<s:textfield label="开户名" name="bankAccount.accountName" value="%{bankAccount.accountName}"/><br>
<s:textfield label="开户银行" name="bankAccount.bankName" value="%{bankAccount.bankName}"></s:textfield><br>
<s:select list="{'1','2'}" headerValue="新异"  size="1"  name="bankAccount.tallySetId" label="账套"></s:select><br>
 
<%-- <s:form action="moneybill_addBankAccount" method="post"> --%>
 <s:radio label="现金账户"  name="bankAccount.isTmp" list="#{'Y':'是','N':'否'}" listKey="key" listValue="value" value="'Y'"/><br>
 <s:radio label="状态"  name="bankAccount.status" list="#{'Y':'正常','N':'使用'}" listKey="key" listValue="value" value="'Y'"/><br>
<s:textfield label="序号" name="bankAccount.sequenceCode" value="%{bankAccount.sequenceCode}"></s:textfield><br>
<s:textfield label="账户余额" name="bankAccount.currentCost" value="%{bankAccount.currentCost}" disabled=""></s:textfield><br>

<s:text name="bankAccount.currentCost" var="%{bankAccount.currentCost}"></s:text>
<s:submit value="保存"></s:submit>
</s:form>

</body>
</html>