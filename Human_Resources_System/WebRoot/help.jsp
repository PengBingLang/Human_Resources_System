<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>帮助信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			background: url("img/welcome.jpg");
  			background-size: 100% auto;
		}
		#zz{
			position:absolute; 
			width: 100%;
			height: 100%;
			top: 0; left: 0; bottom: 0; right: 0;
			/*透明度rgb实现方式*/
			background:rgba(0,0,0,0.5);
			/* 设置css透明度 依次兼容 ie 火狐 谷歌*/
			/* filter:alpha(Opacity=65); 
			-moz-opacity:0.65;
			opacity: 0.65;  */
		}
		
		#insertdiv{
			position:absolute; 
			margin: auto;  
  			position: absolute;  
  			top: 0; left: 0; bottom: 0; right: 0;
		  	background-color:white;
			width: 500px;
			height: 300px;
			border-radius: 10px 10px 10px 10px;
			/* 设置透明度 */
			/* filter:alpha(Opacity=90);-moz-opacity:1.0;opacity: 1.0;  */
		}
		#title{
			width:100%;
			height: 13%; 
			text-align: center;
			line-height: 220%; 
			background-color: #4F94CD;
			border-radius: 10px 10px 0px 0px; 
			margin-bottom: 20px;
		}
		#title p{
			float: left;
			width: 20%;
			height: 100%;
			margin: 0px;	
			font-size:16px;
			margin-left: 20px;
		}
		#close{
			border:0px;
			background-color:#4F94CD;
			width: 40px;
			height: 100%;
			float: right;
			border-radius: 0px 10px 0px 0px; 
		}
		#ok{
			border:0px;
			width: 70px;
			height: 30px;
			margin:10px auto;
			background-color: #EEAD0E;
			border-radius: 3px 3px 3px 3px;
			color: white;
		}
		.li{
			line-height: 30px;
		}
	</style>
  </head>
  
  <body onload="helpLoad();"/>
	  <!-- 隐藏域存储点击类型 -->
	  <input type="hidden" value="${helpType}" id="help">
	  
	 <div id="zz">
    <div id="insertdiv">	
   		<div id = "title"><p id="top" ></p>
   			<button id="close">X</button>
   		</div>
    	<table align="center" cellpadding="20px" cellspacing="0px" width="100%">
    		<tr >
    		<ul>
  				<li class="li" id="l1"></li>
  				<li class="li" id="l2"></li>
  				<li class="li" id="l3"></li>
  				<li class="li" id="l4"></li>
  				<li class="li" id="l5"></li>
  			</ul>
    		</tr>
    	</table>
    </div>
    </div>
  </body>
  <script type="text/javascript" src="jquery-2.1.0.js"></script>
  <script type="text/javascript">
  	function helpLoad(){
  		// 获取帮助类型
  		var helpType = $("#help").val();
  		if(helpType=="user"){
			$("#top").text("用户帮助");
			$("#l1").text("公司将致力于制造业为主的业务发展方向。");
			$("#l2").text("同时坚持以人为本的企业文化。");
			$("#l3").text("用现代化的管理技术手段对员工进行有效管理。");
			$("#l4").text("充分发挥每个人的工作潜能。");
			$("#l5").text("加油！");
		}else if(helpType=="adm"){
			$("#top").text("管理员帮助");
			$("#l1").text("用现代化的管理技术手段对员工进行有效管理。");
			$("#l2").text("充分发挥每个人的工作潜能。");
			$("#l3").text("规范企业人员管理、帮助老板轻松管理企业。");
			$("#l4").text("无纸化的电子阅办，减少了很多资源上的浪费。");
			$("#l5").text("加油！");
		}else if(helpType=="set"){
			$("#top").text("系统设置帮助");
			$("#l1").text("营造宽松的人文环境");
			$("#l2").text("增强企业的凝聚力");
			$("#l3").text("完善人力资源管理的激励约束机制");
			$("#l4").text("企业就会在激烈的市场竞争中立于不败之地。");
			$("#l5").text("加油！");
		}else if(helpType=="about"){
			$("#top").text("关于我们");
			$("#l1").text("软件实现：MySQL5.7 + MyEclipse2013 + jQery2.1 + Tomcat7.0");
			$("#l2").text("站点物理地址：http://localhost:8080");
			$("#l3").text("bug说明：无");
			$("#l4").text("客服电话：110，120，119");
			$("#l5").text("加油！");
		}
  	};
  	
  	$("#close").click(function(){
		$("#zz").remove();
		window.location.href="welcome.html";
	});
  </script>
</html>
