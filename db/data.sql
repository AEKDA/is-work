INSERT INTO users (login, passwd)
VALUES ('user1', 'password1'),
       ('user2', 'password2'),
       ('user3', 'password3'),
       ('user4', 'password4'),
       ('user5', 'password5'),
       ('user6', 'password6'),
       ('user7', 'password7'),
       ('user8', 'password8'),
       ('user9', 'password9'),
       ('user10', 'password10'),
       ('user11', 'password11'),
       ('user12', 'password12');

INSERT INTO customers (user_id, email, first_name, last_name, age, weight, gender, height)
VALUES (1, 'mail@mail.com', 'fist_name1', 'last_name1', 18, 71, 'MALE', 180),
    (2, 'mail1@mail.com', 'fist_name2', 'last_name2', 19, 71, 'MALE', 180),
    (3, 'mail2@mail.com', 'fist_name3', 'last_name3', 20, 71, 'MALE', 180),
    (4, 'mail3@mail.com', 'fist_name4', 'last_name4', 21, 71, 'MALE', 180),
    (5, 'mail4@mail.com', 'fist_name5', 'last_name5', 22, 71, 'MALE', 180);


INSERT INTO clinics (name, description, user_id)
VALUES ('Клиника1', 'the best clinic', 8),
       ('Клиника2', 'the best clinic', 7);

INSERT INTO specializations (name)
VALUES ('Терапевт'),
       ('Хирург'),
       ('Дерматолог'),
       ('Стоматолог'),
       ('Офтальмолог');

INSERT INTO specializations (name)
VALUES ('Терапевт'),
       ('Хирург'),
       ('Дерматолог'),
       ('Стоматолог'),
       ('Офтальмолог');

INSERT INTO doctors (user_id, description, first_name, last_name, clinic_id)
VALUES (6, 'Опытный терапевт', 'Доктор','А', 1),
       (7, 'Квалифицированный хирург', 'Доктор',' Б', 1),
       (8, 'Специалист по дерматологии', 'Доктор',' В', 2),
       (9, 'Зубной врач', 'Доктор',' Г', 2),
       (10, 'Офтальмолог с большим стажем', 'Доктор',' Д', 1);


INSERT INTO specialization_doctor (specializations_id, doctor_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5);


INSERT INTO busy_hours (doctor_id, "start", "end")
VALUES (1, '2024-10-20 09:00:00', '2024-10-20 12:00:00'),
        (1, '2024-10-20 13:00:00', '2024-10-20 18:00:00'),
        (2, '2024-10-20 09:00:00', '2024-10-20 12:00:00'),
        (2, '2024-10-20 13:00:00', '2024-10-20 18:00:00'),
        (3, '2024-10-20 09:00:00', '2024-10-20 12:00:00'),
        (3, '2024-10-20 13:00:00', '2024-10-20 18:00:00'),
        (4, '2024-10-20 09:00:00', '2024-10-20 12:00:00'),
        (4, '2024-10-20 13:00:00', '2024-10-20 18:00:00'),
        (5, '2024-10-20 09:00:00', '2024-10-20 12:00:00'),
        (5, '2024-10-20 13:00:00', '2024-10-20 18:00:00');

INSERT INTO timetable (doctor_id, customer_id, "start", "end")
VALUES (1, 1, '2024-10-20 09:00:00', '2024-10-20 09:30:00'),
       (2, 2, '2024-10-20 10:00:00', '2024-10-20 10:30:00'),
       (3, 3, '2024-10-20 11:00:00', '2024-10-20 11:30:00'),
       (4, 4, '2024-10-20 14:00:00', '2024-10-20 14:30:00'),
       (4, 5, '2024-10-20 15:00:00', '2024-10-20 15:30:00');


INSERT INTO request (clinic_id, customer_id, doctor_id, "start", "end")
VALUES (1, 1, 1, '2024-10-20 09:00:00', '2024-10-20 10:00:00'),
       (1, 2, 2, '2024-10-20 10:00:00', '2024-10-20 11:00:00'),
       (2, 3, 3, '2024-10-20 11:00:00', '2024-10-20 12:00:00'),
       (2, 4, 4, '2024-10-20 14:00:00', '2024-10-20 15:00:00'),
       (1, 5, 5, '2024-10-20 15:00:00', '2024-10-20 16:00:00');

INSERT INTO analysis (name, max_value, min_value, unit)
VALUES ('Глюкоза', '6.0', '3.3', 'mmol/L'),
       ('Холестерин', '5.2', '3.0', 'mmol/L'),
       ('Креатинин', '110', '60', 'µmol/L'),
       ('Мочевина', '7.0', '2.5', 'mmol/L'),
       ('Лейкоциты', '10.0', '4.0', 'x10^9/L');

INSERT INTO user_analysis (analysis_id, value, creation_date)
VALUES (1, '5.5', '2024-10-01 10:00:00'),
       (2, '4.5', '2024-10-01 11:00:00'),
       (3, '80', '2024-10-01 12:00:00'),
       (4, '5.0', '2024-10-01 13:00:00'),
       (5, '6.0', '2024-10-01 14:00:00'),
       (1, '4.0', '2024-10-02 10:00:00'),
       (2, '5.0', '2024-10-02 11:00:00'),
       (3, '70', '2024-10-02 12:00:00'),
       (4, '6.0', '2024-10-02 13:00:00'),
       (5, '7.0', '2024-10-02 14:00:00');
