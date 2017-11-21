<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

	<frameset cols="240,*" framespacing=0 border=0 frameborder="0">
			<frame noresize name="menu" scrolling="yes" src="${pageContext.request.contextPath}/messageSendAndReceive_left.action">
			<frame noresize name="right" scrolling="yes" src="${pageContext.request.contextPath}/messageSendAndReceive_right.action">
	</frameset> 
</html>