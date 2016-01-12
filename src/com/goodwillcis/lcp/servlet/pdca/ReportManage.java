package com.goodwillcis.lcp.servlet.pdca;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportManage {

	public String GetEnableReport(){
		String _strSQL = "select * from report_manage where enabled >=0";
		ResultSet _rsData = CommonFunction.ExecuteQuery(_strSQL);
		try {
			String _strJson = "{\"cp_report\":[";
			while (_rsData.next()) {
				String _strTr = _rsData.getString("tr");
				_strJson += " {\"tr\":\"" + _strTr+ "\""+ "},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]";
			_strJson += "}";
			System.out.println(_strJson);
			return _strJson;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
		
		
	}
}
