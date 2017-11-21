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
<%-- ${establishmentVOs } --%>
<h1>选择供应商
</h1>
<h3>鼠标双击选中记录，支持以供应商名称、供应商拼音字头、联系人名称进行模糊查询</h3>
<hr>
<table width="90%" cellpadding="0" cellspacing="0" border="1" >
<tr>
<td>编号</td>
<td>名称</td>
<td>联系人</td>
<td>备注</td>
<td>经办人</td>
<td>操作</td>
</tr>
<s:iterator value="establishmentVOs" status="st">
<tr>
<td>${estCode }</td>
<td>${estName}</td>
<td>${linkman}</td>
<td>${mark}</td>
<td>${managerName}</td>
<td><s:a action="caigouduizhang_xuanze?establishmentVO.id=%{id}">选择</s:a></td>
</tr>
</s:iterator>
</table>
</body>
</html>