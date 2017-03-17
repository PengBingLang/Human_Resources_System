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

<title>上班签到</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	window.onload = function() {
		var clock = document.getElementsByClassName("clock")[0];
		draw();
		var time = new Date();
		var h = drawpointer(8, 100, "#000", time.getHours() * 30
				+ time.getMinutes() * 6 / 12);
		var m = drawpointer(6, 180, "#000", time.getMinutes() * 6);
		var s = drawpointer(4, 260, "red", time.getSeconds() * 6);
		setInterval(function() {
			var time = new Date();
			h.style.transform = "rotate("
					+ (time.getHours() * 30 + time.getMinutes() * 6 / 12)
					+ "deg)";
			m.style.transform = "rotate(" + time.getMinutes() * 6 + "deg)";
			s.style.transform = "rotate(" + time.getSeconds() * 6 + "deg)"
		}, 1000);

		function draw() {
			for ( var i = 0; i < 60; i++) {
				var newdiv = document.createElement("div");
				var m, h;
				if (i % 5 == 0) {
					m = 8;
					h = 25;
				} else {
					m = 6;
					h = 15;
				}
				newdiv.style.cssText = "width:"
						+ m
						+ "px;height:"
						+ h
						+ "px;background:#000;position:absolute;left:0;top:0;transform:translate("
						+ (600 - m) / 2 + "px,0) rotate(" + i * 6
						+ "deg);transform-origin:" + m / 2 + "px 300px"
				clock.appendChild(newdiv);
			}
		}

		function drawpointer(w, h, b, d) {
			var newdiv = document.createElement("div");
			//                中间的圆
			var newd = document.createElement("div");
			newd.style.cssText = "width:50px;height:50px;border-radius:50%;background: radial-gradient(circle at 50% 50%,rebeccapurple,royalblue);position:absolute;left:"
					+ (600 - 50) / 2 + "px;top:" + (600 - 50) / 2 + "px;"
			newdiv.style.cssText = "width:" + w + "px;height:" + h
					+ "px;position:absolute;left:" + (600 - w) / 2 + "px;top:"
					+ (300 - h) + "px;background:" + b + ";transform:rotate("
					+ d + "deg);transform-origin:center bottom;";
			clock.appendChild(newdiv);
			clock.appendChild(newd);
			return newdiv;
		}
	}
</script>

<script type="text/javascript">
	function NowTime() {
		//创建对象：
		var MyDayte = new Date();
		//用对象调用方法实现功能：（获取当前系统时间）
		var yyyy = MyDayte.getFullYear();
		var mm = MyDayte.getMonth() + 1;
		var dd = MyDayte.getDate();
		var week = MyDayte.getDay(); //星期
		var hh = MyDayte.getHours();
		var min = MyDayte.getMinutes();
		var ss = MyDayte.getSeconds();
		/*
		使用with简写：
		with(MyDayte){
		var yyyy = getFullYear();
		var mm = getMonth() + 1;
		var dd = getDate();
		var week = getDay(); //星期
		var hh = getHours();
		var min = getMinutes();
		var ss = getSeconds();
		}
		 */
		//获取显示输出的标签：
		var pID = document.getElementById("p_time");
		//使标签的HTML显示为下面的内容：
		pID.innerHTML = "当前时间：" + yyyy + "年" + mm + "月" + dd + "日，星期" + week
				+ "，" + hh + ":" + min + ":" + (ss < 10 ? "0" + ss : ss);
		//每隔1s调用一次自身：（相当于刷新）
		//setTimeout("NowTime()", 1000);
	}

	function LoadTime() {
		setInterval("NowTime()", 1000);
	}
</script>

<style>
body {
	background: radial-gradient(circle at 50% 50%, #ccc, rebeccapurple);
}

.clock {
	width: 600px;
	height: 600px;
	/*background: radial-gradient(circle at 50% 50%,rebeccapurple,royalblue);*/
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto;
	border-radius: 50%;
}
</style>
</head>

<body onload="LoadTime()">
	<div class="clock"></div>
	<div
		style="text-align:center;margin:5px 0; font:normal 14px/24px 'MicroSoft YaHei';">
		<p>
			<font color="red" size="4" id="p_time"></font>
		</p>
		<p>
			<input type="button" id="button" value="上班签到"
				style="font-size: 20px;" />
		</p>
		<p>
			<font color="red" id="info" size="4"></font>
		</p>
	</div>
</body>

<script type="text/javascript" src="jquery-2.1.0.js"></script>
<script type="text/javascript">
	$("#button").click(function() {
		$.ajax({ //局部刷新
			url : "/Human_Resources_System/servlet/AttendanceServlet",
			type : "post",
			data : {
				type : "上班签到"
			},
			dataType : "text", //在数据接收时设置数据格式
			success : function(result) {
				$("#info").text(result);
				$("#button").attr('disabled', "true");
			}
		});
	});
</script>
</html>
