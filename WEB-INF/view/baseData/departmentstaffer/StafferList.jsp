<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>员工 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script language="javascript">
	function doNew(){
		var url="departStaff_toStafferNew";
		parent.ShowIframe("员工",url,900,475,"refreshStaWin()",900,640);//refreshStaWin是父窗口的
	}
	function refreshWin(){//父窗口的refreshStaWin调用
		window.location.reload(true);
	}
	function doEdit(id){
		var url="departStaff_toStafferEdit";
		parent.ShowIframe("员工",url,900,475,"refreshStaWin()",900,640);//refreshStaWin是父窗口的
	}
	function doDelete(id){
		parent.ShowConfirm('确认框','删除员工将同时删除该员工的所有账号，确定删除吗？',340,80,"doDelSta("+id+")");//doDelSta是父窗口的
	}
	function doDelAct(id){//是父窗口的doDelSta调用
		var fromUrl=getFromUrl();
		window.location="../base/StafferDelete.html?id="+id+"&from_url="+fromUrl;
	}
	function getFromUrl(){
		var departmentId="";
		var searchKey=encodeURIComponent("");
		var searchAll="1";
		var fromUrl="../base/StafferList.html?department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
		return encodeURIComponent(fromUrl);
	}
	function doSearch(){
		var departmentId="";
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var searchAll="";
		if(document.getElementById("search_all").checked){
			searchAll="1";
		}
		window.location="../base/StafferList.html?department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
	}
	function doInit(){
		Window_Onload();
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doDownload(){
		var departmentId="";
		var searchKey=encodeURIComponent("");
		var searchAll="1";
		window.location="../base/StafferList.html?content_type=EXCEL&department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
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
		doEdit(str);
	}
	function doPause(id){
		var fromUrl=getFromUrl();
		window.location="../base/StafferPause.html?id="+id+"&from_url="+fromUrl;
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" scroll="no" style="background: #EAFAFF;">
		<div id="scrollDiv" style="OVERFLOW:auto;height:508px">
		  <div class="main search-business">
			   <div class="cue-info">
					<h4>
						所有部门 - 员工
						
					</h4>				   	
			  </div>
			  <div class="content">		
				  <div align="right">
					<input class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" title="以员工姓名、姓名拼音字头进行模糊查询" type="text">
					<input id="search_all" name="search_all" checked="checked" type="checkbox">在所有部门中查找
					<input class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以员工姓名、姓名拼音字头进行模糊查询" type="button">		
					<input class="buttom search-add " value=" 新 增" onclick="doNew();" type="button">
					<input class="buttom search-out" value=" 导 出" onclick="doDownload();" type="button">
				  </div>
			  </div>			  
			  
<table width="98%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
			  <div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
			  	<span>在职人数：20</span>&nbsp;&nbsp;
				<span>离职人数：7</span>&nbsp;&nbsp;
						<table width="100%">
							<tbody><tr>
								<th width="15%">部门</th>
								<th width="15%">姓名</th>
								<th width="13%">职位</th>
								<th width="15%">上级</th>
								<th width="16%">入职日期</th>
								<th width="10%">状态</th>
								<th width="16%">操作</th>
							</tr>
							
							
							
							<tr class="query_list_data_trSelected" index="1" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="61" style="display:none" checked="checked" type="radio">
									财务部
								</td>
								<td>何盼盼</td>
								<td></td>
								<td></td>
								<td>2017-07-03</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('61');">编辑</a>
									<a href="javascript:doPause('61');">停用</a>
									<a href="javascript:doDelete('61');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="2" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="55" style="display:none" type="radio">
									财务部
								</td>
								<td>郭登云</td>
								<td>会计</td>
								<td></td>
								<td>2017-06-15</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('55');">编辑</a>
									<a href="javascript:doPause('55');">停用</a>
									<a href="javascript:doDelete('55');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="3" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="51" style="display:none" type="radio">
									标识汇运营部
								</td>
								<td>杨海波</td>
								<td></td>
								<td></td>
								<td>2017-03-15</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('51');">编辑</a>
									<a href="javascript:doPause('51');">停用</a>
									<a href="javascript:doDelete('51');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="4" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="47" style="display:none" type="radio">
									标识汇运营部
								</td>
								<td>刘帅盟</td>
								<td></td>
								<td></td>
								<td>2017-02-22</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('47');">编辑</a>
									<a href="javascript:doPause('47');">停用</a>
									<a href="javascript:doDelete('47');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="5" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="65" style="display:none" type="radio">
									标识汇运营部
								</td>
								<td>标识汇</td>
								<td></td>
								<td></td>
								<td>2017-07-04</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('65');">编辑</a>
									<a href="javascript:doPause('65');">停用</a>
									<a href="javascript:doDelete('65');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="6" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="52" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>钟海东</td>
								<td>批灰打磨   喷漆</td>
								<td></td>
								<td>2017-05-21</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('52');">编辑</a>
									<a href="javascript:doPause('52');">停用</a>
									<a href="javascript:doDelete('52');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="7" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="42" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>徐俊岩</td>
								<td>库管  下料 组装</td>
								<td></td>
								<td>2016-09-07</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('42');">编辑</a>
									<a href="javascript:doPause('42');">停用</a>
									<a href="javascript:doDelete('42');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="8" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="50" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>魏振武</td>
								<td>画框 下料  组装</td>
								<td></td>
								<td>2017-03-10</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('50');">编辑</a>
									<a href="javascript:doPause('50');">停用</a>
									<a href="javascript:doDelete('50');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="9" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="40" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>王孟玉</td>
								<td>库管  组装</td>
								<td></td>
								<td>2016-08-02</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('40');">编辑</a>
									<a href="javascript:doPause('40');">停用</a>
									<a href="javascript:doDelete('40');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="10" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="53" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>李显</td>
								<td>焊接  焊接打磨   组装</td>
								<td></td>
								<td>2017-05-21</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('53');">编辑</a>
									<a href="javascript:doPause('53');">停用</a>
									<a href="javascript:doDelete('53');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="11" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="49" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>林付安</td>
								<td>标识焊接   焊接打磨</td>
								<td></td>
								<td>2017-03-10</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('49');">编辑</a>
									<a href="javascript:doPause('49');">停用</a>
									<a href="javascript:doDelete('49');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="12" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="34" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>贾文博</td>
								<td>打印  组装</td>
								<td></td>
								<td>2016-08-01</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('34');">编辑</a>
									<a href="javascript:doPause('34');">停用</a>
									<a href="javascript:doDelete('34');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="13" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="48" style="display:none" type="radio">
									标识加工车间
								</td>
								<td>范贺华</td>
								<td>喷漆    丝印   组装</td>
								<td></td>
								<td>2017-03-10</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('48');">编辑</a>
									<a href="javascript:doPause('48');">停用</a>
									<a href="javascript:doDelete('48');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="14" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="46" style="display:none" type="radio">
									业务来源
								</td>
								<td>张永灿</td>
								<td></td>
								<td></td>
								<td>2016-11-16</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('46');">编辑</a>
									<a href="javascript:doPause('46');">停用</a>
									<a href="javascript:doDelete('46');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="15" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="43" style="display:none" type="radio">
									业务来源
								</td>
								<td>邵丽萍</td>
								<td>会计</td>
								<td></td>
								<td>2016-11-12</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('43');">编辑</a>
									<a href="javascript:doPause('43');">停用</a>
									<a href="javascript:doDelete('43');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="16" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="16" style="display:none" type="radio">
									业务来源
								</td>
								<td>黄秀娟</td>
								<td></td>
								<td></td>
								<td>2016-03-04</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('16');">编辑</a>
									<a href="javascript:doPause('16');">停用</a>
									<a href="javascript:doDelete('16');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="17" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="45" style="display:none" type="radio">
									业务来源
								</td>
								<td>韩柯洋</td>
								<td></td>
								<td></td>
								<td>2016-11-16</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('45');">编辑</a>
									<a href="javascript:doPause('45');">停用</a>
									<a href="javascript:doDelete('45');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="18" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="17" style="display:none" type="radio">
									业务来源
								</td>
								<td>伏龙</td>
								<td>经理</td>
								<td>黄秀娟</td>
								<td>2016-03-04</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('17');">编辑</a>
									<a href="javascript:doPause('17');">停用</a>
									<a href="javascript:doDelete('17');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="19" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="12" style="display:none" type="radio">
									易凯管理员
								</td>
								<td>秦朝阳</td>
								<td></td>
								<td></td>
								<td>2016-03-04</td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('12');">编辑</a>
									<a href="javascript:doPause('12');">停用</a>
									<a href="javascript:doDelete('12');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="20" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="-1" style="display:none" type="radio">
									易凯管理员
								</td>
								<td>管理员</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									在职
									
								</td>
								<td>
									<a href="javascript:doEdit('-1');">编辑</a>
									
									
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="21" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="32" style="display:none" type="radio">
									标识汇运营部
								</td>
								<td>张志青</td>
								<td></td>
								<td></td>
								<td>2016-08-01</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('32');">编辑</a>
									
									<a href="javascript:doDelete('32');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="22" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="44" style="display:none" type="radio">
									标识汇运营部
								</td>
								<td>邵添磊</td>
								<td></td>
								<td></td>
								<td>2016-11-19</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('44');">编辑</a>
									
									<a href="javascript:doDelete('44');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="23" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="41" style="display:none" type="radio">
									财务
								</td>
								<td>黄冬英</td>
								<td>会计</td>
								<td>秦朝阳</td>
								<td>2016-08-13</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('41');">编辑</a>
									
									<a href="javascript:doDelete('41');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="24" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="26" style="display:none" type="radio">
									客服
								</td>
								<td>温艳丽</td>
								<td>客服</td>
								<td>伏龙</td>
								<td>2016-03-04</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('26');">编辑</a>
									
									<a href="javascript:doDelete('26');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="25" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="27" style="display:none" type="radio">
									客服
								</td>
								<td>时慧杰</td>
								<td>客服</td>
								<td>伏龙</td>
								<td>2016-03-04</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('27');">编辑</a>
									
									<a href="javascript:doDelete('27');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="26" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="31" style="display:none" type="radio">
									新异店
								</td>
								<td>姚鑫鑫</td>
								<td>会计</td>
								<td></td>
								<td>2016-07-18</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('31');">编辑</a>
									
									<a href="javascript:doDelete('31');">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="27" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
								<td>
									<input onclick="javascript:ClickCheck(this);" name="query_checkbox" value="30" style="display:none" type="radio">
									新异店
								</td>
								<td>王春辉</td>
								<td>会计</td>
								<td></td>
								<td>2016-07-11</td>
								<td>
									
									<font color="#ff0000">离职</font>
								</td>
								<td>
									<a href="javascript:doEdit('30');">编辑</a>
									
									<a href="javascript:doDelete('30');">删除</a>
								</td>
							</tr>
														
						</tbody></table>
			  </div>
			</div>
		</div>

</body></html>