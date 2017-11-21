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
　<form action="messageSendAndReceive_Reply" method="post" enctype="multipart/form-data">
MessageVO.id:<input type="text" name="messageVO.id" value="${messageVO.id }">
    标题： <input type="text" name="messageVO.title" value="${messageVO.title}"><br>
   内容： <input type="text" name="messageVO.content"><br>
        file: <input type="file" name="file"><br>
        <input type="submit" value="submit">
    </form>
</body>
</html>