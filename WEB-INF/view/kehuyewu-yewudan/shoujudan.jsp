<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("path", request.getContextPath());%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
郑州市新异标识标牌有限公司 收款单

<br>
收款日期：${businessBillVO.checkDate}
付款单位：${ establishmentVO.estName}
经办人：${businessBillVO.managerName }
摘要：这是个空  
收款账户：  ${bankAccountVO.bankName}             金额(大写)：${impresTrans }

<br>
<table width="80%" cellpadding="0" cellspacing="0" border="1">
	<tr><td>业务单号</td><td>订货日期</td> <td>联系人</td><td>摘要</td><td>金额</td><td>本次收款</td><td>尚欠款</td> </tr>
	<tr><td>${businessBillVO.billCode}</td><td>${businessBillVO.orderDate }</td> <td>${businessBillVO.linkman }</td><td>${businessBillVO.mark }</td><td>${businessBillVO.cost}</td><td>${businessBillVO.imprest}</td><td>${businessBillVO.cost-businessBillVO.imprest}</td> </tr>

</table>



<br><br>
开单人：${businessBillVO.createrName }
审核人：${businessBillVO.modifierName }
签字：手写
<br>
${codeRuleVO.printFoot}
<br>
<s:a action="开始打印">开始打印</s:a> <s:a action="">退出</s:a>



</body>
</html>