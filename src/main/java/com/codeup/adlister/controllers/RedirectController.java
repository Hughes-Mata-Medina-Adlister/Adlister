package com.codeup.adlister.controllers;

import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RedirectController {
    public void redirectUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       if (request.getSession().getAttribute("user") != null) {
           //User is logged in, perform redirect based on condition
           // example, if the user has an admin role, redirect to admin page, else redirect t user dashboard.
           User currentUser = (User) request.getSession().getAttribute("user");
           if (currentUser.getRole().equals("admin")) {
               response.sendRedirect(request.getContextPath() + "/admindashboard");

           } else {
               response.sendRedirect(request.getContextPath() + "/userDashboard");
           }
       } else {
           // User is not logged in, redirect to login page
           response.sendRedirect(request.getContextPath() + "/login");

       }
    }
}
