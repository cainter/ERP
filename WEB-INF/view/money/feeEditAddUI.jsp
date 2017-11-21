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


	<s:form action="feetype_%{feeType.id==0?'addFeeType':'editFeeType'}" method="post">
		<s:hidden name="feeType.id" value="%{feeType.id}"></s:hidden>
		<s:textfield label="名称" name="feeType.typeName" value="%{feeType.typeName}" />
		<br>
		<s:textfield label="序号" name="feeType.sequenceCode" value="%{feeType.sequenceCode}"></s:textfield>
		<br>
		<s:submit value="保存"></s:submit>
	</s:form>

</body>
</html>