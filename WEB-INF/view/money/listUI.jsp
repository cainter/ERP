<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	<s:a action="moneybill_addBankAccountUI">新增</s:a>
	<table style="text-align: center;"   width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>序号</td>
			<td>开户名</td>
			<td>开户银行</td>
			<td>所属帐套</td>
			<td>现金账户</td>
			<td>账户余额</td>
			<td>状态</td>
			<td>操作</td>
		</tr>

		<s:iterator value="bankAccountVOs">
		
			
	
			<tr >
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if> >${sequenceCode }</td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>>${accountName}</td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>> ${bankName }</td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>><s:if test="%{tallySetId==1}">新异</s:if> <s:if test="%{tallySetId==2}">网络公司</s:if>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>><s:if test='%{isTmp=="Y"}'>是</s:if><s:if test='%{isTmp=="N"}'>否</s:if></td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>>${currentCost }</td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>><s:if test='%{status=="Y"}'>正常</s:if> <s:if test='%{status=="N"}'>暂停</s:if></td>
				<td <s:if test='%{status=="N"}'>style="color:red" </s:if>>
				
				<s:a action="moneybill_edtiBankAccountUI?bankAccount.id=%{id}">编辑</s:a> 
				<s:if test='%{status=="Y"}'>
						<s:a action="moneybill_StopBankAccount?bankAccount.id=%{id}&bankAccount.str=1">停用</s:a>
					</s:if> 
					<s:if test='%{status=="N"}'>
						<s:a action="moneybill_StopBankAccount?bankAccount.id=%{id}&bankAccount.str=2">启用</s:a>
					</s:if>
					
					 <s:a action="moneybill_DeleteBankAccount?bankAccount.id=%{id}">删除</s:a></td>
			</tr>
		</s:iterator>
	</table>
	<form action="moneybill_BankAccountUI" method="post">
	
	<a href="${pageContext.request.contextPath}/moneybill_BankAccountUI?CurrentPageNum=${fenyeMode.currentPageNum-1}">上一页</a>
	第<span style="color:red">${fenyeMode.currentPageNum}</span>&nbsp;&nbsp;页&nbsp;&nbsp;
	GO第:<span style="color:red"><input type="text" name="CurrentPageNum" value="${fenyeMode.currentPageNum}"  size="2"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
<a href="${pageContext.request.contextPath}/moneybill_BankAccountUI?CurrentPageNum=${fenyeMode.currentPageNum+1}">下一页</a>
每页显示结果：<input type="text" name="maxNumEveryPage"  size="2">
	<input type="submit" value="提交">
	<br><hr width="90%" color="red">
	每页结果数：<span style="color:red">${fenyeMode.maxNumEveryPage}</span>&nbsp;&nbsp;
	一共多少页：<span style="color:red">${fenyeMode.allPageNum}</span>&nbsp;&nbsp;
	一共多少条结果:<span style="color:red">${fenyeMode.allResultNum}</span>&nbsp;&nbsp;

</form>


</body>
</html>