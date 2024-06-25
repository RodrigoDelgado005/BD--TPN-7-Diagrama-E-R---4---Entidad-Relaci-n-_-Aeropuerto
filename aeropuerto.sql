-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 03:31:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos_destino`
--

CREATE TABLE `aeropuertos_destino` (
  `id_aeropuerto_destino` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `llegada_vuelo` datetime NOT NULL,
  `puerta_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos_origen`
--

CREATE TABLE `aeropuertos_origen` (
  `id_aeropuerto_origen` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `salida_vuelo` datetime NOT NULL,
  `puerta_origen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

CREATE TABLE `companias` (
  `id_compania` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `edad` int(11) NOT NULL,
  `numero_asiento` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_aviones`
--

CREATE TABLE `tipo_aviones` (
  `id_tipo_avion` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `id_pasajero` int(11) NOT NULL,
  `id_compania` int(11) NOT NULL,
  `id_tipo_avion` int(11) NOT NULL,
  `id_aeropuerto_origen` int(11) NOT NULL,
  `id_aeropuerto_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeropuertos_destino`
--
ALTER TABLE `aeropuertos_destino`
  ADD PRIMARY KEY (`id_aeropuerto_destino`),
  ADD KEY `aeropuertos_destino_id_ciudad_ciudades_id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `aeropuertos_origen`
--
ALTER TABLE `aeropuertos_origen`
  ADD PRIMARY KEY (`id_aeropuerto_origen`),
  ADD KEY `aeropuertos_origen_id_ciudad_ciudades_id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `companias`
--
ALTER TABLE `companias`
  ADD PRIMARY KEY (`id_compania`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajero`);

--
-- Indices de la tabla `tipo_aviones`
--
ALTER TABLE `tipo_aviones`
  ADD PRIMARY KEY (`id_tipo_avion`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD KEY `vuelos_id_pasajero_pasajeros_id_pasajero` (`id_pasajero`),
  ADD KEY `vuelos_id_compania_companias_id_compania` (`id_compania`),
  ADD KEY `vuelos_id_tipo_avion_tipo_aviones_id_tipo_avion` (`id_tipo_avion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeropuertos_destino`
--
ALTER TABLE `aeropuertos_destino`
  ADD CONSTRAINT `aeropuertos_destino_id_ciudad_ciudades_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `aeropuertos_origen`
--
ALTER TABLE `aeropuertos_origen`
  ADD CONSTRAINT `aeropuertos_origen_id_ciudad_ciudades_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_id_compania_companias_id_compania` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id_compania`),
  ADD CONSTRAINT `vuelos_id_pasajero_pasajeros_id_pasajero` FOREIGN KEY (`id_pasajero`) REFERENCES `pasajeros` (`id_pasajero`),
  ADD CONSTRAINT `vuelos_id_tipo_avion_tipo_aviones_id_tipo_avion` FOREIGN KEY (`id_tipo_avion`) REFERENCES `tipo_aviones` (`id_tipo_avion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
