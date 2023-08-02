package com.codeup.adlister.controllers;

import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FormServlet", urlPatterns = "/form")
public class FormServlet extends HttpServlet {
    private final User userData;

    public FormServlet(User userData) {
        this.userData = userData;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Retrieve form data
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        // Create a UserData object to hold the data and validation results
        userData.setUsername(username);
        userData.setEmail(email);

        // Perform validation (example: check if fields are not empty)
        if (username == null || username.isEmpty() || email == null || email.isEmpty()) {
            // Set error message in UserData object
            userData.setErrorMessage("Please fill in all fields.");
            // Forward back to the form page with an error message
            req.setAttribute("userData", userData);
            req.getRequestDispatcher("form.jsp").forward(req, resp);
        } else {
            // Validation successful, proceed to next step (e.g., save to database)
            // ...
            // Redirect to success page or any other page
            resp.sendRedirect("success.jsp");
        }
    }
}

