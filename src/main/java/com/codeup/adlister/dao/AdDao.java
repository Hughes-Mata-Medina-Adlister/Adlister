package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface AdDao {
    List<Ad> getAllAds();
    Ad getAdById(int id);
    void updateAd(Ad ad);
}
