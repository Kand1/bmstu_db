--package
alter table lab.package
    drop constraint if exists sp_weight;
alter table lab.package
    add constraint sp_weight check ( weight >= 0 );
alter table lab.package
    drop constraint if exists sp_height;
alter table lab.package
    add constraint sp_height check (height  >= 0 );
alter table lab.package
    drop constraint if exists sp_width;
alter table lab.package
    add constraint sp_width check (width  >= 0 );
alter table lab.package
    drop constraint if exists sp_length;
alter table lab.package
    add constraint sp_length check ( length >= 0 );

--courier
alter table lab.courier
    drop constraint if exists spc_passport_id;
alter table lab.courier
    add constraint spc_passport_id check ( passport_id >= 1000000000 and passport_id <= 7099999999  );
alter table lab.courier
    drop constraint if exists spc_birth_date;
alter table lab.courier
    add constraint spc_birth_date check ( birth_date >= '1900-01-01'::date AND birth_date <= current_date);

--recipient
alter table lab.recipient
    drop constraint if exists spr_passport_id;
alter table lab.recipient
    add constraint spr_passport_id check ( passport_id >= 1000000000 and passport_id <= 7099999999  );
alter table lab.recipient
    drop constraint if exists spr_birth_date;
alter table lab.recipient
    add constraint spr_birth_date check ( birth_date >= '1900-01-01'::date AND birth_date <= current_date);

--order
alter table lab.order
    drop constraint if exists sp_date_of_creating;
alter table lab.order
    add constraint sp_date_of_creating check ( date_of_creating >= '1960-01-01'::date AND date_of_creating <= current_date);

drop trigger if exists cpu_stamp on lab.courier;
drop function if exists cpu_stamp;
create function cpu_stamp() returns trigger
    language plpgsql
as
$$
DECLARE
BEGIN
        UPDATE lab.delivery_company SET couriers_count = couriers_count + 1 WHERE lab.delivery_company.id = new.delivery_company_id;
        RETURN NEW;
    END;
$$;

alter function cpu_stamp() owner to postgres;

create trigger cpu_stamp
    before insert or update
    on lab.courier
    for each row
execute procedure public.cpu_stamp();

