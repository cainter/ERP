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
<s:a action="feetype_addFeeTypeUI">新增</s:a>
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%">
		<td>序号</td>
		<td>名称</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="FeeTypeVOs">
	 <tr>
		<td>${sequenceCode}</td>
		<td>${typeName}</td>
	
		<td>
			<s:a action="feetype_editFeeTypeUI?feeType.id=%{id}">编辑</s:a>
			<s:a action="feetype_deleteFeeType?feeType.id=%{id}">删除</s:a>
		</td>                                  
	 </tr>
	 </s:iterator>
</table>


</body>
</html>