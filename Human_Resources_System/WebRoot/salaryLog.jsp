<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>历史工资记录</title>

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
	<p>工资计算方法：</p>
	<table border="1" cellpadding="5" cellspacing="0" align="center">
		<tr height="40px" bgcolor="#6495ED" align="center">
			<th>工号</th>
			<th>开始统计日期</th>
			<th>结束统计日期</th>
			<th>迟到次数</th>
			<th>早退次数</th>
			<th>请假天数</th>
			<th>带薪休假天数</th>
			<th>出勤天数</th>
			<th>应出勤天数</th>
			<th>基本工资</th>
			<th>职称工资</th>
			<th>住房公积金</th>
			<th>养老保险</th>
			<th>医疗保险</th>
			<th>失业保险</th>
			<th>报销费用</th>
			<th>奖金</th>
			<th>实发金额</th>
		</tr>
		<c:forEach items="${saleryInfo }" var="info" varStatus="status">
			<c:if test="${status.index%2==0 }">
				<tr bgcolor="#CCCCCC" height="35px">
			</c:if>
			<c:if test="${status.index%2==1 }">
				<tr bgcolor="#B2DFEE" height="35px">
			</c:if>
			<td>${info.employeeNumber }</td>
			<td>${info.countBegin }</td>
			<td>${info.countEnd }</td>
			<td>${info.countLate }</td>
			<td>${info.countLackTime }</td>
			<td>${info.countLeave }</td>
			<td>${info.countPaidLeave }</td>
			<td>${info.countAttendance }</td>
			<td>${info.totalAttendance }</td>
			<td>${info.basicSalary }</td>
			<td>${info.rankSalary }</td>
			<td>${info.houseFund }</td>
			<td>${info.pension }</td>
			<td>${info.health }</td>
			<td>${info.unemployment }</td>
			<td>${info.reimbursement }</td>
			<td>${info.bonus }</td>
			<td>${info.totalSalary }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
