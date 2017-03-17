<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">

<title>找回密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<br />
	<br />
	<table align="center" width="961" cellspacing="0" border="1"
		bordercolor="#9ACDFF">
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">工号：&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td rowspan="7">
				<table cellspacing="0" border="1" bordercolor="#E8E5E8" width="720">
					<tr height="29">
						<td><input type="text" id="workID" /></td>
					</tr>
					<tr height="30">
						<td><input type="text" id="name" /></td>
					</tr>
					<tr height="30">
						<td><input type="text" id="peopleID" /></td>
					</tr>
					<tr height="30">
						<td><input type="radio" name="sex" value="男" />男&nbsp;&nbsp;
							<input type="radio" name="sex" value="女" />女</td>
					</tr>
					<tr height="30">
						<td><input type="text" id="tel" /></td>
					</tr>
					<tr height="30">
						<td><input type="date" id="date" /></td>
					</tr>
					<tr height="29">
						<td><input type="text" id="check" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">姓名：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">身份证号码：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">性别：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">电话：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">入职日期：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>

		<tr height="30">
			<td align="right" width="240" bgcolor="#E7FBFF">验证码：&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr align="center">
			<td colspan="2"><img
				src="/Human_Resources_System/servlet/CheckCodeServlet" id="img" />
				<b id="test">看不清楚？点击图片更换</b></td>
		</tr>
	</table>
	<p align="center">
		<input type="button" id="button" value="确认" />
	</p>
	<p align="center" id="info"></p>
</body>

<script type="text/javascript" src="jquery-2.1.0.js"></script>
<script type="text/javascript">
	//通过点击事件获取并显示验证码图片：
	$("#img").click(function() {
		var date = new Date();
		//给每次刷新的图片加上时间戳 
		$("#img").attr("src","/Human_Resources_System/servlet/CheckCodeServlet?time="
			+ date.getTime());
	});

	$("#button").click(function() {
		var workID = $("#workID").val();
		var name = $("#name").val();
		var peopleID = $("#peopleID").val();
		var gender = $('input:radio[name="sex"]:checked').val();
		var tel = $("#tel").val();
		var date = $("#date").val();
		var code = $("#check").val();

		if (workID != "" && name != "" && peopleID != ""
				&& gender != "" && tel != "" && date != ""
				&& code != "") {

			$.ajax({//局部刷新，判断验证码是否正确
				url : "/Human_Resources_System/servlet/CheckCodeServlet",
				type : "post",
				data : {
					code : code
				},
				dataType : "json",//在数据接收时设置数据格式
				success : function(result) {
					if (result) {//继续异步验证个人信息
						$.ajax({ //局部刷新
							url : "/Human_Resources_System/servlet/PwdChangeServlet",
							type : "post",
							data : {
								employeeNumber : workID,
								employeeName : name,
								employeeID : peopleID,
								employeeGender : gender,
								employeeTel : tel,
								employeeOutTime : date
							},
							dataType : "text", //在数据接收时设置数据格式
							success : function(result) {
								$("#info").text(result);
								if (result.indexOf("成功") == -1) {
									$("#info").css("color","red");
								} else {
									$("#info").css("color","green");
									$("#button").attr("disabled", "true");
								}
							}
						});
					} else {
						$("#info").text("验证码不正确");
						$("#info").css("color", "red");
					}
				}
			});
		} else {
			$("#info").text("每一项都是必填项，不能为空！");
			$("#info").css("color", "red");
		}
	});
</script>

</html>