package com.stockquote.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stockquote.services.StockService;

import StockDto.Headers;
import StockDto.StockHistory;

@WebServlet("/exportStockHistory")
public class exportStockHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session = request.getSession();
		String stockName = request.getParameter("stockName");
		int year = 2021;
		String searchType = request.getParameter("field");

		try {
			List<StockHistory> histories = StockService.getHistory(stockName, year, searchType);
			
			session.setAttribute("msg", searchType.toUpperCase() + " stock history of " + stockName +" : ");
			session.setAttribute("histories", histories);
			response.sendRedirect("/stockquote");
			
		} catch (Exception e) {
			session.setAttribute("messageFail", "Please enter valid entries for advanced search. ");
			response.sendRedirect("/stockquote");
			e.printStackTrace();
		}
		

}
	
}
