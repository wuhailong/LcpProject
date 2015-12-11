<%
/*----------------------------------------------------------------
// Copyright (C) 2011 北京嘉和美康信息技术有限公司版权所有。
//
// 文件名：single.jsp  
// 文件功能描述：显示报表列表
// 创建人：康榕元
// 创建日期：2011-10-22
//----------------------------------------------------------------*/ 
%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="../public/plugins/jquery/themes/dcp/jquery-ui-1.8.16.custom.css">
<link rel="stylesheet" href="../public/plugins/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="../public/styles/style.css">
<script type="text/javascript" src="../public/plugins/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../public/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="../public/plugins/jqgrid/jquery.jqGrid.min.js"></script>

<style type="text/css">
body {
	padding: 0em;
}

.ui-jqgrid tr.jqgrow td {
	white-space: normal !important;
	vertical-align: text-top;
	padding-top: 2px;
}

.ui-widget {
	font-size: 12px;
}

.navi_title {
	float: left;
	width: 400px;
	margin: 5px;
	padding-left: 20px;
	overflow-x: hidden;
}

</style>
<script type="text/javascript">
$(function()
{
	$.jgrid.ajaxOptions.type = 'post';
	var searchtype=['cn','eq'];
		$("#gridTable").jqGrid({
		url:'../StatisticsServlet?op=single&opp=1',
		datatype: "json",
		height:( $(document).height()-80),
		colNames:['路径编码','路径名称', '所属科室', '路径创建时间', '路径类别'],
		colModel:[
					{name:'cp_id',index:'cp_id', width:50,align:"center",searchoptions:{ sopt:searchtype} },
					{name:'cp_name',index:'cp_name', width:200,align:"center",searchoptions:{ sopt:searchtype}},
					{name:'dept_name',index:'dept_name', width:80,align:"center",searchoptions:{ sopt:searchtype} }	,
					{name:'create_date',index:'create_date', width:150,align:"center",sortable:false,search:false},
					{name:'version_date',index:'version_date', width:150,align:"center",sortable:false,search:false}	

				],
		autowidth : true,
		viewrecords:true,
		rownumbers:true,
		rowNum:15,
		beforeRequest:function(){//每次读取前先清空表中数据
			 $(this).clearGridData("clearfooter");
		},
		rowList:[15,30],
		jsonReader:{
			repeatitems : false
		},
		pager:"#gridPager"}).navGrid('#gridPager', {
			edit : false,
			add : false,
			del : false,
			search:false
		});

		$("#selectCPType").change(function(){
			var ur='../StatisticsServlet?op=single&opp='+$(this).val();
			jQuery("#gridTable").setGridParam({url:ur}).hideCol("somecol").trigger("reloadGrid");
		});
		
		//jqGrid 自适应高度及宽度
		var t=document.documentElement.clientWidth;  
		$(window).resize(function() {
			
				if(t != document.documentElement.clientWidth){
				t = document.documentElement.clientWidth;
				var ss = getPageSize();
				$("#gridTable").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-80);
				}
			});
	});
	var addContact = function() {
		var rowid = $("#gridTable").jqGrid("getGridParam", "selrow");
		if (rowid) {
			var rowData = $("#gridTable").getRowData(rowid);
			//var url="../ReportEmitter?rpt=danbingzhong_dcp.brt&params=cp_id="+rowData.cp_id;
			var url="statements.jsp?height=600&rpt=danbingzhong_dcp&cp_id="+rowData.cp_id+"";
			window.open(url);
		}
	};
	var searchTable = function(){
		 $("#gridTable").jqGrid("searchGrid");  
	};
	

	
</script>
</head>

<body>
	<div class="navi">
		<div class="navi_title">
			单病种相关非特异性指标评价表(双击行查看详细信息)
		</div>
		
<div class="navi_function">
				<select id="selectCPType" style="color: #7777ff;">
				<option value="1" selected="selected" style="color: #000000;">全部路径</option>
				<option value="2"  style="color: #000000;">局发路径</option>
				<option value="3" style="color: #000000;">院内自定义路径</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0);" class="infoss" onclick="searchTable();">查询</a>
	 		</div>
	</div>
	<div align="center">
		<table id="gridTable" ondblclick='addContact()'></table>
		<div id="gridPager"></div>
	</div>
  
 
</body>
</html>