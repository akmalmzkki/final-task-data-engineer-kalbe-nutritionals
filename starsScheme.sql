# Create database SampleStarSchema
create database SampleStarSchema;
use SampleStarSchema;

create table if not exists Orders (
    OrderID int primary key not null auto_increment,
    OrderProfit decimal(10, 2),
    OrderQuantity int,
    ItemID int not null,
    WarehouseID int not null,
    EmployeeID int not null,
    DateID int not null,
    CustomerID int not null,
    constraint fk_item foreign key (ItemID) references Items(ItemID),
    constraint fk_warehouse foreign key (WarehouseID) references Warehouses(WarehouseID),
    constraint fk_employee foreign key (EmployeeID) references Employees(EmployeeID),
    constraint fk_date foreign key (DateID) references Dates(DateID),
    constraint fk_customer foreign key (CustomerID) references Customers(CustomerID)
);

create table if not exists Customers (
    CustomerID int primary key not null auto_increment,
    CustomerName varchar(50),
    CustomerAddress varchar(50),
    CustomerPhone varchar(50)
);

create table if not exists Items (
    ItemID int primary key not null auto_increment,
    ItemName varchar(50),
    ItemPrice decimal(10, 2),
    ItemTotal int,
    constraint item_price check (itemPrice > 0)
);

create table if not exists Warehouses (
    WarehouseID int primary key not null auto_increment,
    WarehouseName varchar(50),
    WarehouseLocation varchar(50)
);

create table if not exists Employees (
    EmployeeID int primary key not null auto_increment,
    EmployeeName varchar(50),
    EmployeePosition varchar(50),
    EmployeeSalary decimal(10, 2),
    EmployeeAddress varchar(50)
);

create table if not exists Dates (
    DateID int primary key not null auto_increment,
    DateName varchar(50),
    DateYear int,
    DateMonth int,
    DateDay int
);