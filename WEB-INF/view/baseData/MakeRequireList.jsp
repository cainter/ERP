<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>制作要求 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doNew(){
		var url="ERP/MakeRequire_toMakeReqireNew";
		ShowIframeNoScroll("制作要求",url,500,340,"refreshWin()");
	}
	function refreshWin(){
		window.location.reload(true);
	}
	function doEdit(id){
		var url="base/MakeRequireEdit.html?id="+id;
		ShowIframeNoScroll("制作要求",url,500,340,"refreshWin()");
	}
	function doDelete(id){
		ShowConfirm('确认框','确定删除吗？',340,80,"doDelAct("+id+")");
	}
	function doDelAct(id){
		if(popRetVal!=null){
			window.location="base/MakeRequireDelete.html?id="+id;
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
      <h2>制作要求</h2>
      <p>设置业务单上常规的工艺要求，开单时可以直接选择，提升开单效率；可以设置每一项制作要求产生的附加单价，拖图自动开单可以自动把这个单价叠加到项目价格上，如果不使用拖图开单，这个单价可以不设置。</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
	    <div class="add_content"> 	
	    	 <div align="right"><a href="MakeRequire_toMakeReqireNew" class="buttom search-add">新 增</a></div>
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
	          <tbody><tr>
	          		<th width="10%">序号</th>
      				<th width="15%">编号</th>
					<th width="45%">要求内容</th>
					<th width="15%">附加单价</th>
					<th width="15%">操作</th>
				</tr>
				<s:iterator value="makeRequires" status="indexs">
					<tr>
						<td>${sequenceCode }</td>
						<td>${code }</td>
						<td>${requireContent }</td>
						<td>${price  }</td>
						<td>
							<a href="MakeRequire_toMakeReqireEdit?id=${id }">编辑</a>
							<a href="MakeRequire_delMakeReqire?id=${id }">删除</a>
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