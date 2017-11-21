<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
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
	<h1 align="center">退货单反审核</h1>
	<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>单号</td>
			<td>采购日期</td>
			<td>供应商</td>
			<td>金额</td>
			<td>预付</td>
			<td>经办人</td>
			<td>仓库名称</td>
			<td>操作</td>
		</tr>
		<s:iterator value="purchaseBillVOs" status="st">
			<tr>
				<td>${billCode }</td>
				<td>${ purchaseDate}</td>
				<%-- <td><s:property value="%{establishmentSS[#st.index].estName}"/></td> --%>
				<td><s:iterator value="%{establishmentSS[#st.index]}">
						<s:property value="estName" />
					</s:iterator></td>
				<td>${ cost}</td>
				<td>${ imprest}</td>
				<td>${managerName }</td>
				<%-- 	<td><s:property value="%{storeHouseVOSS[#st.index].stoName}" /></td> --%>
				<td><s:iterator value="%{storeHouseVOSS[#st.index]}">
						<s:property value="stoName" />
					</s:iterator></td>
				<td><s:a action="tuihuodanfanshenhe_shenhebutongguo?purchaseBillVO.id=%{id}">反审核</s:a> <s:a action="tuihuodanfanshenhe_chakan?purchaseBillVO.id=%{id}">查看</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>