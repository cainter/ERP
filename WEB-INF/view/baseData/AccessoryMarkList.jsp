<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>文件说明 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doNew(){
		var url="base/AccessoryMarkNew.html";
		ShowIframeNoScroll("文件说明",url,500,260,"refreshWin()");
	}
	function refreshWin(){
		window.location.reload(true);
	}
	function doEdit(id){
		var url="base/AccessoryMarkEdit.html?id="+id;
		ShowIframeNoScroll("文件说明",url,500,260,"refreshWin()");
	}
	function doDelete(id){
		ShowConfirm('确认框','确定删除吗？',340,80,"doDelAct("+id+")");
	}
	function doDelAct(id){
		if(popRetVal!=null){
			window.location="base/AccessoryMarkDelete.html?id="+id;
		}
	}
	function doCancel(){
		window.close();
	}
</script>
</head>
<body oncontextmenu="return false" class="sheet" style="text-align:center;">
<div class="sheet-main" style="width:560px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>文件说明</h2>
      <p>设置上传文件时常见的文件说明，上传时可以直接选择，提升效率</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
	    <div class="add_content"> 	
	    	 <div align="right"><a class="buttom search-add" href="AccessoryMark_toAccessoryNew">新增</a></div>
	     </div>
		 
<table width="98%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
	     <div class="table-list">
	        <table width="100%">
	          <tbody>
	          	<tr>
	          		<th width="50">序号</th>
					<th width="420">文件说明</th>
					<th>操作</th>
				</tr>
				<s:iterator value="accessoryMarks" status="indexs">
				<tr>
					<td>${sequenceCode }</td>
					<td>${mark }</td>
					<td>
						<a href="AccessoryMark_toAccessoryEdit?id=${id }">编辑</a>
						<a href="AccessoryMark_delAccessoryMark?id=${id }">删除</a>
					</td>
				</tr>
				</s:iterator>
			</tbody></table>
		   </div>  
	   </div>  
  </div>
<div class="blank12">
</div>

</div></body></html>