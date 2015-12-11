<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 临床路径节点变异数统计 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/vacp.js"></script>
<script type="text/javascript" src="js/jscharts.js"></script>
<script type="text/javascript" src="js/jscharts.plug.mb.js"></script>
<link href="css/va.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/table_css1.css" rel="stylesheet" type="text/css">
<body>
	<div id="container">
		<div id="sidebar">		
			<table class="bordered" id ="optionContainer">
				<thead>
					<tr >
					    <th>路径ID</th>						
						<th>路径名称</th>
						<th>路径编码</th>
						<th>变异个数</th>
						<th>完成个数</th>
						<th>变异率</th>
					</tr>
				</thead>				
			</table>
		</div>
		<div id="rightbar">
			<div id="graphTitle"></div>
			<div id="graph"></div>
			<div id="ordertable"></div>
			<table cellspacing="0" cellpadding="0" border="0"
				aria-labelledby="gbox_gridTable" role="grid" style="width: 100%"
				class="ui-jqgrid-htable">
				<thead>
					<tr class="ui-jqgrid-labels" role="rowheader">
						<th class="ui-state-default ui-th-column ui-th-ltr" role="columnheader" style="width: 5%;"></th>
						<th class="ui-state-default ui-th-column ui-th-ltr" role="columnheader" style="width: 9.5%;">医嘱名称</th>
						<th class="ui-state-default ui-th-column ui-th-ltr" role="columnheader" style="width: 14.5%;">医嘱编号</th>
						<th class="ui-state-default ui-th-column ui-th-ltr" role="columnheader" style="width: 4.5%;">执行频次</th>
					</tr>
				</thead>
				<tbody id='orderseqs'>

				</tbody>
			</table>
		</div>

	</div>
</body>
</body>
</html>