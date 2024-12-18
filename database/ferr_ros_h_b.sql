-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2024 a las 03:36:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferr_ros_h`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `est`) VALUES
(1, 'Huancan', 'H'),
(2, 'Huancayo', 'H'),
(3, 'Chilca', 'H'),
(4, 'El Tambo', 'H'),
(5, 'SAPALLANGA', 'H'),
(6, 'PUCARA', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(255) NOT NULL,
  `id_ciudad` int(255) NOT NULL,
  `id_tipodoc` int(50) NOT NULL,
  `numdoc` varchar(20) NOT NULL,
  `nombrecom` varchar(255) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `numcel` char(12) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `id_ciudad`, `id_tipodoc`, `numdoc`, `nombrecom`, `direccion`, `numcel`, `est`) VALUES
(1, 1, 1, '89547621', 'Aquiles Esquivel Madraso', 'Jr. Amazonas N° 1245', '987654321', 'H'),
(2, 3, 2, '1047483670', 'Victor Max Poma Canchari', 'Calle Real N° 200', '978318283', 'H'),
(3, 4, 2, '1021243750', 'Alejandro Toledo Manrrique', 'Jr. José Galvez 840', '975846135', 'H'),
(4, 2, 1, '74581235', 'Alberto Fujimori fujirata', 'Gladeolos 451', '965821423', 'H'),
(5, 3, 2, '22222222', '2222 2222 2222 2222', 'calle 222 2222', '922222222', 'D'),
(6, 4, 1, '12', '12', '12', '12', 'D'),
(7, 4, 1, '66666666', '66666666', '66666666', '966666666', 'D'),
(8, 4, 1, '66666666', '66666666', '66666666', '966666666', 'D'),
(9, 4, 2, '88', '88', '88', '88', 'D'),
(10, 4, 2, '5', '5', '5', '5', 'D'),
(11, 4, 2, '11', '11', '11', '11', 'D'),
(12, 4, 2, '12', '12', '12', '12', 'D'),
(13, 4, 2, '1313', '1313', '1313', '1313', 'D'),
(14, 2, 1, '54215786', 'Marco Antonio Solis', 'Mexico s/n', '987654321', 'H'),
(15, 4, 2, '123456', 'juju', 'juju', '123456', 'D'),
(16, 4, 1, '29292929', 'bbbb', 'bbbb', '29292929', 'H'),
(17, 1, 2, '1025478540', 'Alejandro Perez SA.C', 'Av. Panamericana Sur 1387', '987654321', 'H'),
(18, 2, 2, '102457840', 'decoraciones Ramos Caceres SAC', 'Las begonias s/n la rivera', '912345678', 'H'),
(19, 4, 2, '123', 'prueba', 'prueba', '123', 'H'),
(20, 1, 2, '2147483647', '123', '123', '123', 'H'),
(21, 1, 2, '12345678910', 'qwe', 'qwe ', '987654321', 'H'),
(22, 1, 2, '12345678910123', 'qwe', 'qwe ', '123456789', 'H'),
(23, 2, 2, '12457896542', 'Computronic E.I.R.L', 'Av. Giraldez 250', '955556212', 'H'),
(24, 3, 2, '1024578621', 'El cazador polleria E.I.R.L', 'Av Real 205', '987654321', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuaderno`
--

