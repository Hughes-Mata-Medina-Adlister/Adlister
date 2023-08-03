package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/ads/delete")
public class DeleteAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        long adId;
        try {
            adId = Long.parseLong(id);
        } catch (NumberFormatException e) {
            response.sendRedirect("/ads");
            return;
        }

        Ad ad = DaoFactory.getAdsDao().findById(adId);
        User user = (User) request.getSession().getAttribute("user");
        if (user != null && ad != null && ad.getUserId() == user.getId()) {
            DaoFactory.getAdsDao().delete(adId);
            response.sendRedirect("/ads");
        } else {
            response.sendRedirect("/ads");
        }
    }
}
