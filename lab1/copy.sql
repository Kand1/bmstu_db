copy lab.package(weight, height, width, length, type) from '/home/vlad/Рабочий стол/bmstu/DB/Lab_01_kand1/package.csv' delimiter ';' csv header;
copy lab.delivery_company(local_address, name, couriers_count, rating, cc_phone_number) from '/home/vlad/Рабочий стол/bmstu/DB/Lab_01_kand1/delivery_company.csv' delimiter ';' csv header;
copy lab.courier(delivery_company_id, passport_id, last_name, first_name, middle_name, birth_date, phone_number) from '/home/vlad/Рабочий стол/bmstu/DB/Lab_01_kand1/courier.csv' delimiter ';' csv header;
copy lab.recipient(passport_id, last_name, first_name, middle_name, birth_date, phone_number, destination_address) from '/home/vlad/Рабочий стол/bmstu/DB/Lab_01_kand1/recipient.csv'  delimiter ';' csv header;
copy lab.order(courier_id, recipient_id, package_id, date_of_creating, shipment_class, order_status) from '/home/vlad/Рабочий стол/bmstu/DB/Lab_01_kand1/order.csv'  delimiter ';' csv header;