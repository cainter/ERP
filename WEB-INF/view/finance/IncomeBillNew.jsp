<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0067)http://115.28.87.22:8888/finance/IncomeBillNew.html?alert_type=SHOW -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>其他收入单 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillEdit.css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
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
		
			if(contFlag!='NEW' && contFlag!='COPY'){
				ShowConfirm('确认框','是否现在打印？',340,80,"doSavePrint()");
			}else{
				frm.submit();
			}
		
		
	}
	function doSavePrint(){
		if(popRetVal!=null){
			document.getElementById("print_flag").value="1";
		}
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
	function selectStaffer(){
		var url="base/StafferMainForSelect.html";
		ShowIframe("选择员工",url,800,500,"selectStafferCallBack()",1024,420);
	}
	function selectStafferCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("incomeBill.managerId").value=arr[0];
			document.getElementById("incomeBill.managerName").value=arr[1];
			var depObj=document.getElementById("incomeBill.departmentId");
			for(var i=0;i<depObj.options.length;i++){
				if(arr[2]==depObj.options[i].value){
					depObj.options[i].selected=true;
					break;
				}
			}
		}
	}
	function showMe(){
		document.getElementById("incomeBill.payerName").focus();
		showFormErrorMsg();
	}
	function doPrint(id){
		showWin(900,360,"finance/IncomeBillPrint.html?id="+id);
	}
	function doWinUnload(){
		var retVal='';
		if(retVal!='' && !window.opener){
			parent.popRetVal=retVal;
		}
	}
</script>
</head>
<body scroll="no" onload="showMe();" onunload="doWinUnload();">
<div class="Wrap">
	<form action="InComeBill_saveInComeBill" method="post" enctype="multipart/form-data">
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
		            <td width="301px;" rowspan="2"><h1>其他收入单</h1></td>
		            <td width="301px;" class="tr vb codeTd"> 
		                <span class="MustInput">*</span>编号：
		                
				    	<input type="text" class="tbBillCode TextBox disabled" readonly="readonly" maxlength="30" onkeyup="goNextInput(&#39;incomeDateStr&#39;);" id="incomeBill.billCode" name="billCode" value="">
				    	<script language="javascript">
							setFormErrorMsg('',1,'incomeBill.billCode');
						</script>
			     		
		            </td>
	        	</tr>
	        	<tr>
	            	<td class="tr">
	            		<span id="calPosi"></span>
		            	<span class="MustInput">*</span>日期：
		            	
		                    <input type="text" class="tbBillDate_sim TextBox " maxlength="15" onkeyup="goNextInput(&#39;incomeBill.payerName&#39;);" id="incomeDateStr" name="incomeDateStr" value="2017-07-09">
		                    <img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;incomeDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;calPosi&#39;));">
		                    <script language="javascript">
						    	setFormErrorMsg('',2,'incomeDateStr');
						    </script>
		                
	            	</td>
	        	</tr>
	        </tbody></table>
	        
	        <!-- 附加信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillElseInfo" cellspacing="0" cellpadding="0" style="position:relative;"><!-- ie6要在这里加position:relative下面的附件div才不会错位 -->
	        		<tbody><tr>
	            		<th width="84px">付款单位：</th>
	            		<td width="217px">
	            			
							<input class="tbInfo_sim TextBox" type="text" maxlength="50" onkeyup="goNextInput(&#39;costStr&#39;);" id="incomeBill.payerName" name="payerName" value="">
							
					        <script language="javascript">
					          	setFormErrorMsg('',3,'incomeBill.payerName');
					        </script>
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>经办人：</th>
	            		<td width="217px">
	            			<select type="text" class="tbInfo1 TextBox readonly" id="receiveBill.managerName" name="managerId" title="选择经办人，用于计算该经办人的收欠费产值">
            					<s:iterator value="staffers">
            						<option value="${id }">${stafferName }</option>
            					</s:iterator>
            				</select>
							
					        <script language="javascript">
					          	setFormErrorMsg('',4);
					        </script>
							
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>部门：</th>
	            		
			            
	            		
            			<td width="218px">
            				<select id="incomeBill.departmentId" name="departmentId" class="ddlInfo_sim" style="background:#f6f6f6;">
								<s:iterator value="departments">
	                    			<option value="${id }">${departmentName }</option>
                    			</s:iterator>
                			</select>
                			<script language="javascript">
						    	setFormErrorMsg('',5);
						    </script>
            			</td>
            			
	        		</tr>
	        		<tr>
	        			<th><span class="MustInput">*</span>收入类型：</th>
	            		<td>
	            			
	            			<select class="ddlInfo_sim" id="incomeBill.incomeTypeId" name="incomeTypeId">
								<s:iterator value="inComeTypes" status="indexs">
									<option value="${id }">${typeName }</option>
								</s:iterator>
								
			  				</select>
            				<script language="javascript">
								setFormErrorMsg('',6);
							</script>
            				
	            		</td>
	            		<th><span class="MustInput">*</span>收款账户：</th>
        				
        				<td>
        					<select id="incomeBill.bankAccountId" name="bankAccountId" class="ddlInfo_sim">
                				
                				<s:iterator value="bankAccounts" status="indexs">
									<option value="${id }">${accountName }(${bankName })</option>
								</s:iterator>
                				
            				</select>
            				<script language="javascript">
						    	setFormErrorMsg('',7);
						    </script>
        				</td>
        				
            			<th><span class="MustInput">*</span>收款金额：</th>
        				
        				<td>
        					<input type="text" class="tbInfo_sim TextBox" maxlength="10" onkeyup="goNextInput(&#39;incomeBill.mark&#39;);" name="costStr" id="costStr" value="">
        					<script language="javascript">
						    	setFormErrorMsg('',8,'costStr');
						    </script>
        				</td>
        				
        			</tr>
        			<tr>
        				<th>摘要：</th>
        				
        				<td colspan="5">
        					<textarea class="TextBox" name="mark" id="incomeBill.mark" style="width:764px;height:40px"></textarea>
            				<script language="javascript">
						    	setFormErrorMsg('',11,'incomeBill.mark');
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
						        	setFormErrorMsg('',12);
						    	</script>
					      	
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
				
				<input type="submit" class="buttom-a" value=" 保 存 ">
				
			</div>
			<div id="waitDiv" style="display:none">
    			<span>请稍候...</span>
			</div>
		</div>
		
	</div>
	</form>
</div>
</body></html>