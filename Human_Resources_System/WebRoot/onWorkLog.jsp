<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>签到记录查询</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body bgcolor="#98F5FF">
		<br />
		<div align="center">
			<p>
				开始日期：<input type="date" id="begin" />
			</p>
			<p>
				结束日期：<input type="date" id="end" />
			</p>
			<p>
				<span id="info"></span><input type="button" id="button" value="查询" />
			</p>
		</div>
		<br />
		<table align="center">
			<tr>
				<td id="onWork"></td>
				<td width="30"></td>
				<td id="offWork"></td>
			</tr>
		</table>
	</body>

	<script type="text/javascript" src="jquery-2.1.0.js"></script>
	<script type="text/javascript">
		$("#info").css("color","red");
		$("#button").click(function() {
			var begin = $("#begin").val();
			var end = $("#end").val();
			if(begin != "" && end != "") {
				if(begin < end) {
					var date = new Date();
					var month = date.getMonth() + 1;
					var day = date.getDate();
					if(month >= 1 && month <= 9) {
						month = "0" + month;
					}
					if(day >= 0 && day <= 9) {
						day = "0" + day;
					}
					var now = date.getFullYear() + "-" + month +
						"-" + day;
					if(end > now) {
						$("#info").text("结束日期不能大于今天！");
					} else {
						//异步刷新提交
						$.ajax({ //查询上班签到
							url: "/Human_Resources_System/servlet/AttendanceServlet",
							type: "get",
							data: {
								begin: begin,
								end: end,
								type: "0"
							},
							dataType: "json", //在数据接收时设置数据格式
							success: function(result) {
								var html = "<table border='1' cellpadding='0' cellspacing='0' align='center'><tr height='40 px' bgcolor='#6495ED' align='center'><th width='100px'>工号</th><th width='200px'>签到时间</th><th width ='150px'>签到类型 </th></tr >";
								for(var i = 0; i < result.length; i++) {
									if(i % 2 == 0) {
										html += "<tr bgcolor='#CCCCCC' height='35px'>";
									} else {
										html += "<tr bgcolor='#B2DFEE' height='35px'>";
									}
									html += "<td>" + result[i].employeeNumber + "</td>";
									html += "<td>" + result[i].attendanceDate + "</td>";
									html += "<td>" + result[i].attendanceType + "</td>";
									html += "</tr>";
								}
								html += "</table>";
								$("#onWork").html(html);
								$("#info").text("");
							}
						});
						
						$.ajax({ //查询下班签到
							url: "/Human_Resources_System/servlet/AttendanceServlet",
							type: "get",
							data: {
								begin: begin,
								end: end,
								type: "1"
							},
							dataType: "json", //在数据接收时设置数据格式
							success: function(result) {
								var html = "<table border='1' cellpadding='0' cellspacing='0' align='center'><tr height='40 px' bgcolor='#6495ED' align='center'><th width='100px'>工号</th><th width='200px'>签到时间</th><th width ='150px'>签到类型 </th></tr >";
								for(var i = 0; i < result.length; i++) {
									if(i % 2 == 0) {
										html += "<tr bgcolor='#CCCCCC' height='35px'>";
									} else {
										html += "<tr bgcolor='#B2DFEE' height='35px'>";
									}
									html += "<td>" + result[i].employeeNumber + "</td>";
									html += "<td>" + result[i].attendanceDate + "</td>";
									html += "<td>" + result[i].attendanceType + "</td>";
									html += "</tr>";
								}
								html += "</table>";
								$("#offWork").html(html);
							}
						});
					}
				} else {
					$("#info").text("开始日期必须早于结束日期！");
				}
			} else {
				$("#info").text("开始和结束日期不能为空！");
			}
		});
	</script>

</html>