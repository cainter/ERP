<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0044)http://115.28.87.22:8888/system/UserNew.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>用户 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/minierp.js.下载"></script>

<link rel="stylesheet" type="text/css" href="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/base.css">
<link href="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<script src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/QueryList.js.下载"></script>
<script src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/popup_ext.js.下载"></script>
<script src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/dhtmlgoodies_calendar.js.下载"></script>
<script language="javascript">
	function changeEnabled(){
		if(document.getElementsByName("enabledRadio")[0].checked){
			document.getElementById("user.enabled").value="Y";
		}else{
			document.getElementById("user.enabled").value="N";
		}
	}
	function changeUseValidity(){
		if(document.getElementsByName("validityRadio")[0].checked){
			document.getElementById("user.useValidity").value="Y";
		}else{
			document.getElementById("user.useValidity").value="N";
		}
	}
	function selectStaffer(){
		var url="/base/StafferMainForSelect.ihtm";
		ShowIframe("选择员工",url,800,500,"selectStafferCallBack()",400,460);
	}
	function selectStafferCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("user.stafferId").value=arr[0];
			document.getElementById("stafferName").value=arr[1];
		}
	}
	function doSave(flag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=flag;
		frm.submit();
	}
	function doCancel(){
		parent.ClosePop();
	}
	function showMe(){
		showFormErrorMsg();
		document.getElementById("user.userName").focus();
	}
	function changeTl(){
		if(document.getElementsByName("tlRadio")[0].checked){
			document.getElementById("user.timeLimit").value="Y";
			document.getElementById("user.tlStartHour").disabled=false;
			document.getElementById("user.tlStartMinute").disabled=false;
			document.getElementById("user.tlEndHour").disabled=false;
			document.getElementById("user.tlEndMinute").disabled=false;
		}else{
			document.getElementById("user.timeLimit").value="N";
			document.getElementById("user.tlStartHour").disabled=true;
			document.getElementById("user.tlStartMinute").disabled=true;
			document.getElementById("user.tlEndHour").disabled=true;
			document.getElementById("user.tlEndMinute").disabled=true;
		}
	}
	function changeAi(){
		if(document.getElementsByName("aiRadio")[0].checked){
			document.getElementById("user.allowInternet").value="Y";
		}else{
			document.getElementById("user.allowInternet").value="N";
		}
	}
	function changeApp(){
		if(document.getElementsByName("appRadio")[0].checked){
			document.getElementById("user.useApp").value="Y";
		}else{
			document.getElementById("user.useApp").value="N";
		}
	}
</script>
</head>
<body scroll="no" onload="showMe();" class="sheet modal-dialog" style=" padding-top:15px;">
<div class="sheet-main" id="bodyDiv" style="width:370px;">
	<form name="frm" action="UserRole_UserEdit" method="post">
	<input hidden name="id" value="${user.id }" />
	  <div class="sheet-list">
	    <div class="modal-main search-business" style="+zoom:1">
	    	<div style="width:100%;">
<!--  -->
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
<h3>新增用户</h3>
<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td colspan="2">
	  	<div class="msg-error" id="errorMsgDiv">
      	
      	</div>
	  </td>
	</tr>
