package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchAd")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Ad> ads = null;

        if (search != null && !search.isEmpty()) {
            ads = DaoFactory.getAdsDao().findByTitleOrDescription(search);
        }

        if (ads == null) {
            response.sendRedirect("/ads");
            return;
        }

        request.setAttribute("ads", ads);
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }

    public SearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
