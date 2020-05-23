DROP TABLE request;

DROP TABLE fullorder;

DROP TABLE product;

DROP TABLE customer;

CREATE TABLE customer (
    customerid   NUMBER(3),
    name         VARCHAR(25),
    address      VARCHAR(50),
    PRIMARY KEY ( customerid )
);

CREATE TABLE product (
    productid     NUMBER(2),
    description   VARCHAR(28),
    finish        VARCHAR(10),
    price         NUMBER(5, 2) CHECK ( price >= 0 ),
    primary key (productid)
);

CREATE TABLE fullorder (
    orderid      NUMBER(5),
    orderdate    DATE,
    customerid   NUMBER(3),
    PRIMARY KEY ( orderid ),
    FOREIGN KEY ( customerid )
        REFERENCES customer ( customerid )
);

CREATE TABLE request (
    orderid     NUMBER(5),
    productid   NUMBER(2),
    quantity    NUMBER(3) CHECK ( quantity > 0
                               AND quantity < 101 ),
    PRIMARY KEY ( orderid,
                  productid ),
    FOREIGN KEY ( productid )
        REFERENCES product ( productid ),
    FOREIGN KEY ( orderid )
        REFERENCES fullorder ( orderid )
);

insert into Customer values(2, 'CASUAL FURNITURE', 'PLANO, TX');
insert into Customer values(6, 'MOUNTAIN GALLERY', 'BOULDER, CO');

insert into Product values(10, 'WRITING DESK', 'OAK', 425);
insert into Product values(30, 'DINING TABLE', 'ASH', 600);
insert into Product values(40, 'ENTERTAINMENT CENTER', 'MAPLE', 650);
insert into Product values(70, 'CHILDRENS DRESSER', 'PINE', 300);

insert into fullorder VALUES(1006, Date '2010-03-24', 2);
insert into fullorder VALUES(1007, Date '2010-03-25', 6);
insert into fullorder VALUES(1008, Date '2010-03-25', 6);
insert into fullorder VALUES(1009, Date '2010-03-26', 2);

insert into request values(1006, 10, 4);
insert into request values(1006, 30, 2);
insert into request values(1006, 40, 1);
insert into request values(1007, 40, 3);
insert into request values(1007, 70, 2);
insert into request values(1008, 70, 1);
insert into request values(1009, 10, 2);
insert into request values(1009, 40, 1);

select * from Customer;

select * from FullOrder;

Select * from Request;

Select * from Product;