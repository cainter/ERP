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
<h2 align="left">项目价格目录</h2>
<h6>不同等级的客户可以使用不同的价格手册，例如针对大客户设置一类价格、针对同行设置一类价格、针对普通客户设置一类价格</h6>
<hr>
	<s:form action="estprice_search" method="post">
		<table>
		<%-- 	<s:select  list="tallySetVOS" listKey="id" listValue="title" headerKey="请选择项目类型" name="tallySet"></s:select> --%>
		<s:textfield label="材质名称" name="serarchBeans.proName" value="录入材质名称查询"></s:textfield>
		<s:submit value="提交"></s:submit>
		</table>
	</s:form>
	<hr>
<s:a action="estprice_addEstPriceUI">新增</s:a>
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%" align="center">
	
	<td>序号</td>
		<td>项目类型1</td>
		<td>材质</td>
		<td>规格</td>
		<td>单位</td>
		<td>单价</td>
		<td>制作要求</td>
		<td>备注</td>
		<td>操作</td>
	 </tr>
	 <s:iterator value="fenyeMode.estPriceList">
	 <tr align="center">
	 	<td>${id }</td>
			 	  <td>${makeTypeId }</td>
		<td>${proName}</td>
		<td>${specification  }</td>
		<td>${unit}</td>
		<td>${price}</td>
		<td>${makeRequire}</td>
		<td>${mark}</td>
		<td>
			<s:a action="estprice_editEstPriceUI?estPrice.id=%{id}">编辑</s:a>
			<s:a action="estprice_DeleteEstPriceVOById?estPrice.id=%{id}">删除</s:a>
		</td>
	 </tr>
	 </s:iterator>
</table>
<!-- 正在做的 -->
	<form action="estprice_EstPriceUI" method="post">
	
	<a href="${pageContext.request.contextPath}/estprice_EstPriceUI?CurrentPageNum=${fenyeMode.currentPageNum-1}">上一页</a>
	第<span style="color:red">${fenyeMode.currentPageNum}</span>&nbsp;&nbsp;页&nbsp;&nbsp;
	GO第:<span style="color:red"><input type="text" name="CurrentPageNum" value="${fenyeMode.currentPageNum}"  size="2"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
<a href="${pageContext.request.contextPath}/estprice_EstPriceUI?CurrentPageNum=${fenyeMode.currentPageNum+1}">下一页</a>
每页显示结果：<input type="text" name="maxNumEveryPage"  size="2">
	<input type="submit" value="提交">
	<br><hr width="90%" color="red">
	每页结果数：<span style="color:red">${fenyeMode.maxNumEveryPage}</span>&nbsp;&nbsp;
	一共多少页：<span style="color:red">${fenyeMode.allPageNum}</span>&nbsp;&nbsp;
	一共多少条结果:<span style="color:red">${fenyeMode.allResultNum}</span>&nbsp;&nbsp;

</form>
</body>
</html>