/**
 * 控制报表是否显示
 */
window.onload = function() {
	$.ajax({
		url : 'PdcaServlet?ran=+Math.random()',
		data : {
			op : "C"
		},
		dataType : 'json',
		error : function() {

		},
		success : function(data) {
			for ( var i = 0; i < data["cp_report"].length; i++) {
				var tr =  data["cp_report"][i]["tr"];
				$('#cp_report').append(tr);
			}
		}
	})
}
