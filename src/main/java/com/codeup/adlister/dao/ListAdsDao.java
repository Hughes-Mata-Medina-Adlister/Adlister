package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
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

    @Override
    public void update(Ad ad) {

        for (int i = 0; i < ads.size(); i++) {
            if (ads.get(i).getId() == ad.getId()) {
                ads.set(i, ad);
                return;
            }
        }
    }

    @Override
    public void delete(long id) {
        Iterator<Ad> iterator = ads.iterator();
        while (iterator.hasNext()) {
            Ad ad = iterator.next();
            if (ad.getId() == id) {
                iterator.remove();
                return;
            }
        }
    }

    @Override
    public List<Ad> findByTitleOrDescription(String term) {
        List<Ad> matchingAds = new ArrayList<>();
        for (Ad ad : ads) {
            if (ad.getTitle().toLowerCase().contains(term.toLowerCase()) ||
                    ad.getDescription().toLowerCase().contains(term.toLowerCase())) {
                matchingAds.add(ad);
            }
        }
        return matchingAds;
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
