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

<hr>
${payBillVO.billCode}
${payBillVO.payDate}
<hr>
${establishmentVO.estName }
${bankAccountVO.bankName}
${payBillVO.cost}
<hr>


<hr color="red">


	 <table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>单号</td>
			<td>日期</td>
			<td>金额</td>
			<td>余额</td>
			<td>本次付款</td>
		</tr>
		<s:iterator value="payBillItemVOs" status="st">
			<tr>
			<td>1${purchaseBillCode}</td>
			<td>${purchaseDate}</td>
			<td>${totalCost}</td>
			<td>${remainCost }</td>
			<td>${thisCost }</td>
			</tr>
		</s:iterator>
	</table>
	<br><br><br><br><br>
	<tr><td>${payBillVO.managerName}</td>

					<td>${departmentVO.departmentName}</td>	
						<td>摘要：${payBillVO.description}</td>	
			<td>备注：${payBillVO.mark}</td>
				<td>凭证</td><br>
				<td>${payBillVO.createrName}  &${payBillVO.createTime}</td>
				<td>${payBillVO.examinerName}  &${payBillVO.examineTime}</td>		
			<td><s:a action="paybillfanshenhe_ExaminedNotTongGuo?payBillVO.id=%{payBillVO.id}">审核不通过</s:a>
					<s:a action="">退出</s:a></td> 
					</tr>
			
					${tallySetVO.title }
					
</body>
</html>