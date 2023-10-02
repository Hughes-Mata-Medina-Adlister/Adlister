package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

public interface Users {
    User findByUsername(String username);

    Long insert(User user);
    boolean usernameExists(String username);
    User findById(long id);


    void update(User user);

}
