<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 临床路径节点变异数统计 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/va.css" />
<link rel="stylesheet" type="text/css" href="css/layout.css" />

<link rel="stylesheet" href="css/screen.css" media="screen" />
<link rel="stylesheet" href="css/jquery.treetable.css" />
<link rel="stylesheet" href="css/jquery.treetable.theme.default.css" />
<body >
	<div id="container">
		<div id="sidebar">
			<table class="bordered" id="optionContainer">
				<thead>
					<tr style="font-size:12px,font-family:Helvetica, Arial, sans-serif">
						<th style="display: none">路径ID</th>
						<th font-size:12px;>路径名称</th>
						<th>路径编码</th>
						<th>变异个数</th>
						<th>完成个数</th>
						<th>变异率</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="rightbar">
			<div id="mybtn">
				<input type="button" class='checkOrder' value="查看医嘱执行率" /> 
				<input type="button" class='checkNode' value="查看路径节点变异" />
				<input type="button" onclick="window.location.href='../cpmanage/cplist.jsp';" value="修改临床路径" />
			</div>
			<div id="mygraph"></div>
			<div id="myorders">
				<table class="bordered" id="example-advanced">
					<thead>
						<tr style='font-size:12px,font-family:Helvetica, Arial, sans-serif'>
							<th width="60%">Name</th>
							<th width="20%">Kind</th>
							<th width="20%">Size</th>
						</tr>
					</thead>
					<tbody id='orderseqs'></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/vacp.js"></script>
<script type="text/javascript" src="js/jscharts.js"></script>
<script type="text/javascript" src="js/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery.treetable.js"></script>
<script type="text/javascript" src="../public/plugins/easyui/jquery.easyui.min.js"></script>
</html>