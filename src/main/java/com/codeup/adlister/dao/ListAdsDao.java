package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListAdsDao implements Ads {
    private List<Ad> ads;
    private Connection connection;

    public ListAdsDao(Config config) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );

            ads = generateAds();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public List<Ad> all() {
        if (ads == null) {
            ads = generateAds();
        }
        return ads;
    }

    @Override
    public Long insert(Ad ad) {
        return null;
    }

    @Override
    public Ad findById(long id) {
        for (Ad ad : ads) {
            if (ad.getId() == id) {
                return ad;
            }
        }
        return null;
    }

    private List<Ad> generateAds() {
        return generateAds(null);
    }

    private List<Ad> generateAds(String description) {
        List<Ad> ads = new ArrayList<>();
        String description1;
        if (description == null) {
            description1 = "";
        } else {
            description1 = description;
        }
        ads.add(new Ad(description));
        return ads;
    }
}
