use BarBeerDrinkerSample;
drop table if exists users; 
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    type VARCHAR(25) NOT NULL,
    CHECK (type IN ('customer', 'admin','representative'))
    
);

INSERT INTO users (username, password, type) VALUES ('username1', 'password1', 'customer');
