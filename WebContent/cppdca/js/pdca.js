/**
 * 
 */


//获取路径与非路径对比
$('#inoutcmpare').click(function() {
	//alert($('#cp_id').text());
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "6",
			cp_id:$('#current_cp_id').text()
		    
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			//路径内
			$('#uyxl').text(data['cp_cp'][1]['cp_hzl']);
			$('#uzyf').text(data['cp_cp'][1]['cp_pjzyf']);
			$('#uzyr').text(data['cp_cp'][1]['cp_pjzyr']);
			//--路径外
			$('#ufyxl').text(data['cp_cp'][0]['cp_hzl']);
			$('#ufzyf').text(data['cp_cp'][0]['cp_pjzyf']);
			$('#ufzyr').text(data['cp_cp'][0]['cp_pjzyr']);
		}
	});
});

//获取路径版本间对比
$('#versioncmpare').click(function() {
	//alert($('#cp_id').text());
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "7",
			cp_id:$('#current_cp_id').text()
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			//启用版本参数
			$('#vcpname').text(data['cp_cp'][0]['cp_name']);
			$('#vcpid').text(data['cp_cp'][0]['cp_code']);
			$('#vzlhzl').text(data['cp_cp'][0]['cp_hzl']);
			$('#vzyf').text(data['cp_cp'][0]['cp_pjzyf']);
			$('#vzyr').text(data['cp_cp'][0]['cp_pjzyr']);
			$('#vcpstatus').text(data['cp_cp'][0]['cp_status']);
			//最近版本1
			$('#vcpname1').text(data['cp_cp'][1]['cp_name']);
			$('#vcpid1').text(data['cp_cp'][1]['cp_code']);
			$('#vzlhzl1').text(data['cp_cp'][1]['cp_hzl']);
			$('#vzyf1').text(data['cp_cp'][1]['cp_pjzyf']);
			$('#vzyr1').text(data['cp_cp'][1]['cp_pjzyr']);
			$('#vcpstatus1').text(data['cp_cp'][1]['cp_status']);
			//最近版本2
			$('#vcpname2').text(data['cp_cp'][2]['cp_name']);
			$('#vcpid2').text(data['cp_cp'][2]['cp_code']);
			$('#vzlhzl2').text(data['cp_cp'][2]['cp_hzl']);
			$('#vzyf2').text(data['cp_cp'][2]['cp_pjzyf']);
			$('#vzyr2').text(data['cp_cp'][2]['cp_pjzyr']);
			$('#vcpstatus2').text(data['cp_cp'][2]['cp_status']);
			//最近版本3
			$('#vcpname3').text(data['cp_cp'][3]['cp_name']);
			$('#vcpid3').text(data['cp_cp'][3]['cp_code']);
			$('#vzlhzl3').text(data['cp_cp'][3]['cp_hzl']);
			$('#vzyf3').text(data['cp_cp'][3]['cp_pjzyf']);
			$('#vzyr3').text(data['cp_cp'][3]['cp_pjzyr']);
			$('#vcpstatus3').text(data['cp_cp'][3]['cp_status']);
		}
	});
});

//查看医嘱执行率
$('#checkorders').click(function() {
	$('#orderseqs').empty();
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "8",
			cp_id:$('#current_cp_id').text()
		    
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			var nodeflag = '-';
			var parientid = 0;
			for ( var i = 0; i < data["cp_orders"].length; i++) {
				if (nodeflag != data["cp_orders"][i]["node_name"]) {
					parientid++;
					tr = "<tr data-tt-id='"+ parientid+ "' style='font-size:12px,font-family:Helvetica, Arial, sans-serif' >" +
							"<td><span class='folder'>"+ data["cp_orders"][i]["node_name"]+ "</span></td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							//"<td>--</td>" +
							"<td>--</td>" +
						"</tr>";
					$('#orderseqs').append(tr);
				}										
				tr = "<tr onclick=setCheck(this); data-tt-id='"+ parientid+ '-'+ i+ "' data-tt-parent-id='"+ parientid +"' style='font-size:12px,font-family:Helvetica, Arial, sans-serif'>" +
						"<td><span class='file'>"+ data["cp_orders"][i]["order_text"]+ "</span></td>" +
						"<td name='order_no'>"+ data["cp_orders"][i]["order_no"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["mycount"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["lv"]+ "</td>" +
						"<td name='hospital_id' style='display: none'>"+ data["cp_orders"][i]["hospital_id"]+ "</td>" +
						"<td name='cp_id' style='display: none'>"+ data["cp_orders"][i]["cp_id"]+ "</td>" +
						"<td name='node_id' style='display: none'>"+ data["cp_orders"][i]["node_id"]+ "</td>" +
						"<td name='order_group' style='display: none'>"+ data["cp_orders"][i]["order_group"]+ "</td>" +
						"<td name='order_group_id' style='display: none'>"+ data["cp_orders"][i]["order_group_id"]+ "</td>" +
						"<td name='order_item_id' style='display: none'>"+ data["cp_orders"][i]["order_item_id"]+ "</td>" +
						"<td name='sub_group_id' style='display: none'>"+ data["cp_orders"][i]["sub_group_id"]+ "</td>" +
						//"<td name='sumcount' >"+ data["cp_orders"][i]["sumcount"]+ "</td>" +
						"<td><input id='vck' name='ck' type ='checkbox'></td>" +
						"</tr>";
				$('#orderseqs').append(tr);				
				nodeflag = data["cp_orders"][i]["node_name"];							
			}
			$("#example-advanced").treetable({
				expandable : true
			});
			// Highlight selected row
			$("#example-advanced tbody tr").mousedown(
				function() {
					$("tr.selected").removeClass(
							"selected");
					$(this).addClass("selected");
				});
		}
	});
});

