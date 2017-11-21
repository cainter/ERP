<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	<br> 金额${allcost}
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">

		<tr height="10%">
			<td>日期</td>
			<td>材料编号</td>
			<td>品名规格</td>
			<td>单位</td>
			<td>数量</td>
			<td>单价</td>
			<td>金额</td>
			<td>类型</td>
		</tr>
<s:iterator value="purchaseBillItemVOs" status="st" var="s">
					<tr height="10%">
						<td><s:property value="%{purchaseBillVOs[#st.index].purchaseDate}"/>   </td>
						<td><s:property value="products" /></td>
							<td>1</td>
					<td>2</td>
						<td>${amount }</td>
						<td>${unitPrice }</td>
						<td>${cost}</td>
						<td><s:if test='billType=="BUY"'>采购</s:if>
							<s:if test='billType=="BACK"'>退货</s:if>
						</td>
					</tr>
				</s:iterator>





		<%-- <s:iterator value="purchaseBillVOs" status="st">
			<s:iterator value="%{productVOss[#st.index]}" status="s">
				<s:iterator value="%{pLists[#s.index]}" status="d">
					<tr height="10%">
						<td>${purchaseDate }</td>
						<td>${productCode }</td>
						<td>${productName }</td>
						<td>${unit }</td>
						<td>${amount }</td>
						<td>${unitPrice }</td>
						<td>${cost }</td>
						<td><s:if test='billType=="BUY"'>采购</s:if>
							<s:if test='billType=="BACK"'>退货</s:if>
						</td>
					</tr>
				</s:iterator>
			</s:iterator>
		</s:iterator>
 --%>



	</table>

</body>
</html>