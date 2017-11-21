<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this title</title>
</head>
<body>


<table width="90%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<th width="10%">项目类型</th>
				<th width="15%">内容</th>
				<th width="8%">材质</th>
				<th width="10%">宽x高</th>
				<th width="10%">规格</th>
				<th width="14%">制作要求</th>
				<th width="5%">数量</th>
				<th width="7%">平方数</th>
				<th width="5%">元/平</th>
				<th width="5%">金额</th>
				<th width="4%">外协</th>
				<th width="4%">安装</th>
				<th width="5%">自制</th>
				<th width="4%">操作</th>
			</tr>
			
			<s:iterator value="businessBillItemListsList[0]" status="b">
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].id" value="${id}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].billId" value="${billId}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].wcId" value="${wcId}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].makeTypeId" value="${makeTypeId}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].proId" value="${proId}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].priceType" value="${priceType}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].unit" value="${unit}"/>
				<input type="hidden" name="businessBillItemVOsOne[${b.index}].lengType" value="${lengType}"/>
				<tr>
					<td><s:property value="%{maketypeListList[0][#b.index].typeName}" /></td>
					<td><textarea style="width: 160px;height: 90px;" name="businessBillItemVOsOne[${b.index}].finishedContent">${finishedContent}</textarea> </td>
					<td><input type="text"  name="businessBillItemVOsOne[${b.index}].proName" value="${ proName}"></td>
					<td> <input type="text" size="4"  name="businessBillItemVOsOne[${b.index}].length" value="${length}"> 
						× <input size="4" type="text" name="businessBillItemVOsOne[${b.index}].width" value="${width}"> </td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].specification" value="${ specification}"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].makeRequire" value="${ makeRequire}"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].amount" value="${ amount}"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].squareNum" value="${squareNum }"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].unitPrice" value="${ unitPrice}"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].cost" value="${cost }"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].isCoop" value="${isCoop }"></td>
					<td><input type="text" name="businessBillItemVOsOne[${b.index}].isSetu" value="${isSetu }"></td>
					<td><s:property value="%{workCenterListList[0][#b.index].wcName}" /></td>
					<td><s:a action="business_delete?businessBillVO.billCode=%{businessBillVO.billCode}">删除</s:a> <s:a action="">复制</s:a></td>
				</tr>
			</s:iterator>
			
		</table>
		${huizongSum[0] }记录:${ threetableDeli[0]}  面积：  ${ threetableDeli[1]} 金额：${ threetableDeli[2]} 
		
		

		<br>
		<br>

		<table width="90%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<th width="8%">项目类型</th>
				<th width="15%">内容</th>
				<th width="8%">材质</th>
				<th width="10%">宽x高</th>
				<th width="10%">规格</th>
				<th width="14%">制作要求</th>
				<th width="5%">数量</th>
				<th width="7%">总长度</th>
				<th width="5%">单价</th>
				<th width="5%">金额</th>
				<th width="4%">外协</th>
				<th width="4%">安装</th>
				<th width="5%">自制</th>
				<th width="4%">操作</th>
			</tr>
			<s:iterator value="businessBillItemListsList[1]" status="b">
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].id" value="${id}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].billId" value="${billId}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].wcId" value="${wcId}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].makeTypeId" value="${makeTypeId}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].proId" value="${proId}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].priceType" value="${priceType}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].unit" value="${unit}"/>
					<input type="hidden" name="businessBillItemVOsTwo[${b.index}].lengType" value="${lengType}"/>
				<tr>
					<td><s:property value="%{maketypeListList[1][#b.index].typeName}" /></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].finishedContent" value="${finishedContent }"></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].proName" value="${ proName}"></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].length" value="${length}"> × <input type="text" name="businessBillItemVOsTwo[${b.index}].width" value="${width}"> </td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].specification" value="${specification}"></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].makeRequire" value="${ makeRequire}"></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].amount" value="${ amount}"></td>
					<td>
						<input type="text" readonly="readonly" value="${ width*amount}">
					</td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].unitPrice" value="${ unitPrice}"></td>
					<td><input type="text" name="businessBillItemVOsTwo[${b.index}].cost" value="${cost }"></td>
					<td>${isCoop }</td>
					<td>${isSetu }</td>
					<td><s:property value="%{workCenterListList[1][#b.index].wcName}" /></td>
					<td><s:a action="">删除@</s:a> <s:a action="">复制@</s:a></td>
				</tr>
			</s:iterator>
		</table>
记录:${ threetableDeli[3]}  长度：  ${ threetableDeli[4]} 金额：${ threetableDeli[5]} 

		<br>
		<br>
		<table width="90%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr>
				<th width="8%">项目类型</th>
				<th width="15%">内容</th>
				<th width="8%">材质</th>
				<th width="10%">规格</th>
				<th width="21%">制作要求</th>
				<th width="8%">单位</th>
				<th width="7%">数量</th>
				<th width="5%">单价</th>
				<th width="5%">金额</th>
				<th width="4%">外协</th>
				<th width="4%">安装</th>
				<th width="5%">自制</th>
				<th width="4%">操作</th>
			</tr>


			<s:iterator value="businessBillItemListsList[2]" status="b">
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].id" value="${id}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].billId" value="${billId}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].wcId" value="${wcId}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].makeTypeId" value="${makeTypeId}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].proId" value="${proId}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].priceType" value="${priceType}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].unit" value="${unit}"/>
				<input type="hidden" name="businessBillItemVOsThree[${b.index}].lengType" value="${lengType}"/>
				<tr>
					<td>
					<s:property value="%{maketypeListList[2][#b.index].typeName}" />
					</td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].finishedContent" value="${finishedContent }"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].proName" value="${ proName}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].specification" value="${ specification}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].makeRequire" value="${ makeRequire}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].unit" value="${ unit}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].amount" value="${ amount}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].unitPrice" value="${ unitPrice}"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].cost" value="${cost }"></td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].isCoop" value="${isCoop }"> </td>
					<td><input type="text" name="businessBillItemVOsThree[${b.index}].isSetu" value="${isSetu }"></td>
					<td><s:property value="%{workCenterListList[2][#b.index].wcName}" /></td>
					<td><s:a action="">删除@@</s:a> <s:a action="">复制@@</s:a></td>
				</tr>
			</s:iterator>
		</table>
		记录:${ threetableDeli[6]}  数量：  ${ threetableDeli[7]} 金额：${ threetableDeli[8]} 
		
			<table style="border-collapse: collapse;" width="90%" cellpadding="0" cellspacing="0" border="1" bordercolor="red" align="center">
			<tr height="10%">
				<td>文件</td>
				<td>资料路径</td>
				<td>文件说明</td>
				<td>工作中心</td>
				<td>类型</td>
				<td>上传人</td>
				<td>上传时间</td>
				<td>操作</td>
			</tr>

			<s:iterator value="accessoryVOs" status="s">
				<tr>
					<td>${sourceName }</td>
					<td>${customPath}</td>
					<td>${mark }</td>

					<td>@@@@@<s:property value="%{workCenterListList[#s.index][#s.index].wcName}" /></td>
					<td>@@@@design</td>
					<td>${createrName }</td>
					<td>${createTime }</td>
					<td><s:a action="">@@coazuo</s:a> <s:a action="">@@caozuo</s:a></td>
				</tr>
			</s:iterator>

		</table>
		
</body>
</html>