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
附件  名称:${establishmentVO.estName }<br>
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>文件</td>
		<td>资料途径</td>
		<td>文件说明</td>
		<td>上传人</td>
		<td>上传时间</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="accessoryVOs" status="st">
	<tr height="10%">
		<td>${sourceName }</td>
		<td>${customPath }</td>
		<td>${mark }</td>
		<td>${ createrName}</td>
		<td>${createTime }</td>
		<td><s:a action="">下载</s:a><s:a action="gongyingshang_deleteFujian?accessoryVO.id=%{id}&establishmentVO.id=%{establishmentVO.id}">删除</s:a>  </td>
	 </tr>
	 </s:iterator>
	 
</table> 

	
</body>
</html>