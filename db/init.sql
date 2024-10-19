create table users (
    id serial PRIMARY KEY,
    login TEXT not null UNIQUE,
    passwd TEXT not null
);

CREATE Table customer (
    id serial PRIMARY KEY,
    user_id INTEGER not null unique REFERENCES users,
    email text not null unique,
    first_name text not null,
    last_name text not null,
    age integer not null check (age > 0),
    weight INTEGER not null check (weight > 0),
    gender text not null check (gender in ('MALE', 'FEMALE')),
    height INTEGER not null check (height > 0)
);

CREATE TABLE analysis (
    id serial PRIMARY KEY,
    name text not null UNIQUE,
    max_value text not NULl,
    min_value text not NULl,
    unit text not null
);

CREATE TABLE user_analysis (
    id serial PRIMARY KEY,
    analysis_id INTEGER not null REFERENCES analysis,
    value text not NULl,
    creation_date timestamp not null DEFAULT now()
);

create table clinics (
    id serial PRIMARY KEY,
    name text not null,
    description text,
    user_id INTEGER not null unique REFERENCES users
);

create table posts (
    id serial PRIMARY KEY,
    name text
);

create table specializations (
    id serial PRIMARY KEY,
    name text
);

create table doctor (
    id serial primary key,
    user_id integer not null REFERENCES users,
    description text,
    name text,
    clinic_id int not null REFERENCES clinics, 
    post text REFERENCES posts
);

create table specialization_doctor (
    id_specializations int REFERENCES specializations,
    id_doctor int REFERENCES doctor,
    PRIMARY KEY(id_doctor,id_specializations)
);

create table busy_hours (
    doctor_id int REFERENCES doctors,
    start TIMESTAMP not null,
    end TIMESTAMP not null,
    check (start < end)
);

create table timetable (
    doctor_id int REFERENCES doctors,
    customer_id int REFERENCES customers,
    start TIMESTAMP not null,
    end TIMESTAMP not null,
    check (start < end)
);

create table request (
    id serial PRIMARY KEY,
    clinic_id int REFERENCES clinics,
    customer_id int REFERENCES customers,
    doctor_id int REFERENCES doctors
    start TIMESTAMP not null,
    end TIMESTAMP not null, 
    CHECK (start < end),
    CHECK (EXTRACT(EPOCH FROM end - start) > 3600)
);
