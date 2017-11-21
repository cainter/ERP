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

${feeBillVO.billCode}
${feeBillVO.feeDate}
${feeBillVO.receiverName}

${bankAccountVO.bankName}
${feeBillVO.cost}

<hr color="red">


	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>费用类型</td>
			<td>金额</td>
			<td>备注</td>
			<td>业务单号</td>
		</tr>
		<s:iterator value="feeBillItemVOs" status="st">
			<tr>
				<td><s:property value="%{feeTypeVOs[#st.index].typeName}"/></td>	
			<td>${cost}</td>
			<td>${mark}</td>
			<td>${bbCode }</td>
			</tr>
		</s:iterator>
	</table>
	<br><br><br><br><br>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr><td>${feeBillVO.managerName}</td>
					<td>${departmentVO.departmentName}</td>	
				<td>${feeBillVO.mark}</td>
				<td>凭证</td>
				<td>${feeBillVO.createrName}  &${feeBillVO.createTime}</td>
				<td>${feeBillVO.examinerName}  &${feeBillVO.examineTime}</td>		
				<hr color="green">
${feeBillVO.id }				
				<hr color="green">
				<td><s:a action="feebillfanshenhe_ExaminedNotTongGuo?feeBillVO.id=${feeBillVO.id }	">审核不通过</s:a>
					<s:a action="place_delete?id=%{id}">退出</s:a></td>
					</tr>
					</table>
					${tallySetVO.title }
					
</body>
</html>