//查看路径外医嘱引用情况
$('#checkoutorders').click(function() {
	$('#out-order-seqs').empty();
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "B",
			cp_id:$('#current_cp_id').text()
		    
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			var nodeflag = '-';
			var parientid = 0;
			for ( var i = 0; i < data["cp_orders"].length; i++) {
				if (nodeflag != data["cp_orders"][i]["NODE_NAME"]) {
					parientid++;
					tr = "<tr data-tt-id='"+ parientid+ "' style='font-size:12px,font-family:Helvetica, Arial, sans-serif' >" +
							"<td><span class='folder'>"+ data["cp_orders"][i]["NODE_NAME"]+ "</span></td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
						"</tr>";
					$('#out-order-seqs').append(tr);
				}										
				tr = "<tr onclick=setCheck(this); data-tt-id='"+ parientid+ '-'+ i+ "' data-tt-parent-id='"+ parientid +"' style='font-size:12px,font-family:Helvetica, Arial, sans-serif'>" +
						"<td><span class='file'>"+ data["cp_orders"][i]["CP_NODE_ORDER_TEXT"]+ "</span></td>" +
						"<td name='order_no'>"+ data["cp_orders"][i]["ORDER_NO"]+ "</td>" +
						"<td name='FREQUENCY'>"+ data["cp_orders"][i]["FREQUENCY"]+ "</td>" +
						"<td name='MYCOUNT' >"+ data["cp_orders"][i]["MYCOUNT"]+ "</td>" +
						"<td name='SUMCOUNT' style='display: none'>"+ data["cp_orders"][i]["SUMCOUNT"]+ "</td>" +
						"<td name='LV' >"+ data["cp_orders"][i]["LV"]+ "</td>" +
						"<td name='HOSPITAL_ID' style='display: none'>"+ data["cp_orders"][i]["HOSPITAL_ID"]+ "</td>" +
						"<td name='CP_ID' style='display: none'>"+ data["cp_orders"][i]["CP_ID"]+ "</td>" +
						"<td name='CP_NODE_ID' style='display: none'>"+ data["cp_orders"][i]["CP_NODE_ID"]+ "</td>" +
						"<td name='CP_NODE_ORDER_ID' style='display: none'>"+ data["cp_orders"][i]["CP_NODE_ORDER_ID"]+ "</td>" +
						"<td name='CP_NODE_ORDER_ITEM_ID' style='display: none'>"+ data["cp_orders"][i]["CP_NODE_ORDER_ITEM_ID"]+ "</td>" +
						"<td name='CP_NODE_ORDER_TEXT' style='display: none'>"+ data["cp_orders"][i]["CP_NODE_ORDER_TEXT"]+ "</td>" +
						"<td name='ORDER_NO' style='display: none'>"+ data["cp_orders"][i]["ORDER_NO"]+ "</td>" +
						"<td name='ORDER_TYPE' style='display: none'>"+ data["cp_orders"][i]["ORDER_TYPE"]+ "</td>" +
						"<td name='NEED_ITEM' style='display: none'>"+ data["cp_orders"][i]["NEED_ITEM"]+ "</td>" +
						"<td name='VERIFY_DATE' style='display: none'>"+ data["cp_orders"][i]["VERIFY_DATE"]+ "</td>" +
						"<td name='VERIFY_CODE' style='display: none'>"+ data["cp_orders"][i]["VERIFY_CODE"]+ "</td>" +
						"<td name='VERIFY_NAME' style='display: none'>"+ data["cp_orders"][i]["VERIFY_NAME"]+ "</td>" +
						"<td name='SYS_IS_DEL' style='display: none'>"+ data["cp_orders"][i]["SYS_IS_DEL"]+ "</td>" +
						"<td name='SYS_LAST_UPDATE' style='display: none'>"+ data["cp_orders"][i]["SYS_LAST_UPDATE"]+ "</td>" +
						"<td name='AUTO_ITEM' style='display: none'>"+ data["cp_orders"][i]["AUTO_ITEM"]+ "</td>" +
						"<td name='ORDER_TYPE_NAME' style='display: none'>"+ data["cp_orders"][i]["ORDER_TYPE_NAME"]+ "</td>" +
						"<td name='ORDER_KIND' style='display: none'>"+ data["cp_orders"][i]["ORDER_KIND"]+ "</td>" +
						"<td name='MEASURE' style='display: none'>"+ data["cp_orders"][i]["MEASURE"]+ "</td>" +
						
						"<td name='WAY' style='display: none'>"+ data["cp_orders"][i]["WAY"]+ "</td>" +
						"<td name='DOSAGE' style='display: none'>"+ data["cp_orders"][i]["DOSAGE"]+ "</td>" +
						"<td name='DOSAGE_UNITS' style='display: none'>"+ data["cp_orders"][i]["DOSAGE_UNITS"]+ "</td>" +
						"<td name='ADMINISTRATION' style='display: none'>"+ data["cp_orders"][i]["ADMINISTRATION"]+ "</td>" +
						"<td name='DURATION' style='display: none'>"+ data["cp_orders"][i]["DURATION"]+ "</td>" +
						"<td name='DURATION_UNITS' style='display: none'>"+ data["cp_orders"][i]["DURATION_UNITS"]+ "</td>" +
						"<td name='FREQ_COUNTER' style='display: none'>"+ data["cp_orders"][i]["FREQ_COUNTER"]+ "</td>" +
						"<td name='FREQ_INTERVAL' style='display: none'>"+ data["cp_orders"][i]["FREQ_INTERVAL"]+ "</td>" +
						"<td name='FREQ_INTERVAL_UNIT' style='display: none'>"+ data["cp_orders"][i]["FREQ_INTERVAL_UNIT"]+ "</td>" +
						"<td name='FREQ_DETAIL' style='display: none'>"+ data["cp_orders"][i]["FREQ_DETAIL"]+ "</td>" +
						"<td name='ORDERING_DEPT' style='display: none'>"+ data["cp_orders"][i]["ORDERING_DEPT"]+ "</td>" +
						"<td name='DOCTOR' style='display: none'>"+ data["cp_orders"][i]["DOCTOR"]+ "</td>" +
						"<td name='NURSE' style='display: none'>"+ data["cp_orders"][i]["NURSE"]+ "</td>" +
						"<td name='ORDER_STATUS' style='display: none'>"+ data["cp_orders"][i]["ORDER_STATUS"]+ "</td>" +
						"<td name='PROCESSING_DATE_TIME' style='display: none'>"+ data["cp_orders"][i]["PROCESSING_DATE_TIME"]+ "</td>" +
						"<td name='BILLING_ATTR' style='display: none'>"+ data["cp_orders"][i]["BILLING_ATTR"]+ "</td>" +
						"<td name='ORDER_PRINT_INDICATOR' style='display: none'>"+ data["cp_orders"][i]["ORDER_PRINT_INDICATOR"]+ "</td>" +
						"<td name='START_DATE_TIME' style='display: none'>"+ data["cp_orders"][i]["START_DATE_TIME"]+ "</td>" +
						"<td name='DRUG_BILLING_ATTR' style='display: none'>"+ data["cp_orders"][i]["DRUG_BILLING_ATTR"]+ "</td>" +
						"<td name='ORDER_INSURANCE_TYPE' style='display: none'>"+ data["cp_orders"][i]["ORDER_INSURANCE_TYPE"]+ "</td>" +
						"<td name='LOCAL_ORDER_NO' style='display: none'>"+ data["cp_orders"][i]["LOCAL_ORDER_NO"]+ "</td>" +
						"<td name='LOCAL_ORDER_TEXT' style='display: none'>"+ data["cp_orders"][i]["LOCAL_ORDER_TEXT"]+ "</td>" +
						"<td name='ORDER_ITEM_SET_ID' style='display: none'>"+ data["cp_orders"][i]["ORDER_ITEM_SET_ID"]+ "</td>" +
						"<td name='ORDER_CLASS' style='display: none'>"+ data["cp_orders"][i]["ORDER_CLASS"]+ "</td>" +
						"<td name='REPEAT_INDICATOR' style='display: none'>"+ data["cp_orders"][i]["REPEAT_INDICATOR"]+ "</td>" +
						"<td name='IS_ANTIBIOTIC' style='display: none'>"+ data["cp_orders"][i]["IS_ANTIBIOTIC"]+ "</td>" +
						"<td name='MEASURE_UNITS' style='display: none'>"+ data["cp_orders"][i]["MEASURE_UNITS"]+ "</td>" +
						"<td name='CP_NODE_CLASS_ID' style='display: none'>"+ data["cp_orders"][i]["CP_NODE_CLASS_ID"]+ "</td>" +
						"<td name='EFFECT_FLAG' style='display: none'>"+ data["cp_orders"][i]["EFFECT_FLAG"]+ "</td>" +
						"<td name='SPECIFICATION' style='display: none'>"+ data["cp_orders"][i]["SPECIFICATION"]+ "</td>" +
						"<td name='UNIT_ID' style='display: none'>"+ data["cp_orders"][i]["UNIT_ID"]+ "</td>" +
						"<td name='MARK' style='display: none'>"+ data["cp_orders"][i]["MARK"]+ "</td>" +
						"<td name='DEFAULT_ITEM' style='display: none'>"+ data["cp_orders"][i]["DEFAULT_ITEM"]+ "</td>" +
						"<td name='DRUG_ID' style='display: none'>"+ data["cp_orders"][i]["DRUG_ID"]+ "</td>" +
						"<td><input id='OUTCK-ID' name='OUTCK' type ='checkbox'></td>" +
						"</tr>";
				$('#out-order-seqs').append(tr);				
				nodeflag = data["cp_orders"][i]["NODE_NAME"];							
			}
			$("#out-orders").treetable({
				expandable : true
			});
			// Highlight selected row
			$("#out-orders tbody tr").mousedown(
				function() {
					$("tr.selected").removeClass(
							"selected");
					$(this).addClass("selected");
				});
		}
	});
});

