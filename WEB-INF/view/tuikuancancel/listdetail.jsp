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
退货单

	编号：${purchaseBillVO.billCode}
	采购日期：${purchaseBillVO.purchaseDate}
	供应商：${establishmentVO.estName }
	采购仓库：${storehouseVO.stoName }
	订单合同号：
	
	<br>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>材料编号</td>
			<td>品名规格</td>
			<td>单位</td>
			<td>数量</td>
			<td>单价</td>
			<td>金额</td>
			<td>备注</td>
		</tr>
		<s:iterator value="purchaseBillItemVOs" status="st">
			<tr>
				<td><s:property value="%{productVOs[#st.index].productCode}"/></td>
				<td><s:property value="%{productVOs[#st.index].productName}"/></td>
			<td><s:property value="%{productVOs[#st.index].unit}"/></td>
			<td>${ amount}</td>
			<td>${unitPrice }</td>
			<td>${ cost}</td>
			<td>${ mark}</td>
			</tr>
		</s:iterator>
	</table>
	
	<br>
	
	预付款：${purchaseBillVO.imprest}
	付款账号：${bankAccountVO.bankName }
	金额合计：${allcost }
	经办人：${purchaseBillVO.managerName}
	摘要：${purchaseBillVO.content}
	备注：${purchaseBillVO.mark}
	开单人：${purchaseBillVO.createrName}
	时间：${purchaseBillVO.createTime}
	审核人：${purchaseBillExtVO.examinerName}
	时间：${purchaseBillExtVO.examineTime }
	账套：${tallySetVO.title }
	
</body>
</html>