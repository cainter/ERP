<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>收发存明细表 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="js/minierp.js"></script>
<link href="css/Query.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillList.css">
<script src="js/QueryList.js"></script>

<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doShow(billId,billType){
		var url;
		if(billType=='IN_BILL'){
			url="/storehouse/InBillEdit.ihtm?id="+billId;
		}else if(billType=='OUT_BILL'){
			url="/storehouse/OutBillEdit.ihtm?id="+billId;
		}else if(billType=="ALLO_BILL"){
			url="/storehouse/AlloBillEdit.ihtm?id="+billId;
		}else if(billType=="PURC_BILL"){
			url="/purchase/PurchaseBillEdit.ihtm?id="+billId;
		}else{
			return;
		}
		ShowIframe("查看",url,1024,500,"",1024,600);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		Window_Onload();
		if(window.screen.availWidth>1024){
			var w=window.screen.availWidth*0.98;
			window.resizeTo(w,600);
			//居中
			var resizeWinTop=(window.screen.availHeight-600)/2;
			var resizeWinLeft=(window.screen.availWidth-w)/2;
			window.moveTo(resizeWinLeft,resizeWinTop);
		}
	}
	function doPrint(){
		var str=getSearchCondition();
		showWin(1024,600,"/storehouse/InOutList.ihtm?content_type=PRINT&"+str);
	}
	function doDownload(){
		var str=getSearchCondition();
		window.location="/storehouse/InOutList.ihtm?content_type=EXCEL&"+str;
	}
	function createPageParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("end_date").value);
		str=str+"&sto_id="+document.getElementById("sto_id").value;
		str=str+"&pro_type_id="+document.getElementById("pro_type_id").value;
		str=str+"&pro_name="+encodeURIComponent(document.getElementById("pro_name").value);
		str=str+"&pro_code="+encodeURIComponent(document.getElementById("pro_code").value);
		str=str+"&bb_code="+encodeURIComponent(document.getElementById("bb_code").value);
		str=str+"&type="+document.getElementById("type").value;
		str=str+"&in_type_id="+document.getElementById("in_type_id").value;
		str=str+"&out_type_id="+document.getElementById("out_type_id").value;
		str=str+"&wc_id="+document.getElementById("wc_id").value;
		
		return str;
	}
	
	function createProgramParaStr(){
		var str="start_date="+encodeURIComponent(document.getElementById("hid_start_date").value);
		str=str+"&end_date="+encodeURIComponent(document.getElementById("hid_end_date").value);
		str=str+"&sto_id=1";
		str=str+"&pro_type_id=";
		str=str+"&pro_name="+encodeURIComponent(document.getElementById("hid_pro_name").value);
		str=str+"&pro_code="+encodeURIComponent(document.getElementById("hid_pro_code").value);
		str=str+"&bb_code="+encodeURIComponent(document.getElementById("hid_bb_code").value);
		str=str+"&type=";
		str=str+"&in_type_id=";
		str=str+"&out_type_id=";
		str=str+"&wc_id=";
		
		return str;
	}
	function doSearch(){
		var stoId=document.getElementById("sto_id").value;
		if(stoId==null || stoId=='' || stoId=='0'){
			ShowAlert('提示框','请选择仓库',200,100);
			return;
		}
		
		var str;
		if(IsAdvSearch){//高级
			str="search_type=1";
			if(document.getElementById("cb_order_date").checked){
				if(!checkDateStr(document.getElementById("start_date").value,"开始日期")){
					return;
				}
				if(!checkDateStr(document.getElementById("end_date").value,"结束日期")){
					return;
				}
				str=str+"&cb_order_date=1";
			}
			
			if(document.getElementById("cb_pro_type").checked){
				var proTypeId=document.getElementById("pro_type_id").value;
				if(proTypeId==null || proTypeId=="" || proTypeId=="0"){
					ShowAlert('提示框','请选择材料类别',200,100);
					return;
				}
				str=str+"&cb_pro_type=1";
			}
			if(document.getElementById("cb_pro_name").checked){
				var proName=document.getElementById("pro_name").value.trim();
				if(proName==null || proName==""){
					ShowAlert('提示框','请输入品名规格',200,100);
					return;
				}
				str=str+"&cb_pro_name=1";
			}
			if(document.getElementById("cb_pro_code").checked){
				var proCode=document.getElementById("pro_code").value.trim();
				if(proCode==null || proCode==""){
					ShowAlert('提示框','请输入材料编号',200,100);
					return;
				}
				str=str+"&cb_pro_code=1";
			}
			if(document.getElementById("cb_bb_code").checked){
				var bbCode=document.getElementById("bb_code").value.trim();
				if(bbCode==null || bbCode==""){
					ShowAlert('提示框','请输入业务单号',200,100);
					return;
				}
				str=str+"&cb_bb_code=1";
			}
			if(document.getElementById("cb_type").checked){
				var type=document.getElementById("type").value;
				if(type==null || type==""){
					ShowAlert('提示框','请选择出入类型',200,100);
					return;
				}
				str=str+"&cb_type=1";
			}
			if(document.getElementById("cb_in_type").checked){
				var inTypeId=document.getElementById("in_type_id").value;
				if(inTypeId==null || inTypeId=="" || inTypeId=="0"){
					ShowAlert('提示框','请选择入库类型',200,100);
					return;
				}
				str=str+"&cb_in_type=1";
			}
			if(document.getElementById("cb_out_type").checked){
				var outTypeId=document.getElementById("out_type_id").value;
				if(outTypeId==null || outTypeId=="" || outTypeId=="0"){
					ShowAlert('提示框','请选择出库类型',200,100);
					return;
				}
				str=str+"&cb_out_type=1";
			}
			if(document.getElementById("cb_wc").checked){
				var wcId=document.getElementById("wc_id").value;
				if(wcId==null || wcId=="" || wcId=="0"){
					ShowAlert('提示框','请选择工作中心',200,100);
					return;
				}
				str=str+"&cb_wc=1";
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
		
		document.getElementById("contentDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		window.location="/storehouse/InOutList.ihtm?"+str;
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
		doAutoCheck("cb_order_date");
	}
	function showLog(proId,ioTime,proName){
		var url="/storehouse/InOutLogList.ihtm?search_type=1&sto_id=1&cb_pro_name=1&pro_id="+proId+"&pro_name="+encodeURIComponent(proName)+"&cb_order_date=1&end_date="+ioTime;
		var startDate="";
		var searchType="2";
		if(searchType=="1"){//高级
			
		}else{
			url=url+"&start_date=2017-07-01";
		}
		showWin(1024,600,url);
	}
</script>
</head>
<body>
<div class="Wrap"><!-- 页面主框架 -->
    
	<div id="ListContainer" class="Container" style="width: 1808px;"><!-- 主体容器 -->
	    
	    <!-- 标题栏 -->
	    <div class="Heading BillIcon">
	        <div class="HeadingContent">
	            <h1>收发存明细表</h1>
	            <span class="Note">查询当期材料发生的收发存明细情况，点击结存单价可以查询该材料的库存日志</span>
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
	            			<input type="checkbox" name="cb_order_date" id="cb_order_date" checked="true" style="visibility:hidden;">
	            			日期
	            		</th>
	            		<td width="360px">
	            			<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_order_date&#39;);" id="start_date" name="start_date" value="2017-07-01">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;start_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_order_date\&#39;)&#39;);">
			            	<input type="hidden" id="hid_start_date" value="2017-07-01">
			            	至
			            	<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_order_date&#39;);" id="end_date" name="end_date" value="2017-07-09">
			            	<img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;end_date&#39;),&#39;yyyy-mm-dd&#39;,this,false,&#39;doAutoCheck(\&#39;cb_order_date\&#39;)&#39;);">
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
					<input type="button" class="buttom search-out" value=" 导 出" onclick="doDownload();" id="sDownloadButton" name="sDownloadButton">
					<input type="button" value=" 打 印" onclick="doPrint();" class="buttom search-print" id="sPrintButton" name="sPrintButton">
	            </span>
				<div id="dvMoreOptionBox" class="MoreOptionBox" style="display:none;">
					<table class="MoreOption" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<th class="c1" width="80px">
			        			<input type="checkbox" checked="true" disabled="true">
			        			仓库
			        		</th>
			        		<td class="c1" width="240px">
			        			<select name="sto_id" id="sto_id">
					  				<option value="0">==请选择==</option>
					  				
					  				<option value="1" selected="">标识加工仓库</option>
					  				
					  				<option value="2">中力门店仓库</option>
					  				
					  				<option value="3">车间型材仓库</option>
					  				
					  				<option value="4">车间耗材仓库</option>
					  				
					  				<option value="5">车间工具仓库</option>
					  				
					  				<option value="6">你好，仓库</option>
					  				
				  				</select>
			    			</td>
			    			<th class="c2" width="80px">
	                        	<input type="checkbox" name="cb_type" id="cb_type">
	                        	出入类型
	                        </th>
	                    	<td class="c3" width="250px">
	                        	<select name="type" id="type" onfocus="doAutoCheck(&#39;cb_type&#39;);">
					  				<option value="">==请选择==</option>
					  				<option value="IN">入库</option>
					  				<option value="OUT">出库</option>
				  				</select>
	                    	</td>
			    		</tr>
						<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_pro_type" id="cb_pro_type">
			        			材料类别
			        		</th>
			        		<td class="c1">
			        			<select name="pro_type_id" id="pro_type_id" onfocus="doAutoCheck(&#39;cb_pro_type&#39;);">
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
			    			<th class="c2">
			        			<input type="checkbox" name="cb_in_type" id="cb_in_type">
			        			入库类型
			        		</th>
			    			<td class="c3">
			        			<select name="in_type_id" id="in_type_id" onfocus="doAutoCheck(&#39;cb_in_type&#39;);">
						  			<option value="0">==请选择==</option>
						  			
						  			<option value="1">采购入库</option>
						  			
						  			<option value="2">内部调拨</option>
						  			
						  			<option value="3">盘点入库</option>
						  			
				  				</select>
			    			</td>
			    		</tr>
						<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_pro_name" id="cb_pro_name">
			        			品名规格
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="15" name="pro_name" id="pro_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_pro_name&#39;);" value="">
								<input type="hidden" id="hid_pro_name" value="">
			    			</td>
			    			<th class="c2">
			        			<input type="checkbox" name="cb_out_type" id="cb_out_type">
			        			出库类型
			        		</th>
			    			<td class="c3">
			        			<select name="out_type_id" id="out_type_id" onfocus="doAutoCheck(&#39;cb_out_type&#39;);">
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
			        			<input type="checkbox" name="cb_pro_code" id="cb_pro_code">
			        			材料编号
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="15" name="pro_code" id="pro_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_pro_code&#39;);" value="">
								<input type="hidden" id="hid_pro_code" value="">
			    			</td>
			    			<th class="c2">
			        			<input type="checkbox" name="cbwc" id="cb_wc">
			        			工作中心
			        		</th>
			    			<td class="c3">
			        			<select name="wc_id" id="wc_id" onfocus="doAutoCheck(&#39;cb_wc&#39;);">
					  				<option value="0">==请选择==</option>
					  				
					  				<option value="1">默认工作中心</option>
					  				
					  				<option value="10">型材仓库</option>
					  				
					  				<option value="12">标识部</option>
					  				
					  				<option value="13">标牌部</option>
					  				
				 				</select>
			    			</td>
			    		</tr>
			    		<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_bb_code" id="cb_bb_code">
			        			业务单号
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox" maxlength="15" name="bb_code" id="bb_code" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_bb_code&#39;);" value="">
								<input type="hidden" id="hid_bb_code" value="">
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
			
			<div id="contentDiv" style="background:#eafaff;">
		        <!-- 上栏 分页、操作等 -->
		        
		  		
		        <div class="TopToolBar">
		            <table class="ListNoteInfo" cellpadding="0" cellspacing="0">
		            	<tbody><tr>
		                	<td>
		            			<span>入库金额小计：8630.00元</span>
								<span>出库金额小计：0元</span>
		                	</td>
		            	</tr>
		            </tbody></table>
				</div>
				
		  		

			      <div class="table-list">
			        <table width="100%">
			          <tbody><tr>
							<th width="8%" rowspan="2">单号</th>
							<th width="6%" rowspan="2">日期</th>
							<th width="7%" rowspan="2">供需方</th>
							<th width="4%" rowspan="2">类型</th>
							<th width="7%" rowspan="2">备注</th>
							<th width="6%" rowspan="2">材料类别</th>
							<th width="7%" rowspan="2">材料编号</th>
							<th width="6%" rowspan="2">品名规格</th>
							<th width="4%" rowspan="2">单位</th>
							<th width="15%" colspan="3" align="center">入库</th>
							<th width="15%" colspan="3" align="center">出库
							</th><th width="15%" colspan="3" align="center">结存</th>
						</tr>
						<tr>
							<th width="5%">数量</th>
							<th width="5%">单价</th>
							<th width="5%">金额</th>
							<th width="5%">数量</th>
							<th width="5%">单价</th>
							<th width="5%">金额</th>
							<th width="5%">数量</th>
							<th width="5%">单价</th>
							<th width="5%">金额</th>
						</tr>
						
						<s:iterator value="inOutHistorys">
						<tr class="query_list_data_tr2" index="8" style="color:#000000" defaultfontcolor="#000000" onmouseout="javascript:mouseout(this)" onmouseover="javascript:mouseover(this)">
							<td><a href="javascript:doShow(125,&#39;IN_BILL&#39;);">${billCode }</a></td>
							<td><s:date name="billDate" format="yyyy-MM-dd hh:mm:ss"/></td>
							<td>${requName }</td>
							<td>
								${billType }
							</td>
							<td>${mark }</td>
							<td>材料类别</th>
							<td>材料编号</td>
							<td>品名规格</td>
							<td>卷</td>
							<td>${amount }</td>
							<td>${unitPrice }</td>
							<td>${cost }</td>
							<td>${amount }</td>
							<td>${unitPrice }</td>
							<td>${cost }</td>
							<td>${amount }</td>
							<td>${unitPrice }</td>
							<td>${cost }</td>
						</tr>
						</s:iterator>
						
					</tbody></table>
      			</div>
      		</div>
      		
      		<div class="modal-buttom" id="waitDiv" style="display:none">
				<span style="color:white">请稍候...</span>
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
	        document.getElementById('cb_order_date').style.visibility = 'visible';
	        this.style.visibility = 'hidden';
	    };
	    lnkHiddenOption.onclick = function(){
	    	IsAdvSearch = false;
	        document.getElementById('dvMoreOptionBox').style.display = 'none';
	        document.getElementById('cb_order_date').style.visibility = 'hidden';
	        lnkMoreOption.style.visibility = 'visible';
	    };
	})();
</script>

<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>