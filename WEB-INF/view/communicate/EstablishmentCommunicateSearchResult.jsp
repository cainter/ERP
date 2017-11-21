<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0071)http://115.28.87.22:8888/base/EstablishmentCommunicateSearchResult.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>我的日程 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="js/Query.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillList.css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doNew(){
		var url="./EstablishmentCommunicateNew.html";
		ShowIframe("日程",url,980,440,"refreshWin(0)");
	}
	function refreshWin(flag){
		if(flag==1){
			if(popRetVal!=null){
				window.location.reload(true);
			}
		}else{
			window.location.reload(true);
		}
	}
	function showComm(id){
		var url="./EstablishmentCommunicateEdit.html?id="+id;
		ShowIframe("日程",url,980,440,"refreshWin(0)");
	}
	function createPageParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("end_date").value);
		
		var type="A";
		if(document.getElementById("type1").checked){
			type="LOG";
		}else if(document.getElementById("type2").checked){
			type="PLAN";
		}
		str=str+"&type="+type;
		
		var completed="A";
		if(document.getElementById("complete1").checked){
			completed="Y";
		}else if(document.getElementById("complete2").checked){
			completed="N";
		}
		str=str+"&completed="+completed;
		
		str=str+"&creater_id="+encodeURIComponent(document.getElementById("creater_id").value);
		str=str+"&creater_name="+encodeURIComponent(document.getElementById("creater_name").value);
		
		var fromType="A";
		if(document.getElementById("from_type1").checked){
			fromType="C";
		}else if(document.getElementById("from_type2").checked){
			fromType="J";
		}
		str=str+"&from_type="+fromType;
		
		return str;
	}
	
	function createProgramParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("hid_start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("hid_end_date").value);
		str=str+"&type=";
		str=str+"&completed=";
		str=str+"&creater_id=";
		str=str+"&creater_name="+encodeURIComponent(document.getElementById("hid_creater_name").value);
		str=str+"&from_type=";
		return str;
	}
	function doSearch(){
		var str;
		if(IsAdvSearch){//高级
			str="search_type=1";
			if(document.getElementById("cb_comm_date").checked){
				if(!checkDateStr(document.getElementById("start_date").value,"开始日期")){
					return;
				}
				if(!checkDateStr(document.getElementById("end_date").value,"结束日期")){
					return;
				}
				str=str+"&cb_comm_date=1";
			}
			if(document.getElementById("cb_type").checked){
				str=str+"&cb_type=1";
			}
			if(document.getElementById("cb_complete").checked){
				str=str+"&cb_complete=1";
			}
			
			if(document.getElementById("cb_creater").checked){
				var createrId=document.getElementById("creater_id").value;
				if(createrId==null || createrId=="" || createrId=="0"){
					ShowAlert('提示框','请选择创建人',200,100);
					return;
				}
				str=str+"&cb_creater=1";
			}
			if(document.getElementById("cb_from").checked){
				str=str+"&cb_from=1";
			}
		}else{//快速
			str="search_type=2";
			if(!checkDateStr(document.getElementById("start_date").value,"开始日期")){
				return;
			}
			if(!checkDateStr(document.getElementById("end_date").value,"结束日期")){
				return;
			}
		}
		var paraStr=createPageParaStr();
		if(paraStr!=""){
			str=str+"&"+paraStr;
		}
		window.location="/base/EstablishmentCommunicateSearchResult.ihtm?"+str;
	}
	function doGo(pageIndex){
		var str=getSearchCondition();
		str=str+"&current_page="+pageIndex;
		window.location="/base/EstablishmentCommunicateSearchResult.ihtm?"+str;
	}
	function getSearchCondition(){
		var searchType="2";
		var str="search_type="+searchType;
		if(searchType=="1"){//高级
			
			
			
			
			
		}else{//快速
			
		}
		var paraStr=createProgramParaStr();
		if(paraStr!=""){
			str=str+"&"+paraStr;
		}
		return str;
	}
	function doJump(pageIndex){
		if(window.event.keyCode==13){
			doGo(pageIndex);
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
		showComm(str);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		Window_Onload();
	}
	function checkInput(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doAutoCheck(objId){
		document.getElementById(objId).checked=true;
	}
	function selectCreaterName(){
		var url="/base/StafferMainForSelect.ihtm";
		ShowIframe("选择员工",url,800,500,"selectCreaterNameCallBack()");
	}
	function selectCreaterNameCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("creater_id").value=arr[0];
			document.getElementById("creater_name").value=arr[1];
			doAutoCheck("cb_creater");
		}
	}
	function setDate(type){
		var d=new Date();
		var startStr="";
		var endStr="";
		if(type=="CURRENT_MONTH"){
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-01";
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="PREVIEW_MONTH"){
			d=new Date(d.getFullYear(),d.getMonth(),1);
			d.setDate(d.getDate()-1);
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-1";
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="TODAY"){
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}else if(type=="YESTERDAY"){
			d.setDate(d.getDate()-1);
			startStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			endStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		}
		document.getElementById("start_date").value=startStr;
		document.getElementById("end_date").value=endStr;
		doAutoCheck("cb_comm_date");
	}
	function doDownload(){
		var str=getSearchCondition();
		window.location="/base/EstablishmentCommunicateSearchResult.ihtm?content_type=EXCEL&"+str;
	}
	function doComp(id){
		var url="/base/EstCommCompForm.ihtm?id="+id;
		ShowIframe("完成情况",url,600,300,"refreshWin(1)");
	}
