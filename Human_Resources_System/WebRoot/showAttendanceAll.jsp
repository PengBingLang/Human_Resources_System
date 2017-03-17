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

		<title>考勤总览</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<script type="text/javascript" src="jquery-2.1.0.js"></script>
		<script type="text/javascript">
			var allInfoArray = null; //用于存储全部数据
			var tableTitle = "<table border='1' cellpadding='10' cellspacing='0' align='center'><tr bgcolor='#6495ED'><th>员工工号</th><th>姓名</th><th>部门</th><th>开始统计日期</th><th>结束统计日期</th><th>迟到次数</th><th>早退次数</th><th>请假天数</th><th>带薪休假天数</th><th>出勤天数</th><th>应出勤天数</th></tr>";

			function getAllInfo() {
				$.ajax({
					type: "get",
					url: "/Human_Resources_System/servlet/GetAllAttendance",
					dataType: "json", //在数据接收时设置数据格式
					success: function(result) {
						allInfoArray = result;
						var html = tableTitle;
						for(var i = 0; i < result.length; i++) {
							if(i % 2 == 0) {
								html += "<tr bgcolor='#CCCCCC' height='35px'>";
							} else {
								html += "<tr bgcolor='#B2DFEE' height='35px'>";
							}
							html += "<td>" + result[i].employeeNumber + "</td>";
							html += "<td>" + result[i].employeeName + "</td>";
							html += "<td>" + result[i].departmentName + "</td>";
							html += "<td>" + result[i].countBegin + "</td>";
							html += "<td>" + result[i].countEnd + "</td>";
							html += "<td>" + result[i].countLate + "</td>";
							html += "<td>" + result[i].countLackTime + "</td>";
							html += "<td>" + result[i].countLeave + "</td>";
							html += "<td>" + result[i].countPaidLeave + "</td>";
							html += "<td>" + result[i].countAttendance + "</td>";
							html += "<td>" + result[i].totalAttendance + "</td>";
							html += "</tr>";
						}
						html += "</table>";
						$("#div").html(html);
						$("#text").val("");
					}
				});
			}

			function selectInfo() {
				var html = tableTitle;
				var j = 0;
				for(var i = 0; i < allInfoArray.length; i++) {
					if(check(allInfoArray[i])) {
						if(j % 2 == 0) {
							html += "<tr bgcolor='#CCCCCC' height='35px'>";
						} else {
							html += "<tr bgcolor='#B2DFEE' height='35px'>";
						}
						html += "<td>" + allInfoArray[i].employeeNumber + "</td>";
						html += "<td>" + allInfoArray[i].employeeName + "</td>";
						html += "<td>" + allInfoArray[i].departmentName + "</td>";
						html += "<td>" + allInfoArray[i].countBegin + "</td>";
						html += "<td>" + allInfoArray[i].countEnd + "</td>";
						html += "<td>" + allInfoArray[i].countLate + "</td>";
						html += "<td>" + allInfoArray[i].countLackTime + "</td>";
						html += "<td>" + allInfoArray[i].countLeave + "</td>";
						html += "<td>" + allInfoArray[i].countPaidLeave + "</td>";
						html += "<td>" + allInfoArray[i].countAttendance + "</td>";
						html += "<td>" + allInfoArray[i].totalAttendance + "</td>";
						html += "</tr>";
						j++;
					}
				}
				html += "</table>";
				$("#div").html("");
				$("#div").html(html);
			}

			function check(obj) {
				var s = $("#text").val();
				if((obj.employeeNumber + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.employeeName).indexOf(s) != -1) {
					return true;
				}
				if((obj.departmentName).indexOf(s) != -1) {
					return true;
				}
				if((obj.countBegin).indexOf(s) != -1) {
					return true;
				}
				if((obj.countEnd).indexOf(s) != -1) {
					return true;
				}
				if((obj.countLate + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.countLackTime + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.countLeave + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.countPaidLeave + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.countAttendance + "").indexOf(s) != -1) {
					return true;
				}
				if((obj.totalAttendance + "").indexOf(s) != -1) {
					return true;
				}
				return false;
			}
		</script>
	</head>

	<body bgcolor="#98F5FF" onload="getAllInfo()">
		<br />
		<p align="center">
			单关键字检索：<input type="text" id="text" />
			<input type="button" value="检索" onclick="selectInfo()" />&nbsp;&nbsp;
			<input type="button" value="刷新" onclick="getAllInfo()" />
		</p>
		<br />
		<div id="div"></div>
	</body>

</html>