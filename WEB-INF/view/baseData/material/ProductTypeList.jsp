<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0050)http://115.28.87.22:8888/base/ProductTypeList.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<title>材料类别 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
	<script src="js/minierp.js"></script>

	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link href="css/dtree.css" rel="stylesheet" type="text/css">
	<script src="js/dtree.js"></script>
	<script language="javascript">
		function doTreeNodeClick(id) {
			document.getElementById("currentId").value = id;
			parent.document.getElementById("mainFrame").src = "/base/ProductList.ihtm?type_id=" + id;
		}
		function doNew() {
			var parentId = document.getElementById("currentId").value;
			var url = "product_toProductTypeNew";
			parent.ShowIframeNoScroll("材料类别", url, 320, 280, "refreshTypeWin()");//refreshTypeWin是父窗口的
		}
		function refreshWin(defId) {//父窗口的refreshTypeWin调用
			window.location = "product_toProductType";
		}
		function doEdit() {
			var id = document.getElementById("currentId").value;
			if (id == "") {
				parent.ShowAlert('提示框', '请选择要修改的类别', 200, 100);
			} else {
				var url = "/base/ProductTypeEdit.ihtm?id=" + id;
				parent.ShowIframeNoScroll("材料类别", url, 320, 280, "refreshTypeWin()");//refreshTypeWin是父窗口的
			}
		}
		function doDelete() {
			var id = document.getElementById("currentId").value;
			if (id == "") {
				parent.ShowAlert('提示框', '请选择要删除的类别', 200, 100);
			} else {
				parent.ShowConfirm('确认框', '确定删除吗？', 340, 80, "doDelType(" + id + ")");//doDelType是父窗口的
			}
		}
		function doDelAct(id) {//父窗口的doDelType调用
			var fromUrl = getFromUrl();
			window.location = "/base/ProductTypeDelete.ihtm?id=" + id + "&from_url=" + fromUrl;
		}
		function doInit() {
			var defaultId = "";
			if (defaultId != "") {
				doTreeNodeClick(defaultId);
				d.openTo(defaultId, true, false);
			}
		}
		function getFromUrl() {
			var defaultId = "";
			var fromUrl = "/base/ProductTypeList.ihtm?default_id=" + defaultId;
			return encodeURIComponent(fromUrl);
		}

	</script>
</head>

<body oncontextmenu="return false" onload="doInit();" style="text-align:center" scroll="no">
	<div class="nav" id="scrollDiv" style="text-align:left;overflow-x:hidden;overflow-y:auto;width:190px;height:508px">
		<h3 class="title">材料类别</h3>
		<div class="nav-link nav-mail" style="width:100%">
			<img src="images/icon_add.gif" border="0" title="新增材料类别" onclick="doNew();" style="cursor:pointer;">&nbsp;
			<img src="images/icon_edit.gif" border="0" title="修改材料类别" onclick="doEdit();" style="cursor:pointer;">&nbsp;
			<img src="images/icon_del.gif" border="0" title="删除材料类别" onclick="doDelete();" style="cursor:pointer;">
			<input type="hidden" id="currentId" name="currentId" value="">
			<div class="blank12"></div>

			<table width="98%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr id="errorMsgTr" style="display:none">
						<td>
							<div class="msg-error" id="errorMsgTd">

							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<script language="javascript">
				<!--
							var isOpen = false;
				var d = new dTree('d', 'images');

				d.config.useCookies = false;
				d.config.useLines = true;
				d.config.useIcons = true;

				d.add(0, -1, 'Root');

				d.add(72, 0, '01喷绘材料', "javascript:doTreeNodeClick('72');", '', '', '', false);

				d.add(73, 0, '02写真材料', "javascript:doTreeNodeClick('73');", '', '', '', false);

				d.add(74, 0, '03辅助材料', "javascript:doTreeNodeClick('74');", '', '', '', false);

				d.add(93, 0, '06展示器材', "javascript:doTreeNodeClick('93');", '', '', '', false);

				d.add(94, 0, '07光电产品', "javascript:doTreeNodeClick('94');", '', '', '', false);

				d.add(42, 0, '板材类', "javascript:doTreeNodeClick('42');", '', '', '', false);

				d.add(83, 0, '玻璃镜子', "javascript:doTreeNodeClick('83');", '', '', '', false);

				d.add(69, 0, '标牌配件', "javascript:doTreeNodeClick('69');", '', '', '', false);

				d.add(88, 0, '扁铁圆钢', "javascript:doTreeNodeClick('88');", '', '', '', false);

				d.add(89, 0, '不锈钢方管', "javascript:doTreeNodeClick('89');", '', '', '', false);

				d.add(90, 0, '不锈钢矩管', "javascript:doTreeNodeClick('90');", '', '', '', false);

				d.add(91, 0, '不锈钢圆管', "javascript:doTreeNodeClick('91');", '', '', '', false);

				d.add(64, 0, '成品标牌', "javascript:doTreeNodeClick('64');", '', '', '', false);

				d.add(82, 0, '磁性板', "javascript:doTreeNodeClick('82');", '', '', '', false);

				d.add(84, 0, '镀锌方管', "javascript:doTreeNodeClick('84');", '', '', '', false);

				d.add(85, 0, '镀锌矩管', "javascript:doTreeNodeClick('85');", '', '', '', false);

				d.add(86, 0, '镀锌圆管', "javascript:doTreeNodeClick('86');", '', '', '', false);

				d.add(45, 0, '低值易耗品', "javascript:doTreeNodeClick('45');", '', '', '', false);

				d.add(80, 0, '钢板材类', "javascript:doTreeNodeClick('80');", '', '', '', false);

				d.add(92, 0, '钢材辅料类', "javascript:doTreeNodeClick('92');", '', '', '', false);

				d.add(70, 0, '管材类', "javascript:doTreeNodeClick('70');", '', '', '', false);

				d.add(79, 0, '工程用板', "javascript:doTreeNodeClick('79');", '', '', '', false);

				d.add(65, 0, '光电产品', "javascript:doTreeNodeClick('65');", '', '', '', false);

				d.add(87, 0, '角钢槽钢', "javascript:doTreeNodeClick('87');", '', '', '', false);

				d.add(75, 0, 'KT板类', "javascript:doTreeNodeClick('75');", '', '', '', false);

				d.add(27, 0, '铝型材', "javascript:doTreeNodeClick('27');", '', '', '', false);

				d.add(81, 0, '木板类', "javascript:doTreeNodeClick('81');", '', '', '', false);

				d.add(95, 0, '每月定时出库材料', "javascript:doTreeNodeClick('95');", '', '', '', false);

				d.add(77, 0, 'PVC雪弗板', "javascript:doTreeNodeClick('77');", '', '', '', false);

				d.add(78, 0, '有机板', "javascript:doTreeNodeClick('78');", '', '', '', false);

				d.add(76, 0, '亚克力板', "javascript:doTreeNodeClick('76');", '', '', '', false);

				d.add(44, 0, '油漆类', "javascript:doTreeNodeClick('44');", '', '', '', false);


				document.write(d);
				d.closeAll();
							//-->
			</script>
			

			<div class="dtree">
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