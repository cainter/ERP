<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
<br>
调账记录
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>调账日期</td>
		<td>调账单号</td>
		<td>调账类型</td>
		<td>经手人</td>
		<td>金额</td>
		<td>状态</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="adjustBillVOs" status="st">
	 <tr>
	 	<td>${ adjustDate}</td>
		<td>${billCode }</td>
		<td>
	<s:if test='adjustType=="PAY_ADD"'>付款金额增加</s:if>
	<s:if test='adjustType=="PAY_ABATE"'>付款金额减少</s:if>
</td>
		<td>${managerName }</td>
		<td>${cost }</td>
		<td>
		<s:if test='examined=="Y"'>已审核</s:if>
		<s:if test='examined=="N"'>未审核</s:if>
		</td>
		<td><s:a action=""> 查看（进入调账单）</s:a> </td>
	 </tr>
	 </s:iterator>
	 
</table> 

	
</body>
</html>