</script>
</head>
<body oncontextmenu="return false">
<div class="Wrap"><!-- 页面主框架 -->
    
	<div id="ListContainer" class="Container" style="width: 984px;"><!-- 主体容器 -->
	    
	    <!-- 标题栏 -->
	    <div class="Heading BillIcon">
	        <div class="HeadingContent">
	            <h1>我的日程</h1>
	            <span class="Note">查看与管理自己的任务、日志，<span style="color:red">红色</span>字体表示他人分派的</span>
	        </div>
	    </div>
	
		<!-- 主内容 -->
		<div class="Content">
	        <!-- 筛选控件栏 -->
	        <div class="FilterBar ClearFix">
	            <div class="SearchIcon"></div>
	            <span class="fl">
	            	<table class="MoreOption" cellpadding="0" cellspacing="0">
	            		<tbody><tr><th class="c1" width="80px">
	            			<input type="checkbox" name="cb_comm_date" id="cb_comm_date" checked="true" style="visibility:hidden;">
	            			日期
	            		</th>
	            		<td width="360px">
	            			<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_comm_date&#39;);" id="start_date" name="start_date" value="2017-07-01">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;start_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_comm_date\&#39;)&#39;);">
			            	<input type="hidden" id="hid_start_date" value="2017-07-01">
			            	至
			            	<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_comm_date&#39;);" id="end_date" name="end_date" value="2017-07-05">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;end_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_comm_date\&#39;)&#39;);">
			            	<input type="hidden" id="hid_end_date" value="2017-07-05">
			            	<a href="javascript:setDate(&#39;CURRENT_MONTH&#39;);">本月</a>
							<a href="javascript:setDate(&#39;TODAY&#39;);">今天</a>
							<a href="javascript:setDate(&#39;YESTERDAY&#39;);">昨天</a>
							<a href="javascript:setDate(&#39;PREVIEW_MONTH&#39;);">上月</a>
	            		</td>
	            	</tr></tbody></table>
	            </span>
				<span class="fr">
	            	<a href="javascript:;" id="lnkMoreOption">更多查询选项</a>
		  			<input type="button" value=" 查 询" onclick="doSearch();" class="buttom search-but" id="sSearchButton" name="sSearchButton">
		  			<input type="button" value=" 新 增" onclick="doNew();" class="buttom search-add" id="sNewButton" name="sNewButton">
		  			<input type="button" value=" 导 出" class="buttom  search-out" onclick="doDownload();">
	            </span>
				<div id="dvMoreOptionBox" class="MoreOptionBox" style="display:none;">
					<table class="MoreOption" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<th class="c1" width="80px">
			        			<input type="checkbox" name="cb_type" id="cb_type">
			        			类型
			        		</th>
			    			<td class="c1" width="260px">
			        			<input type="radio" name="type" id="type1" onclick="doAutoCheck(&#39;cb_type&#39;);">日志
								<input type="radio" name="type" id="type2" onclick="doAutoCheck(&#39;cb_type&#39;);">任务
								<input type="radio" name="type" id="type3" onclick="doAutoCheck(&#39;cb_type&#39;);" checked="true">全部
			    			</td>
			    		</tr>
			    		<tr>
			    			<th class="c1">
			        			<input type="checkbox" name="cb_complete" id="cb_complete">
			        			进度
			        		</th>
			    			<td class="c1">
			        			<input type="radio" name="completed" id="complete1" onclick="doAutoCheck(&#39;cb_complete&#39;);">已完成
								<input type="radio" name="completed" id="complete2" onclick="doAutoCheck(&#39;cb_complete&#39;);" checked="true">进行中
			    			</td>
			    		</tr>
			    		<tr>
			    			<th class="c1">
			        			<input type="checkbox" name="cb_creater" id="cb_creater">
			        			创建人
			        		</th>
			    			<td class="c3">
			        			<input type="text" class="TextBox readonly" readonly="true" maxlength="15" name="creater_name" id="creater_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_creater&#39;);" value="">
								<img class="imgIconButton" src="images/make-a.gif" onclick="selectCreaterName();">
								<input type="hidden" id="hid_creater_name" value="">
								<input type="hidden" id="creater_id" value="">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th class="c1">
			        			<input type="checkbox" name="cb_from" id="cb_from">
			        			来源
			        		</th>
			    			<td class="c1">
			        			<input type="radio" name="from_type" id="from_type1" onclick="doAutoCheck(&#39;cb_from&#39;);">自己创建
								<input type="radio" name="from_type" id="from_type2" onclick="doAutoCheck(&#39;cb_from&#39;);">作为参与者
								<input type="radio" name="from_type" id="from_type3" onclick="doAutoCheck(&#39;cb_from&#39;);" checked="true">全部
			    			</td>
			    		</tr>
			    	</tbody></table>
					
					<div class="OptionOrderBy">
						<span class="fr"><a href="javascript:;" id="lnkHiddenOption">隐藏查询选项</a></span>
	                </div>
				</div>
			</div>
			
			<!-- 提示信息显示栏 -->
	        <div class="MsgBar">
	            
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
	        </div>

		    <div class="table-list">
		        <table width="100%">
					<tbody><tr>
						<th width="4%">类型</th>
						<th width="12%">日期</th>
						<th width="14%">主题</th>
						<th width="16%">内容</th>
						<th width="16%">客户</th>
						<th width="8%">创建人</th>
						<th width="6%">进度</th>
						<th width="16%">完成情况</th>
						<th width="8%">操作</th>
					</tr>
					<s:iterator value="myCommunicates" status="indexs">
						<tr>
							<td></td>
							<td>${communicateTime }</td>
							<td>${title }</td>
							<td>${content }</td>
							<td>${estId }</td>
							<td>${createrName }</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</s:iterator>
				</tbody></table>
			</div>

			<!-- 底栏 分页、操作等 -->
	        <div class="BottomToolBar ClearFix">
			    	
    <div class="table-bot">
    	
    	
    	 
    	  <img src="images/but001.gif">
    	  <img src="images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="0" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共0页
		
		
        <img src="images/but003.gif">
        <img src="images/but004.gif">
		
    </div>
	        </div>
			
		</div>
	</div>
