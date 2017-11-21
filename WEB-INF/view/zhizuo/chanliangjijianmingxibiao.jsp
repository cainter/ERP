<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<htm|>
<%@taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${outputVOs }
<hr>
${businessBillItemVOs }
<hr>
${businessBillItemVOs}
<hr>
${businessBillVO2 }
<hr>
${makeTypeVOs }
<hr>
${ workCenterVOs}
<hr>
${establishmentVOs}
<hr>
${workProcessVOs } --%>
<table width="90%" cellpadding="0" cellspacing="0" border="1">
<tr>
										
<td>制作日期	</td>
<td>业务单号</td>
<td>	订货单位</td>
<td>项目类型</td>
<td>内容</td>
<td>	材质	</td>
<td>	规格	</td>
<td>计量单位</td>
<td>数量</td>
<td>制作要求</td>
<td>工作中心</td>
<td>工序	</td>
<td>制作人</td>
<td>占比	完成量</td>
<td>计件单价</td>
<td>计件产值</td>
<td>备注</td>
<td>登记人</td>
<td>登记时间	</td>
<td>	操作</td>
</tr>
<s:iterator value="outputVOs" status="st">
<tr>
<td><s:property  value="businessBillVO2[#st.index].createTime"/></td>
<td><s:property  value="businessBillVO2[#st.index].billCode"/></td>
<td><s:property  value="establishmentVOs[#st.index].estName"/></td>
<td><s:property  value="makeTypeVOs[#st.index].typeName"/></td>

<td>
 <s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="finishedContent"/>
</s:iterator>
</td>
<td>
 <s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="proName"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="specification"/>x<s:property value="amount"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="unit"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="squareNum"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="makeRequire"/>
</s:iterator>
</td>


<td><s:property  value="workCenterVOs[#st.index].wcName"/></td>

<td><s:property  value="workProcessVOs[#st.index].processName"/></td>
<td><s:property  value="outputVOs[#st.index].makerName"/></td>


<td><s:property  value="outputVOs[#st.index].percent"/></td>
<td><s:property  value="workProcessVOs[#st.index].price"/></td>
<td><s:property  value="workProcessVOs[#st.index].price"/></td>
<td><s:property  value="outputVOs[#st.index].mark"/></td>

<td><s:property  value="outputVOs[#st.index].createrName"/></td>
<td><s:property  value="outputVOs[#st.index].createTime"/></td>

<td><s:property  value="outputVOs[#st.index].makerName"/></td>

<td><s:a action="ouputDetail_delete?outputVOs.id=%{id}">删除1</s:a></td>

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