<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>
供应商管理<br>
<table width="60%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
	
	<tr height="10%">
		<td>编号</td>
		<td>供应商名称</td>
		<td>联系人</td>
		<td>电话</td>
		<td>地址</td>
		<td>账套</td>
		<td>经办人</td>
		<td>创建日期</td>
		<td>备注</td>
		<td>相关记录</td>
		<td>操作</td>
		
	 </tr>
	 
	 <s:iterator value="establishmentVOs" status="st">
	 <tr>
		<td>${estCode }</td>
		<td>${ estName}</td>
		<td>${linkman }</td>
		<td>${phone }</td>
		<td>${address }</td>
		<td><s:property value="%{tSetVOs[#st.index].title}"/></td>
		<td>${managerName }</td>
		<td>${createTime }</td>
		<td>${mark }</td>
		 

		<td><s:a action="gongyingshang_purchasehistory?establishmentVO.id=%{id}">采购记录</s:a>
		<s:a action="gongyingshang_fujian?establishmentVO.id=%{id}">附件</s:a>
		<s:a action="gongyingshang_payhistory?establishmentVO.id=%{id}">付款记录</s:a>
		<s:a action="gongyingshang_adjustBillhistory?establishmentVO.id=%{id}"> 调账记录</s:a></td>
		 

		<td><s:a action="gongyingshang_editGongyingshang?establishmentVO.id=%{id}">查看</s:a>
		
		<s:a action="gongyingshang_upload?establishmentVO.id=%{id}">传附件</s:a>
		<s:if test='status=="Y"'>
			<s:a action="gongyingshang_stop?establishmentVO.id=%{id}">停用</s:a>
		</s:if>
		<s:else>
			<s:a action="gongyingshang_start?establishmentVO.id=%{id}">启用</s:a>
		</s:else>
		
			<s:a action="gongyingshang_delete?establishmentVO.id=%{id}">删除</s:a>
	 </tr>
	 </s:iterator>
	 
</table> 

	
</body>
</html>