function setCheck(obj){
	//alert(obj.lastChild.children.ck.checked);
	 if ( obj.lastChild.children.ck.checked==false) {
		 obj.lastChild.children.ck.checked= true;
     } else {
    	 obj.lastChild.children.ck.checked= false;;
     }
}

//查看路径下节点变异趋势
$('#nodevariation').click(function() {
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "9",
			cp_id:$('#current_cp_id').text()
		    
		},
		dataType : 'json',
		error : function() {
		},
		success : function(data) {
			var myData = new Array();
			var myLable = new Array();
			for ( var j = 0; j < data["cp"].length; j++) {
				myData.push([ j,
						data["cp"][j]["vacount"] ]);
				myLable.push([ j,
							data["cp"][j]["node_name"],
							data["cp"][j]["vacount"] ]);
			}
			var myChart = new JSChart('mygraph', 'line');
			myChart.patchMbString();
			myChart.setFontFamily("微软雅黑");
			myChart.setTitle("");
			myChart.setTitleFontSize(20);
			myChart.setAxisValuesFontSize(14);
			myChart.setTitleColor("#000000");
			myChart.setDataArray(myData);
			for ( var m = 0; m < myLable.length; m++) {
				myChart.setLabelX([
						myLable[m][0],
						myLable[m][1] ]);
				myChart.setTooltip(
						[myLable[m][0],
						'count:'
						+ myLable[m][2] ]);
			}
			myChart.setAxisPaddingBottom(50);// 设置x轴和容器底部的距离，默认30。
			myChart.setAxisPaddingLeft(60);// 设置y轴和容器左边距的距离，默认40。
			myChart.setAxisPaddingRight(50);// 设置图表右边和容器的距离，默认30。
			myChart.setAxisPaddingTop(50);
			myChart.setIntervalStartY(0);
			myChart.setIntervalEndY(data['endy']);
			myChart.setAxisValuesNumberX(data['numberx']);
			myChart.setGraphExtend(true);
			myChart.setLineWidth(2);
			myChart.setAxisNameX('');
			myChart.setAxisNameY('');
			myChart.setShowXValues(false);
			myChart.setFlagColor('#c2c2c2');
			myChart.setLineColor('#A52A2A');
			myChart.setGridColor('#c2c2c2');
			myChart.setAxisColor('#C4C4C4');
			myChart.setAxisValuesColor('#fff');
			myChart.setSize(120 * data['numberx'] > 600 ? 120 * data['numberx']: 600, 321);
			myChart.draw();
			//myChart.setBackgroundImage('pic/chart_bg.jpg');
		}
	});
});


