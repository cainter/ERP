<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 测试数据 -->
<%-- ${ establishmentVO}
<hr color="red">
${storehouseVO}
<hr color="red">
${purchaseBillVO }
<hr color="red">
${productVOs }
<hr color="red">
${purchaseBillItemVOs }
<hr color="red">
${tallySetVO }
<hr color="red">
${bankAccountVO }
<hr color="red">
${purchaseBillExtVO } --%>
<h1 align="center">采购单反审核</h1>
编号：${purchaseBillVO.purchaseDate }
<br>采购日期：${purchaseBillVO.purchaseDate }
<hr>
供应商：${establishmentVO.estName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;采购仓库：${storehouseVO.stoName }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单合同号：${purchaseBillVO.contractCode }
<hr>
<table align="center">

<tr align="center">
<td>材料编号</td>
<td>品名规格</td>
<td>  单位</td>
<td> 数量</td>
<td> 单价</td>
<td> 金额</td>
<td> 备注 </td>
</tr>

<s:iterator value="productVOs"  status="s">

<tr>
<td>${productCode }</td>
<td>${productName }</td>
<td>${ unit}</td>
<td><s:property value="%{purchaseBillItemVOs[#s.index].amount}"/></td>	
<td><s:property value="%{purchaseBillItemVOs[#s.index].unitPrice}"/></td>	
<td><s:property value="%{purchaseBillItemVOs[#s.index].cost}"/></td>	
<td><s:property value="%{purchaseBillItemVOs[#s.index].mark}"/></td>	
</tr>
</s:iterator>
</table>
<hr>
预付款：${purchaseBillVO.imprest }
付款账户：${bankAccountVO.accountName }
金额合计：${purchaseBillVO.cost }
<br>
经办人：${purchaseBillVO.managerName }
摘要：${purchaseBillVO.content }
备注：${purchaseBillVO.mark}
<br>
开单人：${purchaseBillVO.createrName } &nbsp;${purchaseBillVO.createTime }
审核人：${purchaseBillExtVO.examinerName}
单据账套：${tallySetVO.title }
<hr>
<s:a action="caigoudanfanshenhe_shenhebutongguo?purchaseBillVO.id=%{purchaseBillVO.id}">反审核</s:a>
<s:a action="caigoudanfanshenhe_tuichu">退出</s:a>
</body>
</html>