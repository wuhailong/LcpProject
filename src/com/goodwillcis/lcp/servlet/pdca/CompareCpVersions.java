package com.goodwillcis.lcp.servlet.pdca;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 路径版本间对比
 * @author wuhailong
 * 2015-12-26
 */
public class CompareCpVersions {

	/**
	 * 获取前四条临床路径
	 * 2015-12-22
	 * 吴海龙 
	 */
	public String GetTopFourCps(String p_strCpId){
		String _strCurrentCpId =p_strCpId;// request.getParameter("master_id");
		String _strSQL = "select * from (select * from (select cp_master_id,cp_id,cp_name,cp_code,cp_status,"
			+ " 		(case cp_status "
			+ " 		when 0 then '启用' "
			+ " 		when 1 then '停用' "
			+ " 		when 2 then '等待审核' "
			+ " 		when 3 then '已退回'  "
			+ " 		when 4 then '隐藏'  "
			+ " 		else '其他' end) cp_status_name , "
			+ " 		(case cp_id  "
			+ " 		when "+_strCurrentCpId+" then 0  "
			+ " 		else 1 end) cp_order , "
			+ " 		round((sum(hzqk)*100/count(*)),2) cp_hzl, "
			+ " 		nvl(round(avg(zyr),2),0) cp_pjzyr, "
			+ " 		nvl(round(avg(zyf),2),0) cp_pjzyf ,cp_create_date "
			+ " 		from( select a.cp_master_id,a.cp_status,a.cp_code,a.cp_id,a.cp_name,c.patient_no,cp_create_date, "
			+ " 		(case b.TREAT_EFFECT when 1then 1 when 2 then 1 else 0 end)hzqk, "
			+ " 		round(B.DISCHARGE_DATE_TIME- B.ADMISSION_DATE_TIME,2) zyr, "
			+ " 		b.fee_total zyf "
			+ " 		from (select cp_master_id,cp_id, cp_status, cp_name, cp_code,cp_create_date "
			+ " 		from lcp_master "
			+ " 		where cp_master_id = (select cp_master_id from lcp_master where cp_id ='"+_strCurrentCpId+"')) a "
			+ " 		left outer join (select CP_ID, PATIENT_NO "
			+ " 		FROM LCP_PATIENT_NODE "
			+ " 		GROUP BY CP_ID, PATIENT_NO) c "
			+ " 		on a.cp_id = c.cp_id "
			+ " 		left outer join (select b1.TREAT_EFFECT, "
			+ " 		b1.PATIENT_NO, "
			+ " 		b1.DISCHARGE_DATE_TIME, "
			+ " 		b1.ADMISSION_DATE_TIME, "
			+ " 		b2.FEE_TOTAL "
			+ " 		from LCP_PATIENT_FIRSTPAGE b1, LCP_PATIENT_FEE b2 "
			+ " 		where b1.patient_no = b2.patient_no) b "
			+ " 		on c.patient_NO = B.PATIENT_NO )  "
			+ " 		group by cp_master_id,cp_id,cp_name,cp_code,cp_status,cp_create_date  "
			+ " 		order by cp_order asc,cp_status asc,cp_create_date desc "
			+ " 		)where cp_order = 0 "
			+ " 		union  "
			+ " 		select * from (select cp_master_id,cp_id,cp_name,cp_code,cp_status, "
			+ " 		(case cp_status  "
			+ " 		when 0 then '启用'  "
			+ " 		when 1 then '停用'  "
			+ " 		when 2 then '等待审核'  "
			+ " 		when 3 then '已退回'  "
			+ " 		when 4 then '隐藏'  "
			+ " 		else '其他' end) cp_status_name , "
			+ " 		(case cp_id  "
			+ " 		when "+_strCurrentCpId+" then 0  "
			+ " 		else 1 end) cp_order , "
			+ " 		round((sum(hzqk)*100/count(*)),2) cp_hzl, "
			+ " 		nvl(round(avg(zyr),2),0) cp_pjzyr, "
			+ " 		nvl(round(avg(zyf),2),0) cp_pjzyf ,cp_create_date "
			+ " 		from( select a.cp_master_id,a.cp_status,a.cp_code,a.cp_id,a.cp_name,c.patient_no,cp_create_date, "
			+ " 		(case b.TREAT_EFFECT when 1then 1 when 2 then 1 else 0 end)hzqk, "
			+ " 		round(B.DISCHARGE_DATE_TIME- B.ADMISSION_DATE_TIME,2) zyr, "
			+ " 		b.fee_total zyf "
			+ " 		from (select cp_master_id,cp_id, cp_status, cp_name, cp_code,cp_create_date "
			+ " 		from lcp_master "
			+ " 		where cp_master_id = (select cp_master_id from lcp_master where cp_id ='"+_strCurrentCpId+"')) a "
			+ " 		left outer join (select CP_ID, PATIENT_NO "
			+ " 		FROM LCP_PATIENT_NODE "
			+ " 		GROUP BY CP_ID, PATIENT_NO) c "
			+ " 		on a.cp_id = c.cp_id "
			+ " 		left outer join (select b1.TREAT_EFFECT, "
			+ " 		b1.PATIENT_NO, "
			+ " 		b1.DISCHARGE_DATE_TIME, "
			+ " 		b1.ADMISSION_DATE_TIME, "
			+ " 		b2.FEE_TOTAL "
			+ " 		from LCP_PATIENT_FIRSTPAGE b1, LCP_PATIENT_FEE b2 "
			+ " 		where b1.patient_no = b2.patient_no) b "
			+ " 		on c.patient_NO = B.PATIENT_NO )  "
			+ " 		group by cp_master_id,cp_id,cp_name,cp_code,cp_status,cp_create_date  "
			+ " 		order by cp_order asc,cp_status asc,cp_create_date desc "
			+ " 		)where cp_order != 0 and cp_hzl !=0 and  rownum <4)order by cp_order asc";
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
				String _strCpStatus = _rsData.getString("cp_status_name");
				_strJson += "{\"cp_id\":\"" + _strCpId + "\",\"cp_name\":\""
						+ _strCpName + "\",\"cp_code\":\"" + _strCpCode
						+ "\",\"cp_hzl\":" + _nCphzl + ",\"cp_pjzyr\":"
						+ _nCppjzyr + ",\"cp_pjzyf\":" + _nCppjzyf
						+ ",\"cp_status\":\"" + _strCpStatus + "\"},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";
			if("{\"cp_cp\":]}"==_strJson){
				_strJson="{\"cp_cp\":[{\"cp_id\":\"no record\",\"cp_name\":\"no record\",\"cp_code\":\"no record\",\"cp_hzl\":0.00,\"cp_pjzyr\":0.00,\"cp_pjzyf\":0.00,\"cp_status\":\"no record\"}]}";
			}		
			System.out.println(_strJson);
			return _strJson;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
		
	}
}
