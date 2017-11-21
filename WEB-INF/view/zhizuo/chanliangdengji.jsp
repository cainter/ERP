<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<%-- 	${businessBillItemVOss }
	<hr>
	${businessBillVO2 }
	<hr>
	${establishmentVOs }
	<hr>
	${workCenterVOs }
	<hr>
	${ businessBillItemExtVOs}
	<hr>
	${makeTypeVOs }
	<hr> --%>

	<table border="1" cellpadding="0" cellspacing="0" bordercolor="red">
		<tr>
			<td>日期</td>
			<td>单号</td>
			<td>订货单位</td>
			<td>项目类型</td>
			<td>内容</td>
			<td>材质</td>
			<td>规格</td>
			<td>单位</td>
			<td>数量</td>
			<td>制作要求</td>
			<td>工作中心</td>
			<td>完成情况</td>
			<td>操作</td>
		</tr>
		<s:iterator value="businessBillItemVOss" status="st">
			<tr>
				<td><s:property value="businessBillVO2[#st.index].orderDate" /></td>
				<td><s:property value="businessBillVO2[#st.index].billCode" /></td>
				<td><s:property value="establishmentVOs[#st.index].estName" /></td>
				<td><s:property value="makeTypeVOs[#st.index].makeType" /></td>
				<td><s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="finishedContent" />
					</s:iterator>
					</td>
					<td>
					
					 <s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="proName" />
					</s:iterator> 
					</td>
					<td>
					<s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="specification" />x<s:property value="amount" />
					</s:iterator></td>
				<td><s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="priceType" />
					</s:iterator></td>
				<td><s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="squareNum" />
					</s:iterator></td>
				<td><s:iterator value="%{businessBillItemVOss[#st.index]}">
						<s:property value="makeRequire" />
					</s:iterator></td>
			<td><s:property  value="workCenterVOs[#st.index].wcName"/></td>
				<td><s:property value="businessBillItemExtVOs[#st.index].compStr" /></td>
				<td><s:a action="chanLiangRegister_dengji?businessBillItemVO.id=%{businessBillItemVOss[#st.index][0].id}&businessBillItemVO.wcId=%{businessBillItemVOss[#st.index][0].wcId}&businessBillVO.id=%{businessBillVO2[#st.index].id}">登记</s:a></td>
			</tr>
		</s:iterator>
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