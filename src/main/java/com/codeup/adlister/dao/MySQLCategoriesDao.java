package com.codeup.adlister.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
	private final Connection connection;

	public MySQLCategoriesDao(Config config) {
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			connection = DriverManager.getConnection(
					config.getUrl(),
					config.getUser(),
					config.getPassword()
			);
		} catch (SQLException e) {
			throw new RuntimeException("Error connecting to the database!", e);
		}
	}

	@Override
	public void insert(Long adId, String category) {
		String insertQuery = "INSERT INTO categories (ad_id, category) VALUES (?, ?)";
		try (PreparedStatement stmt = connection.prepareStatement(insertQuery)) {
			stmt.setLong(1, adId);
			stmt.setString(2, category);
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("Error inserting category.", e);
		}
	}


	@Override
	public List<String> getCategoriesForAd(long adId) {
		List<String> categories = new ArrayList<>();
		String query = "SELECT category FROM categories WHERE ad_id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setLong(1, adId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String category = rs.getString("category");
				categories.add(category);
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error retrieving categories for the ad.", e);
		}
		return categories;
	}
}
