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
    (1, 4), (1, 5), (1, 8),
    (2, 4), (2, 6), (2, 7), (2, 8), (2, 14),
    (3, 14), (3, 17),
    (4, 11), (4, 12), (4, 13),
    (5, 5), (5, 14), (5, 15), (5, 16), (5, 18), (5, 19),
    (6, 9), (6, 10);

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
