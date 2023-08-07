package sample.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.utill.OracleUtility;
import sample.dto.JProductDto;

public class JProductDao {
	public List<JProductDto> selectAll() throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_product";
		PreparedStatement ps = connection.prepareStatement(sql);
		List<JProductDto> results = new ArrayList<>();

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			results.add(new JProductDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4)));

		}

		return results;
	}// 2. 상품목록보기

	public List<JProductDto> selectByPname(String pname) throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_product where pname like '%' || ? || '%'";
		PreparedStatement ps = connection.prepareStatement(sql);

		ps.setString(1, pname);
		ResultSet rs = ps.executeQuery();

		List<JProductDto> results = new ArrayList<>();
		while (rs.next()) {
			results.add(new JProductDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
		}
		ps.close();
		connection.close();

		return results;
	}
}
