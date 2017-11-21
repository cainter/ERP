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
付款记录
付款汇总（不包括预付款）：${payall }元
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>付款日期</td>
		<td>付款单号</td>
		<td>经手人</td>
		<td>金额</td>
		<td>状态</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="payBillVOs" status="st">
	 <tr>
	 	<td>${payDate }</td>
		<td>${billCode }</td>
		<td>${managerName }</td>
		<td>${cost }</td>
		<td>
		<s:if test='examined=="Y"'>已审核</s:if>
		<s:if test='examined=="N"'>未审核</s:if>
		</td>
		<td><s:a action=""> 查看（这个进入付款单）</s:a> </td>
	 </tr>
	 </s:iterator>
	 
</table> 

	
</body>
</html>