<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!-- saved from url=(0076)http://115.28.87.22:8888/base/EstablishmentCommunicateNew.html?client_id=757 -->

<!-- saved from url=(0078)http://115.28.87.22:8888/base/EstablishmentCommunicateNew.ihtm?alert_type=NONE -->

<!-- saved from url=(0076)http://115.28.87.22:8888/base/EstablishmentCommunicateNew.ihtm?client_id=757 -->

<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>日程 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<script src="js/popup_ext.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doSave(contFlag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=contFlag;
		frm.submit();
	}
	function doReply(parentId){
		window.location="EstablishmentCommunicateNew.html?parent_id="+parentId;
	}
	function doCancel(){
		parent.ClosePop();
	}
	function showMe(){
		if(checkNavigator()[0]!="msie" && parent.document.getElementById("dialogBox")){
			document.getElementById("attach_file").className="";
		}
		showFormErrorMsg();
		var childrenNum=0;
		if(childrenNum>0){
			document.getElementById("childrenDiv").style.display="";
		}
		document.getElementById("communicate.title").focus();
	}
	function changeTimeSelect(obj,targetName){
		document.getElementById(targetName).value=obj.value;
	}
	function selectCommunicater(){
		var url="./StafferMainForSelect.html";
		ShowIframe("选择员工",url,800,500,"selectCommunicaterCallBack()",980,440);
	}
	function selectCommunicaterCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("communicate.communicaterName").value=arr[1];
		}
	}
	function selectEst(){
		var url="./EstablishmentListForSelect.html?type=CLIENT";
		ShowIframe("选择客户",url,900,500,"selectEstCallBack()",980,440);
	}
	function selectEstCallBack(){
		if(popRetVal!=null){
			document.getElementById("communicate.estId").value=popRetVal[0];
			document.getElementById("estName").value=popRetVal[1];
		}
	}
	function changeCommType(){
		if(document.getElementById("commType1").checked){
			document.getElementById("communicate.commType").value="LOG";
			document.getElementById("forAllTr").style.display="none";
			document.getElementById("smsRemindTr").style.display="none";
		}else{
			document.getElementById("communicate.commType").value="PLAN";
			document.getElementById("forAllTr").style.display="";
			document.getElementById("smsRemindTr").style.display="";
		}
	}
	function changeForAll(){
		if(document.getElementById("forAll1").checked){
			document.getElementById("communicate.forAll").value="Y";
		}else{
			document.getElementById("communicate.forAll").value="N";
		}
	}
	function changeSmsRemind(){
		if(document.getElementById("communicate.smsRemind").value=="Y"){
			document.getElementById("srDateStr").disabled=false;
			document.getElementById("srDateHourSelect").disabled=false;
			document.getElementById("srDateMinuteSelect").disabled=false;
		}else{
			document.getElementById("srDateStr").disabled=true;
			document.getElementById("srDateHourSelect").disabled=true;
			document.getElementById("srDateMinuteSelect").disabled=true;
		}
	}
	function showReceiver(){
		
		if(document.getElementById("forAll2").checked){
			var url="./EstCommReceiverList.html";
			url=url+"?tmp_code=1_1499328651427";
			
			ShowIframe("参与人员",url,350,400,"");
		}
		
	}
	function doDelete(id){
		ShowConfirm('确认框','确定删除吗？',340,80,"doDelAct("+id+")");
	}
	function doDelAct(id){
		if(popRetVal!=null){
			window.location="./EstablishmentCommunicateDelete.html?id="+id;
		}
	}
	function doComplete(id){
		var url="./EstCommCompForm.html?id="+id;
		ShowIframe("完成情况",url,600,300,"doCompCallback()");
	}
	function doCompCallback(){
		if(popRetVal!=null){
			window.location.reload(true);
		}
	}
	function doSms(commId){
		var content="07-05 17:00 ";
		var content="07-06 16:10 ";
		var url="/sms/SmsSendForm.html?comm_id="+commId+"&content="+encodeURIComponent(content);
		showWin(900,500,url);
	}
	function showExt(){
		if(document.getElementById("extTbl").style.display=="none"){
			document.getElementById("extTbl").style.display="";
			document.getElementById("extSpan").innerHTML="隐藏更多内容";
		}else{
			document.getElementById("extTbl").style.display="none";
			document.getElementById("extSpan").innerHTML="展开更多内容";
		}
	}
