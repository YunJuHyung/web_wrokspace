package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdbc.utill.OracleUtility;
import sample.dto.JCustomerDto;

public class JCustomerDao {

	public JCustomerDto select(String customid) throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_custom where custom_id =?";
		PreparedStatement ps = connection.prepareStatement(sql);

		ps.setString(1, customid);

		ResultSet rs = ps.executeQuery();

		JCustomerDto result = null;
		if (rs.next()) {
			result = new JCustomerDto
					(rs.getString(1), rs.getString(2), 
							rs.getString(3), rs.getInt(4), rs.getDate(5),
							/*sql 추가됨*/ sql);
		}
		ps.close();
		connection.close();
		return result;

	}// 1.간단히 회원아이디를 입력해서 존재하면 로그인 성공
	
	
	public JCustomerDto login(String id,String password) throws SQLException {
	      Connection conn = OracleUtility.getConnection();
	      String sql = "select custom_id ,name  "
	            + "from j_custom where custom_id =? and password=?";
	      JCustomerDto result = null;
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ps.setString(1, id);
	      ps.setString(2,password);
	      
	      ResultSet rs = ps.executeQuery();
	      if(rs.next()) {
	         result = JCustomerDto.builder()
	               .custom_id(rs.getString(1))
	               .name(rs.getString(2))
	               .build();
	      }
	      return result;      //result 가 null 이 아니면 로그인 성공
	   }
}
