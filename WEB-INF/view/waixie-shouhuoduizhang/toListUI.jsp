<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	session.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	外协单位：${ establishmentVO.estName}
	<%-- 起止日期：${ establishmentVO.}
收货金额：${ establishmentVO.} --%>
	地址：${ establishmentVO.address} 联系:${ establishmentVO.linkman} 电话：${ establishmentVO.linkmanPhone}
	<br>

	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">

		<tr height="10%">
			<td>单号</td>
			<td>日期</td>
			<td>项目类型</td>
			<td>内容</td>
			<td>材质</td>
			<td>规格</td>
			<td>单位</td>
			<td>数量</td>
			<td>单价</td>
			<td>金额</td>
			<td>制作要1求</td>
		</tr>
		
		<s:iterator value="gatherBillVOs" status="st">
		<tr>
				<td>${billCode }</td><!-- 单号 -->
				<td> ${gatherDate }  </td><!--日期  -->
				
				<td><s:property value="%{makeTypeVOs[#st.index].typeName}" /></td><!--项目类型  -->
				
				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="finishedContent" /><!-- 内容 -->
					</s:iterator></td>
				
				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="proName" /><!-- 材质 -->
					</s:iterator></td>
	



				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="specification" /><!-- 规格 -->
					</s:iterator></td>

				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="unit" /><!-- 单位 -->
					</s:iterator></td>

				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="amount" /><!-- 数量 -->
					</s:iterator></td>

				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="unitPrice" /><!-- 单价 -->
					</s:iterator></td>

				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="cost" /><!--  金额-->
					</s:iterator></td>

				<td><s:iterator value="%{cooperbillitemvoSS[#st.index]}" >
						<s:property value="makeRequire" /><!-- 制作要求 -->
					</s:iterator></td>
			</tr>
		</s:iterator>

	</table>

</body>
</html>