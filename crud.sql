use kalbe;

# Membuat tabel inventori dengan atribut item_code, item_name, item_price, item_total
create table if not exists inventory (
    item_code varchar(10) primary key,
    item_name varchar(50),
    item_price int,
    item_total int,
    constraint item_price check (item_price > 0)
);

insert into inventory
values
    ('2341', 'Promag Tablet', 3000, 100),
    ('2342', 'Hydro Coco 250ML', 7000, 20),
    ('2343', 'Nutrieve Benecol 100ML', 20000, 30),
    ('2344', 'Blackmores Vit C 500mg', 95000, 45),
    ('2345', 'Entrasol Gold 370G', 90000, 120)

select * from inventory;

# Show ITEM_NAME that has the highest number in item_total
select item_name from inventory
where item_total = (select max(item_total) from inventory);

# Update the ITEM_PRICE of the output of question bullet
update inventory
set item_price = 10000
where item_name = 'Entrasol Gold 370G';

# What will happen if we insert another Item_name with Item_code of 2343 into the table?
# Akan terjadi error karena item_code merupakan primary key

# Delete the Item_name that has the lowest number of Item_total.
delete from inventory
where item_total = (select min(item_total) from inventory);

-- Create customers_order table
CREATE TABLE IF NOT EXISTS customers_order (
    order_no INT PRIMARY KEY,
    purchase_amount DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT
);

-- Insert data into customers_order table
INSERT INTO customers_order (order_no, purchase_amount, order_date, customer_id, salesman_id)
VALUES
    (10001, 150.00, '2022-10-05', 2005, 3002),
    (10009, 279.00, '2022-09-10', 2001, 3005),
    (10002, 65.00, '2022-10-05', 2002, 3001),
    (10004, 110.00, '2022-08-17', 2009, 3003),
    (10007, 948.00, '2022-09-10', 2005, 3002),
    (10005, 2400.00, '2022-07-27', 2007, 3001);

/*
Create a Query to display all customer orders where purchase amount is less than 100 or exclude those
orders which order date is on or greater than 25 Aug 2022 and customer id is above 2001
 */
select * from customers_order
where purchase_amount < 100 or (order_date < '2022-08-25' and customer_id < 2001);
