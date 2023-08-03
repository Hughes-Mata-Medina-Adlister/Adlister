package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database", e);
        }
    }

    @Override
    public List<Ad> all() {
        String query = "SELECT * FROM ads";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching ads from the database", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        String query = "INSERT INTO ads (user_id, title, description, category) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getCategory());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getLong(1);
            } else {
                throw new RuntimeException("Failed to insert the ad, no ID obtained.");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting ad into the database", e);
        }
    }

    @Override
    public Ad findById(long id) {
        String query = "SELECT * FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractAd(rs);
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ad by id", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
    private Ad extractAd(ResultSet rs) throws SQLException {
        long id = rs.getLong("id");
        long userId = rs.getLong("user_id");
        String title = rs.getString("title");
        String description = rs.getString("description");
        String category = rs.getString("category");

        return new Ad(id, userId, title, description, category);
    }
}
