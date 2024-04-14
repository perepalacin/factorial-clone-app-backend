CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255),
    picture VARCHAR(255),
    incorporation DATE,
    location VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO employees (name, role, picture, incorporation, location, email)
VALUES 
    ('Mimi Ramos Garcia', 'CEO', 'https://i.insider.com/603fb765b46d720018b04963?width=700', '2017-05-12', 'Barcelona', 'lucia.ramos@business.com'),
    ('Maria Angeles Lopez', 'CTO', 'https://girlgeek.io/wp-content/uploads/2020/08/ADP-CTO-Urvashi-Tyagi.jpg', '2017-05-12', 'Barcelona', 'maria.angeles@business.com'),
    ('Carlos Roberto Angulo', 'RRHH Manager', 'https://www.equiposytalento.com/contenido/nombramientos/Jose%20Amoretti.jpg', '2021-03-21', 'Barcelona', 'carlos.roberto@business.com'),
    ('Sara Román Antunez', 'Administrative and office management', 'https://www.paralegaledu.org/wp-content/uploads/2021/11/iStock-1320185210-300x200.jpg', '2023-07-11', 'Barcelona', 'sara.roman@business.com');

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL
);

CREATE TABLE employee_teams (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    team_id INT REFERENCES teams(id),
    UNIQUE(employee_id, team_id)
);

CREATE TABLE absences (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    absence_from DATE,
    absence_to DATE,
    absence_type VARCHAR(50),
    CONSTRAINT fk_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
);

CREATE TABLE bank_holidays (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date DATE,
    location VARCHAR(255)
);

INSERT INTO bank_holidays (date, name, location)
VALUES
    ('2024-01-01', 'Año Nuevo', 'Barcelona'),
    ('2024-01-06', 'Reyes', 'Barcelona'),
    ('2024-03-29', 'Viernes Santo', 'Barcelona'),
    ('2024-04-01', 'Lunes de Pascua Florida', 'Barcelona'),
    ('2024-05-01', 'Fiesta del Trabajo', 'Barcelona'),
    ('2024-05-20', 'Lunes de Pascua Granada', 'Barcelona'),
    ('2024-06-24', 'San Juan', 'Barcelona'),
    ('2024-08-15', 'La Asunción', 'Barcelona'),
    ('2024-09-11', 'Diada Nacional de Cataluña', 'Barcelona'),
    ('2024-09-24', 'Virgen de la Merced', 'Bercelona'),
    ('2024-10-12', 'Fiesta Nacional de España', 'Barcelona'),
    ('2024-11-01', 'Todos los Santos', 'Barcelona'),
    ('2024-12-06', 'Día de la Constitución', 'Barcelona'),
    ('2024-12-25', 'Navidad', 'Barcelona'),
    ('2024-12-26', 'San Esteban', 'Barcelona');

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author INT REFERENCES employees(id),
    created_at DATE NOT NULL,
    category VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    picture VARCHAR(255),
    description TEXT
);

INSERT INTO events (title, author, created_at, category, location, picture, description)
VALUES 
  ('2024 Calendar', 6, '2023-12-28', 'Company announcements', null, null, 'Calling to all team members! Join us on January 2nd, 2024, for an important meeting where we will unveil the exciting details of our 2024 calendar. Don''t miss out on this opportunity to stay informed and prepared for the year ahead!'),
  ('Christmass special event!', 6, '2023-12-15', 'Teambuilding activity', 'Attico Terrace Barcelona', 'https://www.mercerbarcelona.com/photo/restaurantes/6/7/terrace.jpg?w=1600', 'Greetings team! Let''s celebrate the holidays together with a festive dinner at ''The Festive Feast'' restaurant on December 22nd, 2023. Come enjoy great food, laughter, and camaraderie as we toast to a successful year and look forward to the adventures ahead!'),
  ('Friday team building activity', 7, '2023-11-21', 'Teambuilding activity', 'Paris Coffee', 'https://hips.hearstapps.com/hmg-prod/images/cafeterias-barcelona-elle-1651662668.jpg?crop=1xw:1xh;center,top&resize=980:*', 'Hello everyone! We are going to celebrate that we hit our goals for 2023 in the Paris Cafeteria tonight at 20PM!');
