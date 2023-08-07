package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List; 

import jdbc.utill.OracleUtility;
import sample.dto.MoneyDto;

public class MoneyDao {
	// 싱글톤으로 만들어봅시다.
	private static MoneyDao daoMoney=new MoneyDao();
	private MoneyDao() {}
	public static MoneyDao getMoneyDao() {
		return daoMoney;
	}
	
	public List<MoneyDto> selectOtherSales() throws SQLException {
		Connection con = OracleUtility.getConnection();
		String sql = "select met.custno, custname,\r\n"
				+ "   decode(met.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade,\r\n"
				+ "   nvl(sale.asum,0) total\r\n"
				+ "   from member_tbl_02 met LEFT OUTER join\r\n"
				+ "   (select custno, sum(price) asum from money_tbl_02 mot\r\n"
				+ "   group by custno\r\n"
				+ "   order by asum desc) sale\r\n"
				+ "   on met.custno = sale.custno ORDER BY total DESC ,custno";
		PreparedStatement ps = con.prepareStatement(sql);

		List<MoneyDto> results = new ArrayList<>();

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			results.add(new MoneyDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4)));
		}
		ps.close();
		con.close();
		return results;
	}
}
