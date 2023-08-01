package com.codeup.adlister.controllers;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.codeup.adlister.dao.DaoFactory.getAdsDao;

@WebServlet (name = "EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Ad ad = (Ad) getAdsDao().getAdById(id);
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("/ads");
            return;
        }
        if (ad.getUserId() == user.getId()) {
            req.getSession().setAttribute("ad", ad);
            req.getSession().setAttribute("categories", getAdsDao().all());
            req.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(req, resp);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ad ad = (Ad) request.getSession().getAttribute("ad");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        ad.setTitle(title);
        ad.setDescription(description);
        response.sendRedirect("/ads");
    }
}

