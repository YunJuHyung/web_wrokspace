package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.utill.OracleUtility;
import sample.dto.JCustomDto;

public class JCustomerDao {

	public JCustomDto select(String customid) throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_custom where custom_id =?";
		PreparedStatement ps = connection.prepareStatement(sql);

		ps.setString(1, customid);

		ResultSet rs = ps.executeQuery();

		JCustomDto result = null;
		if (rs.next()) {
			result = new JCustomDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5));
		}
		ps.close();
		connection.close();
		return result;

	}// 1.간단히 회원아이디를 입력해서 존재하면 로그인 성공
}
