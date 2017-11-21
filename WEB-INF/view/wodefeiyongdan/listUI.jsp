<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>单号</td>
			<td>银行账号</td>
			<td>日期</td>
			<td>收款单位</td>
			<td>金额</td>
			<td>摘要</td>
			<td>经办人</td>
			<td>开单人</td>
			<td>状态</td>
			<td>操作</td>


		</tr>

<s:iterator value="feeBillVOs" status="st">
		<tr>
			<td>${billCode }</td>
			<td><s:property value="%{bankAccountVOs[#st.index].bankName}" />(<s:property value="%{bankAccountVOs[#st.index].accountName}" />)</td>
			<td>${ feeDate}</td>
			<td>${receiverName }</td>
			<td>${ cost}</td>
			<td>${mark }</td>
			
			<td>${managerName }</td>
			<td>${createrName }</td>
		<td>	<s:if test='examined=="Y"'>已审核</s:if>
			<s:else>
			未审核
			</s:else>
			</td>
			
			</td>
			<td></td>


		</tr>
</s:iterator>


	</table>


</body>
</html>