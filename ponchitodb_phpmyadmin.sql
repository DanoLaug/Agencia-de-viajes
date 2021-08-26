-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2021 a las 06:55:45
-- Versión del servidor: 10.5.9-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Base de datos: `ponchitodb`

CREATE TABLE `circuitos` (
  `id_circuito` int(11) NOT NULL,
  `codigo_circuito` varchar(5) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_salida` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_salida` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_llegada` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_llegada` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `precio` float NOT NULL,
  `fecha_circuito_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `etapa_id` int(11) NOT NULL,
  `lugaravisitar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `circuitos` (`id_circuito`, `codigo_circuito`, `descripcion`, `ciudad_salida`, `pais_salida`, `ciudad_llegada`, `pais_llegada`, `duracion`, `precio`, `fecha_circuito_id`, `hotel_id`, `etapa_id`, `lugaravisitar_id`) VALUES
(1, 'A123B', 'PRUEBA', 'Monterrey', 'Mexico', 'Paris', 'Francia', 11, 99.99, 1, 1, 1, 1);

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombre_ciudad` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_ciudad` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`, `pais_ciudad`) VALUES
(1, 'Paris', 'Francia');

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `usuario` varchar(16) COLLATE latin1_spanish_ci NOT NULL,
  `correo_electronico` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `contraseña` varchar(32) COLLATE latin1_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `Reservaciones_id_reservacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `dni` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cargo` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `etapas` (
  `id_etapa` int(11) NOT NULL,
  `codigo_etapa` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `orden_etapa` int(11) DEFAULT NULL,
  `nombre_lugar` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_etapa` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_etapa` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `duracion_etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `etapas` (`id_etapa`, `codigo_etapa`, `orden_etapa`, `nombre_lugar`, `ciudad_etapa`, `pais_etapa`, `duracion_etapa`) VALUES
(1, 'A123B', 101, 'Paris', 'Paris', 'Francia', 10);

CREATE TABLE `fechascircuitos` (
  `id_fecha_circuito` int(11) NOT NULL,
  `codigo_circuito` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `cant_personas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `fechascircuitos` (`id_fecha_circuito`, `codigo_circuito`, `fecha_salida`, `cant_personas`) VALUES
(1, 'A123B', '2021-05-06', 10);

CREATE TABLE `hoteles` (
  `id_hotel` int(11) NOT NULL,
  `nombre_hotel` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_hotel` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_hotel` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_hotel` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `num_cuarto_hotel` int(11) DEFAULT NULL,
  `precio_cuarto_hotel` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio_desayuno_hotel` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `hoteles` (`id_hotel`, `nombre_hotel`, `ciudad_hotel`, `pais_hotel`, `direccion_hotel`, `num_cuarto_hotel`, `precio_cuarto_hotel`, `precio_desayuno_hotel`) VALUES
(1, ' Ibis Paris Opera La Fayette', 'Paris', 'Francia', '19, Rue Buffault, Lafayette', 101, '83', 13);

CREATE TABLE `lugaresavisitar` (
  `id_lugar_a_visitar` int(11) NOT NULL,
  `nombre_lugar` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_lugar` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pais_lugar` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_lugar` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion_lugar` varchar(1000) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio_lugar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `lugaresavisitar` (`id_lugar_a_visitar`, `nombre_lugar`, `ciudad_lugar`, `pais_lugar`, `direccion_lugar`, `descripcion_lugar`, `precio_lugar`) VALUES
(1, 'Palacio de Versalles', 'Paris', 'Francia', 'Place d\'Armes, 78000 Versailles', '(en francés: Château de Versailles) es un edificio que desempeñó las funciones de una residencia real desde 1682 hasta 1789.', 59.5);

CREATE TABLE `reservaciones` (
  `id_reservacion` int(11) NOT NULL,
  `codigo_reservacion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_cliente` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_cliente` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipo_pago` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad_id` int(11) NOT NULL,
  `circuito_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `simulaciones` (
  `id_simulacion` int(11) NOT NULL,
  `codigo_simulacion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombre_persona` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `costo_simulacion` float DEFAULT NULL,
  `ciudad_id` int(11) NOT NULL,
  `circuito_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `simulaciones` (`id_simulacion`, `codigo_simulacion`, `nombre_persona`, `fecha_salida`, `fecha_llegada`, `costo_simulacion`, `ciudad_id`, `circuito_id`) VALUES
(1, 'A123B', 'panchito', '2021-05-05', '2021-05-27', 99.99, 1, 1);

CREATE TABLE `user` (
  `username` varchar(16) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password` varchar(32) COLLATE latin1_spanish_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `user` (`username`, `email`, `password`, `create_time`) VALUES
('ponchito', 'ponchito@ponchitotravel.com', 'ponchito', '2021-05-16 04:30:58');

ALTER TABLE `circuitos`
  ADD PRIMARY KEY (`id_circuito`,`fecha_circuito_id`,`hotel_id`,`etapa_id`,`lugaravisitar_id`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo_circuito`),
  ADD KEY `fk_Circuitos_FechasCircuitos1_idx` (`fecha_circuito_id`),
  ADD KEY `fk_Circuitos_Hoteles1_idx` (`hotel_id`),
  ADD KEY `fk_Circuitos_Etapas1_idx` (`etapa_id`),
  ADD KEY `fk_Circuitos_LugaresAVisitar1_idx` (`lugaravisitar_id`);

ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`,`Reservaciones_id_reservacion`),
  ADD KEY `fk_Clientes_Reservaciones1_idx` (`Reservaciones_id_reservacion`);

ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`);

ALTER TABLE `etapas`
  ADD PRIMARY KEY (`id_etapa`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo_etapa`);

ALTER TABLE `fechascircuitos`
  ADD PRIMARY KEY (`id_fecha_circuito`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo_circuito`);

ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`id_hotel`);

