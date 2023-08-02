package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

public interface Users {
    User findByUsername(String username);
    void insert(User user);
    Long insert(User user);
    boolean usernameExists(String username);
}
