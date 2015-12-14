window.onload = function()
{	
	$.ajax({
		url : 'PdcaServlet?ran=+Math.random()',
		data : {
			op :"2"
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {						
			 for(var i=0;i<data["cp_cp"].length;i++)
		     {		       
				var tr = "<tr onclick=getCpVersions(); id=option"+i+"><td>" 
				+ data["cp_cp"][i]["cp_master_id"] + "</td><td>" 
				+ data["cp_cp"][i]["cp_id"] + "</td><td>" 
				+ data["cp_cp"][i]["cp_name"] + "</td><td>" 
				+ data["cp_cp"][i]["cp_code"] + "</td><td>" 	
				+ data["cp_cp"][i]["cp_version"] + "</td></tr>";
				$('#optionContainer').append(tr);  
		     }	    
		}
	})
}

function getCpVersions(){
	var rows = document.getElementById("optionContainer").rows;  
	if (rows.length > 0) {
		for ( var i = 1; i < rows.length; i++) {
			(function(i) {	
				var cp_master_id = rows[i].cells[0].innerText;
				var cp_id = rows[i].cells[1].innerText;
				var cp_name = rows[i].cells[2].innerText;				
				var obj=rows[i]; 
	            obj.onclick=function(){
            	$.ajax({
            		url : 'PdcaServlet?ran='+Math.random(),
            		data : {            			
            			op :"3",
            			master_id:cp_master_id
            		},
            		dataType : 'json',
            		error : function() {            			
            		},
            		success : function(data) {
            		$('#cpversionscontain').empty(); 
            		for(var i=0;i<data["cp_cp"].length;i++)
           		     {	
           				var tr = "<tr id=option"+i+"><td>" 
           				+ data["cp_cp"][i]["cp_id"] + "</td><td>" 
           				+ data["cp_cp"][i]["cp_name"] + "</td><td>" 
           				+ data["cp_cp"][i]["cp_code"] + "</td><td>" 
           				+ data["cp_cp"][i]["cp_hzl"] + "</td><td>"
           				+ data["cp_cp"][i]["cp_pjzyr"] + "</td><td>"
           				+ data["cp_cp"][i]["cp_pjzyf"] + "</td><td>"
           				+ data["cp_cp"][i]["cp_status"] + "</td></tr>";
           				$('#cpversionscontain').append(tr);  
           		     }	 							
            		}
            	});	            	
	            };  
			})(i)
		}
	}  
	
	
}  


