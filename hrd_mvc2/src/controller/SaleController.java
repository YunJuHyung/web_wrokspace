package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.SaleDao;
import vo.SaleVo;

public class SaleController implements Controller
{ 
	private static final Logger logger = LoggerFactory.getLogger(SaleController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		SaleDao sdao = SaleDao.getSaleDao();
		List<SaleVo> sales = null;
		try {sales = sdao.salesTotal();} 
		catch (SQLException e) {logger.error("[MyInfo] - {}",e.getMessage());}
		
		request.setAttribute("sales", sales);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("saleView.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
