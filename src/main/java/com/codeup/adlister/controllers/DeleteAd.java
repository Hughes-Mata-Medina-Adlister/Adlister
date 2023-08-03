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
import java.util.List;

@WebServlet(name = "controllers.DeleteServlet", urlPatterns = "/ads/delete")
public class DeleteAd extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        List<Ad> ads = DaoFactory.getAdsDao().all();
        req.setAttribute("ads/delete", ads);

        try {
            req.getRequestDispatcher("/WEB-INF/ads/delete.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       long id = Long.parseLong(request.getParameter("post-id"));
        User user = (User) request.getSession().getAttribute("user");
        long user_id = user.getId();
        DaoFactory.getAdsDao().deleteAd(id, user_id);
        response.sendRedirect("/ads");
    }
}






