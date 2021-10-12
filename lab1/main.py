
from random import randint
from random import uniform
from random import choice
import string
import random
from faker import Faker
from faker.providers import person
from faker.providers import date_time


fragility = ["fragile", "semi-fragile", "not-fragile"]
companies = ["WILDBERRIES", "AMAZON", "OZON", "FAST_ORDER"]
classes = ["Extra-fast_shipping", "Fast_shipping", "Normal_shipping"]
delivery_status = ["Preparing_for_delivery", "Delivering", "Delivered"]


MAX_N = 1000
MAX_COMPANIES = 20



def generate_package():
    f = open('package.csv', 'w')
    for i in range(MAX_N + 5):
        weight = randint(1, 25)
        height = randint(15, 100)
        width = randint(15, 100)
        length = randint(15, 150)
        fragility = choice(fragility)
        line = "{0};{1};{2};{3};{4}\n".format(
                                                  weight,
                                                  height,
                                                  width,
                                                  length,
                                                  fragility,
                                                  )
        f.write(line)
    f.close()

def generate_recipient():
    faker = Faker('ru_RU')
    #faker.add_provider(person)
    #faker.add_provider(date_time)
    f = open('recipient.csv', 'w')
    for i in range(MAX_N + 5):
        passport_id = random.randint(2000000000, 5000000000)
        first_name, middle_name, last_name = faker.name().split(' ')[:3]
        destination_address = faker.address()
        birth_date = faker.date()
        phone_number = 70000000000 + random.randint(9000000000, 9999999999)
        line = "{0};{1};{2};{3};{4};{5};{6}\n".format(
                                                  passport_id,
                                                  first_name,
                                                  middle_name,
                                                  last_name,
                                                  birth_date,
                                                  phone_number,
                                                  destination_address
                                                  )
        f.write(line)
    f.close()
    
def generate_courier():
    faker = Faker('ru_RU')
    f = open('courier.csv', 'w')
    for i in range(MAX_N + 5):
        passport_id = random.randint(2000000000, 5000000000)
        first_name, middle_name, last_name = faker.name().split(' ')[:3]
        delivery_company_id = random.randint(1, MAX_COMPANIES-1)
        birth_date = faker.date()
        print()
        phone_number = 70000000000 + random.randint(9000000000, 9999999999)
        line = "{0};{1};{2};{3};{4};{5};{6}\n".format(
        					    delivery_company_id,
                                                  passport_id,
                                                  first_name,
                                                  middle_name,
                                                  last_name,
                                                  birth_date,
                                                  phone_number
                                                  )
        f.write(line)
    f.close()
    

def generate_delivery_company():
    f = open('delivery_company.csv', 'w')
    faker = Faker('ru_RU')
    for i in range(MAX_COMPANIES):
        local_address = faker.address()
        cc_phone_number = 70000000000 + random.randint(9000000000, 9999999999)
        rating = random.randint(1, 10)
        count_of_couriers = 0
        name = choice(companies)
        line = "{0};{1};{2};{3};{4}\n".format(
                                                  local_address,
                                                  name,
                                                  count_of_couriers,
                                                  rating,
                                                  cc_phone_number,
                                                  )
        f.write(line)
    f.close()

def generate_order():
    faker = Faker('ru_RU')
    faker.add_provider(person)
    faker.add_provider(date_time)
    f = open('order.csv', 'w')
    for i in range(MAX_N + 15000):
        courier_id  = randint(1, MAX_N - 1)
        recipient_id  = randint(1, MAX_N - 1)
        package_id = randint(1, MAX_N - 1)
        delivery_class = choice(classes)
        status = choice(delivery_status)
        date_of_creating = faker.date()

        line = "{0};{1};{2};{3};{4};{5}\n".format(
                                                  courier_id,
                                                  recipient_id,
                                                  package_id,
                                                  date_of_creating,
                                                  delivery_class,
                                                  status
                                                  )
        f.write(line)
    f.close()


if __name__ == "__main__":
    generate_package()
    generate_recipient()
    generate_courier()
    generate_delivery_company()
    generate_order()
  
