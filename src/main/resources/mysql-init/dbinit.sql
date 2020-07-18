-- Create table
create table accounts
(
  user_name VARCHAR(20) not null,
  active    BIT not null,
  encrypted_password  VARCHAR(128) not null,
  user_role VARCHAR(20) not null
) ;

alter table accounts
  add primary key (user_name) ;
---------------------------------------

create table products
(
  code        VARCHAR(20) not null,
  image       longblob,
  name        VARCHAR(255) not null,
  price       double precision not null,
  create_date datetime not null
) ;

alter table products
  add primary key (code) ;
---------------------------------------
-- Create table
create table orders
(
  id               VARCHAR(50) not null,
  amount           double precision not null,
  customer_address VARCHAR(255) not null,
  customer_email   VARCHAR(128) not null,
  customer_name    VARCHAR(255) not null,
  customer_phone   VARCHAR(128) not null,
  order_date       datetime not null,
  order_num        INTEGER not null
) ;
alter table orders
  add primary key (id) ;
alter table orders
  add constraint order_uk unique (order_num) ;
---------------------------------------

-- Create table
create table order_details
(
  id         VARCHAR(50) not null,
  amount     double precision not null,
  price      double precision not null,
  quantity   INTEGER not null,
  order_id   VARCHAR(50) not null,
  product_id VARCHAR(20) not null
) ;
--
alter table order_details
  add primary key (id) ;
alter table order_details
  add constraint order_detail_ord_fk foreign key (order_id)
  references orders (id);
alter table order_details
  add constraint order_detail_ord_fk foreign key (product_id)
  references products (code);

---------------------------------------
insert into Accounts (user_name, active, encrypted_password, user_role)
values ('employee1', 1, '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_EMPLOYEE');

insert into Accounts (user_name, active, encrypted_password, user_role)
values ('manager1', 1, '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_MANAGER');

----------------
insert into products (code, name, price, create_date)
values ('S001', 'Core Java', 100, sysdate);

insert into products (code, name, price, create_date)
values ('S002', 'Spring for Beginners', 50, sysdate);

insert into products (code, name, price, create_date)
values ('S003', 'Swift for Beginners', 120, sysdate);

insert into products (code, name, price, create_date)
values ('S004', 'Oracle XML Parser', 120, sysdate);

insert into products (code, name, price, create_date)
values ('S005', 'CSharp Tutorial for Beginers', 110, sysdate);