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

		<title>发布公告</title>

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
					<!--新通知发布-->
					<table align="center" border="1" cellpadding="5" cellspacing="0">
						<caption>
							<p>发布新通知：</p>
						</caption>
						<tr>
							<td>通知截止时间：</td>
							<td><input type="date" id="endTime" /></td>
						</tr>
						<tr>
							<td align="right">通知标题：</td>
							<td><input type="text" id="title" /></td>
						</tr>
						<tr>
							<td>通知正文内容：</td>
							<td><textarea rows="5" cols="20" id="inform"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="确认发布" onclick="addInfo()" />
							</td>
						</tr>
					</table>
				</td>
				<td width="20px"></td>
				<td>
					<!--已有通知查询-->
					<p align="center">历史通知：<input type="button" value="刷新" onclick="infoLoad()" /></p>
					<div id="div"></div>
				</td>
			</tr>
		</table>
	</body>

	<script type="text/javascript" src="jquery-2.1.0.js"></script>
	<script type="text/javascript">
		function infoLoad() {
			$.ajax({
				type: "post",
				url: "/Human_Resources_System/servlet/AdviceServlet",
				data: {
					selectType: "all"
				},
				dataType: "json", //在数据接收时设置数据格式
				success: function(result) {
					var html = "<table border='1' cellpadding='10' cellspacing='0' align='center'><tr height='40px' bgcolor='#6495ED' align='center'><th>发布者</th><th>发布日期</th><th>截止日期</th><th>标题</th><th>通知详情</th></tr>";
					for(var i = 0; i < result.length; i++) {
						if(i % 2 == 0) {
							html += "<tr bgcolor='#CCCCCC' height='35px'>";
						} else {
							html += "<tr bgcolor='#B2DFEE' height='35px'>";
						}
						html += "<td>" + result[i].employeeName + "</td>";
						html += "<td>" + result[i].informTime + "</td>";
						html += "<td>" + result[i].informValidityEnd + "</td>";
						html += "<td>" + result[i].informTitle + "</td>";
						html += "<td>" + result[i].informInfo + "</td>";
						html += "</tr>";
					}
					html += "</table>";
					$("#div").html(html);
				}
			});
		}

		function addInfo() {
			var endTime = $("#endTime").val();
			var title = $("#title").val();
			var infoBody = $("#inform").val();

			if(endTime != "" && infoBody != "") {
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
				if(endTime < now) {
					alert("通知截止时间不能小于今天！");
				} else {
					$.ajax({
						type: "post",
						url: "/Human_Resources_System/servlet/AddAdvice",
						data: {
							endTime: endTime,
							title: title,
							infoBody: infoBody
						},
						dataType: "text", //在数据接收时设置数据格式
						success: function(result) {
							alert(result);
							$("#endTime").val("");
							$("#title").val("");
							$("#inform").val("");
						}
					});
				}
			} else {
				alert("通知截止时间与通知正文内容不能为空！");
			}
		}
	</script>

</html>