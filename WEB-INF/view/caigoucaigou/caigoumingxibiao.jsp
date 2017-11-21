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
<h1 align="center">采购明细表</h1>
<%-- ${ purchaseBillVOs}
<hr color="green">
${purchaseBillItemVOSS }
<hr color="red">
${productVOSS }
<hr color="red">
${purhchaseBillItemVOSS2 }
<hr color="red">
${productTypeVOs }
<hr>
${purchaseBillVOs2 }
<hr color="red">
${ establishmentVOs} --%>
<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>单号</td>
			<td> 日期</td>
			<td> 供应商 </td>
			<td>进/退 </td>
			<td>备注</td>
			
			<td> 材料类别</td>
			<td>材料编号</td>
			<td> 品名规格</td>
			<td> 单位 </td>
			
			<td>数量</td>
			<td>单价</td>
			<td> 金额</td>
		</tr>

<s:iterator value="purchaseBillVOs2" status="st">
		<tr>
			<td>${billCode }</td>
			<td>${ purchaseDate}</td>
			<td><s:property value="%{establishmentVOs[#st.index].estName}"/></td>
			<td>
			<s:if test='billType=="BUY"'>进</s:if>
			<s:else>退</s:else>
			</td>
		<td>
			<s:iterator value="%{purhchaseBillItemVOSS2[#st.index]}">
			<s:property value="mark"/>
			</s:iterator>
			</td>
		<td>
		<s:iterator value="%{productTypeVOs[#st.index]}">
		<s:property value="typeName"/>
		</s:iterator>
		</td>
			<td>
		<s:iterator value="%{productVOSS[#st.index]}">
		<s:property value="productCode"/>
		</s:iterator>
		</td>
			<td>
		<s:iterator value="%{productVOSS[#st.index]}">
		<s:property value="productName"/>
		</s:iterator>
		</td>
			<td>
		<s:iterator value="%{productVOSS[#st.index]}">
		<s:property value="unit"/>
		</s:iterator>
		</td>
			<td>
			<s:iterator value="%{purhchaseBillItemVOSS2[#st.index]}">
			<s:property value="amount"/>
			</s:iterator>
			</td>
			<td>
			<s:iterator value="%{purhchaseBillItemVOSS2[#st.index]}">
			<s:property value="unitPrice"/>
			</s:iterator>
			</td>
			<td>
			<s:iterator value="%{purhchaseBillItemVOSS2[#st.index]}">
			<s:property value="cost"/>
			</s:iterator>
			</td>


		</tr>
</s:iterator>


	</table>

</body>
</html>