<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0056)http://115.28.87.22:8888/business/ReceivableAgeList.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>应收款账龄分布表 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/Query.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillList.css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/jquery.js"></script>
<script language="javascript">
	function createPageParaStr(){
		var str="est_name="+encodeURIComponent(document.getElementById("est_name").value);
		str=str+"&area_id="+document.getElementById("area_id").value;
		str=str+"&et_id="+document.getElementById("et_id").value;
		str=str+"&el_id="+document.getElementById("el_id").value;
		str=str+"&ts_id="+document.getElementById("ts_id").value;
		str=str+"&mng_id="+encodeURIComponent(document.getElementById("mng_id").value);
		str=str+"&mng_name="+encodeURIComponent(document.getElementById("mng_name").value);
		return str;
	}
	
	function createProgramParaStr(){
		var str="est_name="+encodeURIComponent(document.getElementById("hid_est_name").value);
		str=str+"&area_id=";
		str=str+"&et_id=";
		str=str+"&el_id=";
		str=str+"&ts_id=1";
		str=str+"&mng_id=";
		str=str+"&mng_name="+encodeURIComponent(document.getElementById("hid_mng_name").value);
		return str;
	}
	function doSearch(){
		var str;
		if(IsAdvSearch){//高级
			str="search_type=1";
			if(document.getElementById("cb_est").checked){
				var estName=document.getElementById("est_name").value.trim();
				if(estName==null || estName==""){
					ShowAlert('提示框','请输入客户名称',200,100);
					return;
				}
				str=str+"&cb_est=1";
			}
			if(document.getElementById("cb_area").checked){
				var areaId=document.getElementById("area_id").value;
				if(areaId==null || areaId=="" || areaId=="0"){
					ShowAlert('提示框','请选择地区',200,100);
					return;
				}
				str=str+"&cb_area=1";
			}
			if(document.getElementById("cb_et").checked){
				var etId=document.getElementById("et_id").value;
				if(etId==null || etId=="" || etId=="0"){
					ShowAlert('提示框','请选择客户类别',200,100);
					return;
				}
				str=str+"&cb_et=1";
			}
			if(document.getElementById("cb_el").checked){
				var elId=document.getElementById("el_id").value;
				if(elId==null || elId=="" || elId=="0"){
					ShowAlert('提示框','请选择客户等级',200,100);
					return;
				}
				str=str+"&cb_el=1";
			}
			if(document.getElementById("cb_ts").checked){
				var tsId=document.getElementById("ts_id").value;
				if(tsId==null || tsId=="" || tsId=="0"){
					ShowAlert('提示框','请选择帐套',200,100);
					return;
				}
				str=str+"&cb_ts=1";
			}
			if(document.getElementById("cb_mng").checked){
				var mngId=document.getElementById("mng_id").value;
				if(mngId==null || mngId=="" || mngId=="0"){
					ShowAlert('提示框','请选择业务员',200,100);
					return;
				}
				str=str+"&cb_mng=1";
			}
		}else{//快速
			str="search_type=2";
		}
		var paraStr=createPageParaStr();
		if(paraStr!=""){
			str=str+"&"+paraStr;
		}
		window.location="business/ReceivableAgeList.html?"+str;
	}
	function getSearchCondition(){
		var searchType="1";
		var str="search_type="+searchType;
		if(searchType=="1"){//高级
			
			
			
			
			str=str+"&cb_ts=1";
			
		}else{//快速
			
		}
		var paraStr=createProgramParaStr();
		if(paraStr!=""){
			str=str+"&"+paraStr;
		}
		return str;
	}
	function doAutoCheck(objId){
		if(document.getElementById(objId).style.visibility!="hidden"){
			document.getElementById(objId).checked=true;
		}
	}
	function DoubleClick(it){
		
	}
	function doDownload(){
		var str=getSearchCondition();
		window.location="business/ReceivableAgeListData.html?content_type=EXCEL&"+str;
	}
	function doCancel(){
		window.close();
	}
	function checkInput(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function selectStaffer(){
		var url="base/StafferMainForSelect.html";
		var cb="selectStafferCallBack()";
		ShowIframe("选择员工",url,800,500,cb);
	}
	function selectStafferCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("mng_id").value=arr[0];
			document.getElementById("mng_name").value=arr[1];
			doAutoCheck("cb_mng");
		}
	}
	function doInit(){
		if(window.screen.availWidth>=1280){
			var w=window.screen.availWidth*0.98;
			window.resizeTo(w,600);
			//居中
			var resizeWinTop=(window.screen.availHeight-600)/2;
			var resizeWinLeft=(window.screen.availWidth-w)/2;
			window.moveTo(resizeWinLeft,resizeWinTop);
		}
		
		var searchType="1",cbEst="",cbArea="",cbEt="",cbEl="",cbTs="",cbMng="";
		if(searchType=="1"){//高级
			cbEst="";
			cbArea="";
			cbEt="";
			cbEl="";
			cbTs="1";
			cbMng="";
		}
		var estName=document.getElementById("hid_est_name").value;
		var areaId="",etId="",elId="",tsId="1",mngId="";
		var mngName=document.getElementById("hid_mng_name").value;
		
		$.post("business/ReceivableAgeListData.html",{search_type:searchType,cb_est:cbEst,cb_area:cbArea,cb_et:cbEt,cb_el:cbEl,cb_ts:cbTs,cb_mng:cbMng,est_name:estName,area_id:areaId,et_id:etId,el_id:elId,ts_id:tsId,mng_id:mngId,mng_name:mngName},function(data,status){
			parseData(data,status);
		});
	}
	function parseData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			
			var monthArr=new Array();
			
				monthArr[0]='2017-07';
			
				monthArr[1]='2017-06';
			
				monthArr[2]='2017-05';
			
				monthArr[3]='2017-04';
			
				monthArr[4]='2017-03';
			
				monthArr[5]='2017-02';
			
				monthArr[6]='2017-01';
			
				monthArr[7]='2016-12';
			
				monthArr[8]='2016-11';
			
				monthArr[9]='2016-10';
			
				monthArr[10]='2016-09';
			
				monthArr[11]='2016-08';
			
			
			var tbl=document.getElementById("dataTbl");
			var trClass="query_list_data_tr1";
			
  			$.each(obj.items,function(index,item){
  				
  				var estId=item.estId;
  				var estName=item.estName;
  				var remCost=item.remCost;
  				var yeaCost=item.yearBefCost;
  				
  				var tr=document.createElement("tr");
  				tr.setAttribute("className",trClass);
  				tr.setAttribute("class",trClass);
  				tr.style.cursor="pointer";
  				tr.setAttribute("index",index+1);
  				tr.onclick=dataOnClick;
  				tr.onmouseout=dataOnMouseOut;
  				tr.onmouseover=dataOnMouseOver;
  				
  				var td;
  				var input;
  				
  				td=document.createElement("td");
  				input=document.createElement("input");
  				input.setAttribute("type","radio");
  				input.setAttribute("name","query_checkbox");
  				input.setAttribute("value",estId);
  				input.style.display="none";
  				td.appendChild(input);
  				td.appendChild(document.createTextNode(estName));
				tr.appendChild(td);
				
				td=document.createElement("td");
				td.innerHTML="<a href=\"javascript:showDetail('"+estName+"','');\">"+remCost+"</a>";
				//td.appendChild(document.createTextNode(remCost));
				tr.appendChild(td);
				
				$.each(item.months,function(mIndex,mItem){
					td=document.createElement("td");
					td.innerHTML="<a href=\"javascript:showDetail('"+estName+"','"+monthArr[mIndex]+"');\">"+mItem.cost+"</a>";
					//td.appendChild(document.createTextNode(mItem.cost));
					tr.appendChild(td);
				});
				
				td=document.createElement("td");
				td.appendChild(document.createTextNode(yeaCost));
				tr.appendChild(td);
				
				tbl.appendChild(tr);
				
  				if(trClass=="query_list_data_tr1"){
  					trClass="query_list_data_tr2";
  				}else{
  					trClass="query_list_data_tr1";
  				}
  			});
  			
  			var tr=document.createElement("tr");
  			var th=document.createElement("th");
			th.appendChild(document.createTextNode("合计"));
			tr.appendChild(th);
			
			th=document.createElement("th");
			//th.innerHTML="<a href=\"javascript:showDetail('','');\">"+obj.remTota+"</a>";
			th.appendChild(document.createTextNode(obj.remTota));
			tr.appendChild(th);
  			
  			$.each(obj.monthTota,function(index,item){
				th=document.createElement("th");
				//th.innerHTML="<a href=\"javascript:showDetail('','"+monthArr[index]+"');\">"+item.cost+"</a>";
				th.appendChild(document.createTextNode(item.cost));
				tr.appendChild(th);
			});
			
			th=document.createElement("th");
			th.appendChild(document.createTextNode(obj.yearBefTota));
			tr.appendChild(th);
  			
  			tbl.appendChild(tr);
  			
  			document.getElementById("waitDiv").style.display="none";
  			document.getElementById("dataDiv").style.display="";
  			
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function dataOnClick(){
		ClickCheck(this);
	}
	function dataOnMouseOut(){
		mouseout(this);
	}
	function dataOnMouseOver(){
		mouseover(this);
	}
	function showDetail(estName,monthStr){
		var startDate=monthStr+"-01";
		var arr=monthStr.split("-");
		var d=new Date(arr[0],arr[1],1);
		d.setDate(d.getDate()-1);
		var endDate=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		var url="business/BusinessBillListForReceive.html?search_type=1";
		if(estName!=""){
			url=url+"&cb_est=1&est_name="+encodeURIComponent(estName);
		}
		if(monthStr!=""){
			url=url+"&cb_order_date=1&start_date="+startDate+"&end_date="+endDate;
		}
		
			url=url+"&cb_ts=1&ts_id=1";
		
		showWin(1024,600,url);
	}
