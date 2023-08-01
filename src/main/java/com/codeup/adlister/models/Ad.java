package com.codeup.adlister.models;


public class Ad {
    private String description;
    private String id;

    private long userId;
    private long title;

    public Ad(String description1) {
        this.description = description1;
    }

    public Ad(long userId, long title) {
        this.userId = userId;
        this.title = title;
    }

    public Ad(String title, String description, String postedBy, int price) {
        this.description = description;
    }

    public Ad(long id, long userId, String title, String description) {
    }

    public Ad(long id, String title) {
    }

    public String getId() {
        return id;
    }

        public void setId(String id) {
            this.id = id;
        }

    public long getUserId() {
        return userId;
    }

    public String getTitle() {
            return String.valueOf(title);
        }

        public void setTitle(long title) {
            this.title = title;
        }

        public String getDescription() {
            return (String) description;
        }

}