</div>


<script type="text/javascript">
	function ChangeWindowSize( container, maxWidth ){
	    setTimeout( function(){
	        var w1 = document.documentElement.clientWidth-40;
	        if( w1>maxWidth ) w1 = maxWidth;
	        else if( w1<870 ) w1 = 860;
	        container.style.width = w1+'px';
	    }, 300 );
	}
	var IsAdvSearch = false;
	(function(){
		doInit();
	    var ListContainer = document.getElementById('ListContainer');
	    ChangeWindowSize( ListContainer, 2020 );    // 超过 1280 的最大 1260 ，不全部铺满
	
	    var lnkMoreOption   = document.getElementById('lnkMoreOption');
	    var lnkHiddenOption = document.getElementById('lnkHiddenOption');
	    lnkMoreOption.onclick = function(){
	    	IsAdvSearch = true;
	        document.getElementById('dvMoreOptionBox').style.display = 'block';
	        document.getElementById('cb_comm_date').style.visibility = 'visible';
	        this.style.visibility = 'hidden';
	    };
	    lnkHiddenOption.onclick = function(){
	    	IsAdvSearch = false;
	        document.getElementById('dvMoreOptionBox').style.display = 'none';
	        document.getElementById('cb_comm_date').style.visibility = 'hidden';
	        lnkMoreOption.style.visibility = 'visible';
	    };
	})();
</script>
<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>