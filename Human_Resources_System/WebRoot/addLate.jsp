<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>添加请假信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body bgcolor="#98F5FF" onload="infoLoad()">
		<br />
		<!--1行3列Table布局-->
		<table align="center">
			<tr valign="top">
				<td>
					<!--添加新请假信息-->
					<table align="center" border="1" cellpadding="5" cellspacing="0">
						<caption>
							<p>添加请假记录：</p>
						</caption>
						<tr>
							<td align="right">请假人工号：</td>
							<td><input type="text" id="id" /></td>
						</tr>
						<tr>
							<td align="right">请假开始日期：</td>
							<td><input type="date" id="begin" /></td>
						</tr>
						<tr>
							<td align="right">请假结束日期：</td>
							<td><input type="date" id="end" /></td>
						</tr>
						<tr>
							<td align="right">请假事由：</td>
							<td><input type="text" id="reason" /></td>
						</tr>
						<tr>
							<td align="right">请假类型 ：</td>
							<td>
								<select id="type">
									<option>普通请假</option>
									<option>带薪休假</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="确认添加请假" onclick="addInfo()" />
							</td>
						</tr>
					</table>
				</td>
				<td width="20px"></td>
				<td>
					<!--已有请假信息查询-->
					<p align="center">已有请假信息：<input type="button" value="刷新" onclick="infoLoad()" /></p>
					<div id="div"></div>
				</td>
			</tr>
		</table>
	</body>

	<script type="text/javascript" src="jquery-2.1.0.js"></script>
	<script type="text/javascript">
		function infoLoad() {
			$.ajax({
				type: "get",
				url: "/Human_Resources_System/servlet/AddLeave",
				dataType: "json", //在数据接收时设置数据格式
				success: function(result) {
					var html = "<table border='1' cellpadding='10' cellspacing='0' align='center'><tr height='40px' bgcolor='#6495ED' align='center'><th>请假人工号</th><th>开始日期</th><th>结束日期</th><th>请假事由</th><th>请假类型</th></tr>";
					for(var i = 0; i < result.length; i++) {
						if(i % 2 == 0) {
							html += "<tr bgcolor='#CCCCCC' height='35px'>";
						} else {
							html += "<tr bgcolor='#B2DFEE' height='35px'>";
						}
						html += "<td>" + result[i].employeeNumber + "</td>";
						html += "<td>" + result[i].dateBging + "</td>";
						html += "<td>" + result[i].dateEnd + "</td>";
						html += "<td>" + result[i].leaveReason + "</td>";
						html += "<td>" + result[i].leaveType + "</td>";
						html += "</tr>";
					}
					html += "</table>";
					$("#div").html(html);
				}
			});
		}

		function addInfo() {
			var id = $("#id").val();
			var begin = $("#begin").val();
			var end = $("#end").val();
			var reason = $("#reason").val();
			var type = $("#type").val();

			if(id != "" && begin != "" && end != "" && reason != "") {
				var date = new Date();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				if(month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if(day >= 0 && day <= 9) {
					day = "0" + day;
				}
				var now = date.getFullYear() + "-" + month + "-" + day;
				if(now < begin && begin <= end) {
					$.ajax({
						type: "post",
						url: "/Human_Resources_System/servlet/AddLeave",
						data: {
							id: id,
							dateBging: begin,
							dateEnd: end,
							leaveReason: reason,
							leaveType: type
						},
						dataType: "text", //在数据接收时设置数据格式
						success: function(result) {
							alert(result);
							$("#id").val("");
							$("#begin").val("");
							$("#end").val("");
							$("#reason").val("");
							$("#type").val("");
						}
					});
				} else {
					alert("请假开始日期必须大于今天，结束日期不能大于开始日期！");
				}
			} else {
				alert("每一项信息均不能为空！");
			}
		}
	</script>

</html>