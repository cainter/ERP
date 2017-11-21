<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("path", request.getContextPath());%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>

<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>编号</td>
		<td>名称</td>
		<td>联系人</td>
		<td>备注</td>
		<td>经办人</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="establishmentVOs">
	 <tr>
		<td>${estCode }</td>
		<td>${estName }</td>
		<td>${linkman }</td>
		<td>${mark }</td>
		<td>${createrName }</td>
		<td><s:a action="reciveingcheck_listUI?establishmentVO.id=%{id}">选择</s:a></td>
	 </tr>
	 </s:iterator>
	 
</table> 


</body>
</html>