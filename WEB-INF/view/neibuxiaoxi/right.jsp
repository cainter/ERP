<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<h1>这里是发消息界面right.jsp</h1>

<s:form action="messageSendAndReceive_save" method="post" enctype="multipart/form-data" >

<s:textfield name="messageVO.title" label="标题Struts"></s:textfield>
<s:textarea name="messageVO.content" label="内容"></s:textarea>
<s:file name="file" ></s:file>
<s:submit value="提交"></s:submit>
</s:form>

</body>
</html>
