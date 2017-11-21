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

<s:form action="place_add" method="post">
		<s:textfield name="childRenName" label="名称"/>
		<s:select label="用户" name="area.areaName" list="listtree" headerKey="str" headerValue="==请选择==" cssStyle="width:100px" />
		<s:submit value="提交"></s:submit>
</s:form>
</body>
</html>