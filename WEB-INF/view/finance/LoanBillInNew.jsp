<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0078)http://115.28.87.22:8888/finance/LoanBillNew.html?alert_type=SHOW&bill_type=IN -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>资金借入单 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
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
			if(window.opener){
				document.getElementById("print_flag").value="REDI";
			}else{
				document.getElementById("print_flag").value="NEW_WIN";
			}
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
			document.getElementById("loanBill.managerId").value=arr[0];
			document.getElementById("loanBill.managerName").value=arr[1];
			
			if(document.getElementById("loanBill.rpName").value==""){
				document.getElementById("loanBill.rpName").value=arr[1];
			}
			var depObj=document.getElementById("loanBill.departmentId");
			for(var i=0;i<depObj.options.length;i++){
				if(arr[2]==depObj.options[i].value){
					depObj.options[i].selected=true;
					break;
				}
			}
		}
	}
	function doPrint(id){
		showWin(900,360,"finance/LoanBillPrint.html?id="+id);
	}
	function showMe(){
		showFormErrorMsg();
		document.getElementById("costStr").focus();
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
		            <td width="301px;" rowspan="2"><h1>资金借入单</h1></td>
		            <td width="301px;" class="tr vb codeTd"> 
		                <span class="MustInput">*</span>编号：
		                
				    	<input type="text" class="tbBillCode TextBox disabled" readonly="readonly" maxlength="30" onkeyup="goNextInput(&#39;loanDateStr&#39;);" id="loanBill.billCode" name="loanBill.billCode" value="">
				    	<script language="javascript">
							setFormErrorMsg('',1,'loanBill.billCode');
						</script>
			     		
		            </td>
	        	</tr>
	        	<tr>
	            	<td class="tr">
	            		<span id="calPosi"></span>
		            	<span class="MustInput">*</span>日期：
		            	
		                    <input type="text" class="tbBillDate_sim TextBox " maxlength="15" onkeyup="goNextInput(&#39;loanBill.rpName&#39;);" id="loanDateStr" name="loanDateStr" value="2017-07-09">
		                    <img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;loanDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;calPosi&#39;));">
		                    <script language="javascript">
						    	setFormErrorMsg('',2,'loanDateStr');
						    </script>
		                
	            	</td>
	        	</tr>
	        </tbody></table>

			<!-- 附加信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillElseInfo" cellspacing="0" cellpadding="0" style="position:relative;"><!-- ie6要在这里加position:relative下面的附件div才不会错位 -->
	        		<tbody><tr>
	            		<th width="84px"><span class="MustInput">*</span>借款人：</th>
	            		<td width="217px">
	            			
							<input class="tbInfo_sim TextBox" type="text" maxlength="15" onkeyup="goNextInput(&#39;costStr&#39;);" id="loanBill.rpName" name="loanBill.rpName" value="标识汇">
					        <script language="javascript">
					          	setFormErrorMsg('',3,'loanBill.rpName');
					        </script>
					        
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>经办人：</th>
	            		<td width="217px">
	            			
							<input class="tbInfo_sim TextBox readonly" type="text" id="loanBill.managerName" name="loanBill.managerName" value="标识汇">
							
							<img class="make-a" src="images/make-a.gif" style="cursor:pointer;" onclick="selectStaffer();">
							
							<input type="hidden" id="loanBill.managerId" name="loanBill.managerId" value="65">
					        <script language="javascript">
					          	setFormErrorMsg('',4);
					        </script>
							
	            		</td>
	            		<th width="84px"><span class="MustInput">*</span>部门：</th>
	            		
			            
	            		
            			<td width="218px">
            				<select id="loanBill.departmentId" name="loanBill.departmentId" class="ddlInfo_sim" style="background:#f6f6f6;">
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
<option value="32" selected="">标识汇运营部</option>
<option value="33">财务部</option>
                			</select>
                			<script language="javascript">
						    	setFormErrorMsg('',5);
						    </script>
            			</td>
            			
	        		</tr>
	        		<tr>
	            		<th><span class="MustInput">*</span>收款账户：</th>
        				
        				<td>
        					<select id="loanBill.bankAccountId" name="loanBill.bankAccountId" class="ddlInfo_sim">
                				
                				
                					<option value="10">建行(秦朝阳)</option>
                				
                					<option value="12">黄秀娟(长通物流(6116))</option>
                				
                					<option value="9">工行(黄秀娟)</option>
                				
                					<option value="8">交行(秦朝阳)</option>
                				
                					<option value="13">黄秀娟(创新物流(5165))</option>
                				
                					<option value="14">黄秀娟(豫鑫物流（73035）)</option>
                				
                					<option value="4">农行(黄秀娟)</option>
                				
                					<option value="15">黄秀娟(微信15225099188)</option>
                				
                					<option value="11">中行(秦朝阳)</option>
                				
                					<option value="7"> 浦发(公司一般户)</option>
                				
                					<option value="2">中行(公司基本户)</option>
                				
                					<option value="1">现金(会计)</option>
                				
                					<option value="5">浦发(POS机刷卡)</option>
                				
                					<option value="6">淘宝 黄秀娟(支付宝 15225099188)</option>
                				
                					<option value="16">浦发(黄秀娟)</option>
                				
                					<option value="17">秦朝阳(微信13608675408)</option>
                				
            				</select>
            				<script language="javascript">
						    	setFormErrorMsg('',7);
						    </script>
        				</td>
        				
            			<th><span class="MustInput">*</span>收款金额：</th>
        				
        				<td>
        					<input type="text" class="tbInfo_sim TextBox" maxlength="10" onkeyup="goNextInput(&#39;loanBill.mark&#39;);" name="costStr" id="costStr" value="">
        					<script language="javascript">
						    	setFormErrorMsg('',8,'costStr');
						    </script>
        				</td>
        				
        				<th>&nbsp;</th>
	            		<td>&nbsp;</td>
        			</tr>
        			<tr>
        				<th>摘要：</th>
        				
        				<td colspan="5">
        					<textarea class="TextBox" name="loanBill.mark" id="loanBill.mark" style="width:764px;height:40px"></textarea>
            				<script language="javascript">
						    	setFormErrorMsg('',11,'loanBill.mark');
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
				
				<input type="submit" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;&#39;);">
				
					<input type="button" class="buttom-a" value="保存并新增" onclick="doSave(&#39;NEW&#39;);">
					<input type="button" class="buttom-a" value="保存并复制" onclick="doSave(&#39;COPY&#39;);">
				
				<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
				<input type="hidden" name="continue_flag" id="continue_flag" value="">
				<input type="hidden" id="examine" name="examine" value="0">
				<input type="hidden" name="print_flag" id="print_flag" value="">
			</div>
			<div id="waitDiv" style="display:none">
    			<span>请稍候...</span>
			</div>
		</div>
		
	</div>
	</form>
</div>


</body></html>