$("a[name='vcompare']").each(function() {
	$(this).click(function() {
		var _cpids = new Array();
		if (true == $("#vck").is(':checked')) {
			_cpids.push($("#vcpid"). text());
			//alert($("#vcpid"). text());
		}
		if (true == $("#vck1").is(':checked')) {
			_cpids.push($("#vcpid1"). text());
			//alert($("#vcpid1"). text());
		}
		if (true == $("#vck2").is(':checked')) {
			_cpids.push($("#vcpid2"). text());
			//alert($("#vcpid2"). text());
		}
		if (true == $("#vck3").is(':checked')) {
			_cpids.push($("#vcpid3"). text());
			//alert($("#vcpid3"). text());
		}
		if(_cpids.length!=2){
			alert('只能选择两组进行对比');
		}else{
			window.open('../cppdca/ordercompare.jsp?cpone:'+_cpids[0]+"&cptwo:"+_cpids[1]);		
		}
	});
});

//精简医嘱
$('#thinorders').click(function() {
	$('#clearedorders').empty();
	var _strOrders = "";
	var cp_id='';
	$("input[name='ck']:checked").each(function(){
		var tablerow = $(this).parent("td").parent("tr");
		cp_id = tablerow.find("[name='cp_id']").text();
		var hospital_id = tablerow.find("[name='hospital_id']").text();
		var node_id = tablerow.find("[name='node_id']").text();
		var order_group = tablerow.find("[name='order_group']").text();
		var order_group_id = tablerow.find("[name='order_group_id']").text();
		var order_item_id = tablerow.find("[name='order_item_id']").text();
		var sub_group_id = tablerow.find("[name='sub_group_id']").text();
		var order_no = tablerow.find("[name='order_no']").text();
		_strOrders+=hospital_id+","+cp_id+","+node_id+","+order_group_id+","+order_item_id+"#";				
	});	
	//alert(cp_id);
	$.ajax({
		url : '../PdcaServlet?ran=' + Math.random(),
		data : {
			op : "A",
			cp_id:cp_id,
			ordersstring:_strOrders
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			$('#tips').empty();
			var nodeflag = '-';
			var parientid = 0;
			var cp_code =data["cp_orders"][0]["cp_code"];
			$('#newcpcode').text(cp_code);
			for ( var i = 0; i < data["cp_orders"].length; i++) {
				if (nodeflag != data["cp_orders"][i]["NODE_NAME"]) {
					parientid++;
					tr = "<tr data-tt-id='"+ parientid+ "' style='font-size:12px,font-family:Helvetica, Arial, sans-serif' >" +
							"<td><span class='folder'>"+ data["cp_orders"][i]["node_name"]+ "</span></td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
							"<td>--</td>" +
						"</tr>";
					$('#clearedorders').append(tr);
				}										
				tr = "<tr data-tt-id='"+ parientid+ '-'+ i+ "' data-tt-parent-id='"+ parientid +"' style='font-size:12px,font-family:Helvetica, Arial, sans-serif'>" +
						"<td><span class='file'>"+ data["cp_orders"][i]["order_text"]+ "</span></td>" +
						"<td>"+ data["cp_orders"][i]["order_no"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["SPECIFICATION"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["FREQUENCY"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["MEASURE"]+ "</td>" +
						"<td>"+ data["cp_orders"][i]["ORDER_KIND"]+ "</td>" +
						
						"</tr>";
				$('#clearedorders').append(tr);				
				nodeflag = data["cp_orders"][i]["NODE_NAME"];							
			}
			$("#bornedcp").treetable({
				expandable : true
			});
			// Highlight selected row
			$("#bornedcp tbody tr").mousedown(
				function() {
					$("tr.selected").removeClass(
							"selected");
					$(this).addClass("selected");
				});
		}
	});
});
