<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	session.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	小票 客户：${businessBillVO.billCode }
	<br> 联系人：${businessBillVO.linkman }
	<br> 交货日期：${businessBillVO.deliverDate}
	<br>
	<hr>











	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>项目</td>
			<td>内容</td>
			<td>材质</td>
			<td>规格</td>
			<td>数量</td>
			<td>单价</td>
			<td>金额</td>
		</tr>

		<s:iterator value="businessBillItemVOs" status="b">
			<tr>
				<td><s:property value="%{makeTypeVOs[#b.index].typeName}" /></td>
				<td>${ finishedContent}</td>
				<td>${ proName}</td>
				<td>${width}*${length}${amount}</td>
				<td>${ amount}</td>
				<td>${ unitPrice}</td>
				<td>${cost }</td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="9">优惠：${ businessBillVO.favCost}折后合计（大写）: 已调账： 已收款：尚欠金额：</td>
		</tr>
	</table>
<br><br><br>
	<s:iterator value="businessBillItemVOs" status="b">
		<table width="15%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<td>项目</td>
				<td><s:property value="%{makeTypeVOs[#b.index].typeName}" /></td>
			</tr>
			<tr>
				<td>内容</td>
				<td>${ finishedContent}</td>
			</tr>
			<tr>
				<td>材质</td>
				<td>${ proName}</td>
			</tr>
			<tr>
				<td>规格</td>
				<td>${width}*${length}${amount}</td>
			</tr>
			<tr>
				<td>数量</td>
				<td>${ amount}</td>
			</tr>
			<tr>
				<td>单价</td>
				<td>${ unitPrice}</td>
			</tr>
			<tr>
				<td>金额</td>
				<td>${cost }</td>
			</tr>

		</table>
<br>
	</s:iterator>
	
	<table width="15%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<td>优惠：</td>
				<td>###@@@</td>
			</tr>
			<tr>
				<td>折后后计：</td>
				<td></td>
			</tr>
			<tr>
				<td>调账</td>
				<td></td>
			</tr>
			<tr>
				<td>已收</td>
				<td></td>
			</tr>
			<tr>
				<td>欠款</td>
				<td></td>
			</tr>
		</table>
		<br>
		<table width="15%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<td>  
				${enterpriseInfoVO.shortName}&nbsp;${enterpriseInfoVO.phone}&nbsp;
				
				${enterpriseInfoVO.address}
				
				</td>
			</tr>
		</table>












	<br>

	<s:a action="开始打印">开始打印</s:a>
	<s:a action="">退出</s:a>

</body>
</html>