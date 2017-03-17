<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>notFound</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		:root {
			  --X: 0;
			  --Y: 0;
			}
			* {
			  box-sizing: border-box;
			  -webkit-animation: fadeIn 0.5s;
			          animation: fadeIn 0.5s;
			}
			body {
			  background-color: #111;
			  color: #fafafa;
			  display: -webkit-box;
			  display: -ms-flexbox;
			  display: flex;
			  -webkit-box-align: center;
			      -ms-flex-align: center;
			          align-items: center;
			  -webkit-box-pack: center;
			      -ms-flex-pack: center;
			          justify-content: center;
			  overflow: hidden;
			  height: 100vh;
			  width: 100vw;
			}
			@media (max-width: 768px) {
			  h2 {
			    font-size: 16px;
			  }
			}
			h1 {
			  font-size: 110px;
			  margin: 4px;
			  display: inline-block;
			}
			@media (max-width: 768px) {
			  h1 {
			    -webkit-transition: all 0.25s ease 0s;
			    transition: all 0.25s ease 0s;
			    font-size: 60px;
			  }
			}
			h1:nth-of-type(1) {
			  color: #f00;
			  --scaleX: 40;
			  --scaleY: -40;
			  --translateX: calc((var(--X)) * var(--scaleX) * 1px);
			  --translateY: calc((var(--Y)) * var(--scaleY) * 1px);
			  -webkit-transform: translate(var(--translateX), var(--translateY));
			          transform: translate(var(--translateX), var(--translateY));
			  z-index: 3;
			}
			h1:nth-of-type(2) {
			  color: #ffa500;
			  --scaleX: -50;
			  --scaleY: 50;
			  --translateX: calc((var(--X)) * var(--scaleX) * 1px);
			  --translateY: calc((var(--Y)) * var(--scaleY) * 1px);
			  -webkit-transform: translate(var(--translateX), var(--translateY));
			          transform: translate(var(--translateX), var(--translateY));
			  z-index: 2;
			}
			h1:nth-of-type(3) {
			  color: #008000;
			  --scaleX: 30;
			  --scaleY: 30;
			  --translateX: calc((var(--X)) * var(--scaleX) * 1px);
			  --translateY: calc((var(--Y)) * var(--scaleY) * 1px);
			  -webkit-transform: translate(var(--translateX), var(--translateY));
			          transform: translate(var(--translateX), var(--translateY));
			  z-index: 1;
			}
			h1:nth-of-type(4) {
			  z-index: 4;
			  --scaleX: -50;
			  --scaleY: -50;
			  --translateX: calc((var(--X)) * var(--scaleX) * 1px);
			  --translateY: calc((var(--Y)) * var(--scaleY) * 1px);
			  -webkit-transform: translate(var(--translateX), var(--translateY));
			          transform: translate(var(--translateX), var(--translateY));
			}
			@-webkit-keyframes fadeIn {
			  from {
			    opacity: 0;
			  }
			  to {
			    opacity: 1;
			  }
			}
			@keyframes fadeIn {
			  from {
			    opacity: 0;
			  }
			  to {
			    opacity: 1;
			  }
			}
		
	</style>

  </head>
  
  <body>
    <h1>4</h1>
	<h1>0</h1>
	<h1>4</h1>
	<h2>此功能等待开发，敬请期待！</h2>
	<h1>??</h1>
  </body>
</html>
