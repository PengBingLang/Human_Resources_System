<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="jquery-2.1.0.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				$("#close").click(function() {
					$("#zz").remove();
					window.location.href = "welcome.html";
				});
				
				// 选择全部
				function getById(id) {
					return document.getElementById(id);
				}
			
				var selectAll = getById('selectAll');

				selectAll.onclick = function() {
					var cks = list.getElementsByTagName('input');
					var i;
					var length = cks.length;
					var ck;
					for(i = 0; i < length; i++) {
						ck = cks[i];
						if(!ck.checked) {
							ck.checked = true;
						}
					}
				};
				
				// 全部不选
				var noselectAll = getById('noselectAll');
				noselectAll.onclick = function() {
					var cks = list.getElementsByTagName('input');
					var i;
					var length = cks.length;
					var ck;
					for(i = 0; i < length; i++) {
						ck = cks[i];
						if(ck.checked) {
							ck.checked = false;
						}
					}
				};
				
				//导出操作
				$("#report").click(function(){
					var cks = $("#list li .tab");
					var reportTabs = [];
					for(i in cks) {
						if(cks[i].checked) {
							// 获取选中的内容集
							reportTabs.push(cks[i].value).toString;
						}
					}
					// 如果数组为空则没有选择提示之
					if(reportTabs.toString()==""){
						alert("请选择需要导出的表");
					}else{
					// 异步提交给后台进行操作
						$.ajax({
							type : "post",
							url : "/Human_Resources_System/servlet/ReportTabServlet",
							data : {
								// 将要导出的表名集合提交
								reportTabs : reportTabs.toString()
							},
							/* dataType:"json", */
							success :function(rs) {
								// count是true出现的次数,
								var count = (rs.split("true")).length-1;
								if(count>=1) {
									alert("导出成功"+count+"个数据表，至D根目录");
								}else{
									alert("抱歉，导出失败,可能原因为已存在此表或文件正在使用");
								}
							}
						});
					}
				});
			};
 
		</script>
		<style type="text/css">
			body {
				background: url("img/welcome.jpg");
				background-size: 100% auto;
			}
			
			#zz {
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				bottom: 0;
				right: 0;
				/*透明度rgb实现方式*/
				background: rgba(0, 0, 0, 0.5);
				/* 设置css透明度 依次兼容 ie 火狐 谷歌*/
				/* filter:alpha(Opacity=65); 
			-moz-opacity:0.65;
			opacity: 0.65;  */
			}
			
			#insertdiv {
				position: absolute;
				margin: auto;
				position: absolute;
				top: 0;
				left: 0;
				bottom: 0;
				right: 0;
				background-color: white;
				width: 400px;
				height: 65%;
				border-radius: 10px 10px 10px 10px;
				/* 设置透明度 */
				/* filter:alpha(Opacity=90);-moz-opacity:1.0;opacity: 1.0;  */
			}
			
			#title {
				width: 100%;
				height: 40px;
				text-align: center;
				line-height: 220%;
				background-color: #4F94CD;
				border-radius: 10px 10px 0px 0px;
				margin-bottom: 20px;
			}
			
			#title p {
				float: left;
				width: 20%;
				height: 100%;
				margin: 0px;
				font-size: 16px;
				margin-left: 20px;
			}
			
			#close {
				border: 0px;
				background-color: #4F94CD;
				width: 40px;
				height: 100%;
				float: right;
				border-radius: 0px 10px 0px 0px;
			}
			
			#ok {
				border: 0px;
				width: 70px;
				height: 30px;
				margin: 10px auto;
				background-color: #EEAD0E;
				border-radius: 3px 3px 3px 3px;
				color: white;
			}
			
			#div {
				margin: 0 auto;
				width: 300px;
				height: 100%;
			}
			
			#list li {
				line-height: 30px;
			}
		</style>
    </head>
    <body>
    		<div id="zz">
			<div id="insertdiv">
				<div id="title">
					<p id="top"></p>
					<button id="close">X</button>
				</div>
				<table align="center" cellpadding="20px" cellspacing="0px" width="100%">
					<tr>
						<div id="div">
							<div id="but" align="center">
								<input type="button" value="选择全部" id="selectAll" />
								<input type="button" value="全部不选" id="noselectAll" />
								<input type="button" value="导出" id="report" />
							</div>
							<hr />
							<h2 align="left">选择数据:</h2>
							<hr />
							<ul id="list">
								<li><input type="checkbox" value="rankTab" class="tab">职称表</li>
								<li><input type="checkbox" value="departmentTab" class="tab">部门表</li>
								<li><input type="checkbox" value="employeeInfoTab" class="tab">员工信息表</li>
								<li><input type="checkbox" value="attendanceCountTab" class="tab">考勤统计表</li>
								<li><input type="checkbox" value="salaryInfoTab" class="tab">工资信息表</li>
							</ul>
						</div>
					</tr>
				</table>
			</div>
		</div>
 	</body>
</html>