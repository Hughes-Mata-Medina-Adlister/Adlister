package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.*;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.dao.Categories;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdServlet", urlPatterns = "/ad")
public class AdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adId = Long.parseLong(request.getParameter("adId"));

        Config config = new Config();

        MySQLAdsDao adsDao = new MySQLAdsDao(config);

        Ad ad = adsDao.findById(adId);

        if (ad == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ad not found");
            return;
        }

        Users usersDao = new MySQLUsersDao(config);

        User user = usersDao.findById(ad.getUserId());

        request.setAttribute("user", user);

        List<String> categories = DaoFactory.getCategoriesDao().getCategoriesForAd(adId);

        request.setAttribute("categories", categories);

        request.setAttribute("ad", ad);

        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }
}
