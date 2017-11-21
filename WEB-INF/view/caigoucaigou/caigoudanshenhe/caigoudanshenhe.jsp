<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${storeHouseVOSS}
<hr color="RED">
${establishmentSS } --%>
<%--  ${purchaseBillVOs }
<hr color="red">${ storehouseVOs}<hr color="yellow"> 
${establishmentSS }
 --%>
 <h1 align="center">采购单审核</h1>
	<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>单号</td>
			<td> 采购日期</td>
			<td> 供应商 </td>
			<td>金额</td>
			<td> 预付</td>
			<td> 经办人 </td>
			<td>仓库名称</td>
			<td>操作</td>


		</tr>

<s:iterator value="purchaseBillVOs" status="st">
		<tr>
			<td>${billCode }</td>
			<td>${ purchaseDate}</td>
			<td><s:iterator value="%{establishmentSS[#st.index]}" >
						<s:property value="estName" />
					</s:iterator></td>
			<td>${ cost}</td>
				<td>${ imprest}</td>
			<td>${managerName }</td>
			<td><s:iterator value="%{storeHouseVOSS[#st.index]}" >
						<s:property value="stoName" />
					</s:iterator></td>
			<td>
			<s:a action="caigoudanshenhe_shenhetongguo?purchaseBillVO.id=%{id}">审核通过</s:a>
			<s:a action="caigoudanshenhe_chakan?purchaseBillVO.id=%{id}">查看</s:a>
			</td>
<td></td>


		</tr>
</s:iterator>


	</table>


</body>
</html>