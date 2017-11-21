<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
</head>
<body>
	<a href="login.jsp">登录</a>
	<a href="qichuqiankuan_DaoRu">导入客户期初欠款（完成）</a>
		<a href="waixieqichuqiankuan_DaoRu">导入外协商初欠款（完成）</a>
	<br>
	<hr>
	《-----------------基础数据：账务三个 ------------------------》<br>
	<s:a action="moneybill_BankAccountUI"> 进入账务（后台已完善，分页已加入）</s:a><br>
	<s:a action="incometype_IncomeTypeUI"> 进入收入类型（后台已完善，无需分页）</s:a><br>
	<s:a action="feetype_FeeTypeUI"> 进入费用类型（后台已完善,无需分页）</s:a><br>
	<s:a action="estprice_EstPriceUI">进入价格手册（后台已完善，id自增,分页完成）</s:a><br>
	<s:a action="place_listUI">地区管理(部分未完成)</s:a><br>
	
		<br>
	《-----------------外协： ------------------------》<br>
	<s:a action="establishment_EstablishmentUI">进入外协对账（*需要外协商登记，分页完成）(@坐了50%)</s:a><br>
	<s:a action="CooperAgaincheck_listUI?isCheck=1">外协单审核（*跳到制作单了）</s:a><br>
	<s:a action="CooperAgaincheck_listUI?isCheck=0">外协单反审核（*跳到制作单了）</s:a><br>
	<s:a action="reciveingcheck_firstlistSelectUI">收货对账</s:a><br>
	<br>
	《-----------------账务：支出 ------------------------》
	<br>
<%-- 	<s:a action="login.jsp">支出</s:a><br> --%>
	<s:a action="fukuandan_Select">付款单选择</s:a>
	<s:a action="paybill_findAll">付款单一览表,分页完成</s:a>
	<s:a action="feebillshenhe_findAll">费用单审核,分页完成</s:a>
	<s:a action="feebillfanshenhe_findAll">费用单反审核，分页完成</s:a>
	<s:a action="paybillshenhe_findAll">付款单审核</s:a>
	<s:a action="paybillfanshenhe_findAll">付款单反审核</s:a>
	<s:a action="feiyongdanyidan_listUI">费用单一览表</s:a>
	<s:a action="feiyongmingxiTable_listUI">费用明细一览表</s:a>
	<s:a action="wodefeiyongdan_listUI">我的费用单</s:a>
	<hr>
	
	《-----------------沟通： ------------------------》
	<br>
	<s:a action="messageSendAndReceive_toIndex">发消息（后台已完善，待整合）</s:a>
	<s:a action="messageSendAndReceive_findAllMessageVOsAndReceiverDeleteIsN">收件箱（后台已完善，待整合）</s:a>
	<s:a action="messageSendAndReceive_findAllMessageVOsAndSendDeleteIsN">发件箱（后台已完善，待整合）</s:a>
	<s:a action="business_listUI">业务单一览表</s:a><br>
	<hr>
		
	<hr>
	<!-- 由于要添加供应商 所以e这个表的主键 需要改成自增 -->
	---------------采购 》供应商；作废--------------------------<br>
<%-- <s:a action="gongyingshang_dengjiUI">供应商登记</s:a><br> --%>
<%-- <s:a action="gongyingshang_yijiao">供应商移交</s:a><br> --%>
<s:a action="gongyingshang_listUI">全部供应商</s:a>	<br>
<s:a action="caigoudanyilanbiao_findAll">采购单一览表</s:a>
	<s:a action="caigoudanshenhe_findAll">采购单审核</s:a>
	<s:a action="caigoudanfanshenhe_findAll">采购单反审核</s:a>
	
	<s:a action="tuihuodanyilanbiao_findAll">退货单一览表</s:a>
		<s:a action="tuihuodanshenhe_findAll">退货单审核</s:a>
		<s:a action="tuihuodanfanshenhe_findAll">退货单反审核</s:a>
	<s:a action="caigouhuizongbiao_findAll">供应商采购汇总表</s:a><br>
		<s:a action="caigouduizhang_findAll">采购对账(待整合)~</s:a>
		<s:a action="caigoumingxi_findAll">采购明细表</s:a>
<s:a action="purchasecanleling_list">采购单作废</s:a><br>
<s:a action="tuikuancanleling_listtuikuan">退款单作废</s:a><br>
		<hr>
----------------要制作的业务单-----------------------------<br>
	<s:a action="makebill_listUI">要制作的业务单</s:a><br>
	<s:a action="chanLiangRegister_listUI"> 产量登记</s:a><br>
	<s:a action="ouputDetail_listUI"> 产量计件明细表</s:a><br>
</body>
</html>