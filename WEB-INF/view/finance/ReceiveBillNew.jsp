<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0068)http://115.28.87.22:8888/finance/ReceiveBillNew.html?alert_type=SHOW -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>收款单 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillEdit.css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/jquery.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doSavePrinLitt(){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value="";
		document.getElementById("print_detail").value="L";
		if(window.opener){
			document.getElementById("print_flag").value="SHOW";
		}else{
			document.getElementById("print_flag").value="CALLBACK";
		}
		
			ShowConfirm('确认框','是否同时审核？',340,80,"doSavePrinLittExt()");
		
		
	}
	function doSavePrinLittExt(){
		if(popRetVal!=null){
			document.getElementById("examine").value="1";
		}else{
			document.getElementById("examine").value="0";
		}
		frm.submit();
	}
	function doSave(contFlag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=contFlag;
		
			ShowConfirm('确认框','是否同时审核？',340,80,"doSaveExt('"+contFlag+"')");
		
		
	}
	function doSaveExt(contFlag){
		if(popRetVal!=null){
			document.getElementById("examine").value="1";
		}else{
			document.getElementById("examine").value="0";
		}
		
			if(contFlag!='NEW'){
				ShowConfirm('确认框','是否现在打印？',340,80,"doSavePrint()");
			}else{
				frm.submit();
			}
		
		
	}
	function doSavePrint(){
		if(popRetVal!=null){
			ShowConfirm('确认框','是否同时打印收款明细？',340,80,"doSavePrintExt()");
		}else{
			frm.submit();
		}
	}
	function doSavePrintExt(){
		if(popRetVal!=null){
			document.getElementById("print_detail").value="Y";
		}else{
			document.getElementById("print_detail").value="N";
		}
		var printFlag;
		if(window.opener){
			printFlag="SHOW";
		}else{
			printFlag="CALLBACK";
		}
		document.getElementById("print_flag").value=printFlag;
		frm.submit();
	}
	function doCancel(){
		if(window.opener){
			window.close();
		}else{
			var retVal="";
			if(retVal!=""){
				parent.popRetVal=retVal;
			}
			parent.ClosePop();
		}
	}
	function printBusi(id){
		showWin(900,600,"business/BusinessBillPrint.html?id="+id);
	}
	function selectClient(){
		var url="base/EstablishmentListForSelect.html?type=CLIENT&order_type=BUS_TIME&ts_id=1";
		ShowIframe("选择付款单位",url,900,500,"selectClientCallBack()",1024,600);
	}
	function selectClientCallBack(){
		if(popRetVal!=null){
			var url="finance/BusinessBillByDateForReceive.html?bill_type=business";
			var estId=popRetVal[0];
			var estName=popRetVal[1];
			var mngId=popRetVal[2];
			var mngName=popRetVal[3];
			
			ShowIframeNoScroll("选择日期起止",url,580,300,"selectClientCallBackBill("+estId+",'"+estName+"',"+mngId+",'"+mngName+"')");
		}
	}
	function selectClientCallBackBill(estId,estName,mngId,mngName){
		if(popRetVal!=null){
			$("#LoadProcess").css("top",getTopPos(document.getElementById("clientName"))+50+"px");
			$("#LoadProcess").css("left",getleftPos(document.getElementById("clientName"))+100+"px");
			$("#LoadProcess").show();
			
			document.getElementById("receiveBill.clientId").value=estId;//名字带点jquery不认
			document.getElementById("clientName").value=estName;
			if(mngId!="0"){
				document.getElementById("receiveBill.managerId").value=mngId;
				document.getElementById("receiveBill.managerName").value=mngName;
			}
			
			var tsId="1";
			$.post("finance/GetBusiForRece.html",{est_id:estId,ts_id:tsId,start_date:popRetVal[0],end_date:popRetVal[1]},function(data,status){
				parseItemData(data,status);
			});
		
		}
	}
	
	function parseItemData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			if(obj.status=="ERROR"){
				$("#LoadProcess").hide();
				ShowAlert('提示框',obj.errMsg,200,100);
			}else{
				var tbl=$("#itemRowTbl");
				var itemNum=$("#item_num").val()-0;
				var i;
				for(var i=0;i<itemNum;i++){
					$("#itemTr"+i).hide();
					$("#status_"+i).val("DELETE");
				}
				
				$("#item_num").val(obj.items.length+itemNum);
				
				$.each(obj.items,function(index,item){
					var rowInd=index+itemNum;
					var tr=$("<tr></tr>");
					tr.prop({"id":"itemTr"+rowInd,"class":"ListTr"});
					
					var td;
					var input;
			
					td=$("<td></td>");
					input=$("<input type='checkbox' name='query_checkbox' checked>");
					input.val(rowInd);
					input.click(function(){
						doItemClick(this);
					});
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='business_bill_code_"+rowInd+"' id='business_bill_code_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);//自定义的属性要显式设置,否则后面用prop取不出来(写在上面的字符串的话,只能用attr才取得到)
					input.css("width","120px");
					input.val(item.code);
					td.append(input);
					
					input=$("<img src='/images/ico-bar.gif' />");
					input.prop("index",rowInd);
					input.css("cursor","pointer");
					input.click(function(){
						printBusi($("#business_bill_id_"+$(this).prop("index")).val());
					});
					td.append(input);
					
					input=$("<input type='hidden' name='business_bill_id_"+rowInd+"' id='business_bill_id_"+rowInd+"' />");
					input.val(item.id);
					td.append(input);
					
					input=$("<input type='hidden' name='id_"+rowInd+"' id='id_"+rowInd+"' />");
					input.val("0");
					td.append(input);
					
					input=$("<input type='hidden' name='status_"+rowInd+"' id='status_"+rowInd+"' />");
					input.val("NEW");
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='order_date_"+rowInd+"' id='order_date_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);
					input.css("width","70px");
					input.val(item.date);
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='linkman_"+rowInd+"' id='linkman_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);
					input.css("width","70px");
					input.val(item.linkman);
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='content_"+rowInd+"' id='content_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);
					input.css("width","200px");
					input.val(item.cont);
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='total_cost_"+rowInd+"' id='total_cost_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);
					input.css("width","80px");
					input.val(item.totaCost);
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='remain_cost_"+rowInd+"' id='remain_cost_"+rowInd+"' class='TextBox readonly' readonly='readonly' />");
					input.prop("index",rowInd);
					input.css("width","80px");
					input.val(item.remaCost);
					td.append(input);
					tr.append(td);
					
					td=$("<td></td>");
					input=$("<input type='text' name='this_cost_"+rowInd+"' id='this_cost_"+rowInd+"' class='TextBox' maxlength='10' />");
					input.prop("index",rowInd);
					input.css("width","80px");
					input.val(item.remaCost);
					td.append(input);
					tr.append(td);
					
					tbl.append(tr);
				});
				
				document.getElementById("all_item_cb").checked=true;
				doCount();
				resizePopwin();
				setFocus("costStr");
				$("#LoadProcess").hide();
			}
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function doCount(){
		var itemNum=Number(document.getElementById("item_num").value);
		var costTotal=0;
		var itemCost;
		for(var i=0;i<itemNum;i++){
			if(document.getElementById("status_"+i).value!="DELETE"){
				itemCost=document.getElementById("this_cost_"+i).value;
				if(!isNaN(itemCost)){
					costTotal=addMul(costTotal,itemCost);
				}
			}
		}
		document.getElementById("costStr").value=costTotal;
	}
	function checkItemChange(index){
		if(document.getElementById("id_"+index).value=="" || document.getElementById("id_"+index).value=="0"){
			document.getElementById("status_"+index).value="NEW";
		}else{
			document.getElementById("status_"+index).value="EDIT";
		}
	}
	function doAllItem(obj){
		var ob_arr = document.getElementsByName("query_checkbox");
		var i;
		for (i=0;i<ob_arr.length;i++){
			var index=ob_arr[i].value;
			if(document.getElementById("status_"+index).value!="DELETE"){
				if(obj.checked){
					ob_arr[i].checked=true;
					document.getElementById("this_cost_"+index).value=document.getElementById("remain_cost_"+index).value;
				}else{
					ob_arr[i].checked=false;
					document.getElementById("this_cost_"+index).value="0";
				}
				checkItemChange(index);
			}
		}
	}
	function doItemClick(obj){
		var index=obj.value;
		if(obj.checked){
			document.getElementById("this_cost_"+index).value=document.getElementById("remain_cost_"+index).value;
		}else{
			document.getElementById("this_cost_"+index).value="0";
		}
		checkItemChange(index);
	}
	function selectStaffer(){
		var url="base/StafferMainForSelect.html";
		ShowIframe("选择员工",url,800,500,"selectStafferCallBack()",1024,600);
	}
	function selectStafferCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("receiveBill.managerId").value=arr[0];
			document.getElementById("receiveBill.managerName").value=arr[1];
			var depObj=document.getElementById("receiveBill.departmentId");
			for(var i=0;i<depObj.options.length;i++){
				if(arr[2]==depObj.options[i].value){
					depObj.options[i].selected=true;
					break;
				}
			}
		}
	}
	function autoAssign(){
		var cost=document.getElementById("costStr").value;
		var itemNum=Number(document.getElementById("item_num").value);
		var i;
		for(i=0;i<itemNum;i++){
			var status=document.getElementById("status_"+i).value;
			if(status!="DELETE"){
				var remainCost=document.getElementById("remain_cost_"+i).value;
				if(Number(cost)<=Number(remainCost)){
					document.getElementById("this_cost_"+i).value=cost;
					cost=0;
				}else{
					cost=abateMul(cost,remainCost);
					document.getElementById("this_cost_"+i).value=remainCost;
				}
				checkItemChange(i);
			}
		}
	}
	function doPrint(id){
		ShowConfirm('确认框','是否同时打印收款明细？',340,80,"showPrintCallBack("+id+")");
	}
	function showPrintCallBack(id){
		var printDetail="N";
		if(popRetVal!=null){
			printDetail="Y";
		}
		showWin(900,600,"finance/ReceiveBillPrint.html?id="+id+"&print_detail="+printDetail);
	}
	function doPrintLitt(id){
		showWin(900,600,"finance/ReceiveBillPrint.html?id="+id+"&print_detail=L");
	}
	function doInit(){
		showFormErrorMsg();
		
		var allCheck=true;
		var ob_arr = document.getElementsByName("query_checkbox");
		var i;
		for (i=0;i<ob_arr.length;i++){
			var index=ob_arr[i].value;
			if(document.getElementById("status_"+index).value!="DELETE"){
				var thisCost=document.getElementById("this_cost_"+index).value;
				var remaCost=document.getElementById("remain_cost_"+index).value;
				if(!isNaN(thisCost)){
					if(thisCost-0==remaCost-0){
						ob_arr[i].checked=true;
					}else{
						ob_arr[i].checked=false;
						allCheck=false;
					}
				}
			}
		}
		document.getElementById("all_item_cb").checked=allCheck;
		
		resizePopwin();
		document.getElementById("costStr").focus();
	}
	function doWinUnload(){
		var retVal='';
		if(retVal!='' && !window.opener){
			parent.popRetVal=retVal;
		}
	}
	function changeClosBusi(){
		if(document.getElementById("clos_busi_cb").checked){
			document.getElementById("receiveBill.closBusi").value="Y";
		}else{
			document.getElementById("receiveBill.closBusi").value="N";
		}
	}
