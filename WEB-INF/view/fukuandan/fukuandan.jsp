<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	${cooperBillVOs } 
	${establishmentVOs}
	<hr color="green">
 ${bankAccountVOs }  --%>
<form action="fukuandan_waixiefindAll" method="post">
		<h1 align="center">外协付款单</h1>
		<s:combobox list="establishmentVOs" listKey="id" listValue="estName" label="收款单位"  name="estId" readonly="false" ></s:combobox>
		<br><hr color="red">
		<s:combobox list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" label="付款账户"  name="bankId" readonly="false" ></s:combobox>
	<s:submit value="查找"></s:submit>
	<hr color="red" size="10">
	</form>
	<form action="fukuandan_waixiefindAll" method="post">
	<hr color="red">
	<s:combobox list="establishmentVOs" listKey="id" listValue="estName" label="收款单位"  name="estId" readonly="false" ></s:combobox>
		<br><hr color="red">
		<s:combobox list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" label="付款账户"  name="bankId" readonly="false" ></s:combobox>
	<%-- 	<s:select label="收款单位" list="establishmentVOs" listKey="id" listValue="estName" headerKey="" name="establishmentVO.estName"></s:select>
		<s:select label="付款账户" list="bankAccountVOs" listKey="id" listValue="bankName+(accountName)" headerKey="请选择账套" name="bankAccountVO.bankName"></s:select> --%>
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
				<input type="hidden" name="cooperBillVOs[${st.index}].id" value="${id}">
				<input type="hidden" name="cooperBillVOs[${st.index}].gatherDate"   value="${gatherDate}">
				<input type="hidden" name="cooperBillVOs[${st.index}].cooperatorId"   value="${cooperatorId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].estName"  value="${estName}">
				<input type="hidden" name="cooperBillVOs[${st.index}].linkman"   value="${linkman}">
				<input type="hidden" name="cooperBillVOs[${st.index}].phone"   value="${phone}">
				<input type="hidden" name="cooperBillVOs[${st.index}].address"   name=" " value="${ address}">
				<input type="hidden" name="cooperBillVOs[${st.index}].imprest"   value="${ imprest}">
				<input type="hidden" name="cooperBillVOs[${st.index}].favCost"   value="${ favCost}">
				<input type="hidden" name="cooperBillVOs[${st.index}].cost"   value="${cost}">
				<input type="hidden" name="cooperBillVOs[${st.index}].amount"   value="${ amount}">
				<input type="hidden" name="cooperBillVOs[${st.index}].square"   value="${ square}">
				<input type="hidden" name="cooperBillVOs[${st.index}].lengM"   value="${ lengM}">
				<input type="hidden" name="cooperBillVOs[${st.index}].lengCm"   value="${lengCm}">
				<input type="hidden" name="cooperBillVOs[${st.index}].bankAccountId"   value="${bankAccountId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].payModeId"   value="${payModeId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].departmentId"   value="${departmentId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].managerId"   value="${managerId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].managerName"   value="${managerName}">
				<input type="hidden" name="cooperBillVOs[${st.index}].gatherRequire"   value="${gatherRequire}">
				<input type="hidden" name="cooperBillVOs[${st.index}].gatherRequire"   value="${setupRequire}">
				<input type="hidden" name="cooperBillVOs[${st.index}].mark"   value="${ mark}">
				<input type="hidden" name="cooperBillVOs[${st.index}].tallySetId "  value="${tallySetId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].createrId"   value="${createrId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].createrName"   value="${createrName}">
				<input type="hidden" name="cooperBillVOs[${st.index}].modifierId"   value="${modifierId}">
				<input type="hidden" name="cooperBillVOs[${st.index}].modifierName"   value="${modifierName}">
				<input type="hidden" name="cooperBillVOs[${st.index}].modifyTime"   value="${modifyTime}">
				<input type="hidden" name="cooperBillVOs[${st.index}].createTime "  value="${createTime}">
				<input type="hidden" name="cooperBillVOs[${st.index}].updateTime"   value="${updateTime}">
				<tr>
					<td><input type="text"  name="cooperBillVOs[${st.index}].billCode"    value="${billCode}"></td>
					<td><input type="text"  name="cooperBillVOs[${st.index}].cooperDate"    value="${cooperDate}"></td>
					<td><input type="text"  name="cooperBillVOs[${st.index}].content"    value="${content}"></td>
					<td><input type="text"  name="cooperBillVOs[${st.index}].cost"   value="${cost}"></td>
					<td>未找到</td>
					<td>未找到</td>
				</tr>
			</s:iterator>
		</table>
		经办人：<input type="text" value="${ cooperBillVOs}.managerName" name="cooperBillVOs.managerName"><input type="button" value="选择"> &nbsp;&nbsp; 部门：待做 &nbsp;&nbsp;付款类型：外协付款
		<hr>
		<hr>
		<s:textarea label="摘要" name="description"></s:textarea>
		<br>
		<s:textarea label="备注" name="mark"></s:textarea>
		<br>
		<s:file label="上传"></s:file>
		<br> <br>
		<s:submit value="保存"></s:submit>
	</form>
</body>
</html>