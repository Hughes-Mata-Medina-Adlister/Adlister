package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Config;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String[] categories = request.getParameterValues("categories");

        Ad ad = new Ad(loggedInUser.getId(), title, description);
        Long adId = DaoFactory.getAdsDao().insert(ad);

        if (categories != null) {
            for (String category : categories) {
                DaoFactory.getCategoriesDao().insert(adId, category);
            }
        }

        response.sendRedirect("/ads");
    }

    private void insertCategory(Long adId, String category) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Config config = new Config();

            conn = DriverManager.getConnection(config.getUrl(), config.getUser(), config.getPassword());

            String insertQuery = "INSERT INTO categories (ad_id, category) VALUES (?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setLong(1, adId);
            stmt.setString(2, category);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting category.", e);
        } finally {

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}