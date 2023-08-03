package com.codeup.adlister.dao;

import java.util.List;

public interface Categories {
	void insert(Long adId, String category);

	List<String> getCategoriesForAd(long adId);
}
