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

<jsp:include page="yewudansearch.jsp"/>




<hr color="red">
  合同:${huizongSum[0]}元 &nbsp;(已优惠:${huizongSum[1]}元)&nbsp;调账 :${huizongSum[2]}元 &nbsp;已收:     ${huizongSum[3]}元 &nbsp;  (其中预付款:   ${huizongSum[4]}元) &nbsp;
       欠款:${huizongSum[5]}元 &nbsp;      面积合计:${huizongSum[6]}平方米 &nbsp; 长度合计:    ${huizongSum[7]}米 &nbsp;     ${huizongSum[8]}公分 &nbsp;合同单数:     ${huizongSum[9]}笔 &nbsp;    
    回款率:${huikuanlv }&nbsp;    

<hr color="red">

	<table width="90%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr>
			<td width="9%">单号</td>
			<td width="6%">订货日期</td>
			<td width="9%">订货单位</td>
			<td width="8%">摘要</td>
			<td width="6%">金额</td>
			<td width="6%">调账</td>
			<td width="6%">已收</td>
			<td width="6%">欠款</td>
			<td width="5%">已优惠</td>
			<td width="6%">设计</td>
			<td width="5%">跟单员</td>
			<td width="6%">最后打印</td>
			<td width="6%">交货日期</td>
			<td width="8%">状态</td>
			<td width="8%">操作</td>
		</tr>

		<s:iterator value="businessBillVOs" status="s">
			
			
			<tr  >
				<td>${billCode}</td>
				<td>${orderDate}</td>
				<td><s:property value="%{establishmentVOs[#s.index].estName}" />(<s:property value="%{establishmentVOs[#s.index].linkman}" />)</td>
				<td>${content }</td>
				<td>${ cost}</td>
				 <td><s:property value="%{zhangtaos[#s.index]}"/></td>
				<!-- 已收 --><td><s:property value="%{yishous[#s.index]}"/></td>
				<td><s:property value="%{qianMoneys[#s.index]}"/></td>
				<td>${ favCost}</td>
				<td>${designerNameStr}</td>
				<td>${followerNameStr}</td>
				<td><s:property value="%{businessBillExtVOs[#s.index].lastPrinter}"/>
				<s:if test='businessBillExtVOs[#s.index].printNum!=0'>
						/<s:property value="%{businessBillExtVOs[#s.index].printNum}"/>次
				 </s:if>
				 </td>
				<td>${ deliverDate}</td>
				<td>
				
				 
				 <s:if test='businessBillExtVOs[#s.index].examined=="Y"'>已审核</s:if> 
				 <s:else>
				 	未审核
				 </s:else>
				 
				 
				  <s:if test='businessBillExtVOs[#s.index].collected=="Y"'>已完工</s:if> 
				 <s:else>
				 	未完工
				 </s:else>
				 
				  
				  
				    <s:if test='businessBillExtVOs[#s.index].completed="Y"'>已送完</s:if> 
				 <s:else>
				 	未送完
				 </s:else>
				  
				  
				  
				    <s:if test='businessBillExtVOs[#s.index].delivered=="Y"'>已结清</s:if> 
				 <s:else>
				 	未结清
				 </s:else>
				  
				  
				  
				  
				  
				  </td>

				<td>
				<s:if test='businessBillExtVOs[#s.index].delivered=="Y"'>
				    <s:a action="business_updateUI?businessBillVO.billCode=%{billCode}">查看</s:a>
				</s:if>
				<s:else>
				    <s:a action="business_updateUI?businessBillVO.billCode=%{billCode}">修改</s:a>
				
				</s:else>
				
				 <s:a action="">收款</s:a> <s:a action="">调账</s:a> <s:a action="">打印</s:a> <s:a action="">单据跟踪</s:a></td>
			</tr>
			
			
			
			
		</s:iterator>
	</table>

</body>
</html>