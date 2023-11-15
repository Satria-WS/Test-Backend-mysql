-- CREATE tabel job
CREATE TABLE job (
    id INT PRIMARY KEY,
    jobtitle VARCHAR(255) NOT NULL
);

-- CREATE tabel job department
CREATE TABLE department (
    id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- CREATE tabel job section
CREATE TABLE section (
    id INT PRIMARY KEY,
    section_name VARCHAR(255) NOT NULL
);

-- CREATE tabel job employee with foreign key
CREATE TABLE employee (
    id INT PRIMARY KEY,
    nik VARCHAR(20) NOT NULL,
    nama VARCHAR(255) NOT NULL,
    job_id INT NOT NULL,
    umur INT,
    department_id INT,
    section_id INT,
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (section_id) REFERENCES section(id)
);

-- INSERT data ke dalam tabel job
INSERT INTO job (id, jobtitle) VALUES
(1, 'Backend Developer'),
(2, 'Frontend Developer'),
(3, 'QA Testing'),
(4, 'Business System Analyst'),
(5, 'UI/UX');

-- INSERT data ke dalam tabel department
INSERT INTO department (id, department_name) VALUES
(1, 'IT'),
(2, 'Marketing'),
(3, 'Finance');

-- INSERT data ke dalam tabel section
INSERT INTO section (id, section_name) VALUES
(1, 'Director'),
(2, 'CIO'),
(3, 'staff'),
(4, 'Manager'),
(5, 'Supervisor');


-- INSERT data ke dalam tabel employee dengan FOREIGN KEY, department, dan section
INSERT INTO employee (id, nik, nama, job_id, umur, department_id, section_id) VALUES
(1, 'N2310001', 'Asep', 1, 23, 1, 1),
(2, 'N2310002', 'Adi', 1, 29, 1, 2),
(3, 'N2310003', 'Bayu', 1, 25, 1, 3),
(4, 'N2310004', 'Cahyo', 1, 24, 1, 4),
(5, 'N2310005', 'Ayu', 2, 30, 2, NULL),
(6, 'N2310006', 'Dedy', 3, 30, 3, NULL),
(7, 'N2310007', 'Reza', 3, 24, 3, NULL),
(8, 'N2310008', 'Haryo', 3, 28, 3, NULL),
(9, 'N2310009', 'Dewa', 4, 25, 2, 1),
(10, 'N2310010', 'Diki', 5, 25, 2, 2);

-- check table for make sure
-- select * from job;
-- select * from department;
-- select * from section;
-- select * from employee;



-- no 4
SELECT 
    e.nik,
    e.nama,
    j.jobtitle AS Job_Title,
    d.department_name AS Departement,
    s.section_name AS Section
FROM 
    employee e
JOIN 
    job j ON e.job_id = j.id
JOIN 
    department d ON e.department_id = d.id
LEFT JOIN 
    section s ON e.section_id = s.id
WHERE 
    e.umur BETWEEN 24 AND 29;

































