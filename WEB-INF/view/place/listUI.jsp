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
<s:a action="place_addUI">新增</s:a>
<s:a action="place_getTop">返回</s:a>
<s:if test="%{aList[0].parentId!=0&&aList[0].enabled!=null}">
<!-- <a href="javascript:history.go(-1);location.reload()">返回</a>  -->
<%-- <s:a href="javascript :;" onClick="javascript :history.back(-1);location.reload()">返回</s:a> --%>
</s:if>
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>序号</td>
		<td>名称</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="aList">
	 <tr>
		<td>${id}</td>
		<td>${areaName}</td>
		<td>
		<s:a action="place_listUI?id=%{id}">进入子分类</s:a>
		<s:a action="place_editUI?id=%{id}">编辑</s:a>
		<s:a action="place_delete?id=%{id}">删除</s:a>
		</td>
	 </tr>
	 </s:iterator>
</table>


</body>
</html>