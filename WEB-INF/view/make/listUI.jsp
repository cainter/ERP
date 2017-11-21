<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
		<tr height="10%">
			<td>单号</td>
			<td>订货单位</td>
			<td>摘要</td>
			<td>交货日期</td>
			<td>审核时间</td>
			<td>跟单员</td>
			<td>开工状态</td>
			<td>工作中心</td>
			<td>操作</td>
		</tr>

		<s:iterator value="businessBillVOs" status="st">
			<tr>
				<td>${billCode }</td>
				<td><s:property  value="%{establishmentVOs[#st.index].estName}"/></td>
					<td>${content }</td> 
				<td>${orderDate}</td>
			<td>${ deliverDate}</td>
			<td><s:property  value="%{businessBillExtVOs[#st.index].examineTime}"/></td>
			<td>${followerNameStr}</td>
			<td>开工状态</td>
			<td>工作中心</td>
			<td>
			<s:a action="">打印</s:a>
			<s:a action="">打印工艺单</s:a>
			<s:a action="">下载图样</s:a>
			<s:a action="">取消开工</s:a>
			<s:a action="">取消加急</s:a>
			<s:a action="">进度跟踪</s:a>
			</td>
			</tr>
		</s:iterator>
	</table>


</body>
</html>