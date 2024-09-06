create table countries(
  id_country serial primary key,
  name varchar(50) not null
  );

create table priorities(
  id_priority serial primary key,
  type_name varchar(50) not null
  );

create table contact_request(
  id_email varchar(50) PRIMARY KEY,
  id_country INT not null,
  id_priority INT not null,
  name varchar(50),
  detail text,
  physical_address VARCHAR(100),
    FOREIGN KEY (id_country) REFERENCES countries(id_country),
    FOREIGN KEY (id_priority) REFERENCES priorities(id_priority)
);

insert into countries (id_country, name) values (1, 'USA') , (2, 'Venezuela'),(3, 'Argentina'), (4, 'Panama'), (5, 'Chile');
SELECT * FROM countries;

INSERT INTO priorities (id_priority, type_name) VALUES (1, 'Alto'), (2, 'Medio'), (3, 'Bajo');
SELECT * FROM priorities;

INSERT INTO contact_request (id_email, id_country, id_priority, name, detail, physical_address)
VALUES ('goseche@kmg.com', 1, 1, 'Gustavo Oseche', 'TI_Computer', 'Guarenas'),
       ('kgutierrez@kmg.com', 2,2, 'Kendy Gutierrez', 'Comunitty_Manager', 'Ruiz Pineda'),
       ('moseche@kmg.com', 3,3, 'Mathias Oseche', 'Data_Science', 'Calle el Kinder');

SELECT * FROM contact_request;
