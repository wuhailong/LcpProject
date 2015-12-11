<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
/*---------------------------------------------------------------- 
 * // Copyright (C) 2012 北京嘉和美康信息技术有限公司版权所有。
 * // 文件名：zhikong_patient_td7.jsp
 * // 文件功能描述： 医嘱记录
 * // 创建人：张昆 
 * // 创建日期：2012/07/30
 * ----------------------------------------------------------------*/
%>
<%
	String patient_no=request.getParameter("patient_no");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医嘱记录</title>
<link rel="stylesheet" href="../public/styles/demos.css">
<link rel="stylesheet" type="text/css" href="../public/plugins/jquery/themes/dcp/jquery-ui-1.8.16.custom.css">
<link rel="stylesheet" type="text/css" href="../public/plugins/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" type="text/css" href="../public/styles/style.css">
<script type="text/javascript" src="../public/plugins/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../public/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="../public/plugins/jqgrid/jquery.jqGrid.min.js"></script>

<style type="text/css">
.navi_title {
	float: left;
	width: 300px;
	margin: 5px;
	padding-left: 20px;
	overflow-x: hidden;
}
</style>
<script type="text/javascript">
var patient_no='<%=patient_no%>';
$(function(){
	 var queryStringByName= function (queryName) {
	        var str = location.href; //取得整个地址栏
	        if (str.indexOf("?") > -1) {
	            var queryParam = str.substring(str.indexOf("?") + 1);
	            //如果有多个参数
	            //if (queryParam.indexOf("&") > -1)
	            var param = queryParam.split("&");
	            for (var a = 0; a < param.length; a++) {
	                var query = param[a].split("=");
	                if (query[0] == queryName) {
	                    return query[1];
	                 }
	            }
	        }
	        return 0;
	     };
	     var title='医嘱记录';
	     $(".navi_title").html(title);
		$.jgrid.ajaxOptions.type = 'post';
		var searchtype=['cn','eq'];
		jQuery("#gridTable").jqGrid({
		   url:'../ZhikongPatientServlet?op=order&patientNo='+patient_no,
		   datatype: "json",
		   beforeRequest:function(){//每次读取前先清空表中数据
				 $(this).clearGridData("clearfooter");
			},
		   colNames: ['路径医嘱', '系统主键', '系统编码', '长期', '类别', '医嘱内容', '剂量', '单位','途径','频次','持','续','下达医生','下达时间','护士','频','／','次'],
		   colModel: [
		         {name:'isBelongCp',index:'isBelongCp', width:35,align:"center",search:false,sortable:false },
					{name:'LOCAL_KEY',index:'LOCAL_KEY', width:35,align:"center",search:false,sortable:false },
					{name:'LOCAL_CODE',index:'LOCAL_CODE', width:35,align:"center",search:false,sortable:false},
					{name:'REPEAT_INDICATOR',index:'REPEAT_INDICATOR',width:20,align:"center",search:false,sortable:false }	,
					{name:'ORDER_CLASS',index:'ORDER_CLASS', width:20,align:"center",search:false,sortable:false }	,
					{name:'LOCAL_ORDER_TEXT',index:'LOCAL_ORDER_TEXT', width:120,align:"center",search:false,sortable:false },
					{name:'DOSAGE',index:'DOSAGE', width:20,align:"center",search:false,sortable:false },
					{name:'DOSAGE_UNITS',index:'DOSAGE_UNITS', width:20,align:"center",search:false,sortable:false },
					{name:'ADMINISTRATION',index:'ADMINISTRATION', width:20,align:"center",search:false,sortable:false },
					{name:'FREQUENCY',index:'FREQUENCY', width:20,align:"center",search:false,sortable:false},
					{name:'DURATION',index:'DURATION', width:13,align:"center",search:false,sortable:false },
					{name:'DURATION_UNITS',index:'DURATION_UNITS', width:13,align:"center",search:false,sortable:false },
					{name:'DOCTOR',index:'DOCTOR', width:35,align:"center",search:false,sortable:false },
					{name:'EXE_DATE',index:'EXE_DATE', width:35,align:"center",search:false,sortable:false},
					{name:'NURSE',index:'NURSE', width:35,align:"center",search:false,sortable:false },
					{name:'FREQ_COUNTER',index:'FREQ_COUNTER', width:13,align:"center",search:false,sortable:false },
					{name:'FLAG',index:'FLAG', width:13,align:"center",search:false,sortable:false},
					{name:'FREQ_INTERVAL_UNIT',index:'FREQ_INTERVAL_UNIT', width:13,align:"center",search:false,sortable:false}
		    ],
			width : $(document.body).width()-10,
			height : $(document.body).height()+	116,
			viewrecords:true,
			rowNum:15,
			rownumbers:true,
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
		jQuery("#gridTable").jqGrid('setGroupHeaders', {
		  useColSpanStyle: true, 
		  groupHeaders:[
			{startColumnName: 'LOCAL_KEY', numberOfColumns: 5, titleText: '医嘱信息'},
			{startColumnName: 'DOSAGE', numberOfColumns: 3, titleText: '用法用量/标本'},
			{startColumnName: 'FREQUENCY', numberOfColumns: 9, titleText: '用药频率'}
		  ]	
		});
	});	
</script>
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
  	<td width="3">&nbsp;</td>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="24" height="19" valign="bottom"><div align="center"><img src="../public/images/tb.gif" width="14" height="14" /></div></td>
                <td valign="bottom"><span class="STYLE1"> 病例详细信息</span></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  	<td width="3">&nbsp;</td>
  </tr>
  <tr>
  	<td width="3">&nbsp;</td>
    <td align="left"><table width="100%" id="Table1" class="users" border="0" cellpadding="0" cellspacing="1" >
    
       <tbody id="Tbody1">    
      <tr>
        <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td1.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/detail_1.png" style="border:0px" width="48" height="48" alt="病例概况" /><br />病例概况</a></div></td>
        <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td2.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/detail_2.png" style="border:0px" width="48" height="48" alt="临床路径执行情况" /><br />路径执行情况</a></div></td>
        <td width="100" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td3.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/left_16.gif" style="border:0px" width="48" height="48" alt="诊断与手术记录" /><br />诊断与手术记录</a></div></td>
        <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td6.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/detail_3.png" style="border:0px" width="48" height="48" alt="治疗记录" /><br />治疗记录</a></div></td>
        <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td7.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/left_14.gif" style="border:0px" width="48" height="48" alt="医嘱记录" /><br />医嘱记录</a></div></td>
         <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td8.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/left_15.gif" style="border:0px" width="48" height="48" alt="护理记录" /><br />护理记录</a></div></td>
           <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td4.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/detail_4.png" style="border:0px" width="48" height="48" alt="检验检查结果" /><br />检验检查结果</a></div></td>
        <td width="80" height="80" bgcolor="#FFFFFF"><div align="center"><a href="zhikong_patient_td5.jsp?patient_no=<%=patient_no%>&cp_id=<%=request.getParameter("cp_id")%>">
            <img src="../public/images/detail_5.png" style="border:0px" width="48" height="48" alt="相关病历内容" /><br />相关病历</a></div></td>
     	<td width="*" align="right" valign="top">
			<a href="../statements/singleCPStatistics.html"><font style="font-size: 16px; color: red;">【返回路径列表】</font></a>
			<font style="font-size: 16px; color: black;">||</font>
			<a href="../statements/patientIndex.html?cp_id=<%=request.getParameter("cp_id")%>"><font style="font-size: 16px; color: red;">【返回病人列表】</font></a>
		</td>
      </tr>      				
      </tbody>
    </table></td>
  	<td width="3">&nbsp;</td>
  </tr>
  <tr>
  	<td width="3">&nbsp;</td>
    <td height="1"></td>
  	<td width="3">&nbsp;</td>
  </tr>
 </table>
  <!-- 医嘱记录 -->
<div class="navi">
		<div class="navi_title"></div>
		</div>
		<div align="center">
		<div id="gridPager"></div>
		<table id="gridTable"></table>
</div>
</body>
</html>