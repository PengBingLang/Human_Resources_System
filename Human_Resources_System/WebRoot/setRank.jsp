<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职称设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.max{
			width: 50%;
			height:95%;
			margin: 0 auto;
		}
		#left{
			border-radius: 0px 0px 0px 20px;
			width: 80%;
			height: 95%;
			background-color: #D3D3D3;
			float: left;
			
		}
		#left table tr td {
			text-align: center;
		}
		#right{
			border-radius: 0px 0px 20px 0px ;
			width: 19.8%;
			height: 95%;
			background-color: #D3D3D3;
			float: right;
			
		}
		#header{
			border-radius: 20px 20px 0px  0px ;
			width: 100%;
			height: 50px;
			background-color: #4F94CD;
			font-size: 30px;
		}
		#top{
			font-size: 30px;
			text-align: center;
			line-height: 50px;
		}
		#right ul li {
			list-style-type: none;
		}
		#right ul li a {
			text-decoration: none;
			color: white;
		}
		.but{
			border:0px;
			width: 70px;
			height: 30px;
			margin:10px auto;
			background-color: #4F94CD;
			color: white;
		}
		body{
			background: url("img/welcome.jpg");
			background-size: 100% auto;
		}
		.update{
			width:100%;
			height:100%;
			border:0px #EBEBE4;
			background:#EBEBE4;
			color: red;
		}
		#rankInfo{
			margin-top: 20px;
		}
		.rankName,.rankSalary{
			border:0px;
			width: 100%;
			height:100%;
			text-align: center;
			readonly:readonly;
			color: black;
		}
		#msg{
			text-align: left;
			margin-left: 5%;
		}
		/* 遮罩，弹出框 */
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
			width: 300px;
			height: 250px;
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
			width: 70px;
			height: 100%;
			margin: 0px;	
			color: aqua;
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
	</style>
  </head>
  
  <body onload="Rankload();">
    <div class="max">
    	<div id= "header">
    		<p id="top">人事管理系统职称管理</p>
    	</div>
    	<div id="left">
    		<div id = "rankInfo">
    		<table align="center" border="1px" cellpadding="8px" cellspacing="0px" width="90%">
    			<th>职称序号</th>
    			<th>职称名称</th>
    			<th>职称工资</th>
    			<th>操作</th>
    		</table>
    		</div>
    		<p id="msg"></p>
	    </div>
	    <div id = "right">
	    	<ul>
	    		<li><button class="but" id="insert" onclick="insert();">✚添加</button></li>
	    		<li><button class="but" id="updates" onclick="update();">✎修改</button></li>
	    		<li><button class="but" id="refresh" onclick="Rankload();">〇刷新</button></li>
	    	</ul>
	    </div>
    </div>
    <div id="addzz">
    <!-- 利用jquery的点击事件添加遮罩及表单，下为添加的内容 -->
   <!--  <div id="zz">
    <div id="insertdiv">	
   		<div id = "title"><p >职称设置</p>
   			<button id="close">x</button>
   		</div>
    	<table align="center" cellpadding="20px" cellspacing="0px" width="100%">
    		<tr >
    			<td>职称：<input type="text" ></td>
    		</tr>
    		<tr>
    			<td>薪金：<input type="text"></td>
    		</tr>
    		<tr>
    			<td align="center"><button>添加</button></td>
    		</tr>
    	</table>
    </div>
    </div> -->
    
    </div>
    <script type="text/javascript" src="jquery-2.1.0.js"></script>
    <script type="text/javascript">
    	// 添加载入事件到body，ajax异步刷新数据
    	function Rankload(){
	    	$.ajax({
	    		type : "post", 
	    		url : "/Human_Resources_System/servlet/SetRankServlet",
	    		data : {
	    			selectType : "AllRank"  // 查询类型作为数据提交到servlet
	    		},
	    		dataType: "json",
	    		success : function(rs) {
	    			if(rs!=null){
		    			var html = "<table align='center' border='1px'  cellspacing='0px' width='90%'><th>职称序号</th><th>职称名称</th><th>职称工资</th><th>操作</th>";
		    			for(var i = 0;i< rs.length;i++){
		    				if(i % 2 == 0){
		    					html += "<tr bgcolor='#EBEBE4' height='35px'>";
		    				}else{
		    					html += "<tr bgcolor='#EBEBE4' height='35px'>";
		    				}
		    				/*  加入隐藏域用来获取当前选中的位置 */
		    				html += "<td>" + (rs[i].rankID+1) + "<input type='hidden' class='rankID' value='"+rs[i].rankID+"'></td>";
							html += "<td><input disabled class='rankName' type = 'text'   value = '" + rs[i].rankName +"'></td>";
							html += "<td><input disabled class='rankSalary' type = 'text'  value = '" + rs[i].rankSalary +"'></td>";
							html += "<td><button class='update'>只读</button></td>";
							html += "</tr>";
		    			}
	    				$("#rankInfo").html(html);
	    			}else{
	    				alert("未查询到任何数据");
	    			}
	    		}
	    	});
	    }
	    
	    //  点击修改按钮事件，可编辑表格，
    	function update() {
    		//  设置文本框可编辑
			$(".rankName,.rankSalary").removeAttr("disabled");
			//  改变提交修改的链接颜色
			$(".update").css("color","green");
			//  改变文本
			$(".update").text("✎执行修改");
			//  焦点事件变当前输入框颜色
			$(".rankName,.rankSalary").focus(function(){
				$(this).css("border","2px solid red");
   			});
   			//  失去焦点和背景同色
   			$(".rankName,.rankSalary").blur(function(){
				$(this).css("border","1px solid wite");
   			});
   			//  添加提示信息
   			$("#msg").html("备注:数据无价，请按照要求写入数据！<ul><li>工资列必须为数字，不得有汉字，字母！</li><li>为防止数据丢失，请在修改数据后点击执行！</li></ul>"); 
   			
   			/* 执行修改操作 */
   			//  拿到元素数组
				var rankIDs = $(".rankID");
				var rankNames = $(".rankName");
				var rankSalarys = $(".rankSalary");
				var updates = $(".update");
   			//  执行修改的点击事件,获取当前单击的行
   			$(".update").click(function (){
				/* 获取当前点击的标签对象在该对象数组中的位置 */
				var index = updates.index($(this));
				//  获取当前位置所对应行的信息文本框中的内容
				var rankID = rankIDs.eq(index).val();
				var rankName = rankNames.eq(index).val();
				var rankSalary = rankSalarys.eq(index).val();
				if(rankSalary){
					
				}
				//  将当前行的文本框值为不可输入
				rankNames.eq(index).attr("disabled","true");
				rankSalarys.eq(index).attr("disabled","true");
				/* 将获取到的信息异步提交给后台 */
				$.ajax({
					type:"get",
					url:"/Human_Resources_System/servlet/SetRankServlet",
					data:{
						type:"update",
						rankID : rankID,
						rankName : rankName,
						rankSalary : rankSalary
					},
					dataType:"json",
					success :function(rs){
						if(rs){
							alert("修改成功");
						}else if(!rs){
							alert("修改失败,请重试");
							Rankload();
						}
					}
				});
			});
		};
		
		//  添加职称按钮的点击事件，弹出一个遮罩层和输入表单框
		function insert(){
			var addzz = "<div id='zz'><div id='insertdiv'><div id = 'title'><p >职称添加</p><button id='close'>x</button></div><table align='center' cellpadding='20px' cellspacing='0px' width='100%'>"
			+"<tr ><td>职称：<input type='text' id='newRankID' ></td></tr><tr><td>薪金：<input type='text' id='newRankSalary'></td></tr><tr><td align='center'><button id='ok'>确认添加</button></td></tr></table></div></div>";
			// 将遮罩和输入弹出
			$("#addzz").html(addzz);
			//  给弹出的输入框一个关闭窗口的时事件，移除遮罩层的内容
			$("#close").click(function(){
				$("#zz").remove();
			});
			//  给确认提交一个点击事件,异步提交数据
			$("#ok").click(function(){
				var rankName = $("#newRankID").val();
				var rankSalary = $("#newRankSalary").val();
				$.ajax({
					type:"get",
					url:"/Human_Resources_System/servlet/SetRankServlet",
					data:{
						type:"insert",
						rankName:rankName,
						rankSalary:rankSalary
					},
					dataType:"json",
					success :function(rs){
						if(rs){
							alert("添加成功！");
							Rankload();
						}else{
							alert("添加失败！已有此职称或输入不正确");
						}
					}
				});
			});
		};
		
    </script>
  </body>
</html>
