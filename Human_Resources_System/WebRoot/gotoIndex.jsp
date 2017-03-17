<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#show{
			text-align:center;
			font-size: 20px;
			margin-top: 100px;
		}
	</style>
  	<script type="text/javascript">
			function close() {
				window.open("/Human_Resources_System/showAttendanceAll.jsp","_self").close();
			}
 			var time=3;
		function closeWindow(){
			window.setTimeout('closeWindow()',300);
			if(time>=0){document.getElementById("show").innerHTML="提交成功，本页面将在<font color=red>"+time+"</font>秒后关闭";
				time--;
			}else{
    			window.open("/Human_Resources_System/showAttendanceAll.jsp","_self").close();
			}
 		 }
    </script>
  </head>
  <body onload="closeWindow();">
    <p id="show">已提交，窗口将在3秒后关闭</p>
  </body>
</html>
