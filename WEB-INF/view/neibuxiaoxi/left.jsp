<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>导航菜单</title>
	<link type="text/css" rel="stylesheet" href="style/blue/left.css" />
</head>
<body style="margin: 0">
   <a target="right" href="${pageContext.request.contextPath}/messageSendAndReceive_findAllMessageVOsAndReceiverDeleteIsN.action">收件箱</a>
   <a target="right" href="${pageContext.request.contextPath}/messageSendAndReceive_findAllMessageVOsAndSendDeleteIsN.action">发件箱</a>   
    <a target="right" href="${pageContext.request.contextPath}/messageSendAndReceive_toWriteMessageUI.action">写信息</a>   
</body>
</html>