<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${purchaseBillVOs }
<hr color="red">
${purchaseBillExtVOs }
<hr color="red">${ storehouseVOs}<hr color="yellow"> 
${establishmentVOs }
 操作 
 --%>
<%--  ${establishmentSS } --%>
 <h1 align="center">采购单一览表</h1>
	<table width="90%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>单号</td>
			<td> 采购日期</td>
			<td> 供应商 </td>
			<td>摘要 </td>
			<td>金额</td>
			<td> 调账</td>
			<td> 已付</td>
			<td> 欠款</td>
			<td> 经办人 </td>
			<td>开单人</td>
			<td>仓库名称</td>
			<td> 状态</td>
			<td>操作</td>
		</tr>

<s:iterator value="purchaseBillVOs" status="st">
		<tr>
			<td>${billCode }</td>
			<td>${ purchaseDate}</td>
			<td>
			<s:iterator  value="%{establishmentSS[#st.index]}">
			<s:property value="estName"/>
			</s:iterator>
			</td>
			<td>${content }</td>
			<td>${ cost}</td>
			
			<td><s:property value="%{purchaseBillExtVOs[#st.index].adjustCost}" /></td>
			<td><s:property value="%{purchaseBillExtVOs[#st.index].paiedCost}" /></td>
			<td><s:property value="cost-purchaseBillExtVOs[#st.index].paiedCost" /></td>
			<td>${managerName }</td>
			<td>${createrName }</td>
			<td><s:property value="%{storehouseVOs[#st.index].stoName}" /></td>
			<td>
			<s:if test='purchaseBillExtVOs[#st.index].examined=="Y"'><s:a action="caigoubiaofanshenhe_chakan?purchaseBillVO.id=%{id}">已审核</s:a></s:if>
			<s:if test='purchaseBillExtVOs[#st.index].examined=="N"'><s:a action="caigoubiaoshenhe_chakan?purchaseBillVO.id=%{id}">未审核</s:a></s:if>
			<s:if test='purchaseBillExtVOs[#st.index].stoc=="Y"'><s:a action="caigoudanfanruku_fanruku?purchaseBillVO.id=%{id}">已入库</s:a></s:if>
			<s:if test='purchaseBillExtVOs[#st.index].stoc=="N"'><s:a action="caigoudanruku_ruku?purchaseBillVO.id=%{id}">未入库</s:a></s:if>
			<s:if test='cost-purchaseBillExtVOs[#st.index].paiedCost==0'>已结清</s:if>
			<s:if test='cost-purchaseBillExtVOs[#st.index].paiedCost!=0'><s:a action="caigoubiaoshenhe_chakan?purchaseBillVO.id=%{id}">未结清</s:a></s:if>
			</td>
<td><s:a action="">修改</s:a>&nbsp;<s:a action="">打印</s:a>&nbsp;<s:a action="">关联数据</s:a>&nbsp;</td>


		</tr>
</s:iterator>


	</table>


</body>
</html>