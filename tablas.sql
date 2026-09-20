-- Creación de la tabla Paciente
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

-- Creación de la tabla Profesional
CREATE TABLE profesional (
    id_profesional SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

-- Creación de la tabla Turno (con Claves Foráneas y restricciones CHECK)
CREATE TABLE turno (
    id_turno SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL,
    profesional_id INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    estado VARCHAR(20) CHECK (estado IN ('Pendiente', 'Confirmado', 'Cancelado')) NOT NULL,
    CONSTRAINT fk_paciente FOREIGN KEY (paciente_id) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_profesional FOREIGN KEY (profesional_id) REFERENCES profesional(id_profesional)
);

-- Inserción de datos de prueba
INSERT INTO paciente (nombre, apellido, dni, telefono) VALUES 
('Juan', 'Pérez', '12345678', '3511234567'),
('María', 'Gómez', '87654321', '3519876543');

INSERT INTO profesional (nombre, apellido, matricula, especialidad) VALUES 
('Carlos', 'López', 'MP1234', 'Ortodoncia'),
('Ana', 'Torres', 'MP5678', 'Odontología General');

INSERT INTO turno (paciente_id, profesional_id, fecha_hora, estado) VALUES 
(1, 1, '2026-06-10 10:30:00', 'Confirmado'),
(2, 2, '2026-06-11 15:00:00', 'Pendiente');
