package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author wuhailong
 * 
 */
public class PdcaServlet extends HttpServlet {
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:DCPLOCAL";
	public static final String DBUSER = "jhdcp";
	public static final String DBPASS = "jhdcp";
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	HttpServletResponse response;

	public PdcaServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.request = request;
		this.response = response;
		char _strOP = request.getParameter("op").charAt(0);
		try {
			GeneralOperation(_strOP);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

	public void GeneralOperation(char p_strOP) throws SQLException {
		switch (p_strOP) {
		case '0':
			GetVaNodeCount();
			break;
		case '1':
			GetCpVaInfo();
			break;
		case '2':
			GetCpcpInfo();
			break;
		case '3':
			GetCpVersions();
			break;
		case '4':
			GetOrderSeqs();
			break;
		default:
		}
	}

	/**
	 * 获取临床路径下的医嘱执行频此
	 * 2015-12-11
	 * 吴海龙 
	 */
	public void GetOrderSeqs(){
		String _strCpId = request.getParameter("cp_id");
		String _strSQL = " select (select cp_node_name\r\n"
				+ " from lcp_master_node\r\n"
				+ " where cp_id = '"+_strCpId+"'\r\n"
				+ " and cp_node_id = t.cp_node_id) node_name,\r\n"
				+ " t.cp_node_order_text order_text,\r\n"
				+ " order_no,\r\n"
				+ " count(*) mycount\r\n"
				+ " from LCP_PATIENT_ORDER_ITEM t\r\n"
				+ " where cp_id = '"+_strCpId+"'\r\n"
				+ " group by cp_node_id, order_no, t.cp_node_order_text\r\n"
				+ " order by cp_node_id asc, mycount desc";
		ResultSet _rsData = this.ExcuteBySQL(_strSQL);
		try {
			String _strJson = "{\"cp_orders\":[";
			while (_rsData.next()) {
				String _strCpName = _rsData.getString("node_name");
				String _strOrderText = _rsData.getString("order_text");
				String _nOrdrNo = _rsData.getString("order_no");
				int _nOrderCount = _rsData.getInt("mycount");
				_strJson += "{\"node_name\":\"" + _strCpName 
				+ "\",\"order_text\":\""+ _strOrderText 
				+ "\",\"order_no\":\"" + _nOrdrNo
				+ "\",\"mycount\":" + _nOrderCount + "},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";			
			System.out.println(_strJson);
			try {
				this.response.setContentType("text/html;charset=UTF-8");
				this.response.getWriter().print(_strJson);
				this.response.getWriter().flush();
				this.response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	

	/**
	 * ��ȡ�ٴ�·���ĸ��ְ汾
	 * 2015-12-10
	 * �⺣�� 
	 */
	public void GetCpVersions(){
		String _strCpMaterId = request.getParameter("master_id");
		String _strSQL = "select cp_id,cp_name,cp_code,(case cp_status when 0 then '启用' when 1 then '停用' when 2 then '等待审核' when 3 then '已退回' when 4 then '隐藏' else '其他' end) cp_status ,\r\n" + 
				"round((sum(hzqk)*100/count(*)),2) cp_hzl,\r\n" + 
				"round(avg(zyr),2) cp_pjzyr,\r\n" + 
				"round(avg(zyf),2) cp_pjzyf \r\n" + 
				"from( select a.cp_status,a.cp_code,a.cp_id,a.cp_name,c.patient_no,\r\n" + 
				"       (case b.TREAT_EFFECT when 1then 1 when 2 then 1 else 0 end)hzqk,\r\n" + 
				"        round(B.DISCHARGE_DATE_TIME- B.ADMISSION_DATE_TIME,2) zyr,\r\n" + 
				"        b.fee_total zyf\r\n" + 
				"  from (select cp_id,cp_status,cp_name,cp_code\r\n" + 
				"          from lcp_master\r\n" + 
				"         where cp_master_id = '"+_strCpMaterId+"'\r\n" + 
				"           and cp_start_user is not null) a,\r\n" + 
				"       (select b1.*, b2.FEE_TOTAL\r\n" + 
				"          from LCP_PATIENT_FIRSTPAGE b1 ,LCP_PATIENT_FEE b2\r\n" + 
				"         where b1.patient_no = b2.patient_no) b,\r\n" + 
				"       (select CP_ID, PATIENT_NO\r\n" + 
				"          FROM LCP_PATIENT_NODE\r\n" + 
				"         GROUP BY CP_ID, PATIENT_NO) c\r\n" + 
				" where a.cp_id = c.cp_id\r\n" + 
				"   and c.patient_NO = B.PATIENT_NO) group by cp_id,cp_name,cp_code,cp_status";
		ResultSet _rsData = this.ExcuteBySQL(_strSQL);
		try {
			String _strJson = "{\"cp_cp\":[";
			while (_rsData.next()) {
				String _strCpId = _rsData.getString("cp_id");
				String _strCpName = _rsData.getString("cp_name");
				String _strCpCode = _rsData.getString("cp_code");
				Double _nCphzl = _rsData.getDouble("cp_hzl");
				Double _nCppjzyr = _rsData.getDouble("cp_pjzyr");
				Double _nCppjzyf = _rsData.getDouble("cp_pjzyf");
				String _strCpStatus = _rsData.getString("cp_status");
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
			try {
				this.response.setContentType("text/html;charset=UTF-8");
				this.response.getWriter().print(_strJson);
				this.response.getWriter().flush();
				this.response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * ��ȡ�ж���汾���ٴ�·����Ϣ��cp_id,cp_name,cp_code 2015-12-10 �⺣��
	 */
	public void GetCpcpInfo() {
		String _strSQL = " select * from lcp_master  where cp_status = 0 ";
		ResultSet _rsData = this.ExcuteBySQL(_strSQL);
		try {
			String _strJson = "{\"cp_cp\":[";
			while (_rsData.next()) {
				String _strCpId = _rsData.getString("cp_id");
				String _strCpName = _rsData.getString("cp_name");
				String _strCpCode = _rsData.getString("cp_code");
				String _strCpMasterId = _rsData.getString("cp_master_id");
				int _nCpVersion = _rsData.getInt("cp_version");
				_strJson += "{\"cp_id\":\"" + _strCpId + "\",\"cp_name\":\""
						+ _strCpName + "\",\"cp_code\":\"" + _strCpCode
						+ "\",\"cp_master_id\":\"" + _strCpMasterId
						+ "\",\"cp_version\":" + _nCpVersion + "},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";
			System.out.println(_strJson);
			try {
				this.response.setContentType("text/html;charset=UTF-8");
				this.response.getWriter().print(_strJson);
				this.response.getWriter().flush();
				this.response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * ��ȡÿ���ٴ�·���ı������� 2015-12-08 �⺣��
	 */
	public void GetCpVaInfo() {
		String _strSQL = " select k.cp_id, " + " k.cp_name," + " k.cp_code,"
				+ " m.fcount," + " n.tcount,"
				+ " round(m.fcount * 100 / (m.fcount + n.tcount), 2) va"
				+ " from (select cp_id, count(*) fcount"
				+ " from LCP_PATIENT_NODE t" + " where cp_node_type = '4'"
				+ " group by cp_id) m," + " (select cp_id, count(*) tcount"
				+ " from LCP_PATIENT_NODE t" + " where cp_node_type = '2'"
				+ " group by cp_id) n," + " lcp_master k"
				+ " where m.cp_id = n.cp_id" + " and k.cp_id = m.cp_id"
				+ " and k.cp_status = 0" + " order by va desc";
		ResultSet _rsData = this.ExcuteBySQL(_strSQL);
		try {
			String _strJson = "{\"cp_va\":[";
			while (_rsData.next()) {
				String _strCpId = _rsData.getString("cp_id");
				String _strCpName = _rsData.getString("cp_name");
				String _strCpCode = _rsData.getString("cp_code");
				int _nFcount = _rsData.getInt("fcount");
				int _nTcount = _rsData.getInt("tcount");
				int _nVa = _rsData.getInt("va");
				_strJson += "{\"cp_id\":\"" + _strCpId + "\",\"cp_name\":\""
						+ _strCpName + "\",\"cp_code\":\"" + _strCpCode
						+ "\",\"fcount\":" + _nFcount + ",\"tcount\":"
						+ _nTcount + ",\"va\":" + _nVa + "},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "]}";
			System.out.println(_strJson);
			try {
				this.response.setContentType("text/html;charset=UTF-8");
				this.response.getWriter().print(_strJson);
				this.response.getWriter().flush();
				this.response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int GetCpNodeCount(String _strCpId) throws SQLException {
		String _strSQL = "select count(*) mycount from LCP_MASTER_NODE where cp_id='"
				+ _strCpId + "' and cp_node_type ='1'";
		ResultSet _rsCpNodeCount = this.ExcuteBySQL(_strSQL);
		int _nCount = 0;
		while (_rsCpNodeCount.next()) {
			_nCount = _rsCpNodeCount.getInt("mycount");
		}
		return _nCount;
	}

	/**
	 * ��ȡ�ڵ���� 2015-12-9 �⺣��
	 */
	public String GetNodeName(String p_strCpId, String p_strNodeId)
			throws SQLException {
		String _strSQL = "select cp_node_name  from LCP_MASTER_NODE "
				+ " where cp_id = '" + p_strCpId + "' and cp_node_id='"
				+ p_strNodeId + "'";
		ResultSet _rsCpNodeCount = this.ExcuteBySQL(_strSQL);
		while (_rsCpNodeCount.next()) {
			return _rsCpNodeCount.getString("cp_node_name");
		}
		return "";

	}

	/**
	 * ��ȡ�ٴ�·�����ڵ�ı����� 2015-12-08 �⺣��
	 * 
	 * @throws SQLException
	 */
	public void GetVaNodeCount() throws SQLException {
		String _strCpId = request.getParameter("cp_id");
		System.out.println("cp_id" + _strCpId);
		String _strSQL = " select mm.node_no,mm.cp_node_name byjd, mm.cp_node_id, nvl(nn.mycount, 0) mycount"
				+ " from (select rownum node_no, m.cp_node_name, cp_node_id"
				+ " from LCP_MASTER_NODE m"
				+ " where cp_id = '"
				+ _strCpId
				+ "'"
				+ " and cp_node_type = '1') mm"
				+ " left outer join (select rownum node_no, x.*"
				+ " from (select m.byjd cp_node_id, count(*) mycount"
				+ " from (select m.patient_no, count(*) byjd"
				+ " from LCP_PATIENT_NODE m,"
				+ " (select tt.patient_no"
				+ " from LCP_PATIENT_NODE tt"
				+ " where cp_id = '"
				+ _strCpId
				+ "'"
				+ " and cp_node_type = '4') n"
				+ " where m.patient_no = n.patient_no"
				+ " group by m.patient_no) m"
				+ " group by byjd) x) nn"
				+ " on mm.node_no = nn.node_no" + " order by cp_node_id asc";
		ResultSet _rsData = this.ExcuteBySQL(_strSQL);
		int _nCount = GetCpNodeCount(_strCpId);
		try {
			int _nMaxCount = 0;
			String _strJson = "{\"cp\":[";
			while (_rsData.next()) {
				String _strNodeName = _rsData.getString("byjd");
				String _strNodeId = _rsData.getString("cp_node_id");
				int _nMyCount = _rsData.getInt("mycount");
				int _nNodeNo = _rsData.getInt("node_no");
				_nMaxCount = _nMaxCount < _nMyCount ? _nMyCount : _nMaxCount;
				System.out.println(_strNodeName + "---" + _nMyCount);
				_strJson += " {\"node_name\":\"" + _strNodeName
						+ "\",\"node_no\":" + _nNodeNo + ",\"node_id\":"
						+ _strNodeId + ",\"vacount\":" + _nMyCount + "},";
			}
			_strJson = _strJson.substring(0, _strJson.length() - 1);
			_strJson += "],\"numberx\":" + _nCount;
			_strJson += ",\"endy\":" + ((_nMaxCount / 10) + 1) * 10;
			_strJson += "}";
			System.out.println(_strJson);
			try {
				this.response.setContentType("text/html;charset=UTF-8");
				this.response.getWriter().print(_strJson);
				this.response.getWriter().flush();
				this.response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int GetNodeVaCount(String p_strNodeId) {
		return 0;

	}

	/**
	 * 
	 * 2015-12-8 �⺣��
	 */
	public ResultSet ExcuteBySQL(String p_strSQL) {
		try {
			Connection conn = null;
			Statement stmt = null;
			String sql = p_strSQL;
			System.out.println(sql);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
