<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>部门 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/dtree.css" rel="stylesheet" type="text/css">
<script src="js/dtree.js"></script>
<script language="javascript">
	function doTreeNodeClick(id){
		document.getElementById("currentId").value=id;
		parent.document.getElementById("mainFrame").src="base/StafferList.html?department_id="+id;
	}
	function doNew(){
		var parentId=document.getElementById("currentId").value;
		var url="departStaff_toDepartmentNew";
		parent.ShowIframeNoScroll("部门",url,320,280,"refreshDepWin()");//refreshDepWin是父窗口的
	}
	function refreshWin(defId){//父窗口的refreshDepWin调用
		window.location="base/DepartmentList.html?default_id="+defId;
	}
	function doEdit(){
		var id=document.getElementById("currentId").value;
		if(id==""){
			parent.ShowAlert('提示框','请选择要修改的部门',200,100);
		}else{
			var url="base/DepartmentEdit.html?id="+id;
			parent.ShowIframeNoScroll("部门",url,320,280,"refreshDepWin()");//refreshDepWin是父窗口的
		}
	}
	function doDelete(){
		var id=document.getElementById("currentId").value;
		if(id==""){
			parent.ShowAlert('提示框','请选择要删除的部门',200,100);
		}else{
			parent.ShowConfirm('确认框','确定删除吗？',340,80,"doDelDep("+id+")");//doDelDep是父窗口的
		}
	}
	function doDelAct(id){//父窗口的doDelDep调用
		var fromUrl=getFromUrl();
		window.location="base/DepartmentDelete.html?id="+id+"&from_url="+fromUrl;
	}
	
	function doInit(){
		var defaultId="";
		if(defaultId!=""){
			doTreeNodeClick(defaultId);
			d.openTo(defaultId,true,false);
		}
	}
	function getFromUrl(){
		var defaultId="";
		var fromUrl="base/DepartmentList.html?default_id="+defaultId;
		return encodeURIComponent(fromUrl);
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" style="text-align:center" scroll="no">
	<div class="nav" id="scrollDiv" style="text-align:left;overflow-x:hidden;overflow-y:auto;height:508px;width:160px">
		<h3 class="title">部门</h3>
	  	<div class="nav-link nav-mail" style="width:100%">
			<img src="images/icon_add.gif" title="新增部门" onclick="doNew();" style="cursor:pointer;" border="0">&nbsp;
			<img src="images/icon_edit.gif" title="修改部门" onclick="doEdit();" style="cursor:pointer;" border="0">&nbsp;
			<img src="images/icon_del.gif" title="删除部门" onclick="doDelete();" style="cursor:pointer;" border="0">
			<input name="currentId" id="currentId" value="" type="hidden">							
			<div class="blank12"></div>
			
<table width="98%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
			<script language="javascript">
				<!--
				var isOpen=false;
				var d = new dTree('d','/images/dtree');
				
				d.config.useCookies=false;
				d.config.useLines=true;
				d.config.useIcons=true;
				
				d.add(0,-1,'Root');
				
					d.add(1,0,'易凯管理员',"javascript:doTreeNodeClick('1');",'','','',false);
				
					d.add(13,0,'总经办',"javascript:doTreeNodeClick('13');",'','','',false);
				
					d.add(14,0,'新异店',"javascript:doTreeNodeClick('14');",'','','',false);
				
					d.add(16,0,'业务来源',"javascript:doTreeNodeClick('16');",'','','',false);
				
					d.add(17,0,'标识加工车间',"javascript:doTreeNodeClick('17');",'','','',false);
				
					d.add(21,0,'合作伙伴',"javascript:doTreeNodeClick('21');",'','','',false);
				
					d.add(32,0,'标识汇运营部',"javascript:doTreeNodeClick('32');",'','','',false);
				
					d.add(33,0,'财务部',"javascript:doTreeNodeClick('33');",'','','',false);
				
					d.add(22,13,'财务',"javascript:doTreeNodeClick('22');",'','','',false);
				
					d.add(15,14,'客服',"javascript:doTreeNodeClick('15');",'','','',false);
				
					d.add(23,14,'设计',"javascript:doTreeNodeClick('23');",'','','',false);
				
					d.add(24,14,'业务',"javascript:doTreeNodeClick('24');",'','','',false);
				
				
				document.write(d);
				d.closeAll();
				//-->
			</script><div class="dtree">
<div class="dTreeNode" style="display:none"><img id="id0" src="images/base.gif" alt="">Root</div>
<div id="dd0" class="clip" style="display:block;">
	<div class="dTreeNode"><img src="images/join.gif" alt=""><img id="id1" src="images/page.gif" alt=""><a id="sd1" class="node" href="javascript:doTreeNodeClick('1');" onclick="javascript: d.s(1);">易凯管理员</a></div>
	<div class="dTreeNode"><a href="javascript:%20d.o(2);"><img id="jd2" src="images/plus.gif" alt=""></a><img id="id2" src="images/folder.gif" alt=""><a id="sd2" class="node" href="javascript:doTreeNodeClick('13');" onclick="javascript: d.s(2);">总经办</a></div>
	<div id="dd2" class="clip" style="display:none;"><div class="dTreeNode"><img src="images/line.gif" alt="">
		<img src="images/joinbottom.gif" alt=""><img id="id9" src="images/page.gif" alt=""><a id="sd9" class="node" href="javascript:doTreeNodeClick('22');" onclick="javascript: d.s(9);">财务</a></div></div>
		<div class="dTreeNode"><a href="javascript:%20d.o(3);"><img id="jd3" src="images/plus.gif" alt=""></a><img id="id3" src="images/folder.gif" alt=""><a id="sd3" class="node" href="javascript:doTreeNodeClick('14');" onclick="javascript: d.s(3);">新异店</a></div>
		<div id="dd3" class="clip" style="display:none;"><div class="dTreeNode"><img src="images/line.gif" alt="">
			<img src="images/join.gif" alt=""><img id="id10" src="images/page.gif" alt=""><a id="sd10" class="node" href="javascript:doTreeNodeClick('15');" onclick="javascript: d.s(10);">客服</a></div>
			<div class="dTreeNode"><img src="images/line.gif" alt=""><img src="images/join.gif" alt=""><img id="id11" src="images/page.gif" alt=""><a id="sd11" class="node" href="javascript:doTreeNodeClick('23');" onclick="javascript: d.s(11);">设计</a></div>
			<div class="dTreeNode"><img src="images/line.gif" alt=""><img src="images/joinbottom.gif" alt=""><img id="id12" src="images/page.gif" alt=""><a id="sd12" class="node" href="javascript:doTreeNodeClick('24');" onclick="javascript: d.s(12);">业务</a></div></div>
			<div class="dTreeNode"><img src="images/join.gif" alt=""><img id="id4" src="images/page.gif" alt=""><a id="sd4" class="node" href="javascript:doTreeNodeClick('16');" onclick="javascript: d.s(4);">业务来源</a></div>
			<div class="dTreeNode"><img src="images/join.gif" alt=""><img id="id5" src="images/page.gif" alt=""><a id="sd5" class="node" href="javascript:doTreeNodeClick('17');" onclick="javascript: d.s(5);">标识加工车间</a></div>
			<div class="dTreeNode"><img src="images/join.gif" alt=""><img id="id6" src="images/page.gif" alt=""><a id="sd6" class="node" href="javascript:doTreeNodeClick('21');" onclick="javascript: d.s(6);">合作伙伴</a></div>
			<div class="dTreeNode"><img src="images/join.gif" alt=""><img id="id7" src="images/page.gif" alt=""><a id="sd7" class="node" href="javascript:doTreeNodeClick('32');" onclick="javascript: d.s(7);">标识汇运营部</a></div>
			<div class="dTreeNode"><img src="images/joinbottom.gif" alt=""><img id="id8" src="images/page.gif" alt=""><a id="sd8" class="node" href="javascript:doTreeNodeClick('33');" onclick="javascript: d.s(8);">财务部</a></div></div></div>
	  	</div>
	</div>

</body></html>