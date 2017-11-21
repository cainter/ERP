<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ${ businessBillItemVO}
<hr>
${businessBillVO }
<hr>
${ establishmentVO}
<hr>
${makeTypeVO }
<hr>
${workCenterVO }
<hr>
${workProcessVOs}
 --%>


	<h2>产量登记（标牌）</h2>
	<table>
		<tr>
			<td>登记日期：${time }</td>
		</tr>
		<tr>
			<td>客户：${ establishmentVO.estName}</td>
		</tr>
		<tr>
			<td>联系人：${ establishmentVO.linkman}</td>
		</tr>
		<tr>
			<td>业务单：${businessBillVO.billCode }</td>
		</tr>
	</table>
	<br>
	<br>
	<table border="1" bordercolor="red">
		<tr>
			<td>项目类型</td>
			<td>内容</td>
			<td>材质</td>
			<td>规格</td>
			<td>成品数量</td>
			<td>平方数</td>
			<td>制作要求</td>
			<td>工作中心</td>
		</tr>
		<tr>
			<td>${makeTypeVO.typeName}</td>
			<td>${businessBillItemVO.finishedContent}</td>
			<td>${businessBillItemVO.proName}</td>
			<td>${businessBillItemVO.specification}*${businessBillItemVO.amount}</td>
			<td>${businessBillItemVO.amount}</td>
			<td>${businessBillItemVO.squareNum}</td>
			<td>${businessBillItemVO.makeRequire}</td>
			<td>${workCenterVO.wcName}</td>

		</tr>
	</table>
	<div>
		<s:form action="" method="post">
		<table>
				<s:iterator>
			<tr>
				<td>
					<s:iterator value="%{workProcessVOs}">
						<s:property value="processName"/><s:a action="chanLiangRegister_new">新增</s:a>
						</s:iterator>
					<s:iterator value="%{outPutVoss[0]}">
<s:property value="makerName" />
						<input value="<s:property value="percent" />"> %<br>
						</s:iterator></td>
				</tr>
		</s:iterator>
		</table>
		<s:submit value="保存"></s:submit>
		</s:form>
	</div>

</body>
</html>