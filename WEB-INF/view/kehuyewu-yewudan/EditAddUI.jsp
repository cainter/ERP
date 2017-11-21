<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务改单</title>
</head>
<body>

	<s:form action="business_updateend" method="post">
		<s:hidden name="businessBillVO.id" value="%{businessBillVO.id}"></s:hidden>


		<s:textfield readonly="true" name="businessBillVO.billCode" value="%{businessBillVO.billCode}" label="编号" />
		<%-- <input name="businessBillVO.orderDate" value="${businessBillVO.orderDate}" /> --%>
		<hr color="red" />
		<s:textfield readonly="true" name="establishmentVO.estName" value="%{establishmentVO.estName}" label="客户" />

		<s:textfield name="businessBillVO.linkman" value="%{businessBillVO.linkman}" label="联系人" />
		<input style="color: red; background: yellow;" value="选择" type="button" />

		<s:textfield name="businessBillVO.phone" value="%{businessBillVO.phone}" label="电话" />

		<s:textfield name="businessBillVO.contractCode" value="%{businessBillVO.contractCode}" label="合同号" />
		<hr color="red">

		<br>
		<br>
		<jsp:include page="./threeUpdateFormTable.jsp"/>
		<br>
		<br>
		<s:textfield label="业务来源" readonly="true" value="%{businessBillVO.introducerName}" name="businessBillVO.introducerName" />
		<input style="color: red; background: yellow;" value="选择" type="button" />
		<s:textfield label="安装要求" name="businessBillVO.setupRequire" value="%{businessBillVO.setupRequire}"></s:textfield>
		<s:textfield label="合计金额" readonly="true" name="businessBillVO.cost" value="%{businessBillVO.cost}"></s:textfield>
		<s:select list="%{departmentVOs}" disabled="true" value="%{departmentVO.departmentName}" listKey="departmentName" name="departmentVO.departmentName" listValue="departmentName" label="部门" />
		<s:textfield label="提货要求" name="businessBillVO.ladingRequire" value="%{businessBillVO.ladingRequire}"></s:textfield>
		<s:textfield label="优惠金额" name="businessBillVO.favCost" value="%{businessBillVO.favCost}"></s:textfield>
		<a>抹零</a>
		<a>四舍五入</a>
		<s:textfield label="业务员" readonly="true" name="businessBillVO.managerName" value="%{businessBillVO.managerName}" />
		<input style="color: red; background: yellow;" value="选择" type="button" />


		<%-- <s:select list="" value="" listKey="" listValue="" label="交货日期"></s:select> --%>
		<s:textfield label="@@@交货日期替换另方式" name="businessBillVO.deliverDate" value="%{businessBillVO.deliverDate}"></s:textfield>
		<a>明天</a>
		<a>后天</a>


		<s:textfield label="折后金额" readonly="true" name="" value="%{businessBillVO.cost}"></s:textfield>
		<s:textfield label="跟单员" readonly="true" name="businessBillVO.followerNameStr" value="%{businessBillVO.followerNameStr}"></s:textfield>
		<input style="color: red; background: yellow;" value="选择" type="button" />
		<s:textfield label="送货地址" name="businessBillVO.address" value="%{businessBillVO.address}"></s:textfield>
		<s:textfield label="预付款" readonly="true" name="businessBillVO.imprest" value="%{businessBillVO.imprest}"></s:textfield>
		<hr>
		<s:select list="%{payModeVOs}" value="%{payModeVO.modeName}" listKey="modeName" name="payModeVO.modeName" listValue="modeName" label="付款方式"></s:select>
		<s:select name="businessBillVO.designType" value="%{businessBillVO.designType}" list="#{'0':'SEIF3','1':'SELF2'}" listKey="key" label="设计类型"></s:select>
		<s:textfield label="摘要" name="businessBillVO.content" value="%{businessBillVO.content}"></s:textfield>
		<%-- <s:select list="" value="" listKey="" listValue="" label="收款账号"></s:select> --%>
	@@收款账号
	<s:textfield label="设计员" name="businessBillVO.designerNameStr" value="%{businessBillVO.designerNameStr}"></s:textfield>
		<input style="color: red; background: yellow;" value="选择" type="button" />
		<s:textfield label="备注" name="businessBillVO.mark" value="%{businessBillVO.mark}"></s:textfield>
		<s:textfield label="结账日期" name="businessBillVO.checkDate" value="%{businessBillVO.checkDate}"></s:textfield>
		<a>日期选择</a>
		<hr>
		<h3>附件管理</h3>

	

		<hr color="red">
	开单人：${businessBillVO.createrName }&nbsp;&nbsp;&nbsp; 审核人：${businessBillVO.createrName }&nbsp;&nbsp;&nbsp; 结清：***&nbsp;&nbsp;&nbsp; 最后打印：${businessBillExtVO.lastPrinter }/${businessBillExtVO.printNum}次&nbsp;&nbsp;&nbsp; 修改人：${businessBillVO.createrName }&nbsp;&nbsp;&nbsp; 单据账套：${tallySetVO.title }&nbsp;&nbsp;&nbsp;
	<hr color="red">
		<s:a action="business_printYewudan?businessBillVO.id=%{businessBillVO.id}">打印业务单</s:a>
		<s:a action="business_printZhizuodan?businessBillVO.id=%{businessBillVO.id}">打印制作单</s:a>
		<s:a action="business_printXiaoshoudan?businessBillVO.id=%{businessBillVO.id}">打印销售单</s:a>
		<s:a action="business_printXiaopiao?businessBillVO.id=%{businessBillVO.id}">打印小票</s:a>
		<s:a action="business_printShouju?businessBillVO.id=%{businessBillVO.id}">打印收据</s:a>
		<s:a action="">导出</s:a>
		<s:submit value="保存" />
		<s:a action="">取消</s:a>
	</s:form>
</body>
</html>