CREATE TABLE `cuaderno` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `id_cliente` int(255) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `total` float(200,2) NOT NULL,
  `situacion` varchar(50) DEFAULT NULL,
  `importe` float(100,2) DEFAULT NULL,
  `resto` float(100,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fecha_sal` date DEFAULT NULL,
  `hora_sal` time DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuaderno`
--

INSERT INTO `cuaderno` (`id`, `id_tienda`, `id_usuario`, `id_cliente`, `descripcion`, `total`, `situacion`, `importe`, `resto`, `fecha`, `hora`, `fecha_sal`, `hora_sal`, `estado`, `est`) VALUES
(6, 1, 1, 15, 'N/A', 9356.70, 'CANCELADO', 0.00, 0.00, '2024-11-12', '03:35:03', NULL, NULL, 'ANULADO', 'D'),
(7, 1, 1, 14, 'N/A', 1203.40, 'CANCELADO', 0.00, 0.00, '2024-11-12', '03:37:10', '2024-11-14', '16:47:25', 'ENTREGADO', 'H'),
(8, 1, 1, 4, 'N/A', 28.80, 'CANCELADO', 0.00, 0.00, '2024-11-12', '04:24:29', '2024-11-14', '16:50:03', 'ENTREGADO', 'H'),
(9, 1, 1, 3, 'N/A', 60.91, 'CANCELADO', 0.00, 0.00, '2024-11-12', '04:30:47', '2024-11-15', '23:40:26', 'ENTREGADO', 'H'),
(10, 1, 1, 3, 'Recogerá el pedido dentro de 2 meses.', 6831.56, 'CANCELADO', 0.00, 0.00, '2024-11-12', '04:45:12', NULL, NULL, 'VENDIDO', 'H'),
(11, 1, 1, 1, 'n/a', 0.70, 'CANCELADO', 0.00, 0.00, '2024-11-12', '23:52:27', NULL, NULL, 'VENDIDO', 'H'),
(12, 1, 1, 1, 'n/a', 28.80, 'CANCELADO', 0.00, 0.00, '2024-11-13', '00:11:15', NULL, NULL, 'VENDIDO', 'H'),
(13, 1, 1, 4, 'N/A', 5032.80, 'CANCELADO', 0.00, 0.00, '2024-11-13', '01:05:07', NULL, NULL, 'VENDIDO', 'H'),
(14, 1, 1, 1, 'N/A', 4979.00, 'CANCELADO', 0.00, 0.00, '2024-11-13', '02:03:16', NULL, NULL, 'ANULADO', 'D'),
(15, 1, 1, 16, 'dime', 56.09, 'CANCELADO', 0.00, 0.00, '2024-11-13', '03:52:42', NULL, NULL, 'ANULADO', 'D'),
(16, 1, 1, 2, 'N/A', 0.70, 'CANCELADO', 0.00, 0.00, '2024-11-13', '03:53:09', NULL, NULL, 'VENDIDO', 'H'),
(17, 1, 1, 17, 'Se entregara los productos dentro de 1 mes.', 5410.00, 'CANCELADO', 0.00, 0.00, '2024-11-13', '05:19:20', NULL, NULL, 'VENDIDO', 'H'),
(18, 1, 1, 3, 'Se entregará esta venta el 06 - 12 - 24', 93.13, 'CANCELADO', 0.00, 0.00, '2024-11-13', '18:28:02', NULL, NULL, 'VENDIDO', 'H'),
(19, 1, 1, 18, '', 8509.20, 'CANCELADO', 0.00, 0.00, '2024-11-14', '22:54:24', '2024-11-15', '00:00:51', 'ENTREGADO', 'H'),
(20, 1, 1, 18, '', 2.40, 'CANCELADO', 0.00, 0.00, '2024-11-15', '22:41:20', NULL, NULL, 'ANULADO', 'D'),
(21, 1, 1, 18, '', 2.40, 'CANCELADO', 0.00, 0.00, '2024-11-15', '22:41:59', NULL, NULL, 'ANULADO', 'D'),
(22, 1, 1, 17, 'Se entregara este producto dentro de 2 meses.', 8020.00, 'CANCELADO', 0.00, 0.00, '2024-11-15', '23:12:47', '2024-11-15', '23:40:59', 'ENTREGADO', 'H'),
(23, 1, 1, 1, 'entrega en 1 semana', 118.00, 'CANCELADO', 0.00, 0.00, '2024-11-15', '23:44:02', '2024-11-15', '23:44:26', 'ENTREGADO', 'H'),
(24, 1, 1, 17, 'Se entregara en 1 semana', 5160.00, 'CANCELADO', 0.00, 0.00, '2024-11-16', '00:03:11', '2024-11-16', '00:03:33', 'ENTREGADO', 'H'),
(25, 1, 1, 17, 'Ninguna.', 7860.00, 'CANCELADO', 0.00, 0.00, '2024-11-16', '00:16:57', '2024-11-16', '00:17:40', 'ENTREGADO', 'H'),
(26, 1, 2, 2, '', 92.84, 'CANCELADO', 0.00, 0.00, '2024-11-17', '14:29:54', '2024-11-17', '14:30:14', 'ENTREGADO', 'H'),
(27, 1, 2, 1, 's/n', 110.00, 'CANCELADO', 0.00, 0.00, '2024-11-17', '14:36:00', '2024-11-17', '14:36:05', 'ENTREGADO', 'H'),
(28, 1, 2, 18, 's/n', 5441.48, 'CANCELADO', 0.00, 0.00, '2024-11-17', '14:56:14', '2024-11-17', '14:56:30', 'ENTREGADO', 'H'),
(29, 1, 2, 4, '', 214.03, 'CANCELADO', 0.00, 0.00, '2024-11-18', '01:18:27', NULL, NULL, 'VENDIDO', 'H'),
(30, 1, 1, 22, '', 1.60, 'CANCELADO', 0.00, 0.00, '2024-11-18', '20:02:22', NULL, NULL, 'VENDIDO', 'H'),
(31, 1, 1, 14, 'nn', 1773.80, 'CANCELADO', 0.00, 0.00, '2024-11-19', '01:13:43', '2024-11-19', '01:13:57', 'ENTREGADO', 'H'),
(32, 1, 1, 2, 'Se entrega en 1 mes', 4390.00, 'CANCELADO', 0.00, 0.00, '2024-11-19', '01:21:32', '2024-11-19', '01:22:01', 'ENTREGADO', 'H'),
(33, 1, 2, 2, 'n/a', 349.96, 'CANCELADO', 349.96, 0.00, '2024-11-19', '23:53:14', NULL, NULL, 'VENDIDO', 'H'),
(34, 1, 2, 17, 'n/a', 176.68, 'CANCELADO', 176.68, 0.00, '2024-11-20', '00:02:16', NULL, NULL, 'VENDIDO', 'H'),
(35, 1, 2, 23, 'N/A', 34.30, 'CANCELADO', 34.30, 0.00, '2024-11-20', '00:47:14', NULL, NULL, 'VENDIDO', 'H'),
(36, 1, 1, 24, 'N/A', 5293.80, 'CANCELADO', 5293.80, 0.00, '2024-11-20', '15:37:00', '2024-11-20', '15:39:17', 'ENTREGADO', 'H'),
(37, 1, 1, 24, 'N/A', 6089.60, 'POR COBRAR', 0.00, 6089.60, '2024-11-20', '15:38:22', '2024-11-20', '15:38:29', 'ENTREGADO', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id` int(255) NOT NULL,
  `porcentaje` float(100,2) DEFAULT NULL,
  `est` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id`, `porcentaje`, `est`) VALUES
(1, 0.05, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id`, `nombre`, `est`) VALUES
(1, 'Acero', 'H'),
(2, 'INSTALACIONES SANITARIAS', 'H'),
(3, 'HERRAMIENTAS', 'H'),
(4, 'SOLDADURA', 'H'),
(5, 'INSUMOS DE LIMPIEZA', 'H'),
(6, 'INSTALACIONES ELECTRICAS', 'H'),
(7, 'PINTURAS', 'H'),
(8, 'CEMENTO', 'H'),
(9, 'HERRAMIENTAS', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`id`, `nombre`, `est`) VALUES
(1, 'FIERRO', 'H'),
(2, 'TUBOS', 'H'),
(3, 'ALAMBRE', 'H'),
(4, 'ACCESORIOS', 'H'),
(5, '', 'D'),
(6, '', 'D'),
(7, '', 'D'),
(8, 'MANUALES', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `est`) VALUES
(1, 'SIDERPERÚ', 'H'),
(2, 'DEACERO FIERRO MACHO', 'H'),
(3, 'PAVCO', 'H'),
(4, 'NICOLL', 'H'),
(5, 'PRODAC', 'H'),
(6, 'PCP', 'H'),
(7, 'APU', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `id` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `tipocam` float(100,2) DEFAULT NULL,
  `toneladab` float(100,2) DEFAULT NULL,
  `toneladaf` float(100,2) DEFAULT NULL,
  `toneladac` float(100,2) DEFAULT NULL,
  `preciob` float(100,2) DEFAULT NULL,
  `preciof` float(100,2) DEFAULT NULL,
  `precioc` float(100,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precio`
--

INSERT INTO `precio` (`id`, `id_producto`, `tipocam`, `toneladab`, `toneladaf`, `toneladac`, `preciob`, `preciof`, `precioc`, `fecha`, `est`) VALUES
(2, 2, 3.76, 1225.00, 1215.00, 1210.00, 22.14, 21.96, 21.87, '2024-10-27', 'H'),
(3, 3, 3.76, 1225.00, 1215.00, 1210.00, 61.41, 60.91, 60.66, '2024-10-27', 'H'),
(4, 4, 3.76, 1225.00, 1215.00, 1210.00, 39.71, 39.38, 39.22, '2024-10-27', 'H'),
(5, 5, 3.77, 1120.00, 1100.00, 1100.00, 82.79, 81.31, 81.31, '2024-10-28', 'H'),
(6, 6, 3.77, 1120.00, 1100.00, 1100.00, 20.30, 19.94, 19.94, '2024-10-28', 'H'),
(7, 7, 3.77, 1120.00, 1100.00, 1100.00, 56.30, 55.29, 55.29, '2024-10-28', 'H'),
(8, 8, 3.77, 1120.00, 1100.00, 1100.00, 36.40, 35.75, 35.75, '2024-10-28', 'H'),
(17, 1, 3.75, 1225.00, 1215.00, 1210.00, 90.07, 89.34, 88.97, '2024-10-29', 'H'),
(18, 2, 3.75, 1225.00, 1215.00, 1210.00, 22.09, 21.91, 21.81, '2024-10-29', 'H'),
(19, 3, 3.75, 1225.00, 1215.00, 1210.00, 61.25, 60.75, 60.50, '2024-10-29', 'H'),
(20, 4, 3.75, 1225.00, 1215.00, 1210.00, 39.60, 39.28, 39.12, '2024-10-29', 'H'),
(25, 5, 3.79, 1120.00, 1100.00, 1100.00, 83.23, 81.75, 81.75, '2024-10-29', 'H'),
(26, 6, 3.79, 1120.00, 1100.00, 1100.00, 20.41, 20.04, 20.04, '2024-10-29', 'H'),
(27, 7, 3.79, 1120.00, 1100.00, 1100.00, 56.60, 55.59, 55.59, '2024-10-29', 'H'),
(28, 8, 3.79, 1120.00, 1100.00, 1100.00, 36.59, 35.94, 35.94, '2024-10-29', 'H'),
(29, 1, 3.79, 1225.00, 1215.00, 1210.00, 91.03, 90.29, 89.92, '2024-10-29', 'H'),
(30, 2, 3.79, 1225.00, 1215.00, 1210.00, 22.32, 22.14, 22.05, '2024-10-29', 'H'),
(31, 3, 3.79, 1225.00, 1215.00, 1210.00, 61.90, 61.40, 61.15, '2024-10-29', 'H'),
(32, 4, 3.79, 1225.00, 1215.00, 1210.00, 40.02, 39.70, 39.53, '2024-10-29', 'H'),
(41, 1, 3.77, 1225.00, 1215.00, 1210.00, 90.55, 89.81, 89.45, '2024-10-30', 'H'),
(42, 2, 3.77, 1225.00, 1215.00, 1210.00, 22.20, 22.02, 21.93, '2024-10-30', 'H'),
(43, 3, 3.77, 1225.00, 1215.00, 1210.00, 61.58, 61.07, 60.82, '2024-10-30', 'H'),
(44, 4, 3.77, 1225.00, 1215.00, 1210.00, 39.81, 39.49, 39.33, '2024-10-30', 'H'),
(45, 5, 3.78, 1120.00, 1100.00, 1100.00, 83.01, 81.53, 81.53, '2024-10-30', 'H'),
(46, 6, 3.78, 1120.00, 1100.00, 1100.00, 20.35, 19.99, 19.99, '2024-10-30', 'H'),
(47, 7, 3.78, 1120.00, 1100.00, 1100.00, 56.45, 55.44, 55.44, '2024-10-30', 'H'),
(48, 8, 3.78, 1120.00, 1100.00, 1100.00, 36.50, 35.84, 35.84, '2024-10-30', 'H'),
(49, 9, 1.20, 12.00, 12.00, 12.00, 28.80, 28.80, 28.80, '2024-10-30', 'H'),
(50, 10, 1.20, 12.00, 12.00, 12.00, 28.80, 28.80, 28.80, '2024-10-30', 'H'),
(51, 11, 1.20, 12.00, 12.00, 12.00, 28.80, 28.80, 28.80, '2024-10-30', 'H'),
(52, 12, 1.10, 11.00, 11.00, 11.00, 24.20, 24.20, 24.20, '2024-10-30', 'H'),
(53, 13, 1.10, 11.00, 11.00, 11.00, 24.20, 24.20, 24.20, '2024-10-30', 'H'),
(54, 14, 1.10, 11.00, 11.00, 11.00, 24.20, 24.20, 24.20, '2024-10-30', 'H'),
(78, 1, 3.77, 1225.00, 1215.00, 1210.00, 90.55, 89.81, 89.45, '2024-11-05', 'H'),
(79, 2, 3.77, 1225.00, 1215.00, 1210.00, 22.20, 22.02, 21.93, '2024-11-05', 'H'),
(80, 3, 3.77, 1225.00, 1215.00, 1210.00, 61.58, 61.07, 60.82, '2024-11-05', 'H'),
(81, 4, 3.77, 1225.00, 1215.00, 1210.00, 39.81, 39.49, 39.33, '2024-11-05', 'H'),
(82, 5, 3.78, 1120.00, 1100.00, 1100.00, 83.01, 81.53, 81.53, '2024-11-05', 'H'),
(83, 6, 3.78, 1120.00, 1100.00, 1100.00, 20.35, 19.99, 19.99, '2024-11-05', 'H'),
(84, 7, 3.78, 1120.00, 1100.00, 1100.00, 56.45, 55.44, 55.44, '2024-11-05', 'H'),
(85, 8, 3.78, 1120.00, 1100.00, 1100.00, 36.50, 35.84, 35.84, '2024-11-05', 'H'),
(106, 5, 3.78, 1120.00, 1100.00, 1100.00, 83.01, 81.53, 81.53, '2024-11-06', 'H'),
(107, 6, 3.78, 1120.00, 1100.00, 1100.00, 20.35, 19.99, 19.99, '2024-11-06', 'H'),
(108, 7, 3.78, 1120.00, 1100.00, 1100.00, 56.45, 55.44, 55.44, '2024-11-06', 'H'),
(109, 8, 3.78, 1120.00, 1100.00, 1100.00, 36.50, 35.84, 35.84, '2024-11-06', 'H'),
(110, 1, 3.77, 1225.00, 1215.00, 1210.00, 90.55, 89.81, 89.45, '2024-11-06', 'H'),
(111, 2, 3.77, 1225.00, 1215.00, 1210.00, 22.20, 22.02, 21.93, '2024-11-06', 'H'),
(112, 3, 3.77, 1225.00, 1215.00, 1210.00, 61.58, 61.07, 60.82, '2024-11-06', 'H'),
(113, 4, 3.77, 1225.00, 1215.00, 1210.00, 39.81, 39.49, 39.33, '2024-11-06', 'H'),
(114, 1, 3.76, 1225.00, 1215.00, 1210.00, 90.31, 89.58, 89.21, '2024-11-08', 'H'),
(115, 2, 3.76, 1225.00, 1215.00, 1210.00, 22.14, 21.96, 21.87, '2024-11-08', 'H'),
(116, 3, 3.76, 1225.00, 1215.00, 1210.00, 61.41, 60.91, 60.66, '2024-11-08', 'H'),
(117, 4, 3.76, 1225.00, 1215.00, 1210.00, 39.71, 39.38, 39.22, '2024-11-08', 'H'),
(118, 5, 3.77, 1120.00, 1100.00, 1100.00, 82.79, 81.31, 81.31, '2024-11-08', 'H'),
(119, 6, 3.77, 1120.00, 1100.00, 1100.00, 20.30, 19.94, 19.94, '2024-11-08', 'H'),
(120, 7, 3.77, 1120.00, 1100.00, 1100.00, 56.30, 55.29, 55.29, '2024-11-08', 'H'),
(121, 8, 3.77, 1120.00, 1100.00, 1100.00, 36.40, 35.75, 35.75, '2024-11-08', 'H'),
(131, 1, 3.80, 1225.00, 1215.00, 1210.00, 91.25, 90.51, 90.13, '2024-11-15', 'H'),
(132, 2, 3.80, 1225.00, 1215.00, 1210.00, 22.37, 22.19, 22.10, '2024-11-15', 'H'),
(133, 3, 3.80, 1225.00, 1215.00, 1210.00, 62.05, 61.54, 61.29, '2024-11-15', 'H'),
(134, 4, 3.80, 1225.00, 1215.00, 1210.00, 40.12, 39.79, 39.63, '2024-11-15', 'H'),
(135, 1, 3.80, 1225.00, 1215.00, 1210.00, 91.25, 90.51, 90.13, '2024-11-18', 'H'),
(136, 2, 3.80, 1225.00, 1215.00, 1210.00, 22.37, 22.19, 22.10, '2024-11-18', 'H'),
(137, 3, 3.80, 1225.00, 1215.00, 1210.00, 62.05, 61.54, 61.29, '2024-11-18', 'H'),
(138, 4, 3.80, 1225.00, 1215.00, 1210.00, 40.12, 39.79, 39.63, '2024-11-18', 'H'),
(139, 20, 3.80, 1225.00, 1215.00, 1210.00, 175.61, 174.18, 173.46, '2024-11-18', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `id_familia` int(255) NOT NULL,
  `id_linea` int(255) NOT NULL,
  `id_marca` int(255) NOT NULL,
  `id_descuento` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `medida` varchar(100) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `paquete` int(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `preciob` float(100,2) DEFAULT NULL,
  `preciof` float(100,2) DEFAULT NULL,
  `precioc` float(100,2) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `id_tienda`, `id_familia`, `id_linea`, `id_marca`, `id_descuento`, `nombre`, `medida`, `cantidad`, `paquete`, `imagen`, `preciob`, `preciof`, `precioc`, `est`) VALUES
(1, 1, 1, 1, 1, 1, 'Fierro Corrugado', '3/4\'\'', 190, 102, 'Fierro 3-4.png', 91.25, 90.51, 90.13, 'H'),
(2, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '3/8\'\'', 340, 416, 'Fierro 3-8.png', 22.37, 22.19, 22.10, 'H'),
(3, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '5/8\'\'', 286, 150, 'Fierro 5-8.png', 62.05, 61.54, 61.29, 'H'),
(4, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '1/2\'\'', 170, 232, 'Fierro 1-2.png', 40.12, 39.79, 39.63, 'H'),
(5, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '3/4\'\'', 690, 102, '', 91.25, 90.51, 90.13, 'H'),
(6, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '3/8\'\'', 515, 416, '', 22.37, 22.19, 22.10, 'H'),
(7, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '5/8\'\'', 880, 150, '', 62.05, 61.54, 61.29, 'H'),
(8, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '1/2\'\'', 480, 232, '', 40.12, 39.79, 39.63, 'H'),
(9, 1, 2, 2, 3, 1, 'TUBO PVC AGUA FRIA', '1\'\'', 600, 1, '', 28.80, 28.80, 28.80, 'H'),
(10, 1, 2, 2, 3, 1, 'TUBO PVC AGUA FRIA', '3/4\'\'', 371, 1, '', 28.80, 28.80, 28.80, 'H'),
(11, 1, 2, 2, 3, 1, 'TUBO PVC AGUA FRIA', '1/2\'\'', 611, 1, '', 28.80, 28.80, 28.80, 'H'),
(12, 1, 2, 2, 4, 1, 'TUBO PVC AGUA FRIA', '1\'\'', 821, 1, '', 2.30, 2.50, 2.00, 'H'),
(13, 1, 2, 2, 4, 1, 'TUBO PVC AGUA FRIA', '3/4\'\'', 764, 1, '', 3.35, 3.55, 3.05, 'H'),
(14, 1, 2, 2, 4, 1, 'TUBO PVC AGUA FRIA', '1/2\'\'', 451, 1, '', 4.30, 4.50, 4.00, 'H'),
(15, 1, 2, 2, 3, 1, 'ADAPTADOR PVC AGUA FRIA', '1\'\'', 585, 1, '', 2.62, 2.72, 2.42, 'H'),
(16, 1, 2, 2, 4, 1, 'ADAPTADOR PVC AGUA FRIA', '1\'\'', 400, 1, NULL, 1.00, 1.00, 1.00, 'H'),
(17, 1, 2, 2, 3, 1, 'ADAPTADOR PVC AGUA FRIA', '1/2\'', 400, 1, NULL, 0.70, 0.70, 0.70, 'H'),
(18, 1, 2, 2, 4, 1, 'ADAPTADOR PVC AGUA FRIA', '1/2\'\'', 397, 1, NULL, 0.80, 0.80, 0.80, 'H'),
(19, 1, 1, 1, 5, 1, 'CLAVO', '1\'', 280, 1, '', 2.50, 1.60, 1.50, 'H'),
(20, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '1\'\'', 440, 53, '', 175.61, 174.18, 173.46, 'H'),
(21, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '1\'\'', 500, 58, '', 160.00, 158.00, 156.00, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_cuaderno`
--

CREATE TABLE `producto_cuaderno` (
  `id` int(255) NOT NULL,
  `id_cuaderno` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `precio` float(100,2) DEFAULT NULL,
  `cantidad` int(255) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_cuaderno`
--

INSERT INTO `producto_cuaderno` (`id`, `id_cuaderno`, `id_producto`, `precio`, `cantidad`, `est`) VALUES
(3, 6, 1, NULL, 50, 'H'),
(4, 6, 3, NULL, 80, 'H'),
(5, 6, 17, NULL, 7, 'H'),
(6, 7, 7, NULL, 20, 'H'),
(7, 7, 15, NULL, 35, 'H'),
(8, 7, 18, NULL, 3, 'H'),
(9, 8, 11, NULL, 1, 'H'),
(10, 9, 3, NULL, 1, 'H'),
(11, 10, 1, NULL, 52, 'H'),
(12, 10, 4, NULL, 40, 'H'),
(13, 10, 6, NULL, 30, 'H'),
(14, 11, 17, NULL, 1, 'H'),
(15, 12, 11, NULL, 1, 'H'),
(16, 13, 2, NULL, 40, 'H'),
(17, 13, 4, NULL, 60, 'H'),
(18, 13, 1, NULL, 20, 'H'),
(19, 14, 12, NULL, 200, 'H'),
(20, 14, 1, NULL, 50, 'H'),
(21, 15, 7, NULL, 1, 'H'),
(22, 15, 18, NULL, 1, 'H'),
(23, 16, 17, NULL, 1, 'H'),
(24, 17, 3, NULL, 50, 'H'),
(25, 17, 2, NULL, 30, 'H'),
(26, 17, 1, NULL, 20, 'H'),
(27, 18, 1, NULL, 1, 'H'),
(28, 18, 13, NULL, 1, 'H'),
(29, 19, 19, 4.50, 20, 'H'),
(30, 19, 3, 61.41, 60, 'H'),
(31, 19, 1, 90.31, 40, 'H'),
(32, 19, 4, 39.71, 30, 'H'),
(33, 21, 12, 2.40, 1, 'H'),
(34, 22, 1, 88.00, 50, 'H'),
(35, 22, 4, 38.00, 40, 'H'),
(36, 22, 19, 4.50, 60, 'H'),
(37, 22, 3, 60.00, 20, 'H'),
(38, 22, 2, 21.00, 30, 'H'),
(39, 23, 3, 59.00, 2, 'H'),
(40, 24, 2, 22.00, 30, 'H'),
(41, 24, 1, 90.00, 50, 'H'),
(42, 25, 3, 60.00, 30, 'H'),
(43, 25, 1, 90.00, 50, 'H'),
(44, 25, 4, 39.00, 40, 'H'),
(45, 26, 12, 2.50, 1, 'H'),
(46, 26, 3, 61.54, 1, 'H'),
(47, 26, 10, 28.80, 1, 'H'),
(48, 27, 6, 22.00, 5, 'H'),
(49, 28, 15, 2.72, 4, 'H'),
(50, 28, 5, 90.51, 10, 'H'),
(51, 28, 1, 90.51, 50, 'H'),
(52, 29, 4, 39.79, 1, 'H'),
(53, 29, 1, 90.51, 1, 'H'),
(54, 29, 2, 22.19, 1, 'H'),
(55, 29, 3, 61.54, 1, 'H'),
(56, 30, 19, 1.60, 1, 'H'),
(57, 31, 19, 1.60, 20, 'H'),
(58, 31, 20, 174.18, 10, 'H'),
(59, 32, 20, 172.00, 10, 'H'),
(60, 32, 1, 89.00, 30, 'H'),
(61, 33, 20, 174.18, 2, 'H'),
(62, 33, 19, 1.60, 1, 'H'),
(63, 34, 20, 174.18, 1, 'H'),
(64, 34, 12, 2.50, 1, 'H'),
(65, 35, 16, 1.00, 1, 'H'),
(66, 35, 14, 4.50, 1, 'H'),
(67, 35, 10, 28.80, 1, 'H'),
(68, 36, 20, 174.18, 20, 'H'),
(69, 36, 1, 90.51, 20, 'H'),
(70, 37, 20, 174.18, 20, 'H'),
(71, 37, 1, 90.51, 20, 'H'),
(72, 37, 4, 39.79, 20, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(255) NOT NULL,
  `id_ciudad` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id`, `id_ciudad`, `nombre`, `direccion`, `est`) VALUES
(1, 1, 'Tienda Huancan', 'Av. Panamericana Sur 1387', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `id` int(50) NOT NULL,
  `documento` varchar(150) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodoc`
--

INSERT INTO `tipodoc` (`id`, `documento`, `est`) VALUES
(1, 'DNI', 'H'),
(2, 'RUC', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `dni` char(8) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `usuariof` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_tienda`, `dni`, `nombre`, `apellidos`, `usuariof`, `password`, `rol`, `imagen`, `est`) VALUES
(1, 1, '72679186', 'Victor Max', 'Poma Canchari', 'vpoma', '$2y$04$jAmGT1NkrheNIj30hhk0KulzSvBEbO1cwItsuOzvV4/dNLUFaGSym', 'admin', 'Randy Marsh.png', 'H'),
(2, 1, '75482163', 'Alejandro', 'Perez Poma', 'Aperez', '$2y$04$M.Zc38KFe27m7Ya8ZBE3Ce7WhZzg4iSL8jldosYCikT0vE4IMXRZq', 'user', '', 'H');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_ciudad` (`id_ciudad`),
  ADD KEY `fk_cliente_tipodoc` (`id_tipodoc`);

--
-- Indices de la tabla `cuaderno`
--
ALTER TABLE `cuaderno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuaderno_tienda` (`id_tienda`),
  ADD KEY `fk_cuaderno_usuario` (`id_usuario`),
  ADD KEY `fk_cuaderno_cliente` (`id_cliente`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_precio_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_tienda` (`id_tienda`),
  ADD KEY `fk_producto_familia` (`id_familia`),
  ADD KEY `fk_producto_linea` (`id_linea`),
  ADD KEY `fk_producto_marca` (`id_marca`),
  ADD KEY `fk_producto_descuento` (`id_descuento`);

--
-- Indices de la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_cuaderno_cuaderno` (`id_cuaderno`),
  ADD KEY `fk_producto_cuaderno_producto` (`id_producto`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tienda_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuariof` (`usuariof`),
  ADD KEY `fk_usuario_tienda` (`id_tienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `cuaderno`
--
ALTER TABLE `cuaderno`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `precio`
--
ALTER TABLE `precio`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  ADD CONSTRAINT `fk_cliente_tipodoc` FOREIGN KEY (`id_tipodoc`) REFERENCES `tipodoc` (`id`);

--
-- Filtros para la tabla `cuaderno`
--
ALTER TABLE `cuaderno`
  ADD CONSTRAINT `fk_cuaderno_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_cuaderno_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `fk_cuaderno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `fk_precio_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_descuento` FOREIGN KEY (`id_descuento`) REFERENCES `descuento` (`id`),
  ADD CONSTRAINT `fk_producto_familia` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id`),
  ADD CONSTRAINT `fk_producto_linea` FOREIGN KEY (`id_linea`) REFERENCES `linea` (`id`),
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `fk_producto_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`);

--
-- Filtros para la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  ADD CONSTRAINT `fk_producto_cuaderno_cuaderno` FOREIGN KEY (`id_cuaderno`) REFERENCES `cuaderno` (`id`),
  ADD CONSTRAINT `fk_producto_cuaderno_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `fk_tienda_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