</script>
</head>
<body oncontextmenu="return false">
<div class="Wrap"><!-- 页面主框架 -->
    
	<div id="ListContainer" class="Container" style="width: 1452px;"><!-- 主体容器 -->
	    
	    <!-- 标题栏 -->
	    <div class="Heading BillIcon">
	        <div class="HeadingContent">
	            <h1>应收款账龄分布表</h1>
	            <span class="Note">统计客户应收款的账龄分布</span>
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
	            			<input type="checkbox" name="cb_est" id="cb_est" style="visibility:hidden;">
	            			客户名称
	            		</th>
	            		<td class="c3" width="260px">
	            			<input type="text" class="TextBox" id="est_name" name="est_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_est&#39;);" value="" title="以客户名称、客户拼音字头进行模糊查询">
							<input type="hidden" id="hid_est_name" value="">
	            		</td>
	            	</tr></tbody></table>
	            </span>
	            <span class="fr">
	            	<a href="javascript:;" id="lnkMoreOption">更多查询选项</a>
		  			<input type="button" value=" 查 询" onclick="doSearch();" id="sSearchButton" name="sSearchButton" class="buttom search-but">
		  			<input type="button" value=" 导 出" onclick="doDownload();" id="sDownButton" name="sDownButton" class="buttom  search-out">
	            </span>
				<div id="dvMoreOptionBox" class="MoreOptionBox" style="display:none;">
					<table class="MoreOption" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<th class="c1" width="80px">
			        			<input type="checkbox" name="cb_et" id="cb_et">
			        			客户类别
			        		</th>
			        		<td class="c1" width="260px">
			        			<select name="et_id" id="et_id" onfocus="doAutoCheck(&#39;cb_et&#39;);">
							  		<option value="0">==请选择==</option>
							  		
							  		<option value="1">广告公司</option>
							  		
							  		<option value="2">直接客户</option>
							  		
							  		<option value="3">标识汇</option>
							  		
							  		<option value="4">零售客户</option>
							  		
							  		<option value="5">装饰公司</option>
							  		
							  		<option value="6">市场同行</option>
							  		
							  		<option value="7">签约客户</option>
							  		
							  		<option value="8">私企</option>
							  		
						  		</select>
			    			</td>
			    		</tr>
			    		<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_el" id="cb_el">
			        			客户等级
			        		</th>
			        		<td class="c1">
			        			<select name="el_id" id="el_id" onfocus="doAutoCheck(&#39;cb_el&#39;);">
							  		<option value="0">==请选择==</option>
							  		
							  		<option value="1">大客户</option>
							  		
							  		<option value="2">老客户</option>
							  		
							  		<option value="3">新客户</option>
							  		
							  		<option value="4">零售客户</option>
							  		
							  		<option value="5">重要客户</option>
							  		
						  		</select>
			    			</td>
			    		</tr>
			    		<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_area" id="cb_area">
			        			地区
			        		</th>
			        		<td class="c1">
			        			<select name="area_id" id="area_id" onfocus="doAutoCheck(&#39;cb_area&#39;);">
									<option value="0">==全部地区==</option>
									
