-- Active: 1695848398724@@127.0.0.1@5433@is_work
create table users (
    id serial PRIMARY KEY,
    login TEXT not null UNIQUE,
    passwd TEXT not null
);

CREATE Table customers (
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


create table specializations (
    id serial PRIMARY KEY,
    name text
);

create table doctors (
    id serial primary key,
    user_id integer not null REFERENCES users,
    description text,
    first_name text,
    last_name text,
    clinic_id int not null REFERENCES clinics
);

create table specialization_doctor (
    specializations_id int REFERENCES specializations,
    doctor_id int REFERENCES doctors,
    PRIMARY KEY(specializations_id,doctor_id)
);

create table busy_hours (
    doctor_id int REFERENCES doctors,
    "start" TIMESTAMP not null,
    "end" TIMESTAMP not null,
    check ("start" < "end")
);

create table timetable (
    doctor_id int REFERENCES doctors,
    customer_id int REFERENCES customers,
    "start" TIMESTAMP not null,
    "end" TIMESTAMP not null,
    check ("start" < "end")
);

create table request (
    id serial PRIMARY KEY,
    clinic_id int REFERENCES clinics,
    customer_id int REFERENCES customers,
    doctor_id int REFERENCES doctors,
    "start" TIMESTAMP not null,
    "end" TIMESTAMP not null, 
    CHECK ("start" < "end"),
    CHECK (EXTRACT(EPOCH FROM "end" - "start") >= 3600)
);

create table chats(
    id SERIAL PRIMARY KEY,
    customer_id int not null REFERENCES customers,
    clinic_id int not null REFERENCES clinics,
    doctor_id int REFERENCES doctors
);

create table messages(
    id SERIAL PRIMARY KEY,
    message text not null,
    chat_id int not null REFERENCES chats
);