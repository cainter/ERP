<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	${cooperBillVOs } --%>
	<%--
	${ establishmentVOs}

	<hr color="green">
	
--%>
	<%-- ${bankAccountVOs } --%>
	<hr>
	<form action="fukuandan_waixiefindAll" method="post">
		<h1 align="center">外协付款单</h1>
		<s:combobox list="establishmentVOs" listKey="id" listValue="estName" label="收款单位" value="" name="estId" readonly="false" ></s:combobox>
		<br>
		<s:combobox list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" label="付款账户" value=""  name="bankId" readonly="false" ></s:combobox>
		<%-- //<s:select label="收款单位" list="establishmentVOs" listKey="id" listValue="estName"  name="estId"></s:select>
		//<s:select label="付款账户" list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" name="bankId"></s:select> --%>
		付款金额前台来自前台计算
	
		<hr>
		<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr height="10%">
				<td>单号</td>
				<td>日期</td>
				<td>摘要</td>
				<td>金额</td>
				<td>余额</td>
				<td>本次付款</td>
				<td>操作</td>
			</tr>
			<s:iterator value="cooperBillVOs" status="st">
			
			</s:iterator>
		</table>
		经办人：<input type="button" value="选择"> &nbsp;&nbsp; 部门：待做 &nbsp;&nbsp;付款类型：外协付款
		<hr>
		<hr>
		<s:textarea label="摘要" name="description"></s:textarea>
		<br>
		<s:textarea label="备注" name="mark"></s:textarea>
		<br>
		<s:file label="上传"></s:file>
		<br> <br>
		<s:submit value="提交"></s:submit>
	</form>
</body>
</html>