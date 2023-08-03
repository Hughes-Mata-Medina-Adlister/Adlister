package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import java.util.ArrayList;
import java.util.List;


public abstract class ListAdsDao implements Ads {
    private List<Ad> ads;

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
    public void searchAd(String title) {
    }

    private List<Ad> generateAds() {
        return generateAds(null);
    }

    private List<Ad> generateAds(String description) {
        List<Ad> ads = new ArrayList<>();
        String description1;
        if (description == null) description1 = "";
        else description1 = description;
        ads.add(new Ad(description));
        return ads;
    }
}
