-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2023 a las 07:43:33
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--
CREATE DATABASE IF NOT EXISTS `votacion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `votacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `comuna_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_id` (`comuna_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `candidato`:
--   `comuna_id`
--       `comuna` -> `id`
--

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`id`, `nombre`, `comuna_id`) VALUES
(4, 'Candidato 1', 1),
(5, 'Candidato 2', 2),
(6, 'Candidato 3', 3),
(7, 'Candidato 4', 4),
(8, 'Candidato 5', 5),
(9, 'Candidato 6', 6),
(10, 'Candidato 7', 7),
(11, 'Candidato 8', 8),
(12, 'Candidato 9', 9),
(13, 'Candidato 10', 10),
(14, 'Candidato 11', 11),
(15, 'Candidato 12', 12),
(16, 'Candidato 13', 13),
(17, 'Candidato 14', 14),
(18, 'Candidato 15', 15),
(19, 'Candidato 16', 16),
(20, 'Candidato 17', 17),
(21, 'Candidato 18', 18),
(22, 'Candidato 19', 19),
(23, 'Candidato 20', 20),
(24, 'Candidato 21', 21),
(25, 'Candidato 22', 22),
(26, 'Candidato 23', 23),
(27, 'Candidato 24', 24),
(28, 'Candidato 25', 25),
(29, 'Candidato 26', 26),
(30, 'Candidato 27', 27),
(31, 'Candidato 28', 28),
(32, 'Candidato 29', 29),
(33, 'Candidato 30', 30),
(34, 'Candidato 31', 31),
(35, 'Candidato 32', 32),
(36, 'Candidato 33', 33),
(37, 'Candidato 34', 34),
(38, 'Candidato 35', 35),
(39, 'Candidato 36', 36),
(40, 'Candidato 37', 37),
(41, 'Candidato 38', 38),
(42, 'Candidato 39', 39),
(43, 'Candidato 40', 40),
(44, 'Candidato 41', 41),
(45, 'Candidato 42', 42),
(46, 'Candidato 43', 43),
(47, 'Candidato 44', 44),
(48, 'Candidato 45', 45),
(49, 'Candidato 46', 46),
(50, 'Candidato 47', 47),
(51, 'Candidato 48', 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

DROP TABLE IF EXISTS `comuna`;
CREATE TABLE IF NOT EXISTS `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `id_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_FK` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `comuna`:
--   `id_region`
--       `region` -> `numero`
--

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `nombre`, `id_region`) VALUES
(1, 'Arica', 15),
(2, 'Camarones', 15),
(3, 'Putre', 15),
(4, 'Iquique', 1),
(5, 'Alto Hospicio', 1),
(6, 'Pozo Almonte', 1),
(7, 'Antofagasta', 2),
(8, 'Calama', 2),
(9, 'Tocopilla', 2),
(10, 'Copiapó', 3),
(11, 'Vallenar', 3),
(12, 'Huasco', 3),
(13, 'La Serena', 4),
(14, 'Coquimbo', 4),
(15, 'Illapel', 4),
(16, 'Valparaíso', 5),
(17, 'Viña del Mar', 5),
(18, 'Quillota', 5),
(19, 'Santiago', 13),
(20, 'Puente Alto', 13),
(21, 'Maipú', 13),
(22, 'Rancagua', 6),
(23, 'Machalí', 6),
(24, 'San Fernando', 6),
(25, 'Talca', 7),
(26, 'Curicó', 7),
(27, 'Linares', 7),
(28, 'Chillán', 16),
(29, 'Chillán Viejo', 16),
(30, 'Bulnes', 16),
(31, 'Concepción', 8),
(32, 'Talcahuano', 8),
(33, 'Los Ángeles', 8),
(34, 'Temuco', 9),
(35, 'Padre Las Casas', 9),
(36, 'Pucón', 9),
(37, 'Valdivia', 14),
(38, 'La Unión', 14),
(39, 'Futrono', 14),
(40, 'Puerto Montt', 10),
(41, 'Osorno', 10),
(42, 'Castro', 10),
(43, 'Coyhaique', 11),
(44, 'Puerto Aysén', 11),
(45, 'Chile Chico', 11),
(46, 'Punta Arenas', 12),
(47, 'Puerto Natales', 12),
(48, 'Porvenir', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `region`:
--

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`numero`, `nombre`) VALUES
(1, 'Tarapacá'),
(2, 'Antofagasta'),
(3, 'Atacama'),
(4, 'Coquimbo'),
(5, 'Valparaíso'),
(6, 'Libertador General Bernardo O\'Higgins'),
(7, 'Maule'),
(8, 'Biobío'),
(9, 'La Araucanía'),
(10, 'Los Lagos'),
(11, 'Aysén del General Carlos Ibáñez del Campo'),
(12, 'Magallanes y de la Antártica Chilena'),
(13, 'Metropolitana de Santiago'),
(14, 'Los Ríos'),
(15, 'Arica y Parinacota'),
(16, 'Ñuble');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votante`
--

DROP TABLE IF EXISTS `votante`;
CREATE TABLE IF NOT EXISTS `votante` (
  `nombre` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `comuna` varchar(50) DEFAULT NULL,
  `candidato` varchar(50) DEFAULT NULL,
  `canal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `votante`:
--

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_FK` FOREIGN KEY (`id_region`) REFERENCES `region` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
