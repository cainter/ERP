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
<h2>导入外协初期欠款</h2>
<hr>
<s:form method="post" action="waixieqichuqiankuan_test" enctype="multipart/form-data">
	<s:file name="wmc" ></s:file>
	<s:submit>上传</s:submit>
</s:form>

</body>
</html>