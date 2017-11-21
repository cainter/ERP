<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)http://115.28.87.22:8888/bbs/BbsTopicList.ihtm?column_id=1 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>主题列表 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<!-- <script src="js/minierp.js"></script> -->

<link rel="stylesheet" type="text/css" href="css/base.css">
<!-- <script src="js/QueryList.js"></script> -->
<script language="javascript">
 	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		window.location="main_toBbsTopicList?column_id="+columnId+"&search_key="+searchKey;
	}
	function doNew(){
		window.location="./BbsArticleNew.html?column_id=1";
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="main_toBbsTopicList?column_id="+columnId+"&search_key="+searchKey+"&current_page="+pageIndex;
	}
	function doJump(pageIndex){
		if(window.event.keyCode==13){
			doGo(pageIndex);
		}
	}
	function doInit(){
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doMultiDelete(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要删除的公告!',200,100);
		}else{
			parent.ShowConfirm('确认框','确定删除吗？',340,80,"doDelTopic('"+ids+"')");//doDelTopic是父窗口的
		}
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
	function doDeleteAct(id){
		window.location="/bbs/BbsTopicDelete.ihtm?id="+id+"&from_url="+encodeURIComponent(window.location);
	}
	function doChangeColumn(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要改栏目的公告',200,100);
		}else{
			var strFeatures = "dialogWidth:350px;dialogHeight:210px;scroll:no;center:yes;status:no";
			var url="/bbs/ChangeColumnForm.ihtm?id_str="+ids;
			parent.ShowIframeNoScroll("修改栏目",url,340,210,"refreshArtWin()");//refreshArtWin是父窗口的
		}
	} 
	function refreshWin(){//父窗口调用
		window.location.reload(true);
	} 
</script>
</head>
<body scroll="no" style="background: #EAFAFF;">
	<div id="scrollDiv" style="OVERFLOW:auto;height:468px;">
		<div class="main search-business">
			   <div class="cue-info">
					<h4>
						内部公告
					</h4>				   	
			  </div>
			  <div class="add_content">		
	        	<div align="right">								  		             	
						<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以主题、发件人进行模糊查询">
						<input type="button" class="buttom  search-but" value=" 查 询 " onclick="doSearch();" title="以主题、发件人进行模糊查询">
						
						<input type="button" class="buttom  search-add" value=" 发 表" onclick="doNew();">
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

			  <div class="table-list" style="width:95%; padding:15px 0 15px 10px; float:left;">
				  <table width="100%">
				      <tbody><tr>
				      	
				        <th width="36%">主题</th>
				        <th width="12%">作者</th>
				        <th width="18%">发表时间</th>
				        <th width="10%">回复/浏览</th>
						<th width="24%">最后回复</th>
				      </tr>
					  
					  		<!--迭代获得从后台传过来的数据  -->
							<s:iterator value="bbsArticle" status="indexs">
							<tr>
								<td><input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="61" style="display:none" checked="checked" type="radio"></td>
									<td>${title }</td>
									<td>${createrId }</td>
									<td>${createTime }</td>
									<td>${replierName }</td>
									<td>${lastTime }</td>
							</tr>
							</s:iterator>
					  
				      <!-- <tr>
				      	
				        <td>
							<a href="http://115.28.87.22:8888/bbs/BbsReplyList.ihtm?topic_id=6&amp;column_id=1">123</a>
							
						</td>
				        <td>邵丽萍</td>
				        <td>2017-06-29 09:54</td>
				        <td>0/5</td>
						<td class="ListTd">
							
						</td>
				      </tr> -->
					  
		        </tbody></table>
					  	
    <div class="table-bot">
    	
    	
    	 
    	  <img src="images/but001.gif">
    	  <img src="images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="1" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共1页
		
		
        <img src="images/but003.gif">
        <img src="images/but004.gif">
		
    </div>   
			  </div>
			</div>
		</div>



<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>