<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0072)http://115.28.87.22:8888/bbs/BbsColumnList.ihtm?default_id=&default_url= -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<title>信息栏目 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
	<script src="js/minierp.js"></script>

	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link href="css/dtree.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		body {
			background: url(images/leftmenu-bg.gif);
		}
	</style>
	<script src="js/dtree.js"></script>
	<script language="javascript">
		function doNew() {
			var url = "./BbsColumnNew.html";
			parent.ShowIframeNoScroll("栏目", url, 300, 260, "refreshColWin()");//refreshColWin是父窗口的
		}
		function doEdit() {
			var id = document.getElementById("currentId").value;
			if (id == "") {
				parent.ShowAlert('提示框', '请选择要修改的栏目', 200, 100);
			} else {
				var url = "./BbsColumnEdit.html?id=" + id;
				parent.ShowIframeNoScroll("栏目", url, 300, 260, "refreshColWin()");//refreshColWin是父窗口的
			}
		}
		function doDelete() {
			var id = document.getElementById("currentId").value;
			if (id == "") {
				parent.ShowAlert('提示框', '请选择要删除的栏目', 200, 100);
			} else {
				parent.ShowConfirm('确认框', '确定删除吗？', 340, 80, "doDelCol(" + id + ")");//doDelCol是父窗口的
			}
		}
		function doTreeNodeClick(id) {
			document.getElementById("currentId").value = id;
			parent.document.getElementById("mainFrame").src = "./BbsTopicList.html?column_id=" + id;
		}
		function doInit() {
			var defaultId = "1";
			var defaultUrl = "";
			if (defaultId != "") {
				if (defaultUrl != "") {
					parent.document.getElementById("mainFrame").src = defaultUrl;
				} else {
					doTreeNodeClick(defaultId);
				}
				d.openTo(defaultId, true, false);
			}
		}
	</script>
</head>



