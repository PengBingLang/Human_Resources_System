<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>全部员工信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<script type="text/javascript" src="jquery-2.1.0.js"></script>
		<script type="text/javascript">
			var allEmployee = null; //记录全部员工表信息
			var allRank = null; //记录全部职称表信息
			var allDepartment = null; //记录全部部门表信息
			var tableTitle = "<table border='1' cellpadding='5' cellspacing='0'><tr height='40px' bgcolor='#6495ED' align='center'><th>工号</th><th>密码</th><th>员工姓名</th><th>身份证号码</th><th>性别</th><th>联系电话</th><th>住址</th><th>入职时间</th><th>职称</th><th>所属部门</th><th>操作</th></tr>";

			function getAllInfo() { //刷新
				$.ajax({
					type: "get",
					url: "/Human_Resources_System/servlet/SetEmployee",
					dataType: "json", //在数据接收时设置数据格式
					success: function(result) {
						allEmployee = result[0];
						allRank = result[1];
						allDepartment = result[2];
						var html = tableTitle;
						for(var i = 0; i < allEmployee.length; i++) {
							if(i % 2 == 0) {
								html += "<tr bgcolor='#CCCCCC' height='35px'>";
							} else {
								html += "<tr bgcolor='#B2DFEE' height='35px'>";
							}
							html += "<td>" + allEmployee[i].employeeNumber + "</td>";
							html += "<td>" + allEmployee[i].employeePwd + "</td>";
							html += "<td>" + allEmployee[i].employeeName + "</td>";
							html += "<td>" + allEmployee[i].employeeID + "</td>";
							html += "<td>" + allEmployee[i].employeeGender + "</td>";
							html += "<td>" + allEmployee[i].employeeTel + "</td>";
							html += "<td>" + allEmployee[i].employeeAddress + "</td>";
							html += "<td>" + allEmployee[i].employeeOutTime + "</td>";
							html += "<td>" + getRankName(allEmployee[i].rankID) + "</td>";
							html += "<td>" + getDepartmentName(allEmployee[i].departmentID) + "</td>";
							html += "<td><input type='button' value='修改' onclick='update(" + i + ")' /></td>";
							html += "</tr>"
						}
						html += "</table>";
						$("#div").html(html);
						$("input[name='reset']").click(); //清空表单
						$("#sub").removeAttr("disabled"); //使提交按钮可用
						$("#employeeNumber").attr("readOnly", false); //文本框可用
						//添加下拉框选项：
						$("#rankName option").remove();
						$("#departmentName option").remove();
						for(var i = 0; i < allRank.length; i++) {
							$("#rankName").append("<option value='" + allRank[i].rankID + "'>" + allRank[i].rankName + "</option>");
						}
						for(var i = 0; i < allDepartment.length; i++) {
							$("#departmentName").append("<option value='" + allDepartment[i].departmentID + "'>" + allDepartment[i].departmentName + "</option>");
						}
					}
				});
			}

			function getRankName(id) {
				for(var i = 0; i < allRank.length; i++) {
					if(allRank[i].rankID == id) {
						return allRank[i].rankName;
					}
				}
			}

			function getDepartmentName(id) {
				for(var i = 0; i < allDepartment.length; i++) {
					if(allDepartment[i].departmentID == id) {
						return allDepartment[i].departmentName;
					}
				}
			}

			//点击修改按钮：
			function update(i) {
				$("#employeeNumber").val(allEmployee[i].employeeNumber);
				$("#employeeNumber").attr("readOnly", true); //不可编辑，可以传值
				$("#employeePwd").val(allEmployee[i].employeePwd);
				$("#employeePwd1").val(allEmployee[i].employeePwd);
				$("#employeeName").val(allEmployee[i].employeeName);
				$("#employeeID").val(allEmployee[i].employeeID);
				var radios = document.getElementsByName("gender");
				if(allEmployee[i].employeeGender == "男") {
					radios[0].checked = true;
				} else {
					radios[1].checked = true;
				}
				$("#employeeTel").val(allEmployee[i].employeeTel);
				$("#employeeAddress").val(allEmployee[i].employeeAddress);
				$("#employeeOutTime").val(allEmployee[i].employeeOutTime);
				$("#rankName").val(allEmployee[i].rankID);
				$("#departmentName").val(allEmployee[i].departmentID);
			}

			//失去焦点事件，判断工号的唯一性
			function isOnly() {
				if($("#employeeNumber").val() == "") {
					$("#print").val("注意：工号是必填项");
					$("#print").css("color", "#FF8C00");
					return;
				}
				for(var i = 0; i < allEmployee.length; i++) {
					if($("#employeeNumber").val() == allEmployee[i].employeeNumber) {
						$("#print").val("注意：此工号已存在");
						$("#print").css("color", "#FF8C00");
						return;
					}
				}
				if($("#print").val().indexOf("注意：") != -1) {
					$("#print").val("");
				}
			}

			//失去焦点事件，判断两次密码输入的唯一性
			function isPwd() {
				if($("#employeePwd").val() == $("#employeePwd1").val()) {
					$("#print").val("");
					$("#sub").removeAttr("disabled");
				} else {
					$("#print").val("两次密码不一致！");
					$("#print").css("color", "red");
					$("#sub").attr("disabled", "true");
				}
			}

			//提交按钮
			function mySubmit() {
				var employeeNumber = $("#employeeNumber").val();
				var employeePwd = $("#employeePwd").val();
				var employeeName = $("#employeeName").val();
				var employeeID = $("#employeeID").val();
				var employeeGender = $('input:radio[name="gender"]:checked').val();
				var employeeTel = $("#employeeTel").val();
				var employeeAddress = $("#employeeAddress").val();
				var employeeOutTime = $("#employeeOutTime").val();
				var rankID = $("#rankName").val();
				var departmentID = $("#departmentName").val();

				if(employeeNumber == "" || employeePwd == "" || employeeName == "" || employeeID == "" || employeeGender == "" || employeeTel == "" || employeeAddress == "" || employeeOutTime == "" || rankID == "" || departmentID == "") {
					alert("每一项都是必填项，请补充完整！");
					return;
				}

				var myType = 1;
				for(var i = 0; i < allEmployee.length; i++) {
					if(employeeNumber == allEmployee[i].employeeNumber) {
						myType = 0;
						break;
					}
				}

				$.ajax({
					type: "post",
					url: "/Human_Resources_System/servlet/SetEmployee",
					data: {
						myType: myType,
						employeeNumber: employeeNumber,
						employeePwd: employeePwd,
						employeeName: employeeName,
						employeeID: employeeID,
						employeeGender: employeeGender,
						employeeTel: employeeTel,
						employeeAddress: employeeAddress,
						employeeOutTime: employeeOutTime,
						rankID: rankID,
						departmentID: departmentID
					},
					dataType: "text", //在数据接收时设置数据格式
					success: function(result) {
						if(result.indexOf("成功") != -1) {
							getAllInfo();
						}
						alert(result);
					}
				});
			}
		</script>
	</head>

	<body bgcolor="#98F5FF" onload="getAllInfo()">
		<br />
		<!--1行3列Table布局-->
		<table align="center">
			<tr valign="top">
				<td>
					<!--添加或修改员工信息-->
					<form>
						<table border="1" cellpadding="5" cellspacing="0">
							<caption>
								<p>添加或修改员工信息：</p>
							</caption>
							<tr>
								<td align="right">工号：</td>
								<td><input type="text" id="employeeNumber" onblur="isOnly()" /></td>
							</tr>
							<tr>
								<td align="right">密码：</td>
								<td><input type="password" id="employeePwd" /></td>
							</tr>
							<tr>
								<td align="right">确认密码：</td>
								<td><input type="password" id="employeePwd1" onblur="isPwd()" /></td>
							</tr>
							<tr>
								<td align="right">员工姓名：</td>
								<td><input type="text" id="employeeName" /></td>
							</tr>
							<tr>
								<td align="right">身份证号码：</td>
								<td><input type="text" id="employeeID" /></td>
							</tr>
							<tr>
								<td align="right">性别：</td>
								<td>
									<input type="radio" name="gender" value="男" />男&nbsp;&nbsp;
									<input type="radio" name="gender" value="女" />女
								</td>
							</tr>
							<tr>
								<td align="right">联系电话：</td>
								<td><input type="text" id="employeeTel" /></td>
							</tr>
							<tr>
								<td align="right">住址：</td>
								<td><input type="text" id="employeeAddress" /></td>
							</tr>
							<tr>
								<td align="right">入职时间：</td>
								<td><input type="date" id="employeeOutTime" /></td>
							</tr>
							<tr>
								<td align="right">职称：</td>
								<td>
									<select id="rankName"></select>
								</td>
							</tr>
							<tr>
								<td align="right">所属部门：</td>
								<td>
									<select id="departmentName"></select>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<input type="text" id="print" readonly="true" style="background-color:transparent;border: none;" />
									<input type="reset" value="重填" name="reset" />
									<input type="button" id="sub" value="新增或修改" onclick="mySubmit()" />
								</td>
							</tr>
						</table>
					</form>
				</td>
				<td width="20px"></td>
				<td>
					<!--全部员工信息-->
					<p>
						全部员工信息:&nbsp;<input type="button" value="刷新" onclick="getAllInfo()" />
					</p>
					<div id="div"></div>
				</td>
			</tr>
		</table>
	</body>

</html>