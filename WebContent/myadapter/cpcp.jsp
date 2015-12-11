<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 临床路径版本之间执行效果对比 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/cpcp.js"></script>
<script type="text/javascript" src="js/jscharts.js"></script>
<script type="text/javascript" src="js/jscharts.plug.mb.js"></script>
<link href="css/va.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<body>
	<div id="container2">
		<div id="sidebar2">
			<table class="bordered" id="optionContainer">
				<thead>
					<tr>
					    <th>路径主ID</th>
						<th>路径ID</th>
						<th>路径名称</th>
						<th>路径编码</th>
						<th>版本号</th>						
					</tr>
				</thead>
			</table>
		</div>
		<div id="rightbar2">
			<table class="bordered" id="cpversions">
				<thead>
					<tr>
						<th>路径ID</th>
						<th>路径名称</th>
						<th>路径编码</th>
						<th>有效率(%)</th>
						<th>平均住院日</th>
						<th>平均住院费</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody id="cpversionscontain"></tbody>
			</table>
		</div>
	</div>
</body>
</body>
</html>