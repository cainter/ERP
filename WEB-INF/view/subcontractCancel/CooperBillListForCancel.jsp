<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0060)http://115.28.87.22:8888cooper/CooperBillListForCancel.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>外协单作废 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="css/Query.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillList.css">
<script src="js/QueryList.js"></script>
<script src="js/jquery.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doShow(id){
		var url="cooper/CooperBillInfoForCancel.html?id="+id;
		ShowIframe("外协单作废",url,900,500,"refreshWin()",900,600);
	}
	function refreshWin(){
		if(popRetVal!=null){
			window.location=window.location;
		}
	}
	function doDisabled(id,type){
		var url="system/CancelReasonNew.html";
		ShowIframe("外协单作废",url,600,260,"doDisabledCallback('"+id+"','"+type+"')");
	}
	function doDisabledCallback(id,type){
		if(popRetVal!=null){
			$.post("cooper/CooperBillCancel.html",{id:id,reason:popRetVal,type:type,show_aler:"Y"},function(data,status){
				parseDisaData(data,status);
			});
		}
	}
	function parseDisaData(data,status){
		if(status=="success"){
			window.location=window.location;
		}else{
			ShowAlert('提示框','系统错误：'+status,200,100);
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
		doShow(str);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		
	}
	function createPageParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("end_date").value);
		str=str+"&manager_name="+encodeURIComponent(document.getElementById("manager_name").value);
		str=str+"&est_name="+encodeURIComponent(document.getElementById("est_name").value);
		str=str+"&bill_code="+encodeURIComponent(document.getElementById("bill_code").value);
		str=str+"&department="+document.getElementById("department").value;
		str=str+"&min_cost="+encodeURIComponent(document.getElementById("min_cost").value.trim());
		str=str+"&max_cost="+encodeURIComponent(document.getElementById("max_cost").value.trim());
		str=str+"&ts_id="+document.getElementById("ts_id").value;
		
		var exam="A";
		if(document.getElementById("exam1").checked){
			exam="Y";
		}else if(document.getElementById("exam2").checked){
			exam="N";
		}
		str=str+"&exam="+exam;
		
		return str;
	}
	
	function createProgramParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("hid_start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("hid_end_date").value);
		str=str+"&manager_name="+encodeURIComponent(document.getElementById("hid_manager_name").value);
		str=str+"&est_name="+encodeURIComponent(document.getElementById("hid_est_name").value);
		str=str+"&bill_code="+encodeURIComponent(document.getElementById("hid_bill_code").value);
		str=str+"&department=";
		str=str+"&min_cost="+encodeURIComponent(document.getElementById("hid_min_cost").value);
		str=str+"&max_cost="+encodeURIComponent(document.getElementById("hid_max_cost").value);
		str=str+"&ts_id=2";
		str=str+"&exam=";
		return str;
	}
	function doSearch(){
		var str;
		if(IsAdvSearch){//高级
			str="search_type=1";
			if(document.getElementById("cb_cooper_date").checked){
				if(!checkDateStr(document.getElementById("start_date").value,"开始日期")){
					return;
				}
				if(!checkDateStr(document.getElementById("end_date").value,"结束日期")){
					return;
				}
				str=str+"&cb_cooper_date=1";
			}
			if(document.getElementById("cb_manager").checked){
				var managerName=document.getElementById("manager_name").value.trim();
				if(managerName==null || managerName==""){
					ShowAlert('提示框','请输入业务员姓名',200,100);
					return;
				}
				str=str+"&cb_manager=1";
			}
			if(document.getElementById("cb_est").checked){
				var estName=document.getElementById("est_name").value.trim();
				if(estName==null || estName==""){
					ShowAlert('提示框','请输入外协单位',200,100);
					return;
				}
				str=str+"&cb_est=1";
			}
			if(document.getElementById("cb_bill_code").checked){
				var billCode=document.getElementById("bill_code").value.trim();
				if(billCode==null || billCode==""){
					ShowAlert('提示框','请输入外协单号',200,100);
					return;
				}
				str=str+"&cb_bill_code=1";
			}
			if(document.getElementById("cb_dep").checked){
				var department=document.getElementById("department").value;
				if(department==null || department=="" || department=="0"){
					ShowAlert('提示框','请选择部门',200,100);
					return;
				}
				str=str+"&cb_dep=1";
			}
			if(document.getElementById("cb_cost").checked){
				var minCost=document.getElementById("min_cost").value.trim();
				if(minCost==null || minCost==""){
					ShowAlert('提示框','请输入最小金额',200,100);
					return;
				}else if(isNaN(minCost)){
					ShowAlert('提示框','最小金额只能是数字',200,100);
					return;
				}
				var maxCost=document.getElementById("max_cost").value.trim();
				if(maxCost==null || maxCost==""){
					ShowAlert('提示框','请输入最大金额',200,100);
					return;
				}else if(isNaN(maxCost)){
					ShowAlert('提示框','最大金额只能是数字',200,100);
					return;
				}
				str=str+"&cb_cost=1";
			}
			if(document.getElementById("cb_ts").checked){
				var tsId=document.getElementById("ts_id").value;
				if(tsId==null || tsId=="" || tsId=="0"){
					ShowAlert('提示框','请选择帐套',200,100);
					return;
				}
				str=str+"&cb_ts=1";
			}
			if(document.getElementById("cb_exam").checked){
				str=str+"&cb_exam=1";
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
		window.location="subcontract_cooperBillListForCancel?select.beginDate=2015&select.endDate=2018&select.tallySetId=1";
	}
	function doGo(pageIndex){
		var str=getSearchCondition();
		str=str+"&current_page="+pageIndex;
		window.location="cooper/CooperBillListForCancel.html?"+str;
	}
	function getSearchCondition(){
		var searchType="1";
		var str="search_type="+searchType;
		if(searchType=="1"){//高级
			str=str+"&cb_cooper_date=1";
			str=str+"&cb_ts=1";
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
	function checkInput(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doAutoCheck(objId){
		document.getElementById(objId).checked=true;
	}
	function showRelBill(id,code){
		showWin(900,600,"cooper/CooperRelBillCancel.html?id="+id+"&code="+code);
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
		doAutoCheck("cb_cooper_date");
	}
	function selectEstName(){
		var url="base/EstablishmentListForSelect.html?type=COOPERATOR";
		ShowIframe("选择外协商",url,900,500,"selectEstNameCallBack()",900,600);
	}
	function selectEstNameCallBack(){
		if(popRetVal!=null){
			document.getElementById("est_name").value=popRetVal[1];
			doAutoCheck("cb_est");
		}
	}
	function doMutiCanc(){
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
		if(str!=""){
			doDisabled(str,"MULT");
		}else{
			ShowAlert('提示框','请选择要作废的单据',200,100);
		}
	}
</script>
</head>
<body oncontextmenu="return false">
<div class="Wrap"><!-- 页面主框架 -->
    
	<div id="ListContainer" class="Container" style="width: 860px;"><!-- 主体容器 -->
	    
	    <!-- 标题栏 -->
	    <div class="Heading BillIcon">
	        <div class="HeadingContent">
	            <h1>外协单作废</h1>
	            <span class="Note">作废之前必须先进入该外协单的关联单据，作废相关的付款单、收货单、调账单。未审核的外协单允许成批选择作废。</span>
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
	            			<input type="checkbox" name="cb_cooper_date" id="cb_cooper_date" checked="true" style="visibility:hidden;">
	            			外协日期
	            		</th>
	            		<td width="360px">
	            			<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_cooper_date&#39;);" id="start_date" name="selectVO.beginDate" value="2017-07-01">
							<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;start_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_cooper_date\&#39;)&#39;);">
							<input type="hidden" id="hid_start_date" value="2017-07-01">
							至
							<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_cooper_date&#39;);" id="end_date" name="selectVO.endDate" value="2017-07-08">
							<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;end_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_cooper_date\&#39;)&#39;);">
							<input type="hidden" id="hid_end_date" value="2017-07-08">
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
		  			<input type="button" class="buttom  search-audit" value=" 作废" onclick="doMutiCanc();">
	            </span>
				<div id="dvMoreOptionBox" class="MoreOptionBox" style="display:none;">
					<table class="MoreOption" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<th class="c1" width="80px">
			        			<input type="checkbox" name="cooperatorId" id="cb_est">
			        			外协单位
			        		</th>
			    			<td class="c1" width="260px">
			        			<input type="text" class="TextBox" maxlength="50" name="selectVO.cooperatorId" id="est_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_est&#39;);" value="">
								<img class="imgIconButton" src="images/make-a.gif" onclick="selectEstName();">
								<input type="hidden" id="hid_est_name" value="">
			    			</td>
			    			<th class="c2" width="80px">
			        			<input type="checkbox" name="managerName" id="cb_manager">
			        			业务员
			        		</th>
			    			<td class="c3" width="280px">
			        			<input type="text" class="TextBox" maxlength="15" name="selectVO.managerName" id="manager_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_manager&#39;);" value="">
								<input type="hidden" id="hid_manager_name" value="">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th class="c1">
			        			<input type="checkbox" name="selectVO.billCode" id="cb_bill_code">
			        			外协单号
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="50" name="bill_code" id="bill_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_bill_code&#39;);" value="">
								<input type="hidden" id="hid_bill_code" value="">
			    			</td>
							<th class="c2">
			        			<input type="checkbox" name="" id="cb_dep">
			        			部门
			        		</th>
			    			<td class="c3">
			        			<select name="department" id="selectVO.departmentId" onfocus="doAutoCheck(&#39;cb_dep&#39;);">
					  				<option value="0">==请选择==</option>
					  				
<option value="1">易凯管理员</option>
<option value="13">总经办</option>
<option value="22">&nbsp;|--财务</option>
<option value="14">新异店</option>
<option value="15">&nbsp;|--客服</option>
<option value="23">&nbsp;|--设计</option>
<option value="24">&nbsp;|--业务</option>
<option value="16">业务来源</option>
<option value="17">标识加工车间</option>
<option value="21">合作伙伴</option>
<option value="32">标识汇运营部</option>
<option value="33">财务部</option>
				  				</select>
			    			</td>
						</tr>
						<tr>
							<th class="c1">
								<input type="checkbox" name="cb_cost" id="cb_cost">
								外协金额
							</th>
	                    	<td>
	                    		<input type="text" class="TextBox Money" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_cost&#39;);" id="min_cost" name="selectVO.beginCost" value="">
								至
								<input type="text" class="TextBox Money" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_cost&#39;);" id="max_cost" name="selectVO.endCost" value="">
								<input type="hidden" id="hid_min_cost" value="">
								<input type="hidden" id="hid_max_cost" value="">
	                    	</td>
							<th class="c2">
			        			<input type="checkbox" name="cb_exam" id="cb_exam">
	                        	审核状态
			        		</th>
			    			<td class="c3">
			        			<input type="radio" name="exam" id="exam1" onclick="doAutoCheck(&#39;cb_exam&#39;);" checked="true">已审核
	                        	<input type="radio" name="exam" id="exam2" onclick="doAutoCheck(&#39;cb_exam&#39;);">未审核
	                        	<input type="radio" name="exam" id="exam3" onclick="doAutoCheck(&#39;cb_exam&#39;);">全部
			        		</td>
						</tr>
						<tr>
							<th class="c1">
								<input type="checkbox" name="cb_ts" id="cb_ts" checked="true">
	                        	账套
							</th>
	                    	<td>
	                    		<select name="selectVO.tallySetId" id="ts_id" onfocus="doAutoCheck(&#39;cb_ts&#39;);">
				    				<option value="0">==请选择账套==</option>
				    				
									<option value="1">新异</option>
									<option value="2" selected="">网络公司</option>
								</select>
	                    	</td>
							<th class="c2">&nbsp;</th>
			    			<td class="c3">&nbsp;</td>
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
					<tbody>
					<tr>
						<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
						<th width="14%">单号</th>
						<th width="10%">外协日期</th>
						<th width="18%">外协单位</th>
						<th width="14%">摘要</th>
						<th width="10%">交货日期</th>
						<th width="10%">业务员</th>
						<th width="8%">状态</th>
						<th width="16%">操作</th>
					</tr>
					<s:iterator value="cooperBills" status="indexs" >
						<tr>
						<th></th>
						<th>${billCode}</th>
						<th>${cooperDate }</th>
						<th>${cooperatorId }</th>
						<th>${content }</th>
						<th>${gatherDate}</th>
						<th>${managerName }</th>
						<th>已审核</th>
						<th> <a>作废 </a>	<a>查看 </a>	<a>关联单据</a> </th>
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
	        document.getElementById('cb_cooper_date').style.visibility = 'visible';
	        this.style.visibility = 'hidden';
	    };
	    lnkHiddenOption.onclick = function(){
	    	IsAdvSearch = false;
	        document.getElementById('dvMoreOptionBox').style.display = 'none';
	        document.getElementById('cb_cooper_date').style.visibility = 'hidden';
	        lnkMoreOption.style.visibility = 'visible';
	    };
	})();
</script>
</body></html>