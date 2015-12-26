package com.goodwillcis.lcp.servlet.pdca;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InAndOutCompare {

	public InAndOutCompare() {
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * 获取串入参数的路径信息
	 * 2015-12-25
	 * 吴海龙 
	 */
	public String GetUsingCpInfo(String p_strCurrentCpId) {
		String _strSQL = "select cp_master_id,cp_id,cp_name,cp_code,\r\n"
				+ " round((sum(hzqk)*100/count(*)),2) cp_hzl,\r\n"
				+ " nvl(round(avg(zyr),2),0) cp_pjzyr,\r\n"
				+ " nvl(round(avg(zyf),2),0) cp_pjzyf \r\n"
				+ " from( select cp_master_id,a.cp_status,a.cp_code,a.cp_id,a.cp_name,c.patient_no,\r\n"
				+ " (case b.TREAT_EFFECT when 1then 1 when 2 then 1 else 0 end)hzqk,\r\n"
				+ " round(B.DISCHARGE_DATE_TIME- B.ADMISSION_DATE_TIME,2) zyr,\r\n"
				+ " b.fee_total zyf\r\n"
				+ " from (select cp_master_id,cp_id, cp_status, cp_name, cp_code\r\n"
				+ " from lcp_master\r\n"
				+ " where cp_id = '"
				+ p_strCurrentCpId
				+ "') a\r\n"
				+ " left outer join (select CP_ID, PATIENT_NO\r\n"
				+ " FROM LCP_PATIENT_NODE\r\n"
				+ " GROUP BY CP_ID, PATIENT_NO) c\r\n"
				+ " on a.cp_id = c.cp_id\r\n"
				+ " left outer join (select b1.TREAT_EFFECT,\r\n"
				+ " b1.PATIENT_NO,\r\n"
				+ " b1.DISCHARGE_DATE_TIME,\r\n"
				+ " b1.ADMISSION_DATE_TIME,\r\n"
				+ " b2.FEE_TOTAL\r\n"
				+ " from LCP_PATIENT_FIRSTPAGE b1, LCP_PATIENT_FEE b2\r\n"
				+ " where b1.patient_no = b2.patient_no) b\r\n"
				+ " on c.patient_NO = B.PATIENT_NO ) where cp_status ='0' group by cp_master_id,cp_id,cp_name,cp_code,cp_status ";
		ResultSet _rsData = CommonFunction.ExecuteQuery(_strSQL);
		try {
			String _strJson = "{\"cp_cp\":[";
			while (_rsData.next()) {
				String _strCpId = _rsData.getString("cp_id");
				String _strCpName = _rsData.getString("cp_name");
				String _strCpCode = _rsData.getString("cp_code");
				Double _nCphzl = _rsData.getDouble("cp_hzl");
				Double _nCppjzyr = _rsData.getDouble("cp_pjzyr");
				Double _nCppjzyf = _rsData.getDouble("cp_pjzyf");
				String _strCpStatus = "0";
				_strJson += "{\"cp_id\":\"" + _strCpId + "\",\"cp_name\":\""
						+ _strCpName + "\",\"cp_code\":\"" + _strCpCode
						+ "\",\"cp_hzl\":" + _nCphzl + ",\"cp_pjzyr\":"
						+ _nCppjzyr + ",\"cp_pjzyf\":" + _nCppjzyf
						+ ",\"cp_status\":\"" + _strCpStatus + "\"},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";
			if ("{\"cp_cp\":]}" == _strJson) {
				_strJson = "{\"cp_cp\":[{\"cp_id\":\"no record\",\"cp_name\":\"no record\",\"cp_code\":\"no record\",\"cp_hzl\":0.00,\"cp_pjzyr\":0.00,\"cp_pjzyf\":0.00,\"cp_status\":\"no record\"}]}";
			}
			System.out.println(_strJson);
			return _strJson;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
}