</script>
</head>
<body onload="doInit();" onunload="doWinUnload();">
<div class="Wrap">
	<form name="frm" method="post" enctype="multipart/form-data">
	<div class="Container">
		<div class="Contnet Paper">
			
			
			
			
  			
			
      			
				
      		
			
			<!-- 是否可以编辑日期 -->
			

			<!-- 提示信息 -->
			
<script language="javascript">
	var formErrorIndex=0;
	var formErrorMsg="";
	var formErrorObjId="";
	function setFormErrorMsg(msg,index,objId){
		if(formErrorIndex==0 || formErrorIndex>index){
			if(msg!=null && msg!=""){
				formErrorIndex=index;
				formErrorMsg=msg;
				formErrorObjId=objId;
			}
		}
	}
	function showFormErrorMsg(){
		if(formErrorIndex!=0){
			document.getElementById("errorMsgTr").style.display="";
			document.getElementById("errorMsgDiv").innerHTML=formErrorMsg;
			if(formErrorObjId!=null && formErrorObjId!=""){
				document.getElementById(formErrorObjId).focus();
			}
		}
	}
	function goNextInput(objId){
		var obj=null;
		if(objId!=null && objId!=''){
			obj=document.getElementById(objId);
		}
		if(window.event.keyCode==13){
			if(obj!=null){
				obj.focus();
			}else if(window.doSave){
				doSave();
			}
		}
	}