<body oncontextmenu="return false" onload="doInit();" style="text-align:center" scroll="no">
	<div class="nav" id="scrollDiv" style="text-align:left;overflow-x:hidden;overflow-y:auto;height:468px;width:190px">
		<h3 class="title">信息栏目</h3>
		<div class="nav-link nav-mail" style="width:100%">

			<img src="images/icon_add.gif" border="0" title="新增栏目" onclick="doNew();" style="cursor:pointer;">&nbsp;
			<img src="images/icon_edit.gif" border="0" title="修改栏目" onclick="doEdit();" style="cursor:pointer;">&nbsp;
			<img src="images/icon_del.gif" border="0" title="删除栏目" onclick="doDelete();" style="cursor:pointer;">
			<div class="blank12"></div>

			<input type="hidden" id="currentId" name="currentId" value="1">

			
			<s:iterator value="bbsColumnList" status="indexs">
			<a href="main_toBbsTopicList"?id=${id} target="mainFrame" >${columnName}</a>
			</s:iterator>
 
			<%-- <script language="javascript">
				
			var isOpen = false;
				var d = new dTree('d', 'images');

				d.config.useCookies = false;
				d.config.useLines = false;
				d.config.useIcons = false;

				d.add(0, -1, 'Root');
				
				/* <!--用s标签,js获得后台传过来的数据--> */
				<s:iterator value="bbsColumnList" status="indexs">
				var id = ${id};
				d.add("${id }", 0, "${columnName }","javascript:doTreeNodeClick(id);",
						'', '', '', false);
				</s:iterator>
				
				<!-- 
				d.add(1, 0, '内部公告', "javascript:doTreeNodeClick('1');", '', '', '', false);

				d.add(2, 0, '公司制度', "javascript:doTreeNodeClick('2');", '', '', '', false);

				d.add(3, 0, '行业资讯', "javascript:doTreeNodeClick('3');", '', '', '', false);

				d.add(4, 0, '资料共享', "javascript:doTreeNodeClick('4');", '', '', '', false);

				d.add(5, 0, '发货记录', "javascript:doTreeNodeClick('5');", '', '', '', false);

				d.add(6, 0, '打款记录', "javascript:doTreeNodeClick('6');", '', '', '', false);
				-->

				document.write(d);
				d.closeAll();
			//
			</script>
			 --%>
			<div class="dtree">
				<div class="dTreeNode" style="display:none">Root</div>
				<div id="dd0" class="clip" style="display:block;">
					<!--<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd1" class="nodeSel" href="javascript:doTreeNodeClick(&#39;1&#39;);" onclick="javascript: d.s(1);">内部公告</a></div>
					<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd2" class="node" href="javascript:doTreeNodeClick(&#39;2&#39;);" onclick="javascript: d.s(2);">公司制度</a></div>
					<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd3" class="node" href="javascript:doTreeNodeClick(&#39;3&#39;);" onclick="javascript: d.s(3);">行业资讯</a></div>
					<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd4" class="node" href="javascript:doTreeNodeClick(&#39;4&#39;);" onclick="javascript: d.s(4);">资料共享</a></div>
					<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd5" class="node" href="javascript:doTreeNodeClick(&#39;5&#39;);" onclick="javascript: d.s(5);">发货记录</a></div>
					<div class="dTreeNode"><img src="./empty.gif" alt=""><a id="sd6" class="node" href="javascript:doTreeNodeClick(&#39;6&#39;);" onclick="javascript: d.s(6);">打款记录</a></div>-->
				</div>
			</div>
		</div>
	</div>

	<audio controls="controls" style="display: none;"></audio>
</body>
<style type="text/css">
	#yddContainer {
		display: block;
		font-family: Microsoft YaHei;
		position: relative;
		width: 100%;
		height: 100%;
		top: -4px;
		left: -4px;
		font-size: 12px;
		border: 1px solid
	}

	#yddTop {
		display: block;
		height: 22px
	}

	#yddTopBorderlr {
		display: block;
		position: static;
		height: 17px;
		padding: 2px 28px;
		line-height: 17px;
		font-size: 12px;
		color: #5079bb;
		font-weight: bold;
		border-style: none solid;
		border-width: 1px
	}

	#yddTopBorderlr .ydd-sp {
		position: absolute;
		top: 2px;
		height: 0;
		overflow: hidden
	}

	.ydd-icon {
		left: 5px;
		width: 17px;
		padding: 0px 0px 0px 0px;
		padding-top: 17px;
		background-position: -16px -44px
	}

	.ydd-close {
		right: 5px;
		width: 16px;
		padding-top: 16px;
		background-position: left -44px
	}

	#yddKeyTitle {
		float: left;
		text-decoration: none
	}

	#yddMiddle {
		display: block;
		margin-bottom: 10px
	}

	.ydd-tabs {
		display: block;
		margin: 5px 0;
		padding: 0 5px;
		height: 18px;
		border-bottom: 1px solid
	}

	.ydd-tab {
		display: block;
		float: left;
		height: 18px;
		margin: 0 5px -1px 0;
		padding: 0 4px;
		line-height: 18px;
		border: 1px solid;
		border-bottom: none
	}

	.ydd-trans-container {
		display: block;
		line-height: 160%
	}

	.ydd-trans-container a {
		text-decoration: none;
	}

	#yddBottom {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 22px;
		line-height: 22px;
		overflow: hidden;
		background-position: left -22px
	}

	.ydd-padding010 {
		padding: 0 10px
	}

	#yddWrapper {
		color: #252525;
		z-index: 10001;
		background: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);
	}

	#yddContainer {
		background: #fff;
		border-color: #4b7598
	}

	#yddTopBorderlr {
		border-color: #f0f8fc
	}

	#yddWrapper .ydd-sp {
		background-image: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)
	}

	#yddWrapper a,
	#yddWrapper a:hover,
	#yddWrapper a:visited {
		color: #50799b
	}

	#yddWrapper .ydd-tabs {
		color: #959595
	}

	.ydd-tabs,
	.ydd-tab {
		background: #fff;
		border-color: #d5e7f3
	}

	#yddBottom {
		color: #363636
	}

	#yddWrapper {
		min-width: 250px;
		max-width: 400px;
	}
</style>

</html>