<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
<head>
<title>报表展示窗口</title>
<script type="text/javascript" src="../bios_web_res/component/date/WdatePicker.js"></script>
</head>
<body>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String riqi = sdf.format(new Date());
String rpt =request.getParameter("rpt");
String begintime=riqi.substring(0,8)+"01";
String cpMasterId = request.getParameter("cp_id");
System.out.println(rpt+"--"+cpMasterId);
%>
   <center style="font-size: 15px;font-family: sans-serif;font-stretch: narrower;">
 	起始时间：<input  style="color:black" type="text" name="text1" style="width:100px" id="text1"  value="<%=begintime%>"   readonly="true"  onfocus="WdatePicker({isShowWeek:true})"/>&nbsp;&nbsp;&nbsp;
 	结束时间：<input  style="color:black" type="text" name="text2" style="width:100px"  id="text2" value="<%=riqi%>" readonly="true" onfocus="WdatePicker({isShowWeek:true})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input type="button" value="查看" onclick="sub()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </center>
<script language="javascript">
function sub(){
	var start_time = document.getElementById('text1');
	var end_time = document.getElementById('text2');
	var cpMasterId=<%=cpMasterId%>;
	var d1Arr=start_time.value.split('-');
	var d2Arr=end_time.value.split('-');
	var dt1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	var dt2=new Date(d2Arr[0],d2Arr[1],d2Arr[2]);
    if(dt1>dt2){//比较日期
       alert("开始日期不能晚于结束日期!");
       return;
    }
    //alert(start_time.value +"--"+end_time.value+"--"+cpMasterId+"--");
    //alert("----"+'../ReportEmitter?rpt=<%=rpt%>&params=start_time='+start_time.value+';end_time='+end_time.value+';cpMasterId='+cpMasterId);
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    if (userAgent.indexOf("Chrome") > -1){//chrome浏览器
    	baobiao.src='../ReportEmitter?rpt=<%=rpt%>&params=start_time='+start_time.value+';end_time='+end_time.value+';cpMasterId='+cpMasterId;
 	}else{//其他浏览器
 		baobiao.location.href='../ReportEmitter?rpt=<%=rpt%>&params=start_time='+start_time.value+';end_time='+end_time.value+';cpMasterId='+cpMasterId;
 	}
	//baobiao.location.href='../ReportEmitter?rpt=<%=rpt%>&params=start_time='+start_time.value+';end_time='+end_time.value+';cpMasterId='+cpMasterId;
}
</script>
<div>
 <%-- src="../ReportEmitter?rpt=<%=rpt%>.brt&params=<%=canshu%>" --%>
<iframe id="baobiao" frameBorder=0 scrolling=no  width="100%" height="100%"></iframe>
</div>
</body>
</html>