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
    ('Sara Román Antunez', 'Administrative and office management', 'https://www.paralegaledu.org/wp-content/uploads/2021/11/iStock-1320185210-300x200.jpg', '2023-07-11', 'Barcelona', 'sara.roman@business.com'),
    ('Marcos Antonio Valls', 'Accounting Administrative Assistant', 'https://res.cloudinary.com/highereducation/images/f_auto,q_auto/g_face,c_fill,fl_lossy,q_auto:best,w_448,h_382/v1664377386/Accounting.com/accounting-clerk-career-overview_6913a070d/accounting-clerk-career-overview_6913a070d.jpg?_i=AA', '2018-11-02', 'Alicante', 'marcos.antonio@business.com'),
    ('Elizabeth Peralta Almeida', 'Senior Project Manager', 'https://www.learntek.org/blog/wp-content/uploads/2018/05/pmp2.jpg', '2023-07-21', 'Barcelona', 'elizabeth.peralta@business.com'),
    ('Luis Avila Francisco', 'Junior Project Manager', 'https://www.iapm.net/uploaded_files/_managedByElements/certified-junior-project-manager-iapm-benefits_id42957.1669040810.jpg?@600/rpo', '2023-09-12', 'Alicante', 'luis.avila@business.com'),
    ('Diego Pelaez Melero', ' Operations Manager', 'https://www.briarcliff.edu/filesimages/Current%20Chargers/Academics/Undergraduate%20Programs/Operations%20Management/operations%20management_i.jpg', '2018-01-03', 'Alicante', 'diego.pelaez@business.com'),
    ('Jorge Juan Rio', 'Junior Operations Engineer', 'https://imageio.forbes.com/specials-images/imageserve/61780cb729645ad148e64db8/Female-Quality-Engineer-and-Male-Production-Engineer-talking-at-welding-robot-in-a/960x0.jpg?height=472&width=711&fit=bounds', '2018-07-23', 'Valencia', 'jorge.juan@business.com'),
    ('Helena Guirado Días', 'Site Monitoring Engineer', 'https://wordsthatcount.org/wp-content/uploads/2022/09/WhatsApp-Image-2022-09-01-at-6.34.22-AM.jpeg', '2019-11-23', 'Alicante', 'helena.guirado@business.com'),
    ('Anna Saenz Paz', 'Systems Manager', 'https://www.kauffman.org/wp-content/uploads/2020/01/samantha_scheibe_466x600.jpg?fit=466%2C600', '2017-11-11', 'Barcelona', 'anna.saenz@business.com'),
    ('Daniel Dueñas Salgado', 'Senior Software Engineer', 'https://www.springboard.com/blog/wp-content/uploads/2023/06/how-to-become-a-senior-software-engineer-in-7-steps.jpeg', '2018-02-21', 'Alicante', 'daniel.dueñas@gmail.com'),
    ('Manel Mena Lopez', 'Lead Backend Engineer', 'https://resources.workable.com/wp-content/uploads/2017/03/shutterstock_551937484.jpg', '2019-02-11', 'Malaga', 'manel.mena@business.com'),
    ('Maria Esperanza De Miguel', 'Lead UX/UI designer', 'https://img.freepik.com/free-photo/female-web-designer-office-with-laptop_23-2149749890.jpg', '2020-09-14', 'Barcelona', 'maria.esperanza@business.com'),
    ('Jesus Rovira Vegas', 'Front End Engineer', 'https://res.cloudinary.com/cybercoders/image/upload/c_scale,g_south_east,l_cc_logo_bug_wenazs.png,w_40/v1656456343/professional_working_from_home_wearing_headphones_vwjtbq.jpg', '2019-09-14', 'Malaga', 'jesus.rovira@business.com'),
    ('Pere Palacín Pallàs', 'Full Stack Developer', 'https://media.licdn.com/dms/image/C5603AQGeGCCQdLqu5g/profile-displayphoto-shrink_800_800/0/1606578573185?e=1718841600&v=beta&t=_kWCNO4iQmuDx0H_Mq2hTkUMHlEvUORLoGySRCRaCuk', '2024-04-14', 'Barcelona', 'perepalacin@gmail.com');

ALTER TABLE employees
ADD COLUMN supervisor INT REFERENCES employees(id);


UPDATE employees
SET supervisor = CASE 
    WHEN id = 4 THEN 4
    WHEN id = 5 THEN 5
    WHEN id = 6 THEN 4
    WHEN id = 7 THEN 4
    WHEN id = 8 THEN 7
    WHEN id = 9 THEN 4
    WHEN id = 10 THEN 9
    WHEN id = 11 THEN 5
    WHEN id = 12 THEN 11
    WHEN id = 13 THEN 11
    WHEN id = 14 THEN 5
    WHEN id = 15 THEN 5
    WHEN id = 16 THEN 15
    WHEN id = 17 THEN 14
    WHEN id = 18 THEN 15
    WHEN id = 19 THEN 15
    ELSE supervisor
    END
WHERE id IN (4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19);


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL
);

INSERT INTO teams (team_name)
VALUES 
    ('Finance Team'),
    ('Business Administration Team'),
    ('Systems Team'),
    ('Operations Team'),
    ('Software Development Team'),
    ('Project Management Team');

CREATE TABLE employee_teams (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    team_id INT REFERENCES teams(id),
    UNIQUE(employee_id, team_id)
);

INSERT INTO employee_teams (team_id, employee_id)
VALUES 
    (1, 1), (1, 2), (1, 5),
    (2, 1), (2, 2), (2, 3), (2, 5), (2, 10),
    (3, 10), (3, 13),
    (4, 7), (4, 8), (4, 9),
    (5, 2), (5, 10), (5, 11), (5, 12), (5, 14), (5, 15),
    (6, 5), (6, 6);

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

CREATE TABLE absences (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    start DATE,
    finish DATE,
    employee_id INT REFERENCES employees(id)
);

INSERT INTO absences (type, "from", "to", employee_id)
VALUES 
    ('Time off', '2024-01-01', '2024-01-07', 4),
    ('Time off', '2024-01-01', '2024-01-04', 5),
    ('Time off', '2024-01-01', '2024-01-06', 8),
    ('Time off', '2024-04-12', '2024-04-15', 9),
    ('Time off', '2024-04-17', '2024-04-21', 12),
    ('Time off', '2024-04-12', '2024-04-21', 15),
    ('Overtime compensation', '2024-04-29', '2024-05-03', 6),
    ('Overtime compensation', '2024-04-17', '2024-04-21', 11),
    ('Overtime compensation', '2024-04-22', '2024-04-23', 17),
    ('Maternity leave', '2024-03-12', '2024-08-23', 9),
    ('Maternity leave', '2024-04-01', '2024-09-19', 14),
    ('Medical absence', '2024-04-03', '2024-04-04', 13),
    ('Medical absence', '2024-04-07', '2024-04-08', 7),
    ('Medical absence', '2024-04-05', '2024-04-07', 10);

CREATE TABLE shifts (
    id SERIAL PRIMARY KEY,
    day DATE,
    start TIME,
    finish TIME,
    working BOOLEAN,
    employee_id INT REFERENCES employees(id)
);

INSERT INTO shifts (day, "start", "finish", working, employee_id)
VALUES 
    ('2024-04-01', '08:55:00', '13:12:00', TRUE, 19),
    ('2024-04-01', '13:13:00', '14:01:00', FALSE, 19),
    ('2024-04-01', '14:02:00', '18:07:00', TRUE, 19);
