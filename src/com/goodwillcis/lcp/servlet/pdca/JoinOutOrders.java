package com.goodwillcis.lcp.servlet.pdca;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;

/**
 * 将路径外医嘱加入到路径中
 * @author wuhailong
 * 2015-12-30
 */
public class JoinOutOrders {

	
	public JoinOutOrders() {
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * 获取临床路径下的医嘱执行次数
	 * 2015-12-11
	 * 吴海龙 
	 * @throws ServletException 
	 */
	public String GetOutOrderSeqsByCPId(String p_strCpId) throws ServletException{
		String _strCpId = p_strCpId;
		String _strSQL = "select john.*,\r\n" + 
				"(select unit from LCP_LOCAL_ORDER_DOSAGEUNITS where code=john.MEASURE_UNITS_CODE)MEASURE_UNITS,\r\n" + 
				"(select SUPPLY_NAME from LCP_LOCAL_ORDER_WAY WHERE SUPPLY_CODE=john.way)ADMINISTRATION_NAME,\r\n" + 
				"(select order_type_name  from DCP_DICT_ORDER_TYPE where order_type_code =john.order_class)ORDER_TYPE_NAME,\r\n" + 
				"(case repeat_indicator when 1 then '长期' when 0 then '临时' else '长期+临时' end)ORDER_KIND,\r\n" + 
				"-1 CP_NODE_ORDER_ID,\r\n" + 
				"-1 CP_NODE_ORDER_ITEM_ID,\r\n" + 
				"'' ORDER_TYPE,\r\n" + 
				"0 NEED_ITEM,\r\n" + 
				"sysdate VERIFY_DATE,\r\n" + 
				"'' VERIFY_CODE,\r\n" + 
				"'' VERIFY_NAME,\r\n" + 
				"sysdate SYS_LAST_UPDATE,\r\n" + 
				"0 SYS_IS_DEL,\r\n" + 
				"-1 AUTO_ITEM,\r\n" + 
				"-1 FREQ_COUNTER,\r\n" + 
				"'' FREQ_INTERVAL,\r\n" + 
				"'' FREQ_INTERVAL_UNIT,\r\n" + 
				"'' FREQ_DETAIL,\r\n" + 
				"'' ORDERING_DEPT,\r\n" + 
				"'' DOCTOR,\r\n" + 
				"'' NURSE,\r\n" + 
				"'' ORDER_STATUS,\r\n" + 
				"'' PROCESSING_DATE_TIME,\r\n" + 
				"'' BILLING_ATTR,\r\n" + 
				"'' ORDER_PRINT_INDICATOR,\r\n" + 
				"'' START_DATE_TIME,\r\n" + 
				"'' DRUG_BILLING_ATTR,\r\n" + 
				"'' ORDER_INSURANCE_TYPE,\r\n" + 
				"-1 CP_NODE_CLASS_ID,\r\n" + 
				"0 EFFECT_FLAG,\r\n" + 
				"'' SPECIFICATION,\r\n" + 
				"-1 UNIT_ID,\r\n" + 
				"'' MARK,\r\n" + 
				"0 DEFAULT_ITEM,\r\n" + 
				"-1 DRUG_ID,\r\n" + 
				"john.CP_NODE_ORDER_TEXT  LOCAL_ORDER_TEXT,\r\n" + 
				"john.order_no LOCAL_ORDER_NO,\r\n" + 
				"null ORDER_ITEM_SET_ID,\r\n" + 
				"'' ORDER_CLASS,\r\n" + 
				"'' REPEAT_INDICATOR,\r\n" + 
				"(case when \r\n" + 
				"round((case john.sumcount when 0 then 0 else mycount * 100 / sumcount end), 2) > 100 \r\n" + 
				"then 100\r\n" + 
				"else \r\n" + 
				"round((case john.sumcount when 0 then 0 else mycount * 100 / sumcount end), 2)\r\n" + 
				"end) lv\r\n" + 
				"from (select '路径外' kind,\r\n" + 
				"HOSPITAL_ID,\r\n" + 
				"CP_ID,\r\n" + 
				"(select cp_node_name\r\n" + 
				"from lcp_master_node n\r\n" + 
				"where n.cp_id = o.cp_id\r\n" + 
				"and n.cp_node_id = o.cp_node_id) node_name,\r\n" + 
				"CP_NODE_ID,\r\n" + 
				"LOCAL_ORDER_TEXT CP_NODE_ORDER_TEXT,\r\n" + 
				"LOCAL_ORDER_NO ORDER_NO,\r\n" + 
				"MEASURE,\r\n" + 
				"FREQUENCY,\r\n" + 
				"ADMINISTRATION  WAY,\r\n" + 
				"DOSAGE,\r\n" + 
				"DOSAGE_UNITS,\r\n" + 
				"DURATION,\r\n" + 
				"DURATION_UNITS,\r\n" + 
				"IS_ANTIBIOTIC,\r\n" + 
				"MEASURE_UNITS MEASURE_UNITS_CODE,\r\n" + 
				"order_class,\r\n" + 
				"repeat_indicator,\r\n" + 
				"count(*) mycount,\r\n" + 
				"(select count(*)\r\n" + 
				"from (select count(*)\r\n" + 
				"  from LCP_PATIENT_LOG_ORDER r\r\n" + 
				" where r.cp_id = '"+_strCpId+"'\r\n" + 
				" group by patient_no)) sumcount\r\n" + 
				"from LCP_PATIENT_LOG_ORDER o\r\n" + 
				"where cp_id = '"+_strCpId+"'\r\n" + 
				"group by hospital_id,cp_id,\r\n" + 
				"cp_node_id,\r\n" + 
				"LOCAL_ORDER_TEXT,\r\n" + 
				"LOCAL_ORDER_NO,\r\n" + 
				"MEASURE,\r\n" + 
				"MEASURE_UNITS,--领量单位\r\n" + 
				"ADMINISTRATION,--使用途径\r\n" + 
				"FREQUENCY,--频次\r\n" + 
				"IS_ANTIBIOTIC,\r\n" + 
				"MEASURE_UNITS,\r\n" + 
				"order_class,\r\n" + 
				"repeat_indicator,\r\n" + 
				"DOSAGE,\r\n" + 
				"DOSAGE_UNITS,\r\n" + 
				"DURATION,\r\n" + 
				"DURATION_UNITS\r\n" + 
				") john\r\n" + 
				"where NOT EXISTS\r\n" + 
				"(select *\r\n" + 
				"from lcp_node_order_item i\r\n" + 
				"where i.cp_id = john.cp_id\r\n" + 
				"and i.cp_node_id = john.cp_node_id\r\n" + 
				"and i.CP_NODE_ORDER_TEXT = john.CP_NODE_ORDER_TEXT)\r\n" + 
				"order by cp_node_id, mycount desc";
		ResultSet _rsData = CommonFunction.ExecuteQuery(_strSQL);
		try {
			String _strJson = "{\"cp_orders\":[";
			while (_rsData.next()) {
				int HOSPITAL_ID= _rsData.getInt("HOSPITAL_ID");//	NUMBER(5)	N			医院编号
				int CP_ID= _rsData.getInt("CP_ID");//	NUMBER(5)	N			路径编号
				int CP_NODE_ID= _rsData.getInt("CP_NODE_ID");//	NUMBER(5)	N			路径节点编号
				int CP_NODE_ORDER_ID= _rsData.getInt("CP_NODE_ORDER_ID");//	NUMBER(5)	N			路径节点医嘱项编号
				int CP_NODE_ORDER_ITEM_ID= _rsData.getInt("CP_NODE_ORDER_ITEM_ID");//	NUMBER(5)	N			路径节点医嘱明细项编号
				String CP_NODE_ORDER_TEXT= _rsData.getString("CP_NODE_ORDER_TEXT");//	VARCHAR2(100)	Y			路径节点医嘱明细项内容
				String ORDER_NO= _rsData.getString("ORDER_NO");//	VARCHAR2(20)	Y			医嘱编码
				String ORDER_TYPE= _rsData.getString("ORDER_TYPE");//	VARCHAR2(20)	Y			医嘱类型（检查,检验,只存一个字母）
				int NEED_ITEM=_rsData.getInt("NEED_ITEM");//	NUMBER(4)	Y			必做项目（0可选项，1必做项）
				Date VERIFY_DATE= _rsData.getDate("VERIFY_DATE");//	DATE	Y			审核时间（有时间表示已经审核过了）
				String VERIFY_CODE= _rsData.getString("VERIFY_CODE");//	VARCHAR2(20)	Y			审核人编号
				String VERIFY_NAME= _rsData.getString("VERIFY_NAME");//	VARCHAR2(50)	Y			审核人名称
				int SYS_IS_DEL=_rsData.getInt("SYS_IS_DEL");//	NUMBER(4)	Y			是否已经删除
				Date SYS_LAST_UPDATE= _rsData.getDate("SYS_LAST_UPDATE");//	DATE	Y			最新更新时间
				int AUTO_ITEM=_rsData.getInt("AUTO_ITEM");//	NUMBER(4)	Y			自动检测项（0自动，1手动）
				String ORDER_TYPE_NAME= _rsData.getString("ORDER_TYPE_NAME");//	VARCHAR2(100)	Y			医嘱类别描述(检查,检验,存名称)
				String ORDER_KIND= _rsData.getString("ORDER_KIND");//	VARCHAR2(20)	Y			医嘱类型（0临时医嘱、1长期医嘱、2出院医嘱、3长期+临时）
				String MEASURE= _rsData.getString("MEASURE");//	VARCHAR2(20)	Y			领量
				String FREQUENCY= _rsData.getString("FREQUENCY");//	VARCHAR2(20)	Y			执行频率编码:如：TID，每xx分xx次,见LCP_LOCAL_ORDER_FREQUENCY
				String WAY= _rsData.getString("WAY");//	VARCHAR2(20)	Y			途径
				double DOSAGE= _rsData.getDouble("DOSAGE");//	NUMBER(10,4)	Y			药品一次使用剂量
				String DOSAGE_UNITS= _rsData.getString("DOSAGE_UNITS");//	VARCHAR2(10)	Y			一次剂量单位
				String ADMINISTRATION= "";//_rsData.getString("ADMINISTRATION");//	VARCHAR2(20)	Y			给药途径和方法：(作废)
				int DURATION= _rsData.getInt("DURATION");//	NUMBER(2)	Y			持续时间：一次执行的持续时间(作废)
				String DURATION_UNITS= _rsData.getString("DURATION_UNITS");//	VARCHAR2(10)	Y			持续时间单位：使用规范描述(作废)
				int FREQ_COUNTER=_rsData.getInt("FREQ_COUNTER");//	NUMBER(2)	Y			频率次数：执行频率的次数部分(作废)
				int FREQ_INTERVAL=_rsData.getInt("FREQ_INTERVAL");//	NUMBER(2)	Y			频率间隔：执行频率的间隔部分(作废)
				String FREQ_INTERVAL_UNIT= _rsData.getString("FREQ_INTERVAL_UNIT");//	VARCHAR2(10)	Y			频率间隔单位：使用标准描述(作废)
				String FREQ_DETAIL= _rsData.getString("FREQ_DETAIL");//	VARCHAR2(20)	Y			执行时间详细描述(作废)
				String ORDERING_DEPT= _rsData.getString("ORDERING_DEPT");//	VARCHAR2(20)	Y			开医嘱科室(保留)
				String DOCTOR= _rsData.getString("DOCTOR");//	VARCHAR2(20)	Y			开医嘱医生：医生姓名(保留)
				String NURSE= _rsData.getString("NURSE");//	VARCHAR2(20)	Y			校对护士：护士姓名(保留)
				String ORDER_STATUS= _rsData.getString("ORDER_STATUS");//	VARCHAR2(10)	Y			医嘱状态：反映医嘱的执行状态，如新开、提交等，使用代码(保留)
				Date PROCESSING_DATE_TIME= _rsData.getDate("PROCESSING_DATE_TIME");//	DATE	Y			处理日期及时间：护士处理本医嘱的时间，未处理时，为空(保留)
				String BILLING_ATTR= _rsData.getString("BILLING_ATTR");//	VARCHAR2(10)	Y			计价属性：反映本条医嘱计价方面的信息。0-正常计价 1-自带药 2-需手工计价 3-不计价。(保留)
				String ORDER_PRINT_INDICATOR= _rsData.getString("ORDER_PRINT_INDICATOR");//	VARCHAR2(10)	Y			医嘱本打印标志：表示该医嘱是否已打印医嘱本，0-未打印，1-已打印（已废弃）
				Date START_DATE_TIME= _rsData.getDate("START_DATE_TIME");	//DATE//	Y			新开停止医嘱标志：表示该医嘱是起始医嘱或是停止医嘱，0-新起始医嘱，1-停止医嘱(保留)
				String DRUG_BILLING_ATTR= _rsData.getString("DRUG_BILLING_ATTR");//	VARCHAR2(10)	Y			药品计价属性：反映药品是否计价，0-正常，1-自带药(保留)
				String ORDER_INSURANCE_TYPE= _rsData.getString("ORDER_INSURANCE_TYPE");//	VARCHAR2(16)	Y			医嘱保险类别(保留)
				String LOCAL_ORDER_NO= _rsData.getString("LOCAL_ORDER_NO");//	VARCHAR2(20)	Y			本地医嘱编码
				String LOCAL_ORDER_TEXT=_rsData.getString("LOCAL_ORDER_TEXT");//	VARCHAR2(100)	Y			本地医嘱名称
				int ORDER_ITEM_SET_ID=_rsData.getInt("ORDER_ITEM_SET_ID");//	NUMBER(5)	Y			子医嘱分组号
				String ORDER_CLASS= _rsData.getString("ORDER_CLASS");//	VARCHAR2(10)	Y			(保留,不知道是干什么的)
				int REPEAT_INDICATOR=_rsData.getInt("REPEAT_INDICATOR");//	NUMBER(1)	Y			(保留,不知道是干什么的)
				int IS_ANTIBIOTIC=_rsData.getInt("IS_ANTIBIOTIC");//	NUMBER(4)	Y			医嘱项是否是抗生素（0表示不属于抗生素，1属于抗生素）
				String MEASURE_UNITS= _rsData.getString("MEASURE_UNITS");//	VARCHAR2(10)	Y			领量单位：规范描述，本系统定义，见医嘱最小包装单位
				int CP_NODE_CLASS_ID=_rsData.getInt("CP_NODE_CLASS_ID");//	NUMBER(5)	Y			路径节点本地医嘱类别编号
				int EFFECT_FLAG=_rsData.getInt("EFFECT_FLAG");//	NUMBER(5)	Y			医嘱是否有效的标志
				String SPECIFICATION= _rsData.getString("SPECIFICATION");//	VARCHAR2(50)	Y			规格（如果是药品类的  则有此项的值）
				int UNIT_ID=_rsData.getInt("UNIT_ID");//	NUMBER(8)	Y			医嘱流水号
				String MARK= _rsData.getString("MARK");//	VARCHAR2(100)	Y			医生嘱托
				int DEFAULT_ITEM=_rsData.getInt("DEFAULT_ITEM");//	NUMBER(4)	Y			默认医嘱（0非默认项，1默认项）
				String DRUG_ID= _rsData.getString("DRUG_ID");//	VARCHAR2(20)	Y			药品编码

				_strJson += "{\"HOSPITAL_ID\":"+HOSPITAL_ID+"," +
						"\"CP_ID\":"+CP_ID+"," +
						"\"CP_NODE_ID\":\""+CP_NODE_ID+"\"," +
						"\"CP_NODE_ORDER_ID\":\""+CP_NODE_ORDER_ID+"\"," +
						"\"CP_NODE_ORDER_ITEM_ID\":\""+CP_NODE_ORDER_ITEM_ID+"\"," +
						"\"CP_NODE_ORDER_TEXT\":\""+CP_NODE_ORDER_TEXT+"\"," +
						"\"ORDER_NO\":\""+ORDER_NO+"\"," +
						"\"ORDER_TYPE\":\""+ORDER_TYPE+"\"," +
						"\"NEED_ITEM\":\""+NEED_ITEM+"\"," +
						"\"VERIFY_DATE\":\""+VERIFY_DATE+"\"," +
						"\"VERIFY_CODE\":\""+VERIFY_CODE+"\"," +
						"\"VERIFY_NAME\":\""+VERIFY_NAME+"\"," +
						"\"SYS_IS_DEL\":\""+SYS_IS_DEL+"\"," +
						"\"SYS_LAST_UPDATE\":\""+SYS_LAST_UPDATE+"\"," +
						"\"AUTO_ITEM\":\""+AUTO_ITEM+"\"," +
						"\"ORDER_TYPE_NAME\":\""+ORDER_TYPE_NAME+"\"," +
						"\"ORDER_KIND\":\""+ORDER_KIND+"\"," +
						"\"MEASURE\":\""+MEASURE+"\"," +
						"\"FREQUENCY\":\""+FREQUENCY+"\"," +
						"\"WAY\":\""+WAY+"\"," +
						"\"DOSAGE\":\""+DOSAGE+"\"," +
						"\"DOSAGE_UNITS\":\""+DOSAGE_UNITS+"\"," +
						"\"ADMINISTRATION\":\""+ADMINISTRATION+"\"," +
						"\"DURATION\":\""+DURATION+"\"," +
						"\"DURATION_UNITS\":\""+DURATION_UNITS+"\"," +
						"\"FREQ_COUNTER\":\""+FREQ_COUNTER+"\"," +
						"\"FREQ_INTERVAL\":\""+FREQ_INTERVAL+"\"," +
						"\"FREQ_INTERVAL_UNIT\":\""+FREQ_INTERVAL_UNIT+"\"," +
						"\"FREQ_DETAIL\":\""+FREQ_DETAIL+"\"," +
						"\"ORDERING_DEPT\":\""+ORDERING_DEPT+"\"," +
						"\"DOCTOR\":\""+DOCTOR+"\"," +
						"\"NURSE\":\""+NURSE+"\"," +
						"\"ORDER_STATUS\":\""+ORDER_STATUS+"\"," +
						"\"PROCESSING_DATE_TIME\":\""+PROCESSING_DATE_TIME+"\"," +
						"\"BILLING_ATTR\":\""+BILLING_ATTR+"\"," +
						"\"ORDER_PRINT_INDICATOR\":\""+ORDER_PRINT_INDICATOR+"\"," +
						"\"START_DATE_TIME\":\""+START_DATE_TIME+"\"," +
						"\"DRUG_BILLING_ATTR\":\""+DRUG_BILLING_ATTR+"\"," +
						"\"ORDER_INSURANCE_TYPE\":\""+ORDER_INSURANCE_TYPE+"\"," +
						"\"LOCAL_ORDER_NO\":\""+LOCAL_ORDER_NO+"\"," +
						"\"LOCAL_ORDER_TEXT\":\""+LOCAL_ORDER_TEXT+"\"," +
						"\"ORDER_ITEM_SET_ID\":\""+ORDER_ITEM_SET_ID+"\"," +
						"\"ORDER_CLASS\":\""+ORDER_CLASS+"\"," +
						"\"REPEAT_INDICATOR\":\""+REPEAT_INDICATOR+"\"," +
						"\"IS_ANTIBIOTIC\":\""+IS_ANTIBIOTIC+"\"," +
						"\"MEASURE_UNITS\":\""+MEASURE_UNITS+"\"," +
						"\"CP_NODE_CLASS_ID\":\""+CP_NODE_CLASS_ID+"\"," +
						"\"EFFECT_FLAG\":\""+EFFECT_FLAG+"\"," +
						"\"SPECIFICATION\":\""+SPECIFICATION+"\"," +
						"\"UNIT_ID\":\""+UNIT_ID+"\"," +
						"\"MARK\":\""+MARK+"\"," +
						"\"DEFAULT_ITEM\":\""+DEFAULT_ITEM+"\"," +
						"\"DRUG_ID\":\""+DRUG_ID+"\"" +
						"},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";
			if("{\"cp_orders\":]}"==_strJson){}
			System.out.println(_strJson);
			return _strJson;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
