<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0060)http://115.28.87.22:8888/base/StafferNew.html?department_id= -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>员工 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function selectSuperior(){
		var url="base/StafferMainForSelect.html";
		ShowIframe("选择员工",url,800,500,"setSuperior()");
	}
	function setSuperior(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("staffer.superiorId").value=arr[0];
			document.getElementById("superiorName").value=arr[1];
		}
	}
	function seleHeadImg(){
		var url="base/CutImgForm.html";
		ShowIframe("剪切图片",url,500,500,"seleHeadImgExt()");
	}
	function seleHeadImgExt(){
		if(popRetVal!=null){
			document.getElementById("staffer.headImage").value=popRetVal;
			
			document.getElementById("headImageLink").href=popRetVal;
			document.getElementById("headImageLink").style.display="";
		}
	}
	function changeSex(){
		if(document.getElementsByName("sexRadio")[0].checked){
			document.getElementById("staffer.sex").value="MAN";
		}else{
			document.getElementById("staffer.sex").value="FEMALE";
		}
	}
	function changeEnabled(){
		if(document.getElementsByName("enabledRadio")[0].checked){
			document.getElementById("staffer.enabled").value="Y";
			document.getElementById("leaveDateStr").value="";
		}else{
			document.getElementById("staffer.enabled").value="N";
		}
	}
	function doSave(flag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=flag;
		frm.submit();
	}
	function clearSuperior(){
		document.getElementById("staffer.superiorId").value="0";
		document.getElementById("superiorName").value="";
	}
	function doCancel(){
		parent.ClosePop();
	}
	function showMe(){
		if(checkNavigator()[0]!="msie"){
			document.getElementById("accessory_file").className="";
			document.getElementById("attach_file").className="";
		}
		showFormErrorMsg();
		document.getElementById("staffer.stafferName").focus();
	}
</script>
</head>
<body onload="showMe();" class="sheet modal-dialog" style=" padding-top:15px;">
<div class="sheet-main" id="bodyDiv" style="width:860px;">
	<form name="frm" method="post" enctype="multipart/form-data">
	  <div class="sheet-list" style="width:100%">
	    <div class="modal-main search-business">
	    	<div style="width:100%;">
				
				
				
				
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
<h3>新增员工</h3>
<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td colspan="2">
	  	<div class="msg-error" id="errorMsgDiv">
      	
      	</div>
	  </td>
	</tr>
