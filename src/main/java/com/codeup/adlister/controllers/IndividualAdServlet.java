package com.codeup.adlister.controllers;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "AdServlet", urlPatterns = "/individualAds")
public class IndividualAdServlet extends HttpServlet {
    private Object price;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp, ServletContext request, Object AdService) throws ServletException, IOException {
        String adId = String.valueOf(request.getServlet("adId"));
        String title = "Furniture for Sale";
        String description = "Selling a set of used furniture in excellent condition.";
        String postedBy = "Adam Sandler";
        double $500;

        adId = String.valueOf(request.getServlet("adId"));
        Class<?> ad = AdService.getClass();
        request.setAttribute("ad", ad);
        
        request.getRequestDispatcher("/jsp/individualAd.jsp").forward(req, resp);
    }
}
