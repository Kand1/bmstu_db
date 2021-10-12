DROP SCHEMA IF EXISTS lab CASCADE ;
CREATE SCHEMA lab


CREATE TABLE lab.package
(
    id     serial not null primary key,
    weight INT    not NULL,
    height INT    not NULL,
    width  INT    not NULL,
    length INT    not NULL,
    type   TEXT   not NULL
);

CREATE TABLE lab.delivery_company (
    id serial  not null primary key,
    name TEXT not null,
    local_address TEXT not null,
    rating DECIMAL(10, 0) NOT NULL,
    couriers_count INT not null,
    cc_phone_number DECIMAL(11, 0) not NULL
);
CREATE TABLE lab.courier (
    id serial not null primary key,
    delivery_company_id integer not null,
    passport_id DECIMAL(10, 0) NOT NULL,
    last_name TEXT not null,
    first_name TEXT not null,
    middle_name TEXT not null,
    birth_date DATE not null,
    phone_number DECIMAL(11, 0) not NULL,
    foreign key (delivery_company_id) references lab.delivery_company(id) on delete cascade
);
CREATE TABLE lab.recipient (
    id  serial not null primary key,
    passport_id DECIMAL(10, 0) NOT NULL,
    last_name TEXT not null,
    first_name TEXT not null,
    middle_name TEXT not null,
    destination_address TEXT not null,
    birth_date DATE not null,
    phone_number DECIMAL(11, 0) not NULL
);
CREATE TABLE lab.order (
    id serial not null,
    courier_id INT not null ,
    recipient_id INT not null ,
    package_id INT not null ,
    order_status TEXT not null ,
    shipment_class TEXT not null ,
    date_of_creating DATE default  CURRENT_TIMESTAMP NOT NULL,
    foreign key (courier_id) references lab.courier(id) on delete cascade,
    foreign key (recipient_id) references lab.recipient(id) on delete cascade,
    foreign key (package_id) references lab.package(id) on delete cascade
);
