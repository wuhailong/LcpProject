window.onload = function()
{	
	$(".checkOrder").click(function(){
		  $("#mygraph").animate({height:"0px"});
		  $("#mygraph").hide();
		  $("#myorders").animate({height:"450px"});
		  $("#myorders").show();
	  });
	  $(".checkNode").click(function(){
		  $("#myorders").animate({height:"0px"});
		  $("#myorders").hide();
		  $("#mygraph").animate({height:"450px"});	
		  $("#mygraph").show();		  		
	  });
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
				var tr = "<tr onclick=getVaNode();ondblclick=getOrdersSeqs(); id=option"+i+"><td>" 
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


function getOrdersSeqs(){
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
            		var parientid =0;
            		$('#orderseqs').empty();
            		for(var i=0;i<data["cp_orders"].length;i++)
           		    {	
            			if(nodeflag!=data["cp_orders"][i]["node_name"]){
            				parientid++;
            				tr="<tr data-tt-id='"+parientid+"'><td><span class='folder'>"+data["cp_orders"][i]["node_name"]+"</span></td><td>--</td><td>--</td></tr>"
            				$('#orderseqs').append(tr);
            			}
            			tr="<tr data-tt-id='"+parientid+'-'+i+"' data-tt-parent-id='"+parientid+"'><td><span class='file'>"+data["cp_orders"][i]["order_text"]+"</span></td><td>"+data["cp_orders"][i]["order_no"]+"</td><td>"+data["cp_orders"][i]["mycount"]+"</td></tr>"
            			nodeflag=data["cp_orders"][i]["node_name"];
           				$('#orderseqs').append(tr);           				
           		    }
            		$("#example-advanced").treetable({ expandable: true });
            		// Highlight selected row
            		$("#example-advanced tbody tr").mousedown(function() {
            	    $("tr.selected").removeClass("selected");
            	    $(this).addClass("selected");
            	});
            	}
            	});            	 
	            };  
			})(i)
		}
	}  
   
}


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
            			var myChart =  new JSChart('mygraph', 'line');	
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
