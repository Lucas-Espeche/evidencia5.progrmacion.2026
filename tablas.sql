-- Tablas para el sistema Odontokinesis

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(25),
    email VARCHAR(100)
);

CREATE TABLE profesional (
    id_profesional INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE turno (
    id_turno INT PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('Pendiente', 'Confirmado', 'Cancelado', 'Atendido')),
    paciente_id INT NOT NULL,
    profesional_id INT NOT NULL,
    CONSTRAINT fk_turno_paciente FOREIGN KEY (paciente_id) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_turno_profesional FOREIGN KEY (profesional_id) REFERENCES profesional(id_profesional)
);

-- Datos de prueba

INSERT INTO paciente VALUES
(1, 'Juan', 'Pérez', '35123456', '3514112233', 'juan@email.com'),
(2, 'María', 'Gómez', '38987654', '3515223344', 'maria@email.com'),
(3, 'Carlos', 'López', '32111222', '3516334455', 'carlos@email.com'),
(4, 'Ana', 'Martínez', '40555666', '3517445566', 'ana@email.com'),
(5, 'Lucía', 'Rodríguez', '37444333', '3518556677', 'lucia@email.com'),
(6, 'Mateo', 'Fernández', '39222111', '3519667788', 'mateo@email.com'),
(7, 'Sofía', 'Díaz', '41777888', '3511778899', 'sofia@email.com'),
(8, 'Joaquín', 'Álvarez', '36333444', '3512889900', 'joaquin@email.com'),
(9, 'Valentina', 'Romero', '42888999', '3513990011', 'valentina@email.com'),
(10, 'Lucas', 'Giménez', '34000111', '3514001122', 'lucas@email.com');

INSERT INTO profesional VALUES
(1, 'Esteban', 'Quito', 'MP1234', 'Ortodoncia'),
(2, 'Mariana', 'Benítez', 'MP5678', 'Endodoncia'),
(3, 'Roberto', 'Sánchez', 'MP9012', 'Odontopediatría'),
(4, 'Clara', 'Mendoza', 'MP3456', 'Periodoncia'),
(5, 'Gabriel', 'Navarro', 'MP7890', 'Cirugía Maxilofacial'),
(6, 'Daniela', 'Acosta', 'MP2345', 'Implantología'),
(7, 'Julián', 'Paz', 'MP6789', 'Odontología General'),
(8, 'Florencia', 'Medina', 'MP4321', 'Estética Dental'),
(9, 'Hernán', 'Castillo', 'MP8765', 'Ortodoncia'),
(10, 'Camila', 'Rivas', 'MP1122', 'Endodoncia');

INSERT INTO turno VALUES
(1, '2026-06-01 09:00:00', 'Confirmado', 1, 1),
(2, '2026-06-01 10:00:00', 'Pendiente', 2, 2),
(3, '2026-06-02 11:30:00', 'Atendido', 3, 3),
(4, '2026-06-03 14:00:00', 'Cancelado', 4, 4),
(5, '2026-06-04 15:30:00', 'Confirmado', 5, 5),
(6, '2026-06-05 08:30:00', 'Pendiente', 6, 6),
(7, '2026-06-06 09:15:00', 'Confirmado', 7, 7),
(8, '2026-06-08 16:00:00', 'Atendido', 8, 8),
(9, '2026-06-09 11:00:00', 'Pendiente', 9, 9),
(10, '2026-06-10 17:15:00', 'Confirmado', 10, 10);
