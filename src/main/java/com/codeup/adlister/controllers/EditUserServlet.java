package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditUserServlet", urlPatterns = "/profile/edit")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/editUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || (DaoFactory.getUsersDao().findByUsername(username) != null
                && !username.equals(user.getUsername()));

        if (inputHasErrors) {
            response.sendRedirect("/profile/edit");
            return;
        }

        user.setUsername(username);
        user.setEmail(email);
        DaoFactory.getUsersDao().update(user);

        response.sendRedirect("/profile");
    }
}
