<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<%
	session.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
<!--isCheck=1  但是显示外协反审核单 -->
${isCheck}

	<s:if test="%{isCheck=1}">外协审核单</s:if>
<s:if test="%{isCheck!=1}">外协反审核单</s:if>
	<s:debug></s:debug>
	<br>

	<hr color="red" width="100%">
	编号：${cooperBillVO.billCode} 外协日期：${cooperBillVO.cooperDate}
	<hr color="red" width="100%">
	外协单位 ：${establishmentVO.estName } 联系人 ：${cooperBillVO.linkman } 电话 ：${cooperBillVO.phone } 地址 ：${cooperBillVO.address }
	<hr color="red" width="100%">
	
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>项目类型</td>
		<td>内容</td>
		<td>材质</td>
		<td>规格</td>
		<td>制作要求</td>
		<td>单位</td>
		<td>数量</td>
		<td>单价</td>
		<td>金额</td>
		<td>来源</td>
	 </tr>
	 
	 <s:iterator value="cooperBillItemVOs">
	 <tr>
		<td>${makeTypeVO.typeName}</td>
		<td>${finishedContent}</td>
		<td>${proName}</td>
		<td>${specification }</td>
		<td>${makeRequire }</td>
		<td>${unit}</td>
		<td>${amount}</td>
		<td>${ unitPrice}</td>
		<td>${ cost}</td>
		<td><s:a action="CooperAgaincheck_Source?cooperBillItemVO.bbCode=%{bbCode}&businessBillVO.billCode=%{bbCode}">${bbCode}</s:a><td>
	 </tr>
	 </s:iterator>
	 
</table>
	<hr color="red" width="100%">

部门：${departmentVO.departmentName}
交货要求：${cooperBillVO.gatherRequire }
优惠金额：${cooperBillVO.favCost}<br>
%业务员%：${cooperBillVO.managerName}
安装要求：${cooperBillVO.setupRequire}
折后金额：${cooperBillVO.cost}<br>
交货日期：${cooperBillVO.createTime}
预付款：${cooperBillVO.imprest}<br>
<hr color="red" width="100%">
付款方式：${payModeVO.modeName }
付款账户：${ bankAccountVO.bankName}
备注：${cooperBillVO.mark}
摘要：${cooperBillVO.content}
开单人：${cooperBillVO.createrName}&nbsp;${cooperBillVO.createTime}
审核人：${cooperBillExtVO.examinerName}&nbsp;${cooperBillExtVO.examineTime}
修改人：${cooperBillVO.modifierName}&nbsp;${cooperBillVO.modifyTime}
单据账套：${tallySetVO.title}


		<s:if test="%{isCheck=1}">
		<s:a action="CooperAgaincheck_isCheckOrNo?cooperBillVO.id=%{cooperBillVO.id}">审核</s:a><s:a action="CooperAgaincheck_listUIDetailByBillCode?cooperBillVO.billCode=%{billCode}&cooperBillVO.id=%{id}">查看</s:a></td>
		</s:if>
		
		<s:if test="%{isCheck!=1 }">
			<s:a action="CooperAgaincheck_isCheckOrNo?cooperBillVO.id=%{cooperBillVO.id}">反审核</s:a><s:a action="CooperAgaincheck_listUIDetailByBillCode?cooperBillVO.billCode=%{billCode}&cooperBillVO.id=%{id}">查看</s:a></td>
		</s:if>

</body>
</html>