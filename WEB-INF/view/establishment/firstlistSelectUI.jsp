<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
<div>
<table>
<tr>
<td>选择外协商<br>
鼠标双击选中记录，支持以外协商名称、外协商拼音字头、联系人名称进行模糊查询</td>
<td>....................</td>
<td><input type="text"> </td>
<td><s:a action="">新增</s:a></td>
</tr>
</table>
</div>
<br>
<hr>
<div>

<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%" align="center">
	<td>序号</td>
		<td>编号</td>
		<td>名称</td>
		<td>联系人</td>
		<td>备注<td>
		<td>经办人</td>
		<td>操作</td>
	 </tr>
	 <s:iterator value="fenyeMode.estList">
	 <tr align="center">
	 	<td>${id }</td>
        <td>${estCode }</td>
		<td>${estName}</td>
		<td>${linkMan}</td>
		<td>${mark}</td>
		<td>${managerName}</td> 
		<td>
			<s:a action="establishment_listUI?establishmentVO.id=%{id}">选择</s:a>
		</td>
	 </tr>
	 </s:iterator>
	
</table>
<form action="establishment_EstablishmentUI" method="post">
	
	<a href="${pageContext.request.contextPath}/establishment_EstablishmentUI?CurrentPageNum=${fenyeMode.currentPageNum-1}">上一页</a>
	第<span style="color:red">${fenyeMode.currentPageNum}</span>&nbsp;&nbsp;页&nbsp;&nbsp;
	GO第:<span style="color:red"><input type="text" name="CurrentPageNum" value="${fenyeMode.currentPageNum}"  size="2"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
<a href="${pageContext.request.contextPath}/establishment_EstablishmentUI?CurrentPageNum=${fenyeMode.currentPageNum+1}">下一页</a>
每页显示结果：<input type="text" name="maxNumEveryPage"  size="2">
	<input type="submit" value="提交">
	<br><hr width="90%" color="red">
	每页结果数：<span style="color:red">${fenyeMode.maxNumEveryPage}</span>&nbsp;&nbsp;
	一共多少页：<span style="color:red">${fenyeMode.allPageNum}</span>&nbsp;&nbsp;
	一共多少条结果:<span style="color:red">${fenyeMode.allResultNum}</span>&nbsp;&nbsp;

</form>
	
</div>
</body>
</html>