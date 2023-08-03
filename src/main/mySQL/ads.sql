CREATE DATABASE IF NOT EXISTS adlister_db;

USE adlister_db;

CREATE TABLE IF NOT EXISTS ads (
                                   id int NOT NULL AUTO_INCREMENT,
                                   user_id int NOT NULL,
                                   title varchar(255) NOT NULL,
    description text,
    category varchar(255) NOT NULL,
    PRIMARY KEY (id),
    KEY user_id (user_id),
    CONSTRAINT ads_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO ads (user_id, title, description, category) VALUES
                                                            (1, "Arc'teryx Thorium For Sale", "$10 Slightly used", "Clothing"),
                                                            (1, "4 kittens FREE", "Free kittens to a good home", "Pets"),
                                                            (1, "Baby Shoes", "For sale. Very used and dirty $20", "Shoes"),
                                                            (1, "2004 Toyota Celica", "345K miles new alternator", "Vehicles"),
                                                            (1, "Laptop for sale", "Macbook $50 doesn't work sorry", "Electronics"),
                                                            (1, "Hot Sauce for sale by the 50gal drum", "$400 per drum", "Food & Beverages");
