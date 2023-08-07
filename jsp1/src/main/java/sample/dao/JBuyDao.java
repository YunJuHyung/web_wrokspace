package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.utill.OracleUtility;
import sample.dto.JBuyDto;

public class JBuyDao {
	public int buy(List<JBuyDto> carts) throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "insert into j_buy values(seq.nextval,?,?,?,sysdate)";
		PreparedStatement ps = connection.prepareStatement(sql);

		for (JBuyDto jb : carts) {
			ps.setString(1, jb.getCustomid());
			ps.setString(2, jb.getPcode());
			ps.setInt(3, jb.getQuantity());
		}
		int result = ps.executeUpdate();

		ps.close();
		connection.close();

		return result;

	}// 상품 구매(결제)하기 - 장바구니의 데이터를 구매 테이블에 입력하기

	public List<JBuyDto> selectAll() throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_buy";
		PreparedStatement ps = connection.prepareStatement(sql);
		List<JBuyDto> results = new ArrayList<>();

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			results.add(new JBuyDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5)));
		}

		return results;
	}// 나의 구매 내역 보기
}