ALTER TABLE `lugaresavisitar`
  ADD PRIMARY KEY (`id_lugar_a_visitar`);

ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`,`ciudad_id`,`circuito_id`),
  ADD UNIQUE KEY `codigo_reservacion_UNIQUE` (`codigo_reservacion`),
  ADD KEY `fk_Reservaciones_Ciudades1_idx` (`ciudad_id`),
  ADD KEY `fk_Reservaciones_Circuitos1_idx` (`circuito_id`);

ALTER TABLE `simulaciones`
  ADD PRIMARY KEY (`id_simulacion`,`ciudad_id`,`circuito_id`),
  ADD KEY `fk_Simulaciones_Ciudades1_idx` (`ciudad_id`),
  ADD KEY `fk_Simulaciones_Circuitos1_idx` (`circuito_id`);

ALTER TABLE `circuitos`
  MODIFY `id_circuito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `etapas`
  MODIFY `id_etapa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `fechascircuitos`
  MODIFY `id_fecha_circuito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `hoteles`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `lugaresavisitar`
  MODIFY `id_lugar_a_visitar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `simulaciones`
  MODIFY `id_simulacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `circuitos`
  ADD CONSTRAINT `fk_Circuitos_Etapas1` FOREIGN KEY (`etapa_id`) REFERENCES `etapas` (`id_etapa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Circuitos_FechasCircuitos1` FOREIGN KEY (`fecha_circuito_id`) REFERENCES `fechascircuitos` (`id_fecha_circuito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Circuitos_Hoteles1` FOREIGN KEY (`hotel_id`) REFERENCES `hoteles` (`id_hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Circuitos_LugaresAVisitar1` FOREIGN KEY (`lugaravisitar_id`) REFERENCES `lugaresavisitar` (`id_lugar_a_visitar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_Clientes_Reservaciones1` FOREIGN KEY (`Reservaciones_id_reservacion`) REFERENCES `reservaciones` (`id_reservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `reservaciones`
  ADD CONSTRAINT `fk_Reservaciones_Circuitos1` FOREIGN KEY (`circuito_id`) REFERENCES `circuitos` (`id_circuito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reservaciones_Ciudades1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `simulaciones`
  ADD CONSTRAINT `fk_Simulaciones_Circuitos1` FOREIGN KEY (`circuito_id`) REFERENCES `circuitos` (`id_circuito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Simulaciones_Ciudades1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
