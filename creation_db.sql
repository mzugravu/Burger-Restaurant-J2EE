DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS(
    id INTEGER PRIMARY KEY,
    fullname varchar(255),
    phone varchar(255),
    mail varchar(255) UNIQUE,
    password varchar(255),
    address varchar(255),
    role varchar(255)
);

CREATE TABLE PRODUIT(
    id INTEGER PRIMARY KEY,
    name varchar(255),
    description varchar(255),
    price FLOAT,
    image TEXT,
    quantity INTEGER
);

INSERT INTO PRODUIT
    VALUES (1,'Crispy Chicken', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 12.5 ,'crispy_chicken.png', 15),(2,'Black Beef', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17.5 ,'black_beef.png', 60),(3,'Double Mac', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 15.5 ,'double-mac.png', 10),(4,'Big Meety', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 13.5 ,'big_meety.png', 10),(5,'Regular Burger', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 10.5 ,'regular.png', 10);


INSERT INTO USERS
    VALUES (1,'Mary Jane', '+50764490994', 'mary.jane@gmail.com','admin123', '3 Rue de la Cinge', 'admin'),(2,'Bianca','+33453900271','bianca@gmail.com','bianca', '4 Rue de la Science','client');
    
    


