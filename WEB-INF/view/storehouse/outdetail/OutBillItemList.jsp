<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0056)http://115.28.87.22:8888/storehouse/OutBillItemList.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>出库明细一览表 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/Query.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillList.css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doShow(code){
		showWin(1024,600,"/business/BusinessBillInfo.ihtm?code="+encodeURIComponent(code));
	}
	function createPageParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("end_date").value);
		
		var exam="A";
		if(document.getElementById("exam1").checked){
			exam="Y";
		}else if(document.getElementById("exam2").checked){
			exam="N";
		}
		str=str+"&exam="+exam;
		
		str=str+"&ot_id="+document.getElementById("ot_id").value;
		str=str+"&bill_code="+encodeURIComponent(document.getElementById("bill_code").value);
		str=str+"&mng_name="+encodeURIComponent(document.getElementById("mng_name").value);
		str=str+"&requ_type="+document.getElementById("requ_type").value;
		str=str+"&requ_name="+encodeURIComponent(document.getElementById("requ_name").value);
		str=str+"&bb_code="+encodeURIComponent(document.getElementById("bb_code").value);
		str=str+"&sto_id="+document.getElementById("sto_id").value;
		str=str+"&mark="+encodeURIComponent(document.getElementById("mark").value);
		str=str+"&ts_id="+document.getElementById("ts_id").value;
		str=str+"&pt_id="+document.getElementById("pt_id").value;
		str=str+"&pro_id="+document.getElementById("pro_id").value;
		str=str+"&pro_name="+encodeURIComponent(document.getElementById("pro_name").value);
		str=str+"&pro_code="+encodeURIComponent(document.getElementById("pro_code").value);
		
		return str;
	}
	
	function createProgramParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("hid_start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("hid_end_date").value);
		str=str+"&exam=";
		str=str+"&ot_id=";
		str=str+"&bill_code="+encodeURIComponent(document.getElementById("hid_bill_code").value);
		str=str+"&mng_name="+encodeURIComponent(document.getElementById("hid_mng_name").value);
		str=str+"&requ_type=";
		str=str+"&requ_name="+encodeURIComponent(document.getElementById("hid_requ_name").value);
		str=str+"&bb_code="+encodeURIComponent(document.getElementById("hid_bb_code").value);
		str=str+"&mark="+encodeURIComponent(document.getElementById("hid_mark").value);
		str=str+"&sto_id=";
		str=str+"&ts_id=1";
		str=str+"&pt_id=";
		str=str+"&pro_id=";
		str=str+"&pro_name="+encodeURIComponent(document.getElementById("hid_pro_name").value);
		str=str+"&pro_code="+encodeURIComponent(document.getElementById("hid_pro_code").value);
		
		return str;
	}
	function doSearch(){
		var str;
		if(IsAdvSearch){//高级
			str="search_type=1";
			if(document.getElementById("cb_out_date").checked){
				if(!checkDateStr(document.getElementById("start_date").value,"开始日期")){
					return;
				}
				if(!checkDateStr(document.getElementById("end_date").value,"结束日期")){
					return;
				}
				str=str+"&cb_out_date=1";
			}
			if(document.getElementById("cb_exam").checked){
				str=str+"&cb_exam=1";
			}
			if(document.getElementById("cb_ot").checked){
				var otId=document.getElementById("ot_id").value;
				if(otId==null || otId=="" || otId=="0"){
					ShowAlert('提示框','请选择出库类型',200,100);
					return;
				}
				str=str+"&cb_ot=1";
			}
			if(document.getElementById("cb_pt").checked){
				var ptId=document.getElementById("pt_id").value;
				if(ptId==null || ptId=="" || ptId=="0"){
					ShowAlert('提示框','请选择材料类别',200,100);
					return;
				}
				str=str+"&cb_pt=1&pt_id="+ptId;
			}
			if(document.getElementById("cb_pro_code").checked){
				var proCode=document.getElementById("pro_code").value;
				if(proCode==null || proCode==""){
					ShowAlert('提示框','请输入材料编号',200,100);
					return;
				}
				str=str+"&cb_pro_code=1";
			}
			if(document.getElementById("cb_pro_name").checked){
				var proName=document.getElementById("pro_name").value;
				if(proName==null || proName==""){
					ShowAlert('提示框','请输入品名规格',200,100);
					return;
				}
				str=str+"&cb_pro_name=1";
			}
			if(document.getElementById("cb_bill_code").checked){
				var billCode=document.getElementById("bill_code").value.trim();
				if(billCode==null || billCode==""){
					ShowAlert('提示框','请输入单号',200,100);
					return;
				}
				str=str+"&cb_bill_code=1";
			}
			if(document.getElementById("cb_mng").checked){
				var mngName=document.getElementById("mng_name").value.trim();
				if(mngName==null || mngName==""){
					ShowAlert('提示框','请输入经办人姓名',200,100);
					return;
				}
				str=str+"&cb_mng=1";
			}
			if(document.getElementById("cb_requ").checked){
				str=str+"&cb_requ=1";
			}
			if(document.getElementById("cb_bb_code").checked){
				var bbCode=document.getElementById("bb_code").value.trim();
				if(bbCode==null || bbCode==""){
					ShowAlert('提示框','请输入业务单号',200,100);
					return;
				}
				str=str+"&cb_bb_code=1";
			}
			if(document.getElementById("cb_sto").checked){
				var stoId=document.getElementById("sto_id").value;
				if(stoId==null || stoId=="" || stoId=="0"){
					ShowAlert('提示框','请选择仓库',200,100);
					return;
				}
				str=str+"&cb_sto=1";
			}
			if(document.getElementById("cb_ts").checked){
				var tsId=document.getElementById("ts_id").value;
				if(tsId==null || tsId=="" || tsId=="0"){
					ShowAlert('提示框','请选择帐套',200,100);
					return;
				}
				str=str+"&cb_ts=1";
			}
			if(document.getElementById("cb_mark").checked){
				var mark=document.getElementById("mark").value.trim();
				if(mark==null || mark==""){
					ShowAlert('提示框','请输入备注',200,100);
					return;
				}
				str=str+"&cb_mark=1";
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
		window.location="outStorehouse_toOutBillList?"+str;
	}
	
	function doGo(pageIndex){
		var str=getSearchCondition();
		str=str+"&current_page="+pageIndex;
		window.location="outStorehouse_toOutBillList?"+str;
	}
	function getSearchCondition(){
		var searchType="1";
		var str="search_type="+searchType;
		if(searchType=="1"){//高级
			str=str+"&cb_out_date=1";
			
			
			
			
			
			
			
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
	function DoubleClick(it){
		
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
		doAutoCheck("cb_out_date");
	}
	function changeReqType(){
		if(document.getElementById("requ_type").value=="NOT_STO"){
			document.getElementById("requ_name").style.visibility="hidden";
		}else{
			document.getElementById("requ_name").style.visibility="visible";
		}
	}
	function doDownload(){
		var str=getSearchCondition();
		window.location="outStorehouse_toOutBillList?content_type=EXCEL&"+str;
	}
	function selectProduct(){
		var url="/base/ProductMainForSelect.ihtm";
		ShowIframe("选择材料",url,900,500,"selectProductCallBack()",1024,600);
	}
	function selectProductCallBack(){
		if(popRetVal!=null){
			document.getElementById("pro_id").value=popRetVal[0];
			document.getElementById("pro_name").value=popRetVal[2];
			doAutoCheck("cb_pro_name");
		}
	}
</script>
</head>


<body>
<div class="Wrap"><!-- 页面主框架 -->
    
	<div id="ListContainer" class="Container" style="width: 1240px;"><!-- 主体容器 -->
	    
	    <!-- 标题栏 -->
	    <div class="Heading BillIcon">
	        <div class="HeadingContent">
	            <h1>出库明细一览表</h1>
	            <span class="Note">查询当期发生的材料出库</span>
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
	            			<input type="checkbox" name="cb_out_date" id="cb_out_date" checked="true" style="visibility:hidden;">
	            			出库日期
	            		</th>
	            		<td width="360px">
	            			<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_out_date&#39;);" id="start_date" name="start_date" value="2017-07-01">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;start_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_out_date\&#39;)&#39;);">
			            	<input type="hidden" id="hid_start_date" value="2017-07-01">
			            	至
			            	<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_out_date&#39;);" id="end_date" name="end_date" value="2017-07-09">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;end_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_out_date\&#39;)&#39;);">
			            	<input type="hidden" id="hid_end_date" value="2017-07-09">
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
		  			<input type="button" value=" 导 出" onclick="doDownload();" class="buttom search-out" id="sDownloadButton" name="sDownloadButton">
	            </span>
				<div id="dvMoreOptionBox" class="MoreOptionBox" style="display:none;">
					<table class="MoreOption" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<th class="c1" width="80px">
			        			<input type="checkbox" name="cb_requ" id="cb_requ">
			        			需方单位
			        		</th>
			        		<td class="c1" width="240px">
			        			<select style="width:78px" name="requ_type" id="requ_type" onfocus="doAutoCheck(&#39;cb_requ&#39;);" onchange="changeReqType();">
								  	<option value="WORK_CENTER">工作中心</option>
									<option value="DEPARTMENT">部门</option>
									<option value="CLIENT">客户</option>
									<option value="STOREHOUSE">仓库</option>
									<option value="PROVIDER">供应商</option>
									<option value="COOPERATOR">外协商</option>
									<option value="NOT_STO">仓库除外</option>
							  	</select>
							  	<input type="text" class="TextBox" style="width:116px;" maxlength="50" name="requ_name" id="requ_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_requ&#39;);" value="">
							  	<input type="hidden" id="hid_requ_name" value="">
			    			</td>
			    			<th class="c2" width="80px">
	                        	<input type="checkbox" name="cb_exam" id="cb_exam">
	                        	审核状态
	                        </th>
	                    	<td class="c2" width="250px">
	                        	<input type="radio" name="exam" id="exam1" onclick="doAutoCheck(&#39;cb_exam&#39;);" checked="true">已审核
	                        	<input type="radio" name="exam" id="exam2" onclick="doAutoCheck(&#39;cb_exam&#39;);">未审核
	                        	<input type="radio" name="exam" id="exam3" onclick="doAutoCheck(&#39;cb_exam&#39;);">全部
	                    	</td>
			    		</tr>
						<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_bill_code" id="cb_bill_code">
			        			出库单号
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="50" name="bill_code" id="bill_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_bill_code&#39;);" value="">
								<input type="hidden" id="hid_bill_code" value="">
			    			</td>
			    			<th class="c2">
			        			<input type="checkbox" name="cb_ot" id="cb_ot">
			        			出库类型
			        		</th>
			    			<td class="c3">
			        			<select name="ot_id" id="ot_id" onfocus="doAutoCheck(&#39;cb_ot&#39;);">
					  				<option value="0">==请选择==</option>
					  				
					  				<option value="1">销售出库</option>
					  				
					  				<option value="2">内部调拨</option>
					  				
					  				<option value="3">盘亏出库</option>
					  				
					  				<option value="4">加工制作</option>
					  				
					  				<option value="5">低值易耗品</option>
					  				
				  				</select>
			    			</td>
			    		</tr>
						<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_bb_code" id="cb_bb_code">
			        			业务单号
			        		</th>
			    			<td class="c1">
			        			<input type="text" class="TextBox" maxlength="50" name="bb_code" id="bb_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_bb_code&#39;);" value="">
								<input type="hidden" id="hid_bb_code" value="">
			    			</td>
							<th class="c2">
			        			<input type="checkbox" name="cb_sto" id="cb_sto">
			        			仓库
			        		</th>
			    			<td class="c3">
			        			<select name="sto_id" id="sto_id" onfocus="doAutoCheck(&#39;cb_sto&#39;);">
					  				<option value="0">==请选择==</option>
					  				
					  				<option value="1">标识加工仓库</option>
					  				
					  				<option value="2">中力门店仓库</option>
					  				
					  				<option value="3">车间型材仓库</option>
					  				
					  				<option value="4">车间耗材仓库</option>
					  				
					  				<option value="5">车间工具仓库</option>
					  				
					  				<option value="6">你好，仓库</option>
					  				
				  				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th class="c1">
			        			<input type="checkbox" name="cb_mng" id="cb_mng">
			        			经办人
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="15" name="mng_name" id="mng_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_mng&#39;);" value="">
								<input type="hidden" id="hid_mng_name" value="">
			    			</td>
	                    	<th class="c2">
			        			<input type="checkbox" name="cb_pt" id="cb_pt">
			        			材料类别
			        		</th>
			        		<td class="c3">
			        			<select name="pt_id" id="pt_id" onfocus="doAutoCheck(&#39;cb_pt&#39;);">
					  				<option value="0">==请选择==</option>
					  				
<option value="72">01喷绘材料</option>
<option value="73">02写真材料</option>
<option value="74">03辅助材料</option>
<option value="93">06展示器材</option>
<option value="94">07光电产品</option>
<option value="42">板材类</option>
<option value="83">玻璃镜子</option>
<option value="69">标牌配件</option>
<option value="88">扁铁圆钢</option>
<option value="89">不锈钢方管</option>
<option value="90">不锈钢矩管</option>
<option value="91">不锈钢圆管</option>
<option value="64">成品标牌</option>
<option value="82">磁性板</option>
<option value="84">镀锌方管</option>
<option value="85">镀锌矩管</option>
<option value="86">镀锌圆管</option>
<option value="45">低值易耗品</option>
<option value="80">钢板材类</option>
<option value="92">钢材辅料类</option>
<option value="70">管材类</option>
<option value="79">工程用板</option>
<option value="65">光电产品</option>
<option value="87">角钢槽钢</option>
<option value="75">KT板类</option>
<option value="27">铝型材</option>
<option value="81">木板类</option>
<option value="95">每月定时出库材料</option>
<option value="77">PVC雪弗板</option>
<option value="78">有机板</option>
<option value="76">亚克力板</option>
<option value="44">油漆类</option>
				  				</select>
			    			</td>
	                	</tr>
	                	<tr>
	                    	<th class="c1">
			        			<input type="checkbox" name="cb_mark" id="cb_mark">
			        			备注
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="15" name="mark" id="mark" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_mark&#39;);" value="">
								<input type="hidden" id="hid_mark" value="">
			    			</td>
			    			<th class="c2">
			        			<input type="checkbox" name="cb_pro_code" id="cb_pro_code">
			        			材料编号
			        		</th>
			    			<td class="c3">
			        			<input type="text" class="TextBox" maxlength="50" name="pro_code" id="pro_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_pro_code&#39;);" value="">
								<input type="hidden" id="hid_pro_code" value="">
			    			</td>
			    		</tr>
			    		<tr>
			        		<th class="c1">
			        			<input type="checkbox" name="cb_ts" id="cb_ts" checked="true">
	                        	账套
			        		</th>
			    			<td class="c1">
			        			<select name="ts_id" id="ts_id" onfocus="doAutoCheck(&#39;cb_ts&#39;);">
				    				<option value="0">==请选择账套==</option>
				    				
									<option value="1" selected="">新异</option>
									<option value="2">网络公司</option>
								</select>
			        		</td>
			        		<th class="c2">
			        			<input type="checkbox" name="cb_pro_name" id="cb_pro_name">
			        			品名规格
			        		</th>
			    			<td class="c3">
			        			<input type="text" class="TextBox" maxlength="50" name="pro_name" id="pro_name" onkeyup="document.getElementById(&#39;pro_id&#39;).value=&#39;0&#39;;checkInput();" onfocus="doAutoCheck(&#39;cb_pro_name&#39;);" value="" onchange="document.getElementById(&#39;pro_id&#39;).value=&#39;0&#39;;">
			  					<img class="imgIconButton" src="images/make-a.gif" onclick="selectProduct();">
								<input type="hidden" name="pro_id" id="pro_id" value="">
								<input type="hidden" id="hid_pro_name" value="">
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
			
			<div class="TopToolBar">
				<table class="ListNoteInfo" cellpadding="0" cellspacing="0">
	            	<tbody><tr>
	                	<td>
	                		金额合计：0元&nbsp;&nbsp;
	                		数量合计：0
	                	</td>
	            	</tr>
	            </tbody></table>
			</div>
			
     		<div class="table-list">
		        <table width="100%">
		          	<tbody><tr>
						<th width="10%">单号</th>
						<th width="8%">出库日期</th>
						<th width="8%">仓库</th>
						<th width="10%">业务单号</th>
						<th width="10%">客户</th>
						<th width="8%">备注</th>
						<th width="6%">经办人</th>
						<th width="8%">材料编号</th>
						<th width="8%">品名规格</th>
						<th width="6%">单位</th>
						<th width="6%">数量</th>
						<th width="6%">单价</th>
						<th width="6%">金额</th>
					</tr>
				 <!-- 前台迭代获得后台从数据库传过来的值 -->
				<s:iterator value="outBills" status="outBills">
				<tr>
					<td>${billCode }</td>
					<td>${outDate }</td>
					<td>
					   <s:iterator value="storehouses" status="storehouses">
					   		<c:if test="${storehouseId == id }">${stoName }</c:if>
					   </s:iterator>
					</td>
					<td>${businessBillCode }</td>
					<td></td>
					<td>${mark }</td>
					<td>${managerName }</td>
					<td>
						<s:iterator value="outItems" status="outItems">
					   	<c:if test="${billId == id }">${productId }</c:if>
					   </s:iterator>
					</td>
					<td></td>
					<td>
					    <s:iterator value="outItems" status="outItems">
					   	<c:if test="${billId == id }">${productId }</c:if>
					    </s:iterator>
					</td>
					<td>
						<s:iterator value="outItems" status="outItems">
					   	<c:if test="${billId == id }">${amount }</c:if>
					   </s:iterator>
					</td>
					<td>
						<s:iterator value="outItems" status="outItems">
					   	<c:if test="${billId == id }">${unitPrice }</c:if>
					   </s:iterator>
					</td>
					<td>
						<s:iterator value="outItems" status="outItems">
					   	<c:if test="${billId == id }">${cost }</c:if>
					   </s:iterator>
					</td>

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
	        else if( w1<970 ) w1 = 960;
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
	        document.getElementById('cb_out_date').style.visibility = 'visible';
	        this.style.visibility = 'hidden';
	    };
	    lnkHiddenOption.onclick = function(){
	    	IsAdvSearch = false;
	        document.getElementById('dvMoreOptionBox').style.display = 'none';
	        document.getElementById('cb_out_date').style.visibility = 'hidden';
	        lnkMoreOption.style.visibility = 'visible';
	    };
	})();
</script>
<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>