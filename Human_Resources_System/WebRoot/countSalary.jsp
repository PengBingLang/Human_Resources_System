<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>工资计算</title>

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
		<p>考勤统计与工资计算页面：</p>
		<form>
			统计开始日期：
			<input type="date" id="countBegin" /><br />统计结束日期：
			<input type="date" id="countEnd" /><br /> 应出勤总天数：
			<input type="text" id="totalAttendance" /><br />上班时间：
			<input type="time" id="onWorkTime" value="09:00" /><br />下班时间：
			<input type="time" id="offWorkTime" value="17:00" /><br />
			<input type="button" value="开始计算考勤" />
		</form>
	</body>

</html>