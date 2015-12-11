<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="path/to/jquery.treetable.css" rel="stylesheet"
	type="text/css" />
<script src="path/to/jquery.treetable.js"></script>
<script>
	$("#your_table_id").treetable();
</script>
</head>
<body>
	<table cellspacing="0" cellpadding="0" border="0"
		aria-labelledby="gbox_gridTable" role="grid" style="width: 100%"
		class="ui-jqgrid-htable">
		<thead>
			<tr class="ui-jqgrid-labels" role="rowheader">
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 5%;"></th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5%;">项目序号</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 14.5%;">项目名称</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 4.5%;">执行率</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5% %;">规格</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5% %;">必选</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5% %;">频率</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5% %;">剂量</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5% %;">单位</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5%;">数量</th>
				<th class="ui-state-default ui-th-column ui-th-ltr"
					role="columnheader" style="width: 9.5%;">单位</th>
			</tr>
		</thead>
<tbody>
				<tr id="day2" onclick="lap(this)"
					class="ui-widget-content jqgrow ui-row-ltr" role="row"
					tabindex="-1" style="height: auto">
					<td class="ui-state-default jqgrid-rownum"
						aria-describedby="gridTable_rn"
						style="text-align: center; width: 5%; border-style: none;"
						role="gridcell" align="left" orderid="day2">+</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell">484667</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 14.5%;" role="gridcell">第2天</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 4.5%;" role="gridcell">88%</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
				</tr>
				<tr parentid="day2" class="ui-widget-content jqgrow ui-row-ltr"
					role="row" tabindex="-1" style="height: auto; display: none;">
					<td class="ui-state-default jqgrid-rownum"
						aria-describedby="gridTable_rn"
						style="text-align: center; width: 5%; border-style: none;"
						role="gridcell" align="left">&nbsp;&nbsp;</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell">484668</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 14.5%;" role="gridcell">一次性空针20ml(洁璃)(透析纸)</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 4.5%;" role="gridcell">89%</td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
					<td aria-describedby="gridTable_USER_NAME" title="0672"
						style="text-align: center; width: 9.5%;" role="gridcell"></td>
				</tr>				
			</tbody>
		</table>
</body>
</html>