</tbody></table> 
				<table border="0" cellspacing="1" cellpadding="1" align="center" class="table-a2">
					<tbody><tr>
				      	<th><span class="MustInput">*</span>编号：</th>
				      	
				      	<td>
							
				      		
				      			
								
				      		
							<input type="text" maxlength="15" onkeyup="goNextInput(&#39;staffer.stafferName&#39;);" id="staffer.stafferCode" name="staffer.stafferCode" value="" disabled="" class="TextBox readonly">
					          <script language="javascript">
					          	setFormErrorMsg('',1,'staffer.stafferCode');
					          </script>
				     	</td>
				     	
				      	<th><span class="MustInput">*</span>姓名：</th>
				     	
				     	<td>
				     		<input type="text" class="TextBox" maxlength="15" onkeyup="goNextInput(&#39;birthdayStr&#39;);" id="staffer.stafferName" name="staffer.stafferName" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',2,'staffer.stafferName');
					          </script>
				     	</td>
				     	
				      	<th><span class="MustInput">*</span>性别：</th>
				      	<td>
				      		<input type="radio" name="sexRadio" onclick="changeSex();" checked="">男
							<input type="radio" name="sexRadio" onclick="changeSex();">女
							
								<input type="hidden" id="staffer.sex" name="staffer.sex" value="MAN">
						          <script language="javascript">
						          	setFormErrorMsg('',3);
						          </script>
							
				      	</td>
				    </tr>
				    <tr>
				    	<th>生日：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="goNextInput(&#39;staffer.origin&#39;);" id="birthdayStr" name="birthdayStr" value="">
							<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;birthdayStr&#39;),&#39;yyyy-mm-dd&#39;,this);">
					          <script language="javascript">
					          	setFormErrorMsg('',4,'birthdayStr');
					          </script>
				    	</td>
				    	
				    	<th>籍贯：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="10" onkeyup="goNextInput(&#39;staffer.household&#39;);" id="staffer.origin" name="staffer.origin" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',5,'staffer.origin');
					          </script>
				    	</td>
				    	
				    	<th>户口：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="10" onkeyup="goNextInput(&#39;staffer.phone&#39;);" id="staffer.household" name="staffer.household" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',6,'staffer.household');
					          </script>
				    	</td>
				    	
				    </tr>
					<tr>
				    	<th>电话：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="20" onkeyup="goNextInput(&#39;staffer.subPhone&#39;);" id="staffer.phone" name="staffer.phone" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',7,'staffer.phone');
					          </script>
				    	</td>
				    	
				    	<th>分机：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="10" onkeyup="goNextInput(&#39;staffer.qq&#39;);" id="staffer.subPhone" name="staffer.subPhone" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',8,'staffer.subPhone');
					          </script>
				    	</td>
				    	
				    	<th>qq：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="15" onkeyup="goNextInput(&#39;staffer.mobile&#39;);" id="staffer.qq" name="staffer.qq" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',9,'staffer.qq');
					          </script>
				    	</td>
				    	
				    </tr>
				    <tr>
						<th>手机：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="20" onkeyup="goNextInput(&#39;staffer.subMobile&#39;);" id="staffer.mobile" name="staffer.mobile" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',10,'staffer.mobile');
					          </script>
				    	</td>
				    	
				    	<th>移动短号：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="15" onkeyup="goNextInput(&#39;staffer.email&#39;);" id="staffer.subMobile" name="staffer.subMobile" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',11,'staffer.subMobile');
					          </script>
				    	</td>
				    	
				    	<th>电子邮件：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="50" onkeyup="goNextInput(&#39;staffer.possie&#39;);" id="staffer.email" name="staffer.email" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',12,'staffer.email');
					          </script>
				    	</td>
				    	
				    </tr>
					<tr>
				    	<th><span class="MustInput">*</span>部门：</th>
				    	
				    	<td>
				    		<select name="staffer.departmentId" id="staffer.departmentId" style="width:152px;">
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
					        <script language="javascript">
					          	setFormErrorMsg('',13);
					        </script>
				    	</td>
				    	
				    	<th>职位：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox" maxlength="15" onkeyup="goNextInput(&#39;inDateStr&#39;);" id="staffer.possie" name="staffer.possie" value="">
					          <script language="javascript">
					          	setFormErrorMsg('',14,'staffer.possie');
					          </script>
				    	</td>
				    	
						<th>上级：</th>
				    	<td>
				    		
				    		<input type="text" class="TextBox readonly" style="width:86px" readonly="true" id="superiorName" name="superiorName" value="">
							<img class="make-a" src="images/icon_add.gif" style="cursor:pointer;" onclick="selectSuperior();" title="员工只有设置了上级，上级才能在&#39;我的客户&#39;查看到下级的客户，在日历上查看到下级的日志">
							<img class="make-a" src="images/icon_del.gif" style="cursor:pointer;" onclick="clearSuperior();">
				    		
				    		
								<input type="hidden" id="staffer.superiorId" name="staffer.superiorId" value="0">
								<script language="javascript">
					          	setFormErrorMsg('',15);
					          	</script>
							
				    	</td>
				    </tr>
					<tr>
						<th>入职日期：</th>
				    	
				    	<td>
				    		<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="goNextInput(&#39;staffer.mark&#39;);" id="inDateStr" name="inDateStr" value="2017-07-11">
							<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;inDateStr&#39;),&#39;yyyy-mm-dd&#39;,this);">
					          <script language="javascript">
					          	setFormErrorMsg('',16,'inDateStr');
					          </script>
				    	</td>
				    	
				    	<th>状态：</th>
				    	<td>
				    		<input type="radio" name="enabledRadio" onclick="changeEnabled();" checked="">在职
				    		<input type="radio" name="enabledRadio" onclick="changeEnabled();">离职
							
							<input type="hidden" id="staffer.enabled" name="staffer.enabled" value="Y">
							
				    	</td>
						
						<th>离职日期：</th>
				    	<td>
							<input type="text" class="TextBox Datetime" maxlength="15" id="leaveDateStr" name="leaveDateStr" value="">
							<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;leaveDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;leaveDateStr&#39;));">
					          <script language="javascript">
					          	setFormErrorMsg('',17,'leaveDateStr');
					          </script>
				    	</td>
						
					</tr>
					<tr>
				    	<th>简历：</th>
				    	<td>
				    		<input type="file" class="" style="width:150px" id="accessory_file" name="accessory_file">
							
							
						          <script language="javascript">
						          	setFormErrorMsg('',18,'accessory_file');
						          </script>
							
				    	</td>
						<th>身份证图片：</th>			    	
				    	<td>
				    		<input type="file" class="" style="width:150px" name="attach_file" id="attach_file">
							
							
						          <script language="javascript">
						          	setFormErrorMsg('',19,'attach_file');
						          </script>
					      	
				    	</td>
				    	<th>个人头像：</th>			    	
				    	<td>
				    		<a href="javascript:seleHeadImg();">选择头像</a>
				    		<a href="" id="headImageLink" target="_blank" style="display:none">查看</a>
							
								<input type="hidden" name="staffer.headImage" id="staffer.headImage" value="">
						        <script language="javascript">
						          	setFormErrorMsg('',19,'head_file');
						    	</script>
					      	
				    	</td>
				    </tr>
					<tr>
				    	<th>备注：</th>
				    	
				    	<td colspan="5">
				    		<textarea class="TextBox" style="width:660px;height:100px" id="staffer.mark" name="staffer.mark"></textarea>
					          <script language="javascript">
					          	setFormErrorMsg('',18,'staffer.mark');
					          </script>
				    	</td>
				    	
				    </tr>
				</tbody></table>
			</div>
	  	</div>
	  </div>
		<div class="modal-buttom" id="buttonDiv">
			<input type="button" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;0&#39;);">
			<input type="button" class="buttom-a" value="保存并新增" onclick="doSaveAndContinue(&#39;1&#39;);">
			<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
			<input type="hidden" name="continue_flag" id="continue_flag" value="0">
		</div>
		<div class="modal-buttom" id="waitDiv" style="display:none">
			<span style="color:#ffffff">请稍候...</span>
		</div>
	</form>
</div>		

</body></html>