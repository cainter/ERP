<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
<h2>付款单一览表</h2>
查询当期发生的付款（不包括预付款） 
<hr>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>单号</td>
			<td>银行账户</td>
			<td>付款日期</td>
			<td>收款单位</td>
			<td>付款类型</td>
			<td>摘要</td>
			<td>经办人</td>
			<td>开单人</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<s:iterator value="payBillVOs" status="st">
			<tr>
				<td>${billCode}</td>
				<td><s:iterator value="%{bankAccountListVOSS[#st.index]}">
						<s:property value="bankName" />(
                    	<s:property value="accountName" />)
	                 </s:iterator></td>

				<td>${payDate}</td>
				<td><s:iterator value="%{EstablishmentVOSS[#st.index]}">
						<s:property value="estName" />
					</s:iterator></td>

				<td>${payType}</td>
				<td>${description}</td>
				<td>${managerName}</td>
				<td> <s:iterator value="%{stafferNameListVOSS[#st.index]}">
						<s:property value="stafferName"/>
					</s:iterator></td>
				<td>${examined}</td>
				<td><s:a action="place_editUI?id=%{id}">修改</s:a><s:a action="place_delete?id=%{id}">打印</s:a></td>
			</tr>
		</s:iterator>
	</table>
	<!-- 正在做的 -->
	<form action="paybill_findAll" method="post">
	
	<a href="${pageContext.request.contextPath}/paybill_findAll?CurrentPageNum=${fenyeMode.currentPageNum-1}">上一页</a>
	第<span style="color:red">${fenyeMode.currentPageNum}</span>&nbsp;&nbsp;页&nbsp;&nbsp;
	GO第:<span style="color:red"><input type="text" name="CurrentPageNum" value="${fenyeMode.currentPageNum}"  size="2"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
<a href="${pageContext.request.contextPath}/paybill_findAll?CurrentPageNum=${fenyeMode.currentPageNum+1}">下一页</a>
每页显示结果：<input type="text" name="maxNumEveryPage"  size="2">
	<input type="submit" value="提交">
	<br><hr width="90%" color="red">
	每页结果数：<span style="color:red">${fenyeMode.maxNumEveryPage}</span>&nbsp;&nbsp;
	一共多少页：<span style="color:red">${fenyeMode.allPageNum}</span>&nbsp;&nbsp;
	一共多少条结果:<span style="color:red">${fenyeMode.allResultNum}</span>&nbsp;&nbsp;

</form>
</body>
</html>