<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@taglib prefix="s" uri="/struts-tags" %>
</head>
<body>
<h1>注册表单</h1>
<s:fielderror />
<form action="${pageContext.request.contextPath }/regist.action" method="post">
	用户名 <input type="text" name="username" /> <br/>
	密码 <input type="password" name="password" value="${param.password }"/><br/>
	<input type="hidden" name="text" value="itcast" />
	性别 <input type="radio" name="gender" value="男" /> 男 <input type="radio" name="gender" value="女" /> 女  <br/>
	爱好 <input type="checkbox" name="hobby" value="sport" /> 体育
	   <input type="checkbox" name="hobby" value="read" /> 读书
	   <input type="checkbox" name="hobby" value="music" /> 音乐 <br/>
	城市 <select name="city">
			<option value="北京">北京</option>
			<option value="上海">上海</option>
			<option value="南京">南京</option>
			<option value="广州">广州</option>
	    </select>  <br/>
	个人简介 <textarea rows="5" cols="60" name="info">${param.info }</textarea> <br/>
	<input type="submit" value="注册" />
	<input type="reset" value="重置" />
</form>

<hr/>

<!-- action 写struts.xml配置 <action> name属性 , namespace 包名称空间 -->
<!-- 默认布局样式 -->
<s:form action="regist" namespace="/" method="post" theme="xhtml">
	<s:textfield name="username" label="用户名"/>
	<s:password name="password" label="密码"/>
	<s:hidden name="text" value="itcast" />
	<s:submit type="submit" value="注册"/>
	<s:reset type="reset" value="重置" />
</s:form>
<hr/>
<!-- 采用 简单样式布局  -->
<s:form action="regist" namespace="/" method="post" theme="simple">
	用户名 ：<s:textfield name="username" /> <br/>
	<!-- label for 指向一个元素 id -->
	<s:label for="password" value="密码："></s:label> <s:password name="password" id="password" showPassword="true"/> <br/>
	<s:hidden name="text" value="itcast" />
	<!-- 如果看到内容和提交值相同时，ognl构造list  -->
	性别 ： <s:radio list="{'男','女'}" name="gender"></s:radio> <br/>
	<!-- 如果看到内容和提交值 不相同，ognl构造map -->
	爱好 ：<s:checkboxlist list="#{'sport':'体育','read':'读书','music':'音乐' }" name="hobby"></s:checkboxlist> <br/>
	<!-- 这个传到后台的值是北京、。。。。。选中的值 -->
	
	
	
	
	城市：<s:select list="{'北京','上海','南京','广州'}" name="city"></s:select> <br/>
	<!-- 从后台获取下拉列表,如果传到后台是要id，listKey里放id，如果要内容，放title。。后台设置name,即private Long id,或者private string title,来接收 -->
	<s:select label="账套" list="tallySetVOS" listKey="id" listValue="title" headerKey="请选择账套" name="tallySet"></s:select>
	
	
	
	
	个人简介 ：<s:textarea rows="5" cols="60" name="info"></s:textarea> <br/>
	<s:submit type="submit" value="注册"/> 
	<s:reset type="reset" value="重置" />
</s:form>


</body>
</html>