<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("path", request.getContextPath());%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
郑州市新异标识标牌有限公司 销售单

<br>
订货单位：${ establishmentVO.estName} ${businessBillVO.linkman }
地址：${businessBillVO.address }
订货日期：${businessBillVO.orderDate }
交货日期：${businessBillVO.deliverDate}
编号：${establishmentVO.estCode}NO.${businessBillVO.billCode }

<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%">
		<td>行号</td>
		<td>产品</td>
		<td>单位</td>
		<td>数量</td>
		<td>单价</td>
		<td>金额</td>
		<td>备注</td>
	 </tr>
	 
	 <s:iterator value="businessBillItemVOs" status="b">
	 
	 <tr>
	 <td>${b.index+1}</td>
		<td>${ proName}</td>
		<td>${unit }</td>
		<td>${ amount}</td>
		<td>${ unitPrice}</td>
		<td>${cost }</td>
		<td>${ makeRequire}</td>
	 </tr>
	 </s:iterator>
	 <tr>
	 	<td colspan="9"> 优惠：${ businessBillVO.favCost}折后合计（大写）:   已调账：  已收款：尚欠金额： </td>
	 </tr>
</table>
<br><br>

<br><br>
开单人：${businessBillVO.createrName }
业务员：${businessBillVO. managerName}
审核人：${businessBillVO.modifierName }
签字：手写
<br>
${codeRuleVO.printFoot}
<br>
<s:a action="开始打印">开始打印</s:a> <s:a action="">退出</s:a>

</body>
</html>