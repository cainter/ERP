<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a target="right" href="${pageContext.request.contextPath}/messageSendAndReceive_toWriteMessageUI.action">写信息</a>  
欢迎来到收件箱！

	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%" align="center">
			<td>主题</td>
			<td>接收人</td>
			<td>时间</td>
			<td>内容</td>
			<td>操作</td>
		</tr>
		<s:iterator value="messageVOs">
			<tr align="center">
				<td>${title}</td>
				<td>${receiverName}</td>
				<td>${sendTime}</td>
				<td>${content}</td>
				<td><s:a action="messageSendAndReceive_ReplyByWhoSenderId.action?messageVO.id=%{id}&messageVO.title=%{title}&messageVO.content=%{content }">回复</s:a></td>
				<td><s:a action="messageSendAndReceive_deleteReceiveMessageById.action?messageVO.id=%{id}">删除</s:a></td>
			</tr>
		</s:iterator>

	</table>
</body>
</html>