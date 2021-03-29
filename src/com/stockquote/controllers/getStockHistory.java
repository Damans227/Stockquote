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


import StockDto.StockHistory;

@WebServlet("/getStockHistory")
public class getStockHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session = request.getSession();
		String stockName = (String) session.getAttribute("stockName");

		try {
			List<StockHistory> histories = StockService.getHistory(stockName, 0, null);

			session.setAttribute("msg", "Stock history up to date:");
			session.setAttribute("histories", histories);
			response.sendRedirect("/stockquote");
		} catch (Exception e) {
			session.setAttribute("messageFail", "Please enter a valid ticker symbol. ");
			response.sendRedirect("/stockquote");
			
			e.printStackTrace();
		}


		
	}

}
