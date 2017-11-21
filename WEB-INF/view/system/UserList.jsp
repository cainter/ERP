<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://115.28.87.22:8888/system/UserList.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>用户 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doNew(){
		var url="ERP/UserRole_toUserNew";
		ShowIframeNoScroll("用户",url,400,460,"doNewCallBack()",600,530);
	}
	function doNewCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			setTimeout("doPermission("+arr[0]+",'"+arr[1]+"','MODEL_PRIVILEGE')",1000*1);
		}else{
			refreshWin();
		}
	}
	function doEdit(id){
		var url="ERP/UserRole_toUserEdit?id="+id;
		ShowIframeNoScroll("用户",url,400,460,"refreshWin()",600,530);
	}
	function refreshWin(){
		window.location.reload(true);
	}
	function doDelete(id){
		ShowConfirm('确认框','确定删除吗？',340,80,"doDelAct("+id+")");
	}
	function doDelAct(id){
		if(popRetVal!=null){
			window.location="ERP/UserRole_deletcUser?id="+id;
		}
	}
	function doPermission(userId,stafName,privilegeType){
		var url="system/UserPriSetTypeSelect.html";
		ShowIframeNoScroll(stafName,url,420,280,"doPermissionCallBack("+userId+",'"+stafName+"','"+privilegeType+"')",600,530);
	}
	function doPermissionCallBack(userId,stafName,privilegeType){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			var templateId="";
			if(arr[0]=="COPY"){
				templateId=arr[1];
			}
			setTimeout("doPermissionCallBackExt("+userId+",'"+stafName+"','"+privilegeType+"','"+templateId+"')",500*1);
		}else{
			refreshWin();
		}
	}
	function doPermissionCallBackExt(userId,stafName,privilegeType,templateId){
		var url="system/UserPrivilegeList.html?user_id="+userId+"&privilege_type="+privilegeType+"&template_id="+templateId;
		ShowIframe(stafName,url,900,500,"refreshWin()",600,530);
	}
	function doCancel(){
		window.close();
	}
	function doPause(id,flag){
		var fromUrl=encodeURIComponent("system/UserList.html");
		window.location="system/UserPause.html?id="+id+"&flag="+flag+"&from_url="+fromUrl;
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		window.location="ERP/UserRole_findUser?userName="+searchKey;
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doInit(){
		document.getElementById("search_key").focus();
	}
</script>
<style>@font-face{font-family:uc-nexus-iconfont;src:url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.woff) format('woff'),url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.ttf) format('truetype')}</style></head>
<body oncontextmenu="return false" class="sheet" style="text-align:center;" onload="doInit();">
<div class="sheet-main" style="width:560px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>用户管理</h2>
      <p>设置员工的登录账号以及使用权限</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
	    <div class="add_content">
	    	 <div align="right">
	    	 	<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" style="width:100px" value="" title="以员工姓名进行模糊查询">
		        <input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();">
	    	 	<input type="button" class="buttom search-add" value=" 新 增 " onclick="doNew();">
	    	 </div>
	     </div>
	     
<table width="98%" border="0" cellpadding="0" cellspacing="0">
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
					<th width="15%">登录帐号</th>
					<th width="18%">职员姓名</th>
					<th width="15%">设置有效期</th>
					<th width="18%">有效期至</th>
					<th width="10%">状态</th>
					<th width="24%">操作</th>
				</tr>
				<s:iterator value="users" status="indexs">
				<tr>
					<td>${userName }</td>
					<td>员工id等待查找姓名${stafferId }</td>
					<td>
						<c:if test="${useValidity == 'Y'}">
							是
						</c:if>
						<c:if test="${useValidity == 'N'}">
							否
						</c:if>
					</td>
					<td>
						${validity }
					</td>
					<td>
						<c:if test="${enabled == 'Y'}">
							正常
						</c:if>
						<c:if test="${enabled == 'N'}">
							<font color="#ff0000">停用</font>
						</c:if>
					</td>
					<td>
						<a href="javascript:doEdit(${id });">编辑</a>
						<c:if test="${enabled == 'Y'}">
							<a href="UserRole_stopAbled?id=${id }">停用</a>
						</c:if>
						<c:if test="${enabled == 'N'}">
							<a href="UserRole_openAbled?id=${id }">启用</a>
						</c:if>
						
						<a href="">授权</a>
						<a href="javascript:doDelete(${id });">删除</a>
					</td>
					</tr>
				</s:iterator>
			</tbody>
			</table>
		  </div>  
	   </div>  
  </div>
<div class="blank12">
</div>


</div></body></html>