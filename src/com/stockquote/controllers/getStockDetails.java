package com.stockquote.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stockquote.services.StockService;

import StockDto.StockDto;

@WebServlet("/getStock")
public class getStockDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
		HttpSession session = request.getSession();
		String stockName = request.getParameter("stockName");
		StockDto stockDto = null;
		try {
			stockDto = StockService.getStockInfo(stockName);
			List<StockDto> stockList = new ArrayList<>();
			stockList.add(stockDto);
			session.setAttribute("stockList", stockList);
			session.setAttribute("stockName", stockName);
			response.sendRedirect("/stockquote");
			
		} catch (Exception e) {
			session.setAttribute("messageFail", "Please enter a valid ticker symbol. ");
			response.sendRedirect("/stockquote");
			
			e.printStackTrace();
		}
		
		
	}

}
