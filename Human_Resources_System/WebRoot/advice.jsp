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

<title>最新通知</title>
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
	<br />
	<table border="1" cellpadding="10" cellspacing="0" align="center">
		<tr height="40px" bgcolor="#6495ED" align="center">
			<th>发布者</th>
			<th>发布日期</th>
			<th>截止日期</th>
			<th>标题</th>
			<th>通知详情</th>
		</tr>
		<c:forEach items="${adviceInfo }" var="info" varStatus="status">
			<c:if test="${status.index%2==0 }">
				<tr bgcolor="#CCCCCC" height="35px">
			</c:if>
			<c:if test="${status.index%2==1 }">
				<tr bgcolor="#B2DFEE" height="35px">
			</c:if>
			<td>${info.employeeName }</td>
			<td>${info.informTime }</td>
			<td>${info.informValidityEnd }</td>
			<td>${info.informTitle }</td>
			<td>${info.informInfo }</td>
			</tr>
		</c:forEach>
	</table>
</body>

</html>