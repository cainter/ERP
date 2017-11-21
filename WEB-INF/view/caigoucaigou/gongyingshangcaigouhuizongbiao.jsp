<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1 align="center">供应商采购汇总表</h1>
<!-- 根据PB（getPurchaseBillVOs）找到双层数组的PurhchaseBillItemVOSS2，根据PB找到双层数组的ProductVOSS，根据 PurhchaseBillItemVOSS2的多个bill_id反过来找多个重复的PB,根据这个PB找供应商名称-->
<%-- ${purchaseBillVOs } --%>
<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td> 供应商 </td>
			<td>进/退 </td>
			<td>材料编号</td>
			<td> 品名规格</td>
			<td> 单位 </td>
			<td>数量</td>
			<td>单价</td>
			<td> 金额</td>
		</tr>

<s:iterator value="purchaseBillVOs2" status="st">
		<tr>
			<td><s:property value="%{establishmentVOs[#st.index].estName}"/></td>
			<td>
			<s:if test='billType=="BUY"'>进</s:if>
			<s:else><font color="red">退</font></s:else>
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