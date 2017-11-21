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
<s:if test="%{isCheck==1}">外协审核单</s:if>
<s:if test="%{isCheck!=1}">外协反审核单</s:if>

<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>单号</td>
		<td>外协日期</td>
		<td>外协单位</td>
		<td>摘要</td>
		<td>交货日期</td>
		<td>业务员</td>
		<td>操作</td>
	 </tr>
	 
	 <s:iterator value="pageVO.resultlist">
	 <tr>
		<td>${billCode }</td>
		<td>${cooperDate}</td>
		<td>${estName}</td>
		<td>${content }</td>
		<td>${gatherDate }</td>
		<td>${ managerName}</td>
		<td>
		<s:if test="%{isCheck==1}">
		<s:a action="CooperAgaincheck_isCheckOrNo?cooperBillVO.id=%{id}">审核</s:a><s:a action="CooperAgaincheck_listUIDetailByBillCode?cooperBillVO.billCode=%{billCode}&cooperBillVO.id=%{id}">查看</s:a></s:if>
		
		<s:if test="%{isCheck!=1 }">
			<s:a action="CooperAgaincheck_isCheckOrNo?cooperBillVO.id=%{id}">反审核</s:a><s:a action="CooperAgaincheck_listUIDetailByBillCode?cooperBillVO.billCode=%{billCode}&cooperBillVO.id=%{id}">查看</s:a></s:if></td>
	 
	 </tr>
	 </s:iterator>
	 
</table> 

	 <form action="CooperAgaincheck_listUI" method="post">

			<a href="${pageContext.request.contextPath}/CooperAgaincheck_listUI?CurrentPageNum=1&isCheck=${isCheck}">第一页</a>
			 <a href="${pageContext.request.contextPath}/CooperAgaincheck_listUI?CurrentPageNum=${pageVO.currentPageNum-1}&isCheck=${isCheck}">上一页</a> 
			 第<span style="color: red">${pageVO.currentPageNum}</span>&nbsp;&nbsp;页&nbsp;&nbsp; GO第:<span
				style="color: red">
				<input type="hidden" name="isCheck" value="${isCheck}" >
				<input type="text" name="CurrentPageNum" value="${pageVO.currentPageNum}" size="2"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
				  <input type="submit" value="提交">
			一共多少页：<span style="color: red">${pageVO.allPageNum}</span>&nbsp;&nbsp;
				 <a href="${pageContext.request.contextPath}/CooperAgaincheck_listUI?CurrentPageNum=${pageVO.currentPageNum+1}&isCheck=${isCheck}">下一页</a>
			 <a href="${pageContext.request.contextPath}/CooperAgaincheck_listUI?CurrentPageNum=${pageVO.allPageNum}&isCheck=${isCheck}">最后一页</a>
			 
		</form>
</body>
</html>