</script>
</head>
<body onload="showMe();" class="sheet modal-dialog" style=" padding-top:10px;">
<div class="sheet-main" id="bodyDiv" style="width:940px;">
	<form action="MyComm_saveNewComm" method="post" enctype="multipart/form-data">
	  <div class="sheet-list" style="width:100%;">
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
<h3>新增日程</h3>
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
				      	<th><span class="MustInput">*</span>主题：</th>
				      	
				      	<td>
							<input type="text" maxlength="50" class="TextBox" style="width:160px" onkeyup="goNextInput(&#39;communicate.content&#39;);" id="communicate.title" name="title" value="">
					        <script language="javascript">
					          	setFormErrorMsg('',2,'communicate.title');
					        </script>
				     	</td>
				     	
				      	<th><span class="MustInput">*</span>日期：</th>
				     	
				     	<td>
							<input type="text" class="TextBox Datetime" maxlength="15" id="communicateTimeStr" name="communicateTimeStr" value="2017-07-05"><img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;communicateTimeStr&#39;),&#39;yyyy-mm-dd&#39;,this);">
							<select id="orderDateHourSelect" onchange="changeTimeSelect(this,&#39;communicateTimeHour&#39;);">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17" selected="">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<select id="orderDateMinuteSelect" onchange="changeTimeSelect(this,&#39;communicateTimeMinute&#39;);">
								<option value="00" selected="">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
					          <script language="javascript">
					          	setFormErrorMsg('',3,'communicateTimeStr');
					          </script>
				     	</td>
				     	
						<th>客户：</th>
				      	<td>
							
							
							<select class="TextBox readonly" readonly="true" style="width:150px" id="estName" name="estName">
								<s:iterator value="staffers" status="indexs">
								  <option value="${id }">${stafferName }</option>
								</s:iterator>
							</select>
							
							<img class="make-a" src="images/make-a.gif" onclick="selectEst();" style="cursor:pointer;">
							
							
					          <script language="javascript">
					          	setFormErrorMsg('',4);
					          </script>
							
				     	</td>
				    </tr>
					<tr>
				    	<th><span class="MustInput">*</span>内容：</th>
				    	
				    	<td colspan="5">
				    		<textarea class="TextBox" style="width:600px;height:120px" id="communicate.content" name="content"></textarea>
					          <script language="javascript">
					          	setFormErrorMsg('',5,'communicate.content');
					          </script>
				    	</td>
				    	
				    </tr>
				    <tr>
						<th>附件：</th>			    	
				    	<td colspan="5">
				    		<input type="file" class="" style="width:300px" name="attach_file" id="attach_file">
							
							
					          <script language="javascript">
					          	setFormErrorMsg('',6);
					          </script>
					      	
				    	</td>
					</tr>
					<tr>
				    	<th><span class="MustInput">*</span>类型：</th>
				    	<td colspan="5">
							
								<span title="记录已发生的活动"><input type="radio" name="commType" id="commType1" onclick="changeCommType();" checked="true">日志</span>
								<span title="安排下一步的工作"><input type="radio" name="commType" id="commType2" onclick="changeCommType();">任务</span>
								
									<input type="hidden" name="commType" id="communicate.commType" value="LOG">
								
							
							
							<a href="javascript:showExt();"><span id="extSpan">展开更多内容</span></a>
				    	</td>
				    </tr>
				</tbody></table>
				<table border="0" cellspacing="1" cellpadding="1" align="center" class="table-a2" id="extTbl" style="display:none">
					<tbody><tr>
						<th style="height:0px"></th>
						<td></td>
						<th></th>
						<td></td>
						<th></th>
						<td></td>
					</tr>
				    <tr>
						<th>上级任务：</th>
						
				    	<td colspan="5">
				    		<input type="text" class="TextBox readonly" readonly="true" style="width:300px" name="parentTitle" id="parentTitle" value="">
				    	</td>
				    	
					</tr>
					<tr id="forAllTr" style="display:none">
			    		<th><span class="MustInput">*</span>是否公开：</th>
				    	<td colspan="5">
							<input type="radio" id="forAll1" onclick="changeForAll();">全员公开
							<input type="radio" id="forAll2" onclick="changeForAll();" checked="">指定参与人
							<span><a href="javascript:showReceiver();">设置参与人员...</a></span>
							
								<input type="hidden" name="forAll" id="communicate.forAll" value="N">
							
				    	</td>
				    </tr>
					<tr id="smsRemindTr" style="display:none">
			    		<th><span class="MustInput">*</span>定时提醒：</th>
				    	<td colspan="5">
							
							<select name="smsRemind" id="communicate.smsRemind" onchange="changeSmsRemind();">
								<option value="Y">是</option>
								<option value="N" selected="">否</option>
							</select>
							
							

							<input type="text" class="TextBox Datetime" maxlength="15" id="srDateStr" name="srDateStr" value="2017-07-05" disabled="true">

							<input type="text" class="TextBox Datetime" maxlength="15" id="srDateStr" name="srDateStr" value="2017-07-06" disabled="true">

					          <script language="javascript">
					          	setFormErrorMsg('',6,'srDateStr');
					          </script>
							
							<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;srDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;parentTitle&#39;));">
							<select id="srDateHourSelect" onchange="changeTimeSelect(this,&#39;srDateHour&#39;);" disabled="true">

								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18" selected="">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<select id="srDateMinuteSelect" onchange="changeTimeSelect(this,&#39;srDateMinute&#39;);" disabled="true">
								<option value="00" selected="">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>

								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17" selected="">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<select id="srDateMinuteSelect" onchange="changeTimeSelect(this,&#39;srDateMinute&#39;);" disabled="true">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10" selected="">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>

							</select>
							<span class="fei">（发送消息提醒自己与参与人）</span>
				    	</td>
				    </tr>
				</tbody></table>
				<table border="0" cellspacing="1" cellpadding="1" align="center" class="table-a2">
					<tbody><tr>
						<th style="height:0px"></th>
						<td></td>
						<th></th>
						<td></td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td colspan="5">
							<p class="give">
								<span>注：日志只能当天修改，过期只有系统管理员admin可删除；任务的修改删除不受限制</span>
							</p>
							
						</td>
					</tr>
				</tbody></table>
				<div id="childrenDiv" style="width:100%;height:60px;OVERFLOW-Y:auto;display:none">
				<table class="table-b" align="center">
					
				</table>
				</div>
			</div>
	  	</div>
	  </div>
		<div class="modal-buttom" id="buttonDiv">
			<input type="submit" class="buttom-a" value=" 保 存 ">
			
				<input type="button" class="buttom-a" value="保存并新增" onclick="doSave(&#39;1&#39;);">
			
			
			<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
			<input type="hidden" name="continue_flag" id="continue_flag" value="0">

			<input type="hidden" id="communicateTimeHour" name="communicateTimeHour" value="17">
			<input type="hidden" id="communicateTimeMinute" name="communicateTimeMinute" value="00">
			<input type="hidden" id="srDateHour" name="srDateHour" value="18">
			<input type="hidden" id="srDateMinute" name="srDateMinute" value="00">
			<input type="hidden" id="tmpCode" name="tmpCode" value="25_1499245222861">

			<input type="hidden" id="communicateTimeHour" name="communicateTimeHour" value="16">
			<input type="hidden" id="communicateTimeMinute" name="communicateTimeMinute" value="10">
			<input type="hidden" id="srDateHour" name="srDateHour" value="17">
			<input type="hidden" id="srDateMinute" name="srDateMinute" value="10">
			<input type="hidden" id="tmpCode" name="tmpCode" value="1_1499328651427">
		</div>
		<div class="modal-buttom" id="waitDiv" style="display:none">
			<span style="color:#ffffff">请稍候...</span>
		</div>
		
	</form>
</div>		
<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>

</body></html>
