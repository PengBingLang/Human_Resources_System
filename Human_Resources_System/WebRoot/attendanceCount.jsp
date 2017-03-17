<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工考勤统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		
		#header{
			width: auto;
			height: 50px;
			background-color: #4F94CD;
			
		}
		#header p{
			font-size: 30px;
			text-align: center;
			line-height: 50px;
		} 
		#input{
			border:1px solid #6495ED;
			width: 400px;
			height:500px;
			margin: 50px auto;
			background-color: #66CDAA;
		}
		#num,#bging,#end,#day,#sub{
			margin-top: 50px;
			width: 300px;
			margin-left: auto;
			margin-right: auto;
		}
	</style>

  </head>
  	
  <body bgcolor="#B4EEB4">
    	<div id = "header"><p>人事管理考勤统计</p></div>
    	<form action="/Human_Resources_System/servlet/AttendanceCount" method="post" id="form1" onsubmit="return CheckForm(this)">
    		<div id = "input"> 
    			<!-- 输入工号同时检测工号是否存在 -->
    			<div id="num">输入工号:&nbsp;<input type="text" name="employeeNumber" id="employeeNumber"> <font id="tips"></font></div>
    			<div id="bging">开始时间:&nbsp;<input style="width: 172px" class="laydate-icon" id="bgingtime" name="bgingtime" ></div>
    			<div id="end">结束时间:&nbsp;<input style="width: 172px" class="laydate-icon" id="endtime" name="endtime" ></div>
    			
    			<div id="day">应出勤天:&nbsp;<input type="text" name="totalAttendance"></div>
    			<div id = "sub" style="text-align: center;"><input type="submit" value="开始统计" id="submit"> </div>
    		</div>
    	</form>
		<!-- 日期选择的实现及函数库插件导入 -->
		<script type="text/javascript" src="laydate/laydate.js"></script>
		<script>
			;!function(){laydate({
 									elem: '#bgingtime'
						}),
						laydate({
 									elem: '#endtime'
						})
				}();
				
				//  如果有数据没填就提交则提示
			function CheckForm(form) {
                if(form.employeeNumber.value == ""||form.bgingtime.value=="" ||form.endtime.value==""||form.totalAttendance.value=="") {
                    alert("请将统计信息填写完整！");
                    return false;
                }
            return true;
            }
		</script>
		
		<!-- 工号是否存在的验证 -->
		<script type="text/javascript" src="jquery-2.1.0.js"></script>
		<script type="text/javascript">
			//  校验工号是否存在
			$("#employeeNumber").blur(function() {
				var employeeNumber = $("#employeeNumber").val();
				$.ajax({
					url : "/Human_Resources_System/servlet/CheckEmployeeNumber",
					data : {
						employeeNumber : employeeNumber
					},
					success : function(result) {
						if (result) {
							$("#tips").text("×");
							$("#tips").css("color", "red");
							document.getElementById("submit").disabled = 'true';//禁用提交
						} else {
							$("#tips").text("√");
							$("#tips").css("color", "green");
							document.getElementById("submit").removeAttribute("disabled");//恢复提交
						}
					}
				});
			});
			
			
		</script>
  </body>
</html>
