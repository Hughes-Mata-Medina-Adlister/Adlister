package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import static com.codeup.adlister.dao.DaoFactory.getUsersDao;

@WebServlet(name = "EditUserServlet", urlPatterns = "/userEdit")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || ((getUsersDao().findByUsername(username) != null)
                && (getUsersDao().findByUsername(username).getId() != user.getId()));
        if (inputHasErrors) {
            response.sendRedirect("/profile");
            return;
        }
        user.setUsername(username);
        user.setEmail(email);
        getUsersDao().update(user);
        response.sendRedirect("/profile");
    }
}

