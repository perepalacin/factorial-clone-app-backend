CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255),
    picture VARCHAR(255),
    incorporation DATE,
    location VARCHAR(255),
    email VARCHAR(255)
);

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