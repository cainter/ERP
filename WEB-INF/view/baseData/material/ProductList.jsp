<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://115.28.87.22:8888/base/ProductList.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>材料 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script language="javascript">
	function doNew(){
		var url="product_toProductNew";
		parent.ShowIframeNoScroll("材料",url,900,400,"refreshProWin()",1024,640);//refreshProWin是父窗口的
	}
	function refreshWin(){//父窗口的refreshProWin调用
		window.location="/base/ProductList.ihtm?"+getFromUrl();
	}
	function doEdit(id){
		var url="product_toProductEdit";
		parent.ShowIframeNoScroll("材料",url,900,400,"refreshProWin()",1024,640);//refreshProWin是父窗口的
	}
	function doDelete(id){
		parent.ShowConfirm('确认框','确定删除吗？',340,80,"doDelPro('"+id+"')");//doDelPro是父窗口的
	}
	function doDelAct(id){//是父窗口的doDelPro调用
		window.location="/base/ProductDelete.ihtm?id="+id+"&from_url="+encodeURIComponent(window.location);
	}
	function doMultiDelete(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要删除的材料',200,100);
		}else{
			doDelete(ids);
		}
	}
	function doSearch(){
		var typeId="";
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var searchAll="";
		if(document.getElementById("search_all").checked){
			searchAll="1";
		}
		window.location="/base/ProductList.ihtm?type_id="+typeId+"&search_key="+searchKey+"&search_all="+searchAll;
	}
	function doInit(){
		//Window_Onload();
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function DoubleClick(it){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		if(ob_arr.length>=it.getAttribute("index")){
			str=ob_arr[it.getAttribute("index")-1].value;
		}
		if(str==""){
			return;
		}
		doEdit(str);
	}
	function getMultiIds(){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		for (i=0;i<ob_arr.length;i++){
			if ((ob_arr[i].checked == true)){
				if(str!=""){
					str=str+";";
				}
				str = str+ob_arr[i].value;
			}
		}
		return str;
	}
	function doChangeType(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要改类别的材料',200,100);
		}else{
			var strFeatures = "dialogWidth:350px;dialogHeight:210px;scroll:no;center:yes;status:no";
			var url="/base/ProductChangeTypeForm.ihtm?id_str="+ids;
			parent.ShowIframeNoScroll("修改类别",url,340,210,"refreshProWin()");//refreshProWin是父窗口的
		}
	}
	function getFromUrl(){
		var searchKey=encodeURIComponent("");
		var str="type_id=&search_key="+searchKey+"&search_all=1";
		return str;
	}
	function doDownload(expoType){
		window.location="/base/ProductList.ihtm?content_type=EXCEL&expo_type="+expoType+"&"+getFromUrl();
	}
	function doUpload(){
		parent.ShowIframeNoScroll("导入Excel","/base/ProductUploadForm.ihtm",560,300,"doUploadCallBack()");//doUploadCallBack是父窗口的
	}
	function doUploadCallBackExt(fileName){
		document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("search_key"))+50+"px";
		document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("search_key"))+100+"px";
		document.getElementById("LoadProcess").style.display="";

		var url="/base/ProductImport.ihtm?file_name=" + encodeURIComponent(fileName);
		var xmlHttp=createXMLHttpRequest();
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = function(){
			if (xmlHttp.readyState == 4) {
	      		if (xmlHttp.status == 200) {
		      		window.location=window.location;
	      		}
	      	}
	    };
	    xmlHttp.send(null);
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" scroll="no" style="background: #EAFAFF;">
		<div id="scrollDiv" style="OVERFLOW:auto;height:508px">
		  <div class="main search-business">
			   <div class="cue-info">
					<h4>
						所有类别 - 材料
						
					</h4>				   	
			  </div>
			  <div class="content">
			  	<table width="100%">
			      <tbody>
			        <tr>
			          <td width="130">
			          	<input type="text" class="TextBox" style="width:120px" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以产品名称、产品名称拼音字头进行模糊查询">
					  </td>
			          <td style="text-align:right">
					  	<input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以产品名称、产品名称拼音字头进行模糊查询">		
						<input type="button" class="buttom search-add" value=" 新 增" onclick="doNew();">
						<input type="button" class="buttom search-remo" value="改类别" onclick="doChangeType();">
						<input type="button" class="buttom search-remo" value=" 删除" onclick="doMultiDelete();">
						<input type="button" class="buttom search-out" value=" 盘点表" onclick="doDownload(&#39;PD&#39;);">
						<input type="button" class="buttom search-out" value=" 导 出" onclick="doDownload(&#39;CL&#39;);">
					  </td>
			        </tr>
			        <tr>
			        	<td colspan="2">
			        		<input type="checkbox" id="search_all" name="search_all" checked="">在所有类别中查找材料
			        	</td>
			        </tr>
			      </tbody>
			    </table>
			  </div>			  
			  
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
			  <div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
						<table width="100%">
							<tbody><tr>
								<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
								<th width="15%">类别</th>
								<th width="13%">材料编号</th>
								<th width="24%">品名规格</th>
								<th width="10%">计量单位</th>
								<th width="20%">备注</th>
								<th width="18%">操作</th>
							</tr>
							
							
							
							
							<s:iterator value="products" status="indexs">
								<tr class="query_list_data_tr1" index="361" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
									<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="964"></td>
									<td>${productName }</td>
									<td>XZB-4060</td>
									<td>磁性写字板</td>
									<td>个</td>
									<td></td>
									<td>
										<a href="javascript:doEdit(&#39;964&#39;);">编辑</a>
										<a href="javascript:doDelete(&#39;964&#39;);">删除</a>
									</td>
								</tr>
							</s:iterator>
							
							
							</tbody>
							</table>
							</div>
							</div>
							</div>
							</body>
							</html>