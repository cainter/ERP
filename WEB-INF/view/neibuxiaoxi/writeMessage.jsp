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
这里是writeMessage
<s:form action="messageSendAndReceive_save" method="post" enctype="multipart/form-data" >

<s:textfield name="messageVO.title" label="标题Struts"></s:textfield>
<s:textarea name="messageVO.content" label="内容"></s:textarea>
<s:file name="file" ></s:file>
<s:submit value="提交"></s:submit>
</s:form>
</body>
</html>