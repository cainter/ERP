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
郑州市新异标识标牌有限公司 制作单<br>

订货单位:${ establishmentVO.estName}
地址：${ establishmentVO.address}
F0647  NO . :${ establishmentVO.estCode}&nbsp;NO.&nbsp;${ businessBillVO.billCode}
订货日期：${ businessBillVO.orderDate}
交货日期：${ businessBillVO.deliverDate}<br>


<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%">
		<td>项目类型</td>
		<td>内容</td>
		<td>材质</td>
		<td>规格</td>
		<td>数量</td>
		<td>单位</td>
		<td>面积长度</td>
		<td>外协</td>
		<td>制作要求</td>
	 </tr>
	<tr><td>合计</td><td>${cooperBillItemVO.gatheredAmount}</td></tr>	 
	<s:iterator value="cooperBillItemVOs">
	 <tr>
	 
		<td>${makeTypeVO.typeName}</td>
		<td>${finishedContent}</td>
		<td>${proName}</td>
		<td>${specification}</td>
		<td>${amount}</td>
		<td>${unit}</td>
		<td>${squareNum}</td>
		<td>外协</td>
		<td>${makeRequire}</td>
	 </tr>
	 </s:iterator>
	 
</table>

<br>

<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	<tr height="10%">
		<td>提货要求</td><td>${businessBillVO.ladingRequire}</td>  	<td>安装要求</td><td>${businessBillVO.setupRequire}</td>
	 </tr>
	 
	 <tr height="10%">
		<td>备注</td><td>${businessBillVO.mark}</td> 
	 </tr>
	 
 <tr>
		<td>业务员</td>	<td></td>		<td>跟单员</td> <td>${businessBillVO.followerNameStr}</td>
		<td>业务来源</td> <td></td> <td>设计员</td> <td>${businessBillVO.designerNameStr}</td>
	 </tr> 
</table>
<br>
		开单人 ${ businessBillVO.createrName}
			<!--审核人 :${businessBillVO.modifierName }
		 制作主管: 杨海波说没有
		确认: -->
	<br>
		
一式三联，白联留存，红联车间，黄联物流 门市电话：0371-66520971 66758900

<button value="开始打印"></button>
<button value="退出"></button>











</body>
</html>