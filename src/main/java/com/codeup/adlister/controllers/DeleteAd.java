package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DeleteAd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String user = "root";
            String pass = "root";
            String query = "delete from adlister_db where id=?";
            Connection con = DriverManager.getConnection("jdbc:mysql://locahost:8080/ads", user, pass);
            PreparedStatement ps = con.prepareStatement("delete from adlister_db where id=?");
            ps.setString(1, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("Ad successfully removed...");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}






