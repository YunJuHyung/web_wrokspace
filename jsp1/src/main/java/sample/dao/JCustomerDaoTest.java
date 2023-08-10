package sample.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import sample.dto.JCustomerDto;

class JCustomerDaoTest {

	@Test
	void daoTest() {
		JCustomerDao dao = new JCustomerDao();
		assertNotNull(dao);
	}
	
	@Test
	void selectById() {
		JCustomerDao dao = new JCustomerDao();
		try {
			JCustomerDto dto = dao.select("mina012");
			assertNotNull(dto);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	void login() {
		JCustomerDao dao = new JCustomerDao();
		JCustomerDto dto = null;
		try {
			dto = dao.login("mina012", "12345");
		} catch(SQLException e) {
			e.printStackTrace();
		}
		assertNotNull(dto);
	}

}
