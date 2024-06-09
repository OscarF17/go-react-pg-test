CREATE DATABASE storetest;

CREATE USER storeadmin WITH ENCRYPTED PASSWORD '000';

GRANT ALL PRIVILEGES ON DATABASE storetest to storeadmin;

\c storetest;

CREATE TABLE clients(
  id serial PRIMARY KEY,
  name TEXT,
  phone TEXT,
  email TEXT
);

INSERT INTO clients (name, phone, email) VALUES 
  ('Prolamsa', '+52 8181 8181', 'prolamsa@email.com'),
  ('Mattel', '+52 0949 0928', 'mattel@email.com'),
  ('Heineken', '+52 9020 5728', 'heineken@email.com'),
  ('Johnson Controls', '+52 4726 2664', 'johnsoncontrols@email.com'),
  ('Viskase', '+52 0909 0909', 'viskase@email.com');

GRANT ALL ON TABLE public.clients TO storeadmin;

CREATE TYPE order_status AS ENUM ('pending', 'completed', 'cancelled');

CREATE TABLE orders(
  id serial PRIMARY KEY,
  order_date DATE NOT NULL,
  order_last_modified DATE DEFAULT NULL,
  pay_amount DECIMAL NOT NULL,
  details TEXT NOT NULL,
  status order_status NOT NULL,
  client_id INT NOT NULL,
  FOREIGN KEY(client_id) REFERENCES clients(id)
);

INSERT INTO orders (order_date, pay_amount, details, status, client_id) VALUES 
  (current_date, 88284.12, 'Piezas de refacción', 'pending', 1),
  (current_date, 904593.32, 'Refacciones para máquina', 'completed', 1),
  (current_date, 1234.5, 'Piezas de juguetes', 'cancelled', 2),
  (current_date, 8859, 'Partes para máquina', 'pending', 2),
  (current_date, 9530, 'Botellas', 'completed' , 3),
  (current_date, 9580, 'Cosas', 'cancelled', 3),
  (current_date, 48858, 'idk', 'pending' , 4),
  (current_date, 90909, 'no se', 'pending', 4),
  (current_date, 193, 'cosas', 'completed', 5),
  (current_date, 90930, 'partes', 'pending', 5);

GRANT ALL ON public.orders TO storeadmin;

CREATE TABLE users(
  id serial PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO users(username, password) VALUES
  ('Prolamsa', 'password'),
  ('Viskase', 'password'),
  ('Mattel', 'password'),
  ('Jonhson Controls', 'password'),
  ('Heineken', 'password');

INSERT INTO users(username, password, is_admin) VALUES ('lflores7', '6702', true), ('oflores', '0000', true);

GRANT ALL ON TABLE public.users TO storeadmin;