</tbody></table> 
				<table border="0" cellspacing="1" cellpadding="1" align="center" class="table-a">
					<tbody><tr>
				      	<th><span class="MustInput">*</span>登录帐号：</th>
				      	<td>
				      		${user.userName }
				     	</td>
					</tr>
					<tr>
				      	<th><span class="MustInput">*</span>密码：</th>
				      	<td>
				      		<input type="text" class="TextBox" maxlength="15" id="currentPassword" name="password" value="${user.password }">
				      		
					        <script language="javascript">
					          	setFormErrorMsg('',2,'currentPassword');
					        </script>
				     	</td>
					</tr>
					<tr>
				      	<th><span class="MustInput">*</span>职员：</th>
				      	<td>
				      		<input type="text" class="TextBox readonly" readonly="true" id="stafferName" name="stafferName" value="">
							<img class="make-a" src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/make-a.gif" style="cursor:pointer;" onclick="selectStaffer();">
						          <script language="javascript">
						          	setFormErrorMsg('',3);
						          </script>
								<input type="hidden" id="user.stafferId" name="stafferId" value="0">
				     	</td>
					</tr>
					<tr>
				      	<th>状态：</th>
				      	<td>
				      		<input type="radio" name="enabledRadio" onclick="changeEnabled();" checked="">正常 <input type="radio" name="enabledRadio" onclick="changeEnabled();">停用
							<input type="hidden" id="user.enabled" name="enabled" value="Y">
				     	</td>
					</tr>
					<tr>
				      	<th>设置有效期：</th>
				      	<td>
				      		<input type="radio" name="validityRadio" onclick="changeUseValidity();">是 <input type="radio" name="validityRadio" onclick="changeUseValidity();" checked="">否
							<input type="hidden" id="useValidity" name="useValidity" value="N">
				     	</td>
					</tr>
					<tr>
				      	<th>有效期至：</th>
				     	<td>
				     		<input type="text" class="TextBox Datetime" maxlength="15" onkeyup="goNextInput();" id="validityStr" name="validityStr" value="">
							<img src="./用户 _ 管理易-广告加工制作管理软件 企业版 9.28 _ 易凯软件_files/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;validityStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;validityStr&#39;));">
					          <script language="javascript">
					          	setFormErrorMsg('',4,'validityStr');
					          </script>
				     	</td>
					</tr>
					<tr>
				      	<th>使用时间控制：</th>
				      	<td>
				      		<input type="radio" name="tlRadio" onclick="changeTl();">是
				      		<input type="radio" name="tlRadio" onclick="changeTl();" checked="">否
							
								<input type="hidden" id="user.timeLimit" name="timeLimit" value="N">
						          <script language="javascript">
						          	setFormErrorMsg('',5);
						          </script>
							
				     	</td>
					</tr>
					<tr>
				      	<th>使用时间范围：</th>
				      	<td>
							
							<select id="user.tlStartHour" name="tlStartHour" disabled="true">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08" selected="">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							
							
							<select id="user.tlStartMinute" name="tlStartMinute" disabled="true">
								<option value="00" selected="">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
							
							-
							
							<select id="user.tlEndHour" name="tlEndHour" disabled="true">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19" selected="">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							
							
							<select id="user.tlEndMinute" name="tlEndMinute" disabled="true">
								<option value="00" selected="">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
							
				     	</td>
					</tr>
					<tr>
				      	<th>允许外网访问：</th>
				      	<td>
				      		<input type="radio" name="aiRadio" onclick="changeAi();" checked="">是
				      		<input type="radio" name="aiRadio" onclick="changeAi();">否
							
							<input type="hidden" id="user.allowInternet" name="allowInternet" value="Y">
							
				     	</td>
					</tr>
					<tr>
				      	<th>使用手机APP：</th>
				      	<td>
				      		<input type="radio" name="appRadio" onclick="changeApp();" checked="">是
				      		<input type="radio" name="appRadio" onclick="changeApp();">否
							
							<input type="hidden" id="user.useApp" name="useApp" value="Y">
							
				     	</td>
					</tr>
				</tbody></table>
			</div>
	  	</div>
	  </div>
		<div class="modal-buttom" id="buttonDiv">
			<input type="button" class="buttom-a" value=" 修改 " onclick="doSave(&#39;0&#39;);">
			<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
			<input type="hidden" name="continue_flag" id="continue_flag" value="0">			
		</div>
		<div class="modal-buttom" id="waitDiv" style="display:none">
			<span style="color:#ffffff">请稍候...</span>
		</div>
	</form>
</div>

</body></html>