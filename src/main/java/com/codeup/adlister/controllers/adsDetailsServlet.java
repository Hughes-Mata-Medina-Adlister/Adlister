package com.codeup.adlister.controllers;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "adsDetailsServlet.java", urlPatterns = "/ads/detail")
public class adsDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        checks for logged in user
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        User currentUser = (User) request.getSession().getAttribute("user");
        Ad currentAd = (Ad) request.getSession().getAttribute("ad");
        request.setAttribute("user", currentUser.getUsername());
        request.setAttribute("ad", currentAd);


        request.getRequestDispatcher("/WEB-INF/ads/adsDetail.jsp")
                .forward(request, response);
    }
}
