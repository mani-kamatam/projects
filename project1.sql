use miniproject1;
CREATE TABLE categories (
    category_id INT PRIMARY KEY ,
    category_name VARCHAR(255) UNIQUE NOT NULL
);
insert into categories values(1001,'mythology');
insert into categories values(1002,'novel');

select * from categories;

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY ,
    Publisher_name VARCHAR(255) NOT NULL
);
insert into publishers values(1011,'mk_publishers');
insert into publishers values(1012,'km_publishers');

select*from publishers;

create table books( Book_id int primary key,
 title varchar(225) not null,
isbn varchar(30) unique not null,
publication_year int not null,
publisher_id int,
category_id int,
author_name varchar(225),
        FOREIGN KEY (Publisher_id) REFERENCES Publishers(Publisher_id)
        ON DELETE CASCADE,
        FOREIGN KEY (Category_id) REFERENCES Categories(Category_id)
        ON DELETE CASCADE,
        CHECK (Author_name IS NOT NULL)
);
insert into books values(1111,'ramayana','rm1001',1990,1011,1001,'valmiki');
insert into books values(1112,'mahabharath','mb1002',1890,1012,1002,'vyasa');

select*from books;

create table Users (
    user_id INT PRIMARY KEY ,
    username varchar(255) not null,
    email varchar(255) unique not null,
    phone_Number varchar(255) unique not null
);
insert into users values(1,'mani','mani@email.com','987663354');
insert into users values(2,'ravi','ravi@email.com','658763566');

select*from users;

CREATE TABLE Borrowings (
    Borrow_id INT PRIMARY KEY,
    User_id INT,
     FOREIGN KEY (User_id) REFERENCES Users(User_id) ON DELETE CASCADE,
    Book_id INT,
     FOREIGN KEY (Book_id) REFERENCES Books(Book_id) ON DELETE CASCADE,
	Borrow_Date date not null,
    Return_Date date not null
    );

        
insert into Borrowings values(12,1,1111,'2024-09-13','2024-09-16');
insert into borrowings values(11,2,1112,'2024-08-21','2024-08-13');

select* from borrowings;



