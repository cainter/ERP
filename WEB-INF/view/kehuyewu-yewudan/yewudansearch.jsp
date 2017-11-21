<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
	<s:form action="business_search" method="post">
		<table>
		
		<s:textfield label="订货日期" name="serarchBeans.orderDateStart" value=""></s:textfield>
		<s:textfield label="订货日期" name="serarchBeans.orderDateEnd" value=""></s:textfield>
		<s:textfield label="业务单号" name="serarchBeans.billCode" value=""></s:textfield>
		<s:textfield label="交货日期" name="serarchBeans.deliverDateStart" value=""></s:textfield>
		<s:textfield label="交货日期" name="serarchBeans.deliverDateEnd" value=""></s:textfield>
		<s:textfield label="完工日期" name="serarchBeans.completeDateStart" value=""></s:textfield>
		<s:textfield label="完工日期" name="serarchBeans.completeDateEnd" value=""></s:textfield>
		<s:textfield label="合同号"  name="serarchBeans.contractCode" value=""></s:textfield>
		<s:textfield label="订货单位" name="serarchBeans.estName" value=""></s:textfield>
		<s:textfield label="联系人" name="serarchBeans.linkMan" value=""></s:textfield>
		<s:textfield label="电话" name="serarchBeans.phone" value=""></s:textfield>
		<s:textfield label="摘要" name="serarchBeans.mark" value=""></s:textfield>
		<s:submit value="提交"></s:submit>
		</table>
	</s:form>
</body>
</html>