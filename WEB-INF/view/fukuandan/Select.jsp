<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="fukuandan_SelectPayType" method="post">
<div>
<h4>部分字段未找到</h4>
<h3 align="center">请选择付款类型</h3>
 <s:radio list="{'采购付款','外协付款'}" name="PayType" ></s:radio> <br/>
	
	<br>
	<s:submit value="submit"></s:submit>
</div>

</form>
</body>
</html>