</script>
<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td colspan="2">
	  	<div class="msg-error" id="errorMsgDiv">
      	
      	</div>
	  </td>
	</tr>
</tbody></table>

			<!--单 标题-->
			<br>
	        <table class="BillHeading" cellspacing="0" cellpadding="0">
	        	<tbody><tr>
		            <td width="301px;" rowspan="2"><div class="CorpLogo"><img src="images/1_1456975049379login.gif"></div></td>
		            <td width="301px;" rowspan="2"><h1>收款单</h1></td>
		            <td width="301px;" class="tr vb codeTd">
		                <span class="MustInput">*</span>编号：
		                
				    	<input type="text" class="tbBillCode TextBox disabled" readonly="readonly" maxlength="30" onkeyup="goNextInput(&#39;receiveDateStr&#39;);" id="receiveBill.billCode" name="receiveBill.billCode" value="">
				    	<script language="javascript">
							setFormErrorMsg('',1,'receiveBill.billCode');
						</script>
			     		
		            </td>
	        	</tr>
	        	<tr>
	            	<td class="tr">
	            		<span id="calPosi"></span>
		            	<span class="MustInput">*</span>收款日期：
		            	
		                    <input type="text" class="tbBillDate_sim TextBox " maxlength="15" id="receiveDateStr" name="receiveDateStr" value="2017-07-09">
		                    <img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;receiveDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;calPosi&#39;));">
		                    <script language="javascript">
						    	setFormErrorMsg('',2,'receiveDateStr');
						    </script>
		                
	            	</td>
	        	</tr>
	        </tbody></table>

			<!-- 单 头信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillHeadInfo" cellspacing="0" cellpadding="0">
	        		<tbody><tr>
	            		<td width="284px">
	                		<span class="MustInput">*</span>付款单位：
	                		
	                		<select class="TextBox readonly" style="width:150px" readonly="readonly" type="text" id="clientName" name="receiveBill.clientId" value="">
	                			<s:iterator value="establishments">
		                			<option value="${id }">${estName }</option>
	                			</s:iterator>
	                		</select>
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>收款账户：</th>
	            		
	                	<td width="273px">
	                		<select class="ddlInfo3_long" id="receiveBill.bankAccountId" name="receiveBill.bankAccountId">
								<s:iterator value="receiveBills">
									<option value="${id }">${bankName }(${accountName })</option>
								</s:iterator>
				  			</select>
				          	<script language="javascript">
				          		setFormErrorMsg('',6);
				          	</script>
	            		</td>
	            		
	            		<td width="263px;" class="tr">
	                		<span class="MustInput">*</span>收款金额：
	                		
	                    	<input type="text" class="tbHead3 TextBox" maxlength="10" id="costStr" name="costStr" value="" onchange="autoAssign();">
	                    	<script language="javascript">
						    	setFormErrorMsg('',5,'costStr');
						    </script>
	                		
	            		</td>
	        		</tr>
	        	</tbody></table>
	        </div>

			<!-- 明细 -->
	        <input type="hidden" id="item_num" name="item_num" value="0">
	        <table id="BillDetails" class="BillDetails" width="100%" cellspacing="0" cellpadding="0">
	        	<tbody id="itemRowTbl">
				<tr>
					<th width="2%"><input type="checkbox" id="all_item_cb" onclick="javascript:doAllItem(this);"></th>
					<th width="18%">业务单号</th>
					<th width="10%">订货日期</th>
					<th width="10%">联系人</th>
					<th width="24%">摘要</th>
					<th width="12%">金额（元）</th>
					<th width="12%">余额（元）</th>
					<th width="12%">本次收款</th>
				</tr>
				
				</tbody>
			</table>
			<div class="table-bot" style="height:20px;">
				<span style="float:right;PADDING-RIGHT:10px;color:#aaa;">
					<input type="button" style="font-size:12px;" value="汇总到收款金额" onclick="doCount();">
				</span>
				&nbsp;
			</div>
			<br>
			
	        	<script language="javascript">
	          		setFormErrorMsg('',6);
	        	</script>
	    	
	    	
	    	<!-- 附加信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillElseInfo" cellspacing="0" cellpadding="0" style="position:relative;"><!-- ie6要在这里加position:relative下面的附件div才不会错位 -->
	        		<tbody><tr>
	        			<th width="84px"><span class="MustInput">*</span>经办人：</th>
	            		<td width="200px">
	            			
            				<select type="text" class="tbInfo1 TextBox readonly" id="receiveBill.managerName" name="receiveBill.managerId" title="选择经办人，用于计算该经办人的收欠费产值">
            					<s:iterator value="staffers">
            						<option value="${id }">${stafferName }</option>
            					</s:iterator>
            				</select>
            				
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>部门：</th>
	            		
			            
	            		
	            		<td width="273px">
	            			<select id="receiveBill.departmentId" name="receiveBill.departmentId" class="ddlInfo3_long" style="background:#f6f6f6;">
                    			<s:iterator value="departments">
	                    			<option value="${id }">${departmentName }</option>
                    			</s:iterator>
                			</select>
            				<script language="javascript">
						    	setFormErrorMsg('',8);
						    </script>
	            		</td>
	            		
	            		<th width="84px"></th>
            			<td width="179px"></td>
	        		</tr>
	        		<tr>
        				<th>摘要：</th>
        				
        				<td colspan="5">
        					<textarea class="TextBox" name="receiveBill.description" id="receiveBill.description" style="width:764px;height:40px"></textarea>
            				<script language="javascript">
						    	setFormErrorMsg('',9,'receiveBill.description');
						    </script>
        				</td>
        				
        			</tr>
        			<tr>
        				<th>备注：</th>
        				
        				<td colspan="5">
        					<textarea class="TextBox" name="receiveBill.mark" id="receiveBill.mark" style="width:764px;height:40px"></textarea>
            				<script language="javascript">
						    	setFormErrorMsg('',10,'receiveBill.mark');
						    </script>
        				</td>
        				
        			</tr>
        			<tr>
        				<th>上传凭证：</th>
        				<td colspan="5">
        					<div style="position:relative; width:480px; height:28px; overflow:hidden; float:left;">
        						<input type="text" class="TextBox readonly" readonly="readonly" style="width:470px;" name="tmp_att" id="tmp_att">
        					</div>
        					<div style="position:relative;width:40px;height:28px;overflow:hidden;float:left;"> 
								<div style="position:absolute;top:0px;left:0px;width:100%;height:100%;">
									<img class="make-a" src="images/make-a.gif">
								</div> 
								<input type="file" name="attach_file" id="attach_file" onchange="document.getElementById(&#39;tmp_att&#39;).value=this.value" style="position:absolute;top:0px;right:0px;cursor:pointer;opacity:0;filter:alpha(opacity:0);z-index:99;"> 
							</div>
							
							
						    	<script language="javascript">
						        	setFormErrorMsg('',11);
						    	</script>
					      	
        				</td>
        			</tr>
        			<tr>
        				<th>&nbsp;</th>
        				<td colspan="5">
        					<input type="checkbox" id="clos_busi_cb" onclick="changeClosBusi();">
        					同时结清已收齐款的业务单
        					
        						<input type="hidden" name="receiveBill.closBusi" id="receiveBill.closBusi" value="N">
        					
        				</td>
        			</tr>
    			</tbody></table>
    		</div>
	    	<br>
			<div class="BillNotes">
                <span>开单人：标识汇 </span>
	        	<span>审核人：</span>
	        	<span>单据帐套：新异</span>
				
			    	<script language="javascript">
			        	setFormErrorMsg('',1);
			    	</script>
				
			</div>
		</div>
			
		<!-- 底栏按钮 -->
		<div class="Footer">
			<div id="buttonDiv">
				
				<input type="button" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;&#39;);">
				
					<input type="button" class="buttom-a" value="保存打小票" onclick="doSavePrinLitt();">
					<input type="button" class="buttom-a" value="保存并新增" onclick="doSave(&#39;NEW&#39;);">
				
				<!--
				<input type="button" class="buttom-a" value="向下分配" onClick="autoAssign();">
				<input type="button" class="buttom-a" value="向上汇总" onClick="doCount();">
				-->
				<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
				<input type="hidden" id="examine" name="examine" value="0">
				<input type="hidden" name="continue_flag" id="continue_flag" value="">
				<input type="hidden" name="print_flag" id="print_flag" value="">
				<input type="hidden" name="print_detail" id="print_detail" value="">
				<input type="hidden" name="sychronizeValue" id="sychronizeValue" value="0">
			</div>
			<div id="waitDiv" style="display:none">
    			<span>请稍候...</span>
			</div>
		</div>

	</div>
	</form>
</div>

<div id="LoadProcess" style="position:absolute; left:50%;top:50%; width:200px; height:100px; margin-top:-50px;margin-left:-100px;z-index:1; border:solid #000 5px;background-color:White;display:none">
	<table border="0" align="center" style="height:100%;">
		<tbody><tr>
			<td style="valign:middle">
				<img src="images/loading.gif">
				请稍候...
			</td>
		</tr>
	</tbody></table>
</div>


</body></html>