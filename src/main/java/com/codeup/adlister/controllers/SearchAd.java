package com.codeup.adlister.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/profile")
public class SearchAd extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);
        List adlist = new ArrayList();

        String searchType = "";
        String search = "";

        searchType = request.getParameter("searchType");
        search = request.getParameter("search");

        String sqlStr = null;

        if(searchType.equals("title")){
            sqlStr = "Select Moviename, genre, duration, cast, release_date, summary, timeslot FROM movie where Moviename like '%" + search + "%'";
        }
        else if(searchType.equals("genre")) {
            sqlStr = "Select Moviename, genre, duration, cast, release_date, summary, timeslot FROM movie where genre like '%" + search + "%'";
        }
        else if(searchType.equals("Actor")) {
            sqlStr = "Select Moviename, genre, duration, cast, release_date, summary, timeslot FROM movie where cast like '%" + search + "%'";
        }else {
            System.out.println("How did you not select from the drop down table?");
        }
        System.out.println(sqlStr);
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/database?user=root&password=password&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");

            try{

                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlStr);


                while (rs.next()) {
                    List ad = new ArrayList();
                    ad.add(((ResultSet) rs).getInt(1));
                    ad.add(rs.getString(2));
                    ad.add(rs.getString(3));
                    ad.add(rs.getString(4));
                    ad.add(rs.getString(5));
                    ad.add(rs.getString(6));

                    adlist.add(ad);
                }
            } catch (SQLException s){
                System.out.println("Value could not be found");
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        request.setAttribute("id", adlist);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/search result.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAd() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

}