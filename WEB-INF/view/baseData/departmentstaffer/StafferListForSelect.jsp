<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://115.28.87.22:8888/base/StafferListForSelect.ihtm?type= -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>选择员工 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="../js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="../css/base.css">
<link href="../css/Query.css" rel="stylesheet" type="text/css">
<script src="../js/QueryList.js"></script>
<script language="javascript">
	function selectStaffer(index){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		if ( ob_arr.length>=index ){
			str=ob_arr[index-1].value+";"+ob_arr[index-1].getAttribute("staffer_name")+";"+ob_arr[index-1].getAttribute("dep_id");
		}
		if (str != null && str!=''){
			parent.parent.popRetVal=str;
			parent.parent.ClosePop();
		}
	}
	function DoubleClick(it){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		if(ob_arr.length>=it.getAttribute("index")){
			str=ob_arr[it.getAttribute("index")-1].value+";"+ob_arr[it.getAttribute("index")-1].getAttribute("staffer_name")+";"+ob_arr[it.getAttribute("index")-1].getAttribute("dep_id");
		}
		if(str==""){
			return;
		}
		parent.parent.popRetVal=str;
		parent.parent.ClosePop();
	}
	function doSearch(){
		var departmentId="";
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var searchAll="";
		if(document.getElementById("search_all").checked){
			searchAll="1";
		}
		window.location="../base/StafferListForSelect.html?department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
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
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" scroll="no" style="background: #EAFAFF;">
		<div id="scrollDiv" style="OVERFLOW-Y:auto;height:348px">
		  <div class="main search-business">
			   <div class="cue-info">
					<h4>
						所有部门 - 员工
						
					</h4>				   	
			  </div>
			  <div class="content">		
				  <div align="right">
					<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以员工姓名、姓名拼音字头进行模糊查询">
					<input type="checkbox" id="search_all" name="search_all" checked="">在所有部门中查找
					<input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以员工姓名、姓名拼音字头进行模糊查询">			  		             	
		          </div>
			  </div>			  
			  
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
			  <div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
						<table width="100%">
								<tbody><tr>
									<th width="14"></th>
									<th width="30%">部门</th>
									<th width="20%">姓名</th>
									<th width="30%">职位</th>
									<th width="20%">操作</th>
								</tr>
								
								
								
								<tr class="query_list_data_trOver" index="1" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="61" staffer_name="何盼盼" dep_id="33"></td>
									<td>财务部</td>
									<td>何盼盼</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;1&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="2" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="55" staffer_name="郭登云" dep_id="33"></td>
									<td>财务部</td>
									<td>郭登云</td>
									<td>会计</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;2&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="3" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="51" staffer_name="杨海波" dep_id="32"></td>
									<td>标识汇运营部</td>
									<td>杨海波</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;3&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="4" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="47" staffer_name="刘帅盟" dep_id="32"></td>
									<td>标识汇运营部</td>
									<td>刘帅盟</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;4&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="5" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="65" staffer_name="标识汇" dep_id="32"></td>
									<td>标识汇运营部</td>
									<td>标识汇</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;5&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="6" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="52" staffer_name="钟海东" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>钟海东</td>
									<td>批灰打磨   喷漆</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;6&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="7" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="42" staffer_name="徐俊岩" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>徐俊岩</td>
									<td>库管  下料 组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;7&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="8" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="50" staffer_name="魏振武" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>魏振武</td>
									<td>画框 下料  组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;8&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="9" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="40" staffer_name="王孟玉" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>王孟玉</td>
									<td>库管  组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;9&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="10" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="53" staffer_name="李显" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>李显</td>
									<td>焊接  焊接打磨   组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;10&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="11" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="49" staffer_name="林付安" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>林付安</td>
									<td>标识焊接   焊接打磨</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;11&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="12" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="34" staffer_name="贾文博" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>贾文博</td>
									<td>打印  组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;12&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="13" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="48" staffer_name="范贺华" dep_id="17"></td>
									<td>标识加工车间</td>
									<td>范贺华</td>
									<td>喷漆    丝印   组装</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;13&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="14" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="46" staffer_name="张永灿" dep_id="16"></td>
									<td>业务来源</td>
									<td>张永灿</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;14&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="15" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="43" staffer_name="邵丽萍" dep_id="16"></td>
									<td>业务来源</td>
									<td>邵丽萍</td>
									<td>会计</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;15&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="16" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="16" staffer_name="黄秀娟" dep_id="16"></td>
									<td>业务来源</td>
									<td>黄秀娟</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;16&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="17" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="45" staffer_name="韩柯洋" dep_id="16"></td>
									<td>业务来源</td>
									<td>韩柯洋</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;17&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="18" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="17" staffer_name="伏龙" dep_id="16"></td>
									<td>业务来源</td>
									<td>伏龙</td>
									<td>经理</td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;18&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr1" index="19" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="12" staffer_name="秦朝阳" dep_id="1"></td>
									<td>易凯管理员</td>
									<td>秦朝阳</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;19&#39;);">选择</a>
									</td>
								</tr>
								
								
								
								<tr class="query_list_data_tr2" index="20" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
									<td><input type="radio" name="query_checkbox" value="-1" staffer_name="管理员" dep_id="1"></td>
									<td>易凯管理员</td>
									<td>管理员</td>
									<td></td>
									<td class="ListTd">
										<a href="javascript:selectStaffer(&#39;20&#39;);">选择</a>
									</td>
								</tr>
										
						</tbody></table>
			  </div>
			</div>
		</div>

</body></html>