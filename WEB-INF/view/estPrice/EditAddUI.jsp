<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("path", request.getContextPath());%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑页面</title>
</head>
<body>

${estPrice.id }
<s:form action="estprice_%{estPrice.id==0?'addEstPrice':'editEstPrice'}" method="post">
<s:hidden name="estPrice.id" value="%{estPrice.id}"></s:hidden>
<s:textfield label="项目类型" name="estPrice.makeTypeId" value="%{estPrice.makeTypeId}"/><br>
<s:textfield label="材质" name="estPrice.proName" value="%{estPrice.proName}"></s:textfield><br>
<s:textfield label="规格" name="estPrice.specification" value="%{estPrice.specification}"></s:textfield><br>
<s:textfield label="单位" name="estPrice.unit" value="%{estPrice.unit}" disabled=""></s:textfield><br>
<s:textfield label="单价" name="estPrice.price" value="%{estPrice.price}"/><br>
<s:textfield label="制作要求" name="estPrice.makeRequire" value="%{estPrice.makeRequire}"></s:textfield><br>
<s:textfield label="备注" name="estPrice.mark" value="%{estPrice.mark}"></s:textfield><br>
<s:submit value="保存"></s:submit>
</s:form>

</body>
</html>