<option value="1">河南省</option>
<option value="76">&nbsp;|--郑州市</option>
<option value="95">&nbsp;&nbsp;|--巩义市</option>
<option value="104">&nbsp;&nbsp;|--管城区</option>
<option value="105">&nbsp;&nbsp;|--金水区</option>
<option value="106">&nbsp;&nbsp;|--经济开发区</option>
<option value="107">&nbsp;&nbsp;|--惠济区</option>
<option value="108">&nbsp;&nbsp;|--上街区</option>
<option value="109">&nbsp;&nbsp;|--高新技术开发区</option>
<option value="96">&nbsp;&nbsp;|--新郑市</option>
<option value="97">&nbsp;&nbsp;|--登封</option>
<option value="98">&nbsp;&nbsp;|--新密</option>
<option value="99">&nbsp;&nbsp;|--荥阳</option>
<option value="100">&nbsp;&nbsp;|--中牟县</option>
<option value="101">&nbsp;&nbsp;|--二七区</option>
<option value="102">&nbsp;&nbsp;|--中原区</option>
<option value="103">&nbsp;&nbsp;|--郑东新区</option>
<option value="85">&nbsp;|--焦作市</option>
<option value="187">&nbsp;&nbsp;|--沁阳市</option>
<option value="196">&nbsp;&nbsp;|--中站区</option>
<option value="188">&nbsp;&nbsp;|--孟州市</option>
<option value="189">&nbsp;&nbsp;|--修武县</option>
<option value="190">&nbsp;&nbsp;|--温县</option>
<option value="191">&nbsp;&nbsp;|--武陟县</option>
<option value="192">&nbsp;&nbsp;|--博爱县</option>
<option value="193">&nbsp;&nbsp;|--山阳区</option>
<option value="194">&nbsp;&nbsp;|--解放区</option>
<option value="195">&nbsp;&nbsp;|--马村区</option>
<option value="86">&nbsp;|--濮阳市</option>
<option value="197">&nbsp;&nbsp;|--濮阳县</option>
<option value="198">&nbsp;&nbsp;|--南乐县</option>
<option value="199">&nbsp;&nbsp;|--台前县</option>
<option value="200">&nbsp;&nbsp;|--清丰县</option>
<option value="471">&nbsp;&nbsp;|--隆阳区</option>
<option value="472">&nbsp;&nbsp;|--施甸县</option>
<option value="473">&nbsp;&nbsp;|--昌宁县</option>
<option value="474">&nbsp;&nbsp;|--龙陵县</option>
<option value="475">&nbsp;&nbsp;|--腾冲县</option>
<option value="399">&nbsp;|--丽江市</option>
<option value="476">&nbsp;&nbsp;|--玉龙县</option>
<option value="477">&nbsp;&nbsp;|--华坪县</option>
<option value="478">&nbsp;&nbsp;|--永胜县</option>
<option value="479">&nbsp;&nbsp;|--宁蒗县</option>
<option value="480">&nbsp;&nbsp;|--古城区</option>
								</select>
			    			</td>
			    		</tr>
			    		<tr>
							<th class="c1">
			        			<input type="checkbox" name="cb_mng" id="cb_mng">
			        			业务员
			        		</th>
			        		<td class="c1">
			        			<input type="text" class="TextBox readonly" readonly="readonly" maxlength="50" name="mng_name" id="mng_name" onkeyup="checkInput();" onfocus="doAutoCheck(&#39;cb_mng&#39;);" value="">
								<img class="imgIconButton" src="images/make-a.gif" onclick="selectStaffer();">
								<input type="hidden" id="mng_id" value="">
								<input type="hidden" id="hid_mng_name" value="">
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
	        
	        <div id="waitDiv" style="height: 100px; display: none;">
		      	<table width="100%" height="100%">
		      		<tbody><tr>
		      			<td style="text-align:center;background-color:white;"><img src="images/wait.gif"></td>
		      		</tr>
		      	</tbody></table>
		    </div>
	        
		    <div class="table-list" id="dataDiv">
		        <table width="100%">
					<tbody><tr>
						<th width="10%">客户名称</th>
						<th width="10%">欠款合计
						
							</th><th width="6%">2017-07</th>
						
							<th width="6%">2017-06</th>
						
							<th width="6%">2017-05</th>
						
							<th width="6%">2017-04</th>
						
							<th width="6%">2017-03</th>
						
							<th width="6%">2017-02</th>
						
							<th width="6%">2017-01</th>
						
							<th width="6%">2016-12</th>
						
							<th width="6%">2016-11</th>
						
							<th width="6%">2016-10</th>
						
							<th width="6%">2016-09</th>
						
							<th width="6%">2016-08</th>
						
						<th width="8%">1年前</th>
					</tr>
					</tbody><tbody id="dataTbl">
					<tr classname="query_list_data_tr1" 
					class="query_list_data_tr1" index="1" style="cursor: pointer;">
					<td><input type="radio" name="query_checkbox" value="425" style="display: none;">
					<td>、
						<td><a href="javascript:showDetail(&#39;郑州新天地&#39;,&#39;2016-11&#39;);">0</a></td>
						<td><a href="javascript:showDetail(&#39;郑州新天地&#39;,&#39;2016-10&#39;);">0</a></td>
				</table>
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
	        document.getElementById('cb_est').style.visibility = 'visible';
	        this.style.visibility = 'hidden';
	    };
	    lnkHiddenOption.onclick = function(){
	    	IsAdvSearch = false;
	        document.getElementById('dvMoreOptionBox').style.display = 'none';
	        document.getElementById('cb_est').style.visibility = 'hidden';
	        lnkMoreOption.style.visibility = 'visible';
	    };
	})();
</script>
</body></html>