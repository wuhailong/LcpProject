window.onload = function()
{	
	$.ajax({
		url : '../PdcaServlet?ran='+Math.random(),
		data : {
			op :"1"
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {						
			 for(var i=0;i<data["cp_va"].length;i++)
		     {		       
				var tr = "<tr onclick=getVaNode() ondblclick=getOrderSeq(); id=option"+i+"><td>" 
				+ data["cp_va"][i]["cp_id"] + "</td><td>" 
				+ data["cp_va"][i]["cp_name"] + "</td><td>"
				+ data["cp_va"][i]["cp_code"] + "</td><td>"
				+ data["cp_va"][i]["fcount"] + "</td><td>"
				+ data["cp_va"][i]["tcount"] + "</td><td>"
				+ data["cp_va"][i]["va"] + "</td></tr>";
				$('#optionContainer').append(tr);  
		     }	    
		}
	})
}

function getOrderSeq(){
	var rows = document.getElementById("optionContainer").rows;  
	if (rows.length > 0) {
		for ( var i = 1; i < rows.length; i++) {
			(function(i) {				
				var cp_id = rows[i].cells[0].innerText;
				var cp_name = rows[i].cells[1].innerText;				
				var obj=rows[i]; 
	            obj.onclick=function(){
            	$.ajax({
            		url : '../PdcaServlet?ran='+Math.random(),
            		data : {            			
            			op :"4",
            			cp_id:cp_id
            		},
            		dataType : 'json',
            		error : function() {            			
            		},
            		
            		success : function(data) {
            		var nodeflag = '-';
            		for(var i=0;i<data["cp_orders"].length;i++)
           		    {	var tr="";
            			if(nodeflag!=data["cp_orders"][i]["node_name"]){            				
            				tr ="<tr id='day2' onclick='lap(this)' class='ui-widget-content jqgrow ui-row-ltr' role='row' tabindex='-1' style='height: auto'>"
            					+"<td class='ui-state-default jqgrid-rownum' aria-describedby='gridTable_rn' style='text-align: center; width: 5%; border-style: none;' role='gridcell' align='left'>&nbsp;&nbsp;</td>"
            					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 9.5%;' role='gridcell'>"+data["cp_orders"][i]["node_name"]+"</td>"
            					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 14.5%;' role='gridcell'>----</td>"
            					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 14.5%;' role='gridcell'>----</td>"
            					+"</tr>";
            				$('#orderseqs').append(tr);  
            			}
            			tr ="<tr parentid='day2' class='ui-widget-content jqgrow ui-row-ltr' role='row' tabindex='-1' style=' height: auto; display: none;'>"
	        					+"<td class='ui-state-default jqgrid-rownum' aria-describedby='gridTable_rn' style='text-align: center; width: 5%; border-style: none;' role='gridcell' align='left'>&nbsp;&nbsp;</td>"
	        					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 9.5%;' role='gridcell'>"+data["cp_orders"][i]["order_text"]+"</td>"
	        					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 14.5%;' role='gridcell'>"+data["cp_orders"][i]["order_no"]+"</td>"
	        					+"<td aria-describedby='gridTable_USER_NAME' title='0672' style='text-align: center; width: 14.5%;' role='gridcell'>"+data["cp_orders"][i]["mycount"]+"</td>"
	        					+"</tr>";            				
            			nodeflag=data["cp_orders"][i]["node_name"];
           				$('#orderseqs').append(tr);  
           		    }								
            	}
            	});	            	
	            };  
			})(i)
		}
	}  
}

var cc=0;
var dd=0;
var ll=new Array();
var temp=0;
var ss=new Array();
function lap(event){
	document.all.item("bottom").style.cursor="pointer";
	var x = $(event).children().eq(0).html();
	var y = $(event).children().eq(0).attr("orderid");
	if(x == "-"){
		$($(event).children().eq(0)).html("+");
		var trs2=$("tr[parentid='"+y+"']");
		trs2.hide();
		for(var n in ll){
			if(ll[n].indexOf(y)==0){
				$(trs2.children().eq(0)).html("+");
				temp=ll[n].substr(ll[n].indexOf("_")+1,ll[n].length-((ll[n].substr(0,ll[n].indexOf("_"))).length+1));
				ss.push(temp);
				//alert("========================:"+temp);
				$("#"+temp).hide();
				//trs1.hide();
				//alert("0000000000::===:"+ll[n].substring(3,2));
			}
		}
	}else{
		cc=y;
		$($(event).children().eq(0)).html("-");
		var trs2=$("tr[parentid='"+y+"']");
		trs2.show();
	}	
};

function getVaNode(){  
	var rows = document.getElementById("optionContainer").rows;  
	if (rows.length > 0) {
		for ( var i = 1; i < rows.length; i++) {
			(function(i) {				
				var cp_id = rows[i].cells[0].innerText;
				var cp_name = rows[i].cells[1].innerText;				
				var obj=rows[i]; 
	            obj.onclick=function(){
            	$.ajax({
            		url : '../PdcaServlet?ran='+Math.random(),
            		data : {            			
            			op :"0",
            			cp_id:cp_id
            		},
            		dataType : 'json',
            		error : function() {            			
            		},
            		success : function(data) {
            			$("#graphTitle").text(cp_name+"变异节点分析");
            			var myData = new Array();
            			for (var j=0;j< data["cp"].length;j++) {
            				myData.push([data["cp"][j]["node_no"],data["cp"][j]["vacount"]]);
            			}            			            			
            			var myChart =  new JSChart('graph', 'line');	
            			myChart.patchMbString();
            			myChart.setFontFamily("微软雅黑");
            			myChart.setTitle("");
            			myChart.setTitleFontSize(20);            			
            			myChart.setAxisValuesFontSize(12);
            			myChart.setTitleColor("#000000");
            			myChart.setDataArray(myData);	
            			for (var m=0;m< data["cp"].length;m++) {
            				myChart.setLabelX([data["cp"][m]["node_no"],data["cp"][m]["node_name"]]);
            				myChart.setTooltip([data["cp"][m]["node_no"], 'count:'+data["cp"][m]["vacount"]]);            				
            			}
            			myChart.setAxisPaddingBottom(50);//设置x轴和容器底部的距离，默认30。
            			myChart.setAxisPaddingLeft(60);//设置y轴和容器左边距的距离，默认40。
            			myChart.setAxisPaddingRight(50);//设置图表右边和容器的距离，默认30。
            			myChart.setAxisPaddingTop(50);
            			myChart.setIntervalStartY(0);
            			myChart.setIntervalEndY(data['endy']);            		
            			myChart.setAxisValuesNumberX(data['numberx']);            			
            			myChart.setGraphExtend(true);
            			myChart.setLineWidth(2);
            			myChart.setAxisNameX('');
            			myChart.setAxisNameY('');
            			myChart.setShowXValues(false);
            			myChart.setFlagColor('#8B0000');
            			myChart.setLineColor('#A52A2A');
            			myChart.setGridColor('#c2c2c2');
            			myChart.setAxisColor('#C4C4C4');
            			myChart.setAxisValuesColor('#343434');
            			myChart.setSize(120*data['numberx']>600?120*data['numberx']:600, 321);            			
            			myChart.draw();
            			myChart.setBackgroundImage('pic/chart_bg.jpg');								
            		}
            	});	            	
	            };  
			})(i)
		}
	}  
	
	
}  


