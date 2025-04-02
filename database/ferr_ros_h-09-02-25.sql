-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2025 a las 21:42:32
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
-- Estructura de tabla para la tabla `abastecer`
--

CREATE TABLE `abastecer` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `id_proveedor` int(255) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `total` float(200,2) NOT NULL,
  `situacion` varchar(50) DEFAULT NULL,
  `importe` float(200,2) DEFAULT NULL,
  `resto` float(200,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fecha_ent` date DEFAULT NULL,
  `hora_ent` time DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `abastecer`
--

INSERT INTO `abastecer` (`id`, `id_tienda`, `id_usuario`, `id_proveedor`, `descripcion`, `total`, `situacion`, `importe`, `resto`, `fecha`, `hora`, `fecha_ent`, `hora_ent`, `estado`, `est`) VALUES
(1, 2, 1, 1, 'N/A', 14900.00, 'CANCELADO', 14900.00, 0.00, '2025-01-14', '01:54:11', '2025-01-29', '22:55:22', 'INGRESADO', 'H'),
(2, 1, 1, 1, 'N/A', 2.50, 'CANCELADO', 2.50, 0.00, '2025-01-16', '00:08:34', '2025-01-16', '00:08:44', 'INGRESADO', 'H'),
(3, 1, 1, 1, 'N/A', 9.00, 'CANCELADO', 9.00, 0.00, '2025-01-16', '00:09:27', '2025-01-16', '00:09:43', 'INGRESADO', 'H'),
(4, 1, 1, 1, 'N/A', 0.00, 'POR COBRAR', 0.00, 0.00, '2025-01-23', '23:23:48', '2025-01-29', '22:54:14', 'INGRESADO', 'H'),
(5, 1, 1, 2, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-01-29', '17:42:04', '2025-01-29', '22:54:04', 'INGRESADO', 'H'),
(6, 1, 1, 2, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-01-29', '22:53:32', '2025-01-29', '22:53:55', 'INGRESADO', 'H'),
(7, 1, 1, 1, 'N/A', 0.00, 'POR COBRAR', 0.00, 0.00, '2025-02-08', '08:28:03', '2025-02-08', '08:37:54', 'INGRESADO', 'H'),
(8, 1, 1, 1, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:31:30', NULL, NULL, 'ADQUIRIDO', 'H'),
(9, 1, 1, 1, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:32:04', NULL, NULL, 'ADQUIRIDO', 'H'),
(10, 1, 1, 1, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:32:22', '2025-02-08', '08:38:13', 'INGRESADO', 'H'),
(11, 1, 1, 1, 'N/A', 0.00, 'POR COBRAR', 0.00, 0.00, '2025-02-08', '08:32:57', NULL, NULL, 'ADQUIRIDO', 'H'),
(12, 1, 1, 1, 'N/A', 0.00, 'POR COBRAR', 0.00, 0.00, '2025-02-08', '08:33:39', '2025-02-08', '08:33:58', 'INGRESADO', 'H'),
(13, 1, 1, 2, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:34:51', '2025-02-08', '08:35:26', 'INGRESADO', 'H'),
(14, 1, 1, 3, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:35:52', '2025-02-08', '08:36:06', 'INGRESADO', 'H'),
(15, 1, 1, 2, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:41:47', '2025-02-08', '08:42:08', 'INGRESADO', 'H'),
(16, 1, 1, 1, 'N/A', 0.00, 'CANCELADO', 0.00, 0.00, '2025-02-08', '08:42:56', '2025-02-08', '08:42:59', 'INGRESADO', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arqueo`
--

CREATE TABLE `arqueo` (
  `id` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `totalingresoe` float(200,2) NOT NULL,
  `totalingresot` float(200,2) NOT NULL,
  `totalegresoe` float(200,2) NOT NULL,
  `totalegresot` float(200,2) NOT NULL,
  `totaldeuda` float(200,2) NOT NULL,
  `totalefectivo` float(200,2) NOT NULL,
  `totaltransfer` float(200,2) NOT NULL,
  `fechaar` date DEFAULT NULL,
  `turno` char(6) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arqueo`
--

INSERT INTO `arqueo` (`id`, `id_usuario`, `totalingresoe`, `totalingresot`, `totalegresoe`, `totalegresot`, `totaldeuda`, `totalefectivo`, `totaltransfer`, `fechaar`, `turno`, `fecha`, `hora`, `est`) VALUES
(1, 1, 2443.80, 0.00, 30.00, 0.00, 29.00, 2413.80, 0.00, '2025-01-14', 'TARDE', '2025-01-21', '23:38:12', 'H'),
(2, 1, 2141.87, 0.00, 0.00, 0.00, 419.70, 2141.87, 0.00, '2025-01-15', 'TARDE', '2025-01-21', '23:43:14', 'H'),
(3, 1, 345.00, 0.00, 0.00, 0.00, 518.65, 345.00, 0.00, '2025-01-18', 'TARDE', '2025-01-22', '00:26:39', 'H'),
(4, 1, 1712.00, 0.00, 8.00, 0.00, 0.00, 1704.00, 0.00, '2025-01-30', 'MAÑANA', '2025-01-30', '22:22:29', 'H'),
(5, 1, 2304.97, 0.00, 0.00, 0.00, 536.90, 2304.97, 0.00, '2025-01-15', 'CIERRE', '2025-01-31', '11:38:53', 'H');

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
(1, 'HUANCAN', 'H'),
(2, 'EL TAMBO', 'H'),
(3, 'HUANCAYO', 'H'),
(4, 'CHILCA', 'H'),
(5, 'SAPALLANGA', 'H'),
(6, 'HUAYUCACHI', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(255) NOT NULL,
  `id_ciudad` int(255) NOT NULL,
  `id_tipodoc` int(50) NOT NULL,
  `numdoc` char(20) NOT NULL,
  `nombrecom` varchar(255) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `numcel` char(12) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `id_ciudad`, `id_tipodoc`, `numdoc`, `nombrecom`, `direccion`, `numcel`, `est`) VALUES
(1, 4, 2, '11124578451', 'Judas Prieto', 'Av. amazonas 145 - azapampa', '965821354', 'H'),
(2, 5, 2, '107588989097', 'OSORES SULLCA BONY REENAN', 'CALL. REAL SN SAPALLANGA-HYO-JUNIN', '993109094', 'H'),
(3, 4, 1, '72679186', 'vp', 'calle real 200', '954127845', 'H'),
(4, 2, 1, '21547845', 'Paquita la del Barrio', 'Calle San José N° 245', '9111224578', 'H');

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
  `importe` float(200,2) DEFAULT NULL,
  `resto` float(200,2) DEFAULT NULL,
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
(1, 2, 1, 1, 'N/A', 760.00, 'CANCELADO', 760.00, 0.00, '2025-01-14', '01:49:21', '2025-01-28', '10:53:33', 'ENTREGADO', 'H'),
(2, 2, 1, 1, 'N/A', 1598.80, 'CANCELADO', 1598.80, 0.00, '2025-01-14', '01:50:00', NULL, NULL, 'VENDIDO', 'H'),
(3, 2, 1, 1, 'N/A', 12.00, 'POR COBRAR', 0.00, 12.00, '2025-01-14', '01:55:43', NULL, NULL, 'VENDIDO', 'H'),
(4, 2, 1, 1, 'N/A', 85.00, 'CANCELADO', 85.00, 0.00, '2025-01-14', '02:13:36', NULL, NULL, 'VENDIDO', 'H'),
(5, 2, 1, 1, 'N/A', 17.00, 'POR COBRAR', 0.00, 17.00, '2025-01-14', '02:14:11', NULL, NULL, 'VENDIDO', 'H'),
(6, 1, 1, 1, 'N/A', 94.10, 'POR COBRAR', 0.00, 94.10, '2025-01-15', '07:26:08', NULL, NULL, 'VENDIDO', 'H'),
(7, 1, 1, 1, 'N/A', 439.67, 'CANCELADO', 439.67, 0.00, '2025-01-15', '16:04:19', NULL, NULL, 'VENDIDO', 'H'),
(8, 1, 1, 1, 'N/A', 973.90, 'CANCELADO', 973.90, 0.00, '2025-01-15', '22:25:29', '2025-01-28', '10:54:57', 'ENTREGADO', 'H'),
(9, 1, 1, 1, 'N/A', 728.30, 'CANCELADO', 728.30, 0.00, '2025-01-15', '22:37:02', '2025-01-28', '10:55:58', 'ENTREGADO', 'H'),
(10, 1, 1, 1, 'N/A', 163.10, 'CANCELADO', 163.10, 0.00, '2025-01-15', '22:38:20', '2025-01-28', '10:56:30', 'ENTREGADO', 'H'),
(11, 1, 1, 1, 'N/A', 2.80, 'CANCELADO', 2.80, 0.00, '2025-01-13', '00:00:41', '2025-01-13', '00:01:02', 'ENTREGADO', 'H'),
(12, 1, 1, 1, 'N/A', 2.75, 'CANCELADO', 2.75, 0.00, '2025-01-16', '00:03:18', '2025-01-16', '00:03:27', 'ENTREGADO', 'H'),
(13, 1, 1, 1, 'N/A', 2.75, 'CANCELADO', 2.75, 0.00, '2025-01-17', '00:04:22', '2025-01-17', '00:04:25', 'ENTREGADO', 'H'),
(14, 1, 1, 2, 'N/A', 1000.00, 'A CUENTA', 800.00, 200.00, '2025-01-18', '11:15:04', NULL, NULL, 'VENDIDO', 'H'),
(15, 1, 1, 2, 'N/A', 1300.00, 'CANCELADO', 1300.00, 0.00, '2025-01-18', '11:16:13', NULL, NULL, 'VENDIDO', 'H'),
(16, 1, 1, 2, 'N/A', 1300.00, 'CANCELADO', 1300.00, 0.00, '2025-01-18', '11:17:08', NULL, NULL, 'VENDIDO', 'H'),
(17, 1, 1, 2, 'N/A', 1300.00, 'CANCELADO', 1300.00, 0.00, '2025-01-18', '11:22:10', NULL, NULL, 'VENDIDO', 'H'),
(18, 1, 1, 2, 'N/A', 1300.00, 'POR COBRAR', 0.00, 1300.00, '2025-01-18', '11:23:28', NULL, NULL, 'VENDIDO', 'H'),
(19, 1, 1, 2, 'N/A', 1300.00, 'CANCELADO', 1300.00, 0.00, '2025-01-18', '11:23:54', NULL, NULL, 'VENDIDO', 'H'),
(20, 1, 1, 2, 'N/A', 28.50, 'POR COBRAR', 0.00, 28.50, '2025-01-18', '11:24:25', NULL, NULL, 'VENDIDO', 'H'),
(21, 1, 1, 2, 'N/A', 20.38, 'A CUENTA', 10.00, 10.38, '2025-01-18', '11:26:16', '2025-01-29', '00:19:50', 'ENTREGADO', 'H'),
(22, 1, 1, 2, 'N/A', 210.00, 'CANCELADO', 210.00, 0.00, '2025-01-18', '12:17:58', NULL, NULL, 'VENDIDO', 'H'),
(23, 1, 1, 2, 'N/A', 267.80, 'POR COBRAR', 0.00, 267.80, '2025-01-18', '12:18:36', '2025-01-28', '12:32:15', 'ENTREGADO', 'H'),
(24, 1, 1, 2, 'N/A', 86.10, 'A CUENTA', 40.00, 46.10, '2025-01-18', '12:19:17', NULL, NULL, 'VENDIDO', 'H'),
(25, 1, 1, 2, 'N/A', 5.00, 'CANCELADO', 5.00, 0.00, '2025-01-18', '12:20:01', NULL, NULL, 'VENDIDO', 'H'),
(26, 1, 1, 2, 'N/A', 504.75, 'A CUENTA', 300.00, 204.75, '2025-01-18', '12:32:26', '2025-01-28', '12:33:04', 'ENTREGADO', 'H'),
(27, 1, 2, 2, 'N/A', 10.00, 'POR COBRAR', 0.00, 10.00, '2025-01-18', '23:33:05', NULL, NULL, 'VENDIDO', 'H'),
(28, 1, 2, 2, 'N/A', 38.50, 'CANCELADO', 38.50, 0.00, '2025-01-28', '23:36:52', '2025-01-28', '12:04:33', 'ENTREGADO', 'H'),
(29, 1, 1, 1, 'N/A', 110.00, 'CANCELADO', 110.00, 0.00, '2025-01-25', '20:12:50', '2025-01-28', '12:04:41', 'ENTREGADO', 'H'),
(30, 1, 1, 1, 'N/A', 67.00, 'CANCELADO', 67.00, 0.00, '2025-01-25', '20:14:14', NULL, NULL, 'VENDIDO', 'H'),
(31, 1, 1, 1, 'N/A', 345.00, 'CANCELADO', 345.00, 0.00, '2025-01-25', '20:15:01', NULL, NULL, 'VENDIDO', 'H'),
(32, 1, 1, 1, 'N/A', 100.00, 'CANCELADO', 100.00, 0.00, '2025-01-25', '20:19:29', NULL, NULL, 'VENDIDO', 'H'),
(33, 1, 1, 3, 'N/A', 2.00, 'CANCELADO', 2.00, 0.00, '2025-01-29', '17:41:27', NULL, NULL, 'VENDIDO', 'H'),
(34, 1, 1, 3, 'N/A', 590.00, 'CANCELADO', 590.00, 0.00, '2025-01-29', '22:45:17', NULL, NULL, 'VENDIDO', 'H'),
(35, 1, 1, 3, 'N/A', 265.00, 'CANCELADO', 265.00, 0.00, '2025-01-29', '22:47:37', NULL, NULL, 'VENDIDO', 'H'),
(36, 1, 1, 3, 'N/A', 340.00, 'CANCELADO', 340.00, 0.00, '2025-01-30', '11:51:10', '2025-01-30', '11:51:22', 'ENTREGADO', 'H'),
(37, 1, 1, 2, 'N/A', 148.00, 'CANCELADO', 148.00, 0.00, '2025-01-30', '11:52:04', '2025-01-30', '11:52:07', 'ENTREGADO', 'H'),
(38, 1, 1, 3, 'N/A', 20.00, 'CANCELADO', 20.00, 0.00, '2025-01-31', '23:29:07', '2025-01-31', '23:29:13', 'ENTREGADO', 'H');

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
(1, 0.10, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egreso`
--

CREATE TABLE `egreso` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `tipopago` char(13) DEFAULT NULL,
  `monto` float(200,2) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `turno` char(6) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `egreso`
--

INSERT INTO `egreso` (`id`, `id_tienda`, `id_usuario`, `descripcion`, `tipopago`, `monto`, `fecha`, `hora`, `turno`, `est`) VALUES
(1, 1, 1, 'PAGO POR AGUA SEDAN', 'EFECTIVO', 30.00, '2025-01-14', '02:31:44', 'TARDE', 'H'),
(2, 1, 1, 'Pago por Energía Eléctrica', 'YAPE', 90.00, '2025-01-25', '19:58:30', 'TARDE', 'H'),
(3, 1, 1, 'Pago por servicio de Internet', 'BCP', 70.00, '2025-01-25', '20:03:24', 'TARDE', 'H'),
(4, 1, 1, 'Pago por servicio de Agua', 'CAJA HUANCAYO', 20.00, '2025-01-25', '20:04:31', 'TARDE', 'H'),
(5, 1, 1, 'Compra de Tarjetas de Promoción', 'EFECTIVO', 70.00, '2025-01-25', '20:18:28', 'TARDE', 'H'),
(6, 1, 1, 'Almuerzo de Hugo', 'EFECTIVO', 8.00, '2025-01-30', '11:58:38', 'MAÑANA', 'H');

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
(1, 'ACERO', 'H'),
(2, 'INSTALACIONES SANITARIAS', 'H'),
(3, 'INSTALACIONES ELECTRICAS', 'H'),
(4, 'DISCOS Y BROCAS', 'H'),
(5, 'PERNOS Y TORNILLOS', 'H'),
(6, 'HERRAMIENTAS', 'H'),
(7, 'SOLDADURA', 'H'),
(8, 'INSUMOS DE LIMPIEZA', 'H'),
(9, 'ADITIVOS', 'H'),
(10, 'PINTURAS', 'H'),
(11, 'CEMENTO', 'H'),
(12, 'LADRILLO', 'H'),
(13, 'PLANCHAS', 'H'),
(14, 'TANQUES Y CISTERNAS', 'H'),
(15, 'TECNOPOR', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id` int(255) NOT NULL,
  `id_tienda` int(255) NOT NULL,
  `id_usuario` int(255) DEFAULT NULL,
  `id_cliente` int(255) DEFAULT NULL,
  `id_cuaderno` int(255) DEFAULT NULL,
  `tipopago` char(13) DEFAULT NULL,
  `ingresos` float(200,2) DEFAULT NULL,
  `deudas` float(200,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `turno` char(6) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id`, `id_tienda`, `id_usuario`, `id_cliente`, `id_cuaderno`, `tipopago`, `ingresos`, `deudas`, `fecha`, `hora`, `turno`, `descripcion`, `est`) VALUES
(1, 2, NULL, 1, 1, 'EFECTIVO', 760.00, 0.00, '2025-01-14', '01:49:21', 'TARDE', 'N/A', 'H'),
(2, 2, NULL, 1, 2, 'TRANSFERENCIA', 1598.80, 0.00, '2025-01-14', '01:50:00', 'TARDE', 'N/A', 'H'),
(3, 2, NULL, 1, 3, 'EFECTIVO', 0.00, 12.00, '2025-01-14', '01:55:43', 'TARDE', NULL, 'H'),
(4, 2, NULL, 1, 4, 'TRANSFERENCIA', 85.00, 0.00, '2025-01-14', '02:13:36', 'TARDE', NULL, 'H'),
(5, 2, NULL, 1, 5, 'EFECTIVO', 0.00, 17.00, '2025-01-14', '02:14:11', 'TARDE', NULL, 'H'),
(6, 1, NULL, 1, 6, 'EFECTIVO', 0.00, 94.10, '2025-01-15', '07:26:08', 'MAÑANA', NULL, 'H'),
(7, 1, NULL, 1, 7, 'EFECTIVO', 439.67, 0.00, '2025-01-15', '16:04:19', 'TARDE', NULL, 'H'),
(8, 1, NULL, 1, 8, 'EFECTIVO', 973.90, 0.00, '2025-01-15', '22:25:29', 'TARDE', NULL, 'H'),
(9, 1, NULL, 1, 9, 'EFECTIVO', 500.00, 228.30, '2025-01-15', '22:37:02', 'TARDE', NULL, 'H'),
(10, 1, NULL, 1, 10, 'EFECTIVO', 0.00, 163.10, '2025-01-15', '22:38:20', 'TARDE', NULL, 'H'),
(11, 1, NULL, 1, 9, 'EFECTIVO', 200.00, 28.30, '2025-01-15', '22:38:42', 'TARDE', NULL, 'H'),
(12, 1, NULL, 1, 9, 'EFECTIVO', 28.30, 0.00, '2025-01-15', '22:38:52', 'TARDE', NULL, 'H'),
(13, 1, NULL, 1, 10, 'EFECTIVO', 140.00, 23.10, '2025-01-15', '22:39:25', 'NOCHE', NULL, 'H'),
(14, 1, NULL, 1, 10, 'EFECTIVO', 23.10, 0.00, '2025-01-15', '22:39:34', 'NOCHE', NULL, 'H'),
(15, 1, NULL, 1, 11, 'EFECTIVO', 2.80, 0.00, '2025-01-16', '00:00:42', 'NOCHE', NULL, 'H'),
(16, 1, NULL, 1, 12, 'EFECTIVO', 2.75, 0.00, '2025-01-16', '00:03:18', 'NOCHE', NULL, 'H'),
(17, 1, NULL, 1, 13, 'EFECTIVO', 2.75, 0.00, '2025-01-16', '00:04:22', 'NOCHE', NULL, 'H'),
(18, 1, NULL, 2, 14, 'EFECTIVO', 800.00, 200.00, '2025-01-18', '11:15:04', 'MAÑANA', NULL, 'H'),
(19, 1, NULL, 2, 15, 'EFECTIVO', 1300.00, 0.00, '2025-01-18', '11:16:13', 'MAÑANA', NULL, 'H'),
(20, 1, NULL, 2, 16, 'EFECTIVO', 1300.00, 0.00, '2025-01-18', '11:17:08', 'MAÑANA', NULL, 'H'),
(21, 1, NULL, 2, 18, 'EFECTIVO', 0.00, 1300.00, '2025-01-18', '11:23:28', 'MAÑANA', NULL, 'H'),
(22, 1, NULL, 2, 19, 'EFECTIVO', 1300.00, 0.00, '2025-01-18', '11:23:54', 'MAÑANA', NULL, 'H'),
(23, 1, NULL, 2, 20, 'EFECTIVO', 0.00, 28.50, '2025-01-18', '11:24:25', 'MAÑANA', NULL, 'H'),
(24, 1, NULL, 2, 21, 'EFECTIVO', 10.00, 10.38, '2025-01-18', '11:26:16', 'MAÑANA', NULL, 'H'),
(25, 1, NULL, 2, 22, 'EFECTIVO', 210.00, 0.00, '2025-01-18', '12:17:58', 'MAÑANA', NULL, 'H'),
(26, 1, NULL, 2, 23, 'EFECTIVO', 0.00, 267.80, '2025-01-18', '12:18:36', 'TARDE', NULL, 'H'),
(27, 1, NULL, 2, 24, 'EFECTIVO', 40.00, 46.10, '2025-01-18', '12:19:17', 'TARDE', NULL, 'H'),
(28, 1, NULL, 2, 25, 'EFECTIVO', 5.00, 0.00, '2025-01-18', '12:20:01', 'TARDE', NULL, 'H'),
(29, 1, NULL, 2, 26, 'EFECTIVO', 300.00, 204.75, '2025-01-18', '12:32:26', 'TARDE', NULL, 'H'),
(30, 1, NULL, 2, 27, 'EFECTIVO', 0.00, 10.00, '2025-01-18', '23:33:05', 'NOCHE', NULL, 'H'),
(31, 1, NULL, 2, 28, 'EFECTIVO', 38.50, 0.00, '2025-01-18', '23:36:52', 'NOCHE', NULL, 'H'),
(32, 1, NULL, 1, 29, 'YAPE', 110.00, 0.00, '2025-01-25', '20:12:50', 'TARDE', NULL, 'H'),
(33, 1, NULL, 1, 30, 'BCP', 67.00, 0.00, '2025-01-25', '20:14:14', 'TARDE', NULL, 'H'),
(34, 1, NULL, 1, 31, 'CAJA HUANCAYO', 345.00, 0.00, '2025-01-25', '20:15:01', 'TARDE', NULL, 'H'),
(35, 1, NULL, 1, 32, 'EFECTIVO', 100.00, 0.00, '2025-01-25', '20:19:29', 'TARDE', NULL, 'H'),
(36, 1, NULL, 3, 33, 'EFECTIVO', 0.00, 2.00, '2025-01-29', '17:41:27', 'TARDE', NULL, 'H'),
(37, 1, 1, 3, 34, 'EFECTIVO', 590.00, 0.00, '2025-01-29', '22:45:17', 'NOCHE', 'N/A', 'H'),
(38, 1, 1, 3, 35, 'EFECTIVO', 0.00, 265.00, '2025-01-29', '22:47:37', 'NOCHE', 'N/A', 'H'),
(39, 1, 1, 3, 33, 'EFECTIVO', 1.00, 1.00, '2025-01-29', '22:48:18', 'NOCHE', 'N/A', 'H'),
(40, 1, 1, 3, 33, 'EFECTIVO', 1.00, 0.00, '2025-01-29', '22:49:39', 'NOCHE', 'N/A', 'H'),
(41, 1, 1, 3, 35, 'EFECTIVO', 200.00, 65.00, '2025-01-29', '22:50:13', 'NOCHE', 'N/A', 'H'),
(42, 1, 1, 3, 35, 'EFECTIVO', 65.00, 0.00, '2025-01-29', '22:50:22', 'NOCHE', 'N/A', 'H'),
(43, 1, 1, NULL, NULL, 'EFECTIVO', 512.00, 0.00, '2025-01-30', '10:26:46', 'MAÑANA', 'Pago por compra Tienda Huancan', 'H'),
(44, 1, 1, NULL, NULL, 'EFECTIVO', 500.00, 0.00, '2025-01-30', '10:36:46', 'MAÑANA', 'Pagos Huancan', 'H'),
(45, 1, 1, NULL, NULL, 'EFECTIVO', 200.00, 0.00, '2025-01-30', '10:38:13', 'MAÑANA', 'Monto de Apertura de Caja', 'H'),
(46, 1, 1, NULL, NULL, 'EFECTIVO', 12.00, 0.00, '2025-01-30', '10:40:58', 'MAÑANA', 'Ingresa a caja por vuelto de pasaje', 'H'),
(47, 1, 1, 3, 36, 'EFECTIVO', 340.00, 0.00, '2025-01-30', '11:51:10', 'MAÑANA', 'N/A', 'H'),
(48, 1, 1, 2, 37, 'EFECTIVO', 148.00, 0.00, '2025-01-30', '11:52:04', 'MAÑANA', 'N/A', 'H'),
(49, 1, 1, 3, 38, 'EFECTIVO', 20.00, 0.00, '2025-01-31', '23:29:07', 'NOCHE', 'N/A', 'H');

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
(2, 'ALAMBRE', 'H'),
(3, 'CLAVO', 'H'),
(4, 'TUBOS', 'H'),
(5, 'ACCESORIOS', 'H'),
(6, 'CAÑO', 'H'),
(7, 'LLAVE', 'H'),
(8, 'EXTENSIONES', 'H'),
(9, 'LUMINARIAS', 'H'),
(10, 'CABLES', 'H'),
(11, 'LLAVE TERMICA', 'H'),
(12, 'CAJAS', 'H'),
(13, 'DISCO DE CORTE', 'H'),
(14, 'DISCO DE DESBASTE', 'H'),
(15, 'DISCO DE PULIR', 'H'),
(16, 'BROCA ', 'H'),
(17, 'TORNILLO', 'H'),
(18, 'PERNO', 'H'),
(19, 'TARUGO', 'H'),
(20, 'ELECTRICA', 'H'),
(21, 'MANUAL', 'H'),
(22, 'ELECTRODO', 'H'),
(23, 'LIQUIDO', 'H'),
(24, 'SOLIDO', 'H'),
(25, 'PEGAMENTO', 'H'),
(26, 'SILICONA', 'H'),
(27, 'PINTURA', 'H'),
(28, 'CEMENTO', 'H'),
(29, 'TECHO', 'H'),
(30, 'MURO O DIVISION', 'H'),
(31, 'CALAMINA', 'H'),
(32, 'TRASLUCIDO', 'H'),
(33, 'TRIPLAY', 'H'),
(34, 'TANQUE', 'H'),
(35, 'CISTERNA', 'H'),
(36, 'PLANCHA', 'H'),
(37, 'CASETON', 'H');

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
(1, 'SIDERPERU', 'H'),
(2, 'DEACERO FIERRO MACHO', 'H'),
(3, 'PRODAC - TREFIDE', 'H'),
(4, 'PRODAC', 'H'),
(5, 'OTRO', 'H'),
(6, 'PAVCO', 'H'),
(7, 'CONCISSA', 'H'),
(8, 'PCP', 'H'),
(9, 'ERA', 'H'),
(10, 'VAE', 'H'),
(11, 'ITALY', 'H'),
(12, 'LL', 'H'),
(13, 'KROSS', 'H'),
(14, 'C Y A', 'H'),
(15, 'TREBOL', 'H'),
(16, 'NACIONAL', 'H'),
(17, 'MAGNUM', 'H'),
(18, 'FULGORE', 'H'),
(19, 'IMPORTADO', 'H'),
(20, 'B TICINO', 'H'),
(21, 'FSL', 'H'),
(22, 'INDECO', 'H'),
(23, 'BRANDE', 'H'),
(24, 'STRONGER', 'H'),
(25, 'NORTON', 'H'),
(26, 'DEWALT', 'H'),
(27, 'FERRAWY', 'H'),
(28, 'KAMASA', 'H'),
(29, 'KULKONI', 'H'),
(30, 'CASCO', 'H'),
(31, 'BLACK+DECKER', 'H'),
(32, 'UYUSTOOLS', 'H'),
(33, '3M', 'H'),
(34, 'PEGAFAN', 'H'),
(35, 'SANFLEX', 'H'),
(36, 'PUNTO AZUL', 'H'),
(37, 'INDURA', 'H'),
(38, 'CELLOCORD', 'H'),
(39, 'SUPERCITO', 'H'),
(40, 'MARTELL', 'H'),
(41, 'OATEY', 'H'),
(42, 'AFRICANITO', 'H'),
(43, 'SIKA', 'H'),
(44, 'CPP', 'H'),
(45, 'ANDINO', 'H'),
(46, 'INKA', 'H'),
(47, 'SUELTO', 'H'),
(48, 'PIRAMIDE', 'H'),
(49, 'FORTALEZA', 'H'),
(50, 'TORO', 'H'),
(51, 'LA ROCA', 'H'),
(52, 'FIBRAFORTE', 'H'),
(53, 'ROTOPLAS', 'H'),
(54, 'DIPROPOR', 'H');

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
(1, 1, 3.79, 1225.00, 1210.00, 1210.00, 159.88, 157.93, 157.93, '2025-01-14', 'H'),
(2, 2, 3.79, 1225.00, 1210.00, 1210.00, 90.91, 89.80, 89.80, '2025-01-14', 'H'),
(3, 3, 3.79, 1225.00, 1210.00, 1210.00, 61.82, 61.06, 61.06, '2025-01-14', 'H'),
(4, 4, 3.79, 1225.00, 1210.00, 1210.00, 39.97, 39.48, 39.48, '2025-01-14', 'H'),
(5, 5, 3.79, 1225.00, 1210.00, 1210.00, 35.67, 35.23, 35.23, '2025-01-14', 'H'),
(6, 6, 3.79, 1225.00, 1210.00, 1210.00, 22.29, 22.02, 22.02, '2025-01-14', 'H'),
(7, 7, 3.79, 1225.00, 1210.00, 1210.00, 16.10, 15.90, 15.90, '2025-01-14', 'H'),
(8, 8, 3.79, 1225.00, 1210.00, 1210.00, 8.99, 8.88, 8.88, '2025-01-14', 'H'),
(9, 9, 3.79, 1225.00, 1210.00, 1210.00, 5.45, 5.39, 5.39, '2025-01-14', 'H'),
(10, 10, 3.79, 1120.00, 1100.00, 1100.00, 146.18, 143.57, 143.57, '2025-01-14', 'H'),
(11, 11, 3.79, 1120.00, 1100.00, 1100.00, 83.12, 81.64, 81.64, '2025-01-14', 'H'),
(12, 12, 3.79, 1120.00, 1100.00, 1100.00, 56.52, 55.51, 55.51, '2025-01-14', 'H'),
(13, 13, 3.79, 1120.00, 1100.00, 1100.00, 36.54, 35.89, 35.89, '2025-01-14', 'H'),
(14, 14, 3.79, 1120.00, 1100.00, 1100.00, 32.61, 32.03, 32.03, '2025-01-14', 'H'),
(15, 15, 3.79, 1120.00, 1100.00, 1100.00, 20.38, 20.02, 20.02, '2025-01-14', 'H'),
(16, 16, 3.79, 1120.00, 1100.00, 1100.00, 14.72, 14.46, 14.46, '2025-01-14', 'H'),
(17, 17, 3.79, 1120.00, 1100.00, 1100.00, 8.22, 8.07, 8.07, '2025-01-14', 'H'),
(18, 18, 3.79, 1120.00, 1100.00, 1100.00, 4.99, 4.90, 4.90, '2025-01-14', 'H'),
(19, 1, 3.72, 1225.00, 1215.00, 1210.00, 156.97, 155.69, 155.05, '2025-01-27', 'H'),
(20, 2, 3.72, 1225.00, 1215.00, 1210.00, 89.26, 88.53, 88.16, '2025-01-27', 'H'),
(21, 3, 3.72, 1225.00, 1215.00, 1210.00, 60.69, 60.20, 59.95, '2025-01-27', 'H'),
(22, 4, 3.72, 1225.00, 1215.00, 1210.00, 39.24, 38.92, 38.76, '2025-01-27', 'H'),
(23, 5, 3.72, 1225.00, 1215.00, 1210.00, 35.02, 34.73, 34.59, '2025-01-27', 'H'),
(24, 6, 3.72, 1225.00, 1215.00, 1210.00, 21.89, 21.71, 21.62, '2025-01-27', 'H'),
(25, 7, 3.72, 1225.00, 1215.00, 1210.00, 15.81, 15.68, 15.61, '2025-01-27', 'H'),
(26, 8, 3.72, 1225.00, 1215.00, 1210.00, 8.82, 8.75, 8.71, '2025-01-27', 'H'),
(27, 9, 3.72, 1225.00, 1215.00, 1210.00, 5.36, 5.31, 5.29, '2025-01-27', 'H'),
(28, 10, 3.72, 1120.00, 1100.00, 1100.00, 143.51, 140.95, 140.95, '2025-01-27', 'H'),
(29, 11, 3.72, 1120.00, 1100.00, 1100.00, 81.61, 80.15, 80.15, '2025-01-27', 'H'),
(30, 12, 3.72, 1120.00, 1100.00, 1100.00, 55.49, 54.50, 54.50, '2025-01-27', 'H'),
(31, 13, 3.72, 1120.00, 1100.00, 1100.00, 35.88, 35.24, 35.24, '2025-01-27', 'H'),
(32, 14, 3.72, 1120.00, 1100.00, 1100.00, 32.01, 31.44, 31.44, '2025-01-27', 'H'),
(33, 15, 3.72, 1120.00, 1100.00, 1100.00, 20.01, 19.65, 19.65, '2025-01-27', 'H'),
(34, 16, 3.72, 1120.00, 1100.00, 1100.00, 14.45, 14.19, 14.19, '2025-01-27', 'H'),
(35, 17, 3.72, 1120.00, 1100.00, 1100.00, 8.07, 7.92, 7.92, '2025-01-27', 'H'),
(36, 18, 3.72, 1120.00, 1100.00, 1100.00, 4.90, 4.81, 4.81, '2025-01-27', 'H');

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
  `codigo` char(6) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `medida` varchar(100) NOT NULL,
  `cantidad` float(100,2) NOT NULL,
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

INSERT INTO `producto` (`id`, `id_tienda`, `id_familia`, `id_linea`, `id_marca`, `id_descuento`, `codigo`, `nombre`, `medida`, `cantidad`, `paquete`, `imagen`, `preciob`, `preciof`, `precioc`, `est`) VALUES
(1, 1, 1, 1, 1, 1, 'AF0001', 'FIERRO CORRUGADO', '1\"', 220.00, 58, NULL, 156.97, 155.69, 155.05, 'H'),
(2, 1, 1, 1, 1, 1, 'AF0002', 'FIERRO CORRUGADO', '3/4\"', 120.00, 102, NULL, 89.26, 88.53, 88.16, 'H'),
(3, 1, 1, 1, 1, 1, 'AF0003', 'FIERRO CORRUGADO', '5/8\"', 251.00, 150, NULL, 60.69, 60.20, 59.95, 'H'),
(4, 1, 1, 1, 1, 1, 'AF0004', 'FIERRO CORRUGADO', '1/2\"', 236.00, 232, NULL, 39.24, 38.92, 38.76, 'H'),
(5, 1, 1, 1, 1, 1, 'AF0005', 'FIERRO CORRUGADO', '12mm', 249.00, 260, NULL, 35.02, 34.73, 34.59, 'H'),
(6, 1, 1, 1, 1, 1, 'AF0006', 'FIERRO CORRUGADO', '3/8\"', 185.00, 416, NULL, 21.89, 21.71, 21.62, 'H'),
(7, 1, 1, 1, 1, 1, 'AF0007', 'FIERRO CORRUGADO', '8mm', 354.00, 576, NULL, 15.81, 15.68, 15.61, 'H'),
(8, 1, 1, 1, 1, 1, 'AF0008', 'FIERRO CORRUGADO', '1/4\"', 680.00, 1032, NULL, 8.82, 8.75, 8.71, 'H'),
(9, 1, 1, 1, 1, 1, 'AF0009', 'FIERRO CORRUGADO', 'T', 220.00, 1700, NULL, 5.36, 5.31, 5.29, 'H'),
(10, 1, 1, 1, 2, 1, 'AF0010', 'FIERRO CORRUGADO', '1\"', 20.00, 58, NULL, 143.51, 140.95, 140.95, 'H'),
(11, 1, 1, 1, 2, 1, 'AF0011', 'FIERRO CORRUGADO', '3/4\"', 990.00, 102, NULL, 81.61, 80.15, 80.15, 'H'),
(12, 1, 1, 1, 2, 1, 'AF0012', 'FIERRO CORRUGADO', '5/8\"', 160.00, 150, NULL, 55.49, 54.50, 54.50, 'H'),
(13, 1, 1, 1, 2, 1, 'AF0013', 'FIERRO CORRUGADO', '1/2\"', 4.00, 232, NULL, 35.88, 35.24, 35.24, 'H'),
(14, 1, 1, 1, 2, 1, 'AF0014', 'FIERRO CORRUGADO', '12mm', 257.00, 260, NULL, 32.01, 31.44, 31.44, 'H'),
(15, 1, 1, 1, 2, 1, 'AF0015', 'FIERRO CORRUGADO', '3/8\"', 147.00, 416, NULL, 20.01, 19.65, 19.65, 'H'),
(16, 1, 1, 1, 2, 1, 'AF0016', 'FIERRO CORRUGADO', '8mm', 532.00, 576, NULL, 14.45, 14.19, 14.19, 'H'),
(17, 1, 1, 1, 2, 1, 'AF0017', 'FIERRO CORRUGADO', '1/4\"', 872.00, 1032, NULL, 8.07, 7.92, 7.92, 'H'),
(18, 1, 1, 1, 2, 1, 'AF0018', 'FIERRO CORRUGADO', 'T', 1464.00, 1700, NULL, 4.90, 4.81, 4.81, 'H'),
(19, 1, 1, 2, 3, 1, 'AA0001', 'ALAMBRE RECOCIDO NEGRO', '#8', 140.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(20, 1, 1, 2, 3, 1, 'AA0002', 'ALAMBRE RECOCIDO NEGRO', '#16', 139.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(21, 1, 1, 3, 4, 1, 'AC0001', 'CLAVO DE MADERA', '3/4\"', 40.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(22, 1, 1, 3, 4, 1, 'AC0002', 'CLAVO DE MADERA', '1\"', 20.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(23, 1, 1, 3, 4, 1, 'AC0003', 'CLAVO DE MADERA', '1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(24, 1, 1, 3, 4, 1, 'AC0004', 'CLAVO DE MADERA', '2\"', 42.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(25, 1, 1, 3, 4, 1, 'AC0005', 'CLAVO DE MADERA', '2 1/2\"', 23.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(26, 1, 1, 3, 4, 1, 'AC0006', 'CLAVO DE MADERA', '3\"', 45.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(27, 1, 1, 3, 4, 1, 'AC0007', 'CLAVO DE MADERA', '4\"', 55.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(28, 1, 1, 3, 4, 1, 'AC0008', 'CLAVO DE MADERA', '5\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(29, 1, 1, 3, 4, 1, 'AC0009', 'CLAVO DE MADERA', '6\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(30, 1, 1, 3, 4, 1, 'AC0010', 'CLAVO DE MADERA', '7\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(31, 1, 1, 3, 4, 1, 'AC0011', 'CLAVO DE MADERA', '8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(32, 1, 1, 3, 4, 1, 'AC0012', 'CLAVO DE CALAMINA C/J', '2 1/2\"', 25.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(33, 1, 1, 3, 4, 1, 'AC0013', 'CLAVO DE CALAMINA S/J', '3 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(34, 1, 1, 3, 4, 1, 'AC0014', 'GRAPAS DE MADERA', ' \"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(35, 1, 1, 3, 5, 1, 'AC0015', 'CLAVO PARA CONCRETO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(36, 1, 1, 3, 5, 1, 'AC0016', 'CLAVO PARA CONCRETO', '1 1/2\"', 1.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(37, 1, 1, 3, 5, 1, 'AC0017', 'CLAVO PARA CONCRETO', '2\"', 1.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(38, 1, 1, 3, 5, 1, 'AC0018', 'CLAVO PARA CONCRETO', '3\"', 2.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(39, 1, 1, 3, 5, 1, 'AC0019', 'CLAVO PARA CONCRETO', '4\"', 2.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(40, 1, 2, 4, 6, 1, 'ST0001', 'TUBO PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(41, 1, 2, 4, 6, 1, 'ST0002', 'TUBO PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(42, 1, 2, 4, 6, 1, 'ST0003', 'TUBO PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(43, 1, 2, 4, 6, 1, 'ST0004', 'TUBO PVC AGUA FRIA', '1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(44, 1, 2, 4, 6, 1, 'ST0005', 'TUBO PVC AGUA FRIA', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(45, 1, 2, 4, 6, 1, 'ST0006', 'TUBO C/R PVC AGUA FRIA', '1/2\"', 8.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(46, 1, 2, 4, 6, 1, 'ST0007', 'TUBO C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(47, 1, 2, 4, 6, 1, 'ST0008', 'TUBO C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(48, 1, 2, 4, 6, 1, 'ST0009', 'TUBO C/R PVC AGUA FRIA', '1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(49, 1, 2, 4, 6, 1, 'ST0010', 'TUBO C/R PVC AGUA FRIA', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(50, 1, 2, 4, 6, 1, 'ST0011', 'TUBO PVC DESAGUE', '2\"', 13.00, 0, NULL, 16.00, 0.00, 0.00, 'H'),
(51, 1, 2, 4, 6, 1, 'ST0012', 'TUBO PVC DESAGUE', '3\"', 18.00, 0, NULL, 33.50, 0.00, 0.00, 'H'),
(52, 1, 2, 4, 6, 1, 'ST0013', 'TUBO PVC DESAGUE', '4\"', 14.00, 0, NULL, 34.50, 0.00, 0.00, 'H'),
(53, 1, 2, 4, 6, 1, 'ST0014', 'TUBO CPVC', '1/2\"', 20.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(54, 1, 2, 4, 6, 1, 'ST0015', 'TUBO CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(55, 1, 3, 4, 6, 1, 'ET0001', 'TUBO LUZ', '3/4\"', 113.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(56, 1, 3, 4, 6, 1, 'ET0002', 'TUBO LUZ', '1\"', 30.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(57, 1, 2, 5, 6, 1, 'SA0001', 'ADAPTADOR PVC AGUA FRIA', '1/2\"', 16.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(58, 1, 2, 5, 6, 1, 'SA0002', 'ADAPTADOR PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(59, 1, 2, 5, 6, 1, 'SA0003', 'ADAPTADOR PVC AGUA FRIA', '1\"', 5.00, 0, NULL, 4.00, 0.00, 0.00, 'H'),
(60, 1, 2, 5, 6, 1, 'SA0004', 'CODO 90 S/R PVC AGUA FRIA', '1/2\"', 20.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(61, 1, 2, 5, 6, 1, 'SA0005', 'CODO 90 S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(62, 1, 2, 5, 6, 1, 'SA0006', 'CODO 90 S/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(63, 1, 2, 5, 6, 1, 'SA0007', 'CODO 90 C/R PVC AGUA FRIA', '1/2\"', 20.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(64, 1, 2, 5, 6, 1, 'SA0008', 'CODO 90 C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(65, 1, 2, 5, 6, 1, 'SA0009', 'CODO 90 C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(66, 1, 2, 5, 6, 1, 'SA0010', 'CODO 90 MIXTO PVC AGUA FRIA', '1/2\"', 20.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(67, 1, 2, 5, 6, 1, 'SA0011', 'CODO 90 MIXTO PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(68, 1, 2, 5, 6, 1, 'SA0012', 'CODO 90 MIXTO PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(69, 1, 2, 5, 6, 1, 'SA0013', 'CODO 45 S/R PVC AGUA FRIA', '1/2\"', 19.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(70, 1, 2, 5, 6, 1, 'SA0014', 'CODO 45 S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(71, 1, 2, 5, 6, 1, 'SA0015', 'CODO 45 S/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(72, 1, 2, 5, 6, 1, 'SA0016', 'CURVA 90 PVC AGUA FRIA', '1/2\"', 10.00, 0, NULL, 3.50, 0.00, 0.00, 'H'),
(73, 1, 2, 5, 6, 1, 'SA0017', 'CURVA 90 PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(74, 1, 2, 5, 6, 1, 'SA0018', 'CURVA 90 PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(75, 1, 2, 5, 6, 1, 'SA0019', 'REDUCCIÓN AGUA FRIA', '3/4\" - 1/2\"', 10.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(76, 1, 2, 5, 6, 1, 'SA0020', 'REDUCCIÓN AGUA FRIA', '1\" - 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(77, 1, 2, 5, 6, 1, 'SA0021', 'REDUCCIÓN AGUA FRIA', '1\" - 3/4\"', 300.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(78, 1, 2, 5, 6, 1, 'SA0022', 'TAPON HEMBRA S/R PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(79, 1, 2, 5, 6, 1, 'SA0023', 'TAPON HEMBRA S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(80, 1, 2, 5, 6, 1, 'SA0024', 'TAPON HEMBRA S/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(81, 1, 2, 5, 6, 1, 'SA0025', 'TAPON HEMBRA C/R PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(82, 1, 2, 5, 6, 1, 'SA0026', 'TAPON HEMBRA C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(83, 1, 2, 5, 6, 1, 'SA0027', 'TAPON HEMBRA C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(84, 1, 2, 5, 6, 1, 'SA0028', 'TAPON MACHO C/R PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(85, 1, 2, 5, 6, 1, 'SA0029', 'TAPON MACHO C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(86, 1, 2, 5, 6, 1, 'SA0030', 'TAPON MACHO C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(87, 1, 2, 5, 6, 1, 'SA0031', 'TAPON MACHO REX PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(88, 1, 2, 5, 6, 1, 'SA0032', 'TAPON MACHO REX PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(89, 1, 2, 5, 6, 1, 'SA0033', 'TAPON MACHO REX PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(90, 1, 2, 5, 6, 1, 'SA0034', 'TEE S/R PVC AGUA FRIA', '1/2\"', 20.00, 0, NULL, 2.80, 0.00, 0.00, 'H'),
(91, 1, 2, 5, 6, 1, 'SA0035', 'TEE S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(92, 1, 2, 5, 6, 1, 'SA0036', 'TEE S/R PVC AGUA FRIA', '1\"', 5.00, 0, NULL, 6.50, 0.00, 0.00, 'H'),
(93, 1, 2, 5, 6, 1, 'SA0037', 'TEE C/R PVC AGUA FRIA', '1/2\"', 10.00, 0, NULL, 2.80, 0.00, 0.00, 'H'),
(94, 1, 2, 5, 6, 1, 'SA0038', 'TEE C/R PVC AGUA FRIA', '3/4\"', 10.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(95, 1, 2, 5, 6, 1, 'SA0039', 'TEE C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(96, 1, 2, 5, 6, 1, 'SA0040', 'TEE REDUCCIÓN PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(97, 1, 2, 5, 6, 1, 'SA0041', 'TEE REDUCCIÓN PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(98, 1, 2, 5, 6, 1, 'SA0042', 'TEE REDUCCIÓN PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(99, 1, 2, 5, 6, 1, 'SA0043', 'UNIÓN S/R PVC AGUA FRIA', '1/2\"', 25.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(100, 1, 2, 5, 6, 1, 'SA0044', 'UNIÓN S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(101, 1, 2, 5, 6, 1, 'SA0045', 'UNIÓN S/R PVC AGUA FRIA', '1\"', 5.00, 0, NULL, 4.00, 0.00, 0.00, 'H'),
(102, 1, 2, 5, 6, 1, 'SA0046', 'UNIÓN C/R PVC AGUA FRIA', '1/2\"', 1.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(103, 1, 2, 5, 6, 1, 'SA0047', 'UNIÓN C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(104, 1, 2, 5, 6, 1, 'SA0048', 'UNIÓN C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(105, 1, 2, 5, 6, 1, 'SA0049', 'UNIÓN MIXTA PVC AGUA FRIA', '1/2\"', 8.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(106, 1, 2, 5, 6, 1, 'SA0050', 'UNIÓN MIXTA PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(107, 1, 2, 5, 6, 1, 'SA0051', 'UNIÓN MIXTA PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(108, 1, 2, 5, 6, 1, 'SA0052', 'UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2\"', 2.00, 0, NULL, 3.50, 0.00, 0.00, 'H'),
(109, 1, 2, 5, 6, 1, 'SA0053', 'UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4\"', 5.00, 0, NULL, 4.50, 0.00, 0.00, 'H'),
(110, 1, 2, 5, 6, 1, 'SA0054', 'UNIÓN UNIVERSAL PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(111, 1, 2, 5, 7, 1, 'SA0055', 'VÁLVULA S/R PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(112, 1, 2, 5, 7, 1, 'SA0056', 'VÁLVULA S/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(113, 1, 2, 5, 7, 1, 'SA0057', 'VÁLVULA S/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(114, 1, 2, 5, 6, 1, 'SA0058', 'VÁLVULA C/R PVC AGUA FRIA', '1/2\"', 9.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(115, 1, 2, 5, 6, 1, 'SA0059', 'VÁLVULA C/R PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(116, 1, 2, 5, 6, 1, 'SA0060', 'VÁLVULA C/R PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(117, 1, 2, 5, 8, 1, 'SA0061', 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2\"', 3.00, 0, NULL, 21.00, 0.00, 0.00, 'H'),
(118, 1, 2, 5, 8, 1, 'SA0062', 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(119, 1, 2, 5, 8, 1, 'SA0063', 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(120, 1, 2, 5, 6, 1, 'SA0064', 'NIPLE PVC AGUA FRIA', '1/2\" x 1\"', 50.00, 0, NULL, 1.00, 0.00, 0.00, 'H'),
(121, 1, 2, 5, 6, 1, 'SA0065', 'NIPLE PVC AGUA FRIA', '1/2\" x 1 1/2\"', 50.00, 0, NULL, 1.50, 0.00, 0.00, 'H'),
(122, 1, 2, 5, 6, 1, 'SA0066', 'NIPLE PVC AGUA FRIA', '1/2\" x 2\"', 50.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(123, 1, 2, 5, 6, 1, 'SA0067', 'NIPLE PVC AGUA FRIA', '1/2\" x 2 1/2\"', 50.00, 0, NULL, 2.30, 0.00, 0.00, 'H'),
(124, 1, 2, 5, 6, 1, 'SA0068', 'NIPLE PVC AGUA FRIA', '1/2\" x 3\"', 50.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(125, 1, 2, 5, 6, 1, 'SA0069', 'NIPLE PVC AGUA FRIA', '1/2\" x 4\"', 50.00, 0, NULL, 2.80, 0.00, 0.00, 'H'),
(126, 1, 2, 5, 6, 1, 'SA0070', 'NIPLE PVC AGUA FRIA', '3/4\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(127, 1, 2, 5, 6, 1, 'SA0071', 'NIPLE PVC AGUA FRIA', '3/4\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(128, 1, 2, 5, 6, 1, 'SA0072', 'NIPLE PVC AGUA FRIA', '3/4\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(129, 1, 2, 5, 6, 1, 'SA0073', 'NIPLE PVC AGUA FRIA', '1\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(130, 1, 2, 5, 6, 1, 'SA0074', 'NIPLE PVC AGUA FRIA', '1\" x 2\"', 50.00, 0, NULL, 1.50, 0.00, 0.00, 'H'),
(131, 1, 2, 5, 6, 1, 'SA0075', 'NIPLE PVC AGUA FRIA', '1\" x 3\"', 50.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(132, 1, 2, 5, 7, 1, 'SA0076', 'LLAVE DE TOMA PVC AGUA FRIA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(133, 1, 2, 5, 6, 1, 'SA0077', 'CODO 45 DESAGUE', '2\"', 280.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(134, 1, 2, 5, 6, 1, 'SA0078', 'CODO 45 DESAGUE', '3\"', 92.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(135, 1, 2, 5, 6, 1, 'SA0079', 'CODO 45 DESAGUE', '4\"', 114.00, 0, NULL, 8.00, 0.00, 0.00, 'H'),
(136, 1, 2, 5, 6, 1, 'SA0080', 'CODO 90 DESAGUE', '2\"', 216.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(137, 1, 2, 5, 6, 1, 'SA0081', 'CODO 90 DESAGUE', '3\"', 80.00, 0, NULL, 6.50, 0.00, 0.00, 'H'),
(138, 1, 2, 5, 6, 1, 'SA0082', 'CODO 90 DESAGUE', '4\"', 32.00, 0, NULL, 9.00, 0.00, 0.00, 'H'),
(139, 1, 2, 5, 6, 1, 'SA0083', 'CODO DE VENTILACIÓN DESAGUE', '4\" - 2\"', 30.00, 0, NULL, 11.00, 0.00, 0.00, 'H'),
(140, 1, 2, 5, 6, 1, 'SA0084', 'SOMBRERO DE VENTILACIÓN DESAGUE', '2\"', 0.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(141, 1, 2, 5, 6, 1, 'SA0085', 'SOMBRERO DE VENTILACIÓN DESAGUE', '3\"', 0.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(142, 1, 2, 5, 6, 1, 'SA0086', 'SOMBRERO DE VENTILACIÓN DESAGUE', '4\"', 0.00, 0, NULL, 18.00, 0.00, 0.00, 'H'),
(143, 1, 2, 5, 6, 1, 'SA0087', 'TAPÓN DESAGUE', '2\"', 0.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(144, 1, 2, 5, 6, 1, 'SA0088', 'TAPÓN DESAGUE', '3\"', 0.00, 0, NULL, 3.50, 0.00, 0.00, 'H'),
(145, 1, 2, 5, 6, 1, 'SA0089', 'TAPÓN DESAGUE', '4\"', 0.00, 0, NULL, 11.00, 0.00, 0.00, 'H'),
(146, 1, 2, 5, 6, 1, 'SA0090', 'TEE DESAGUE', '2\"', 200.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(147, 1, 2, 5, 6, 1, 'SA0091', 'TEE DESAGUE', '3\"', 0.00, 0, NULL, 11.00, 0.00, 0.00, 'H'),
(148, 1, 2, 5, 6, 1, 'SA0092', 'TEE DESAGUE', '4\"', 29.00, 0, NULL, 12.00, 0.00, 0.00, 'H'),
(149, 1, 2, 5, 6, 1, 'SA0093', 'TEE SANITARIA DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(150, 1, 2, 5, 6, 1, 'SA0094', 'TEE SANITARIA DESAGUE', '3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(151, 1, 2, 5, 6, 1, 'SA0095', 'TEE SANITARIA DESAGUE', '4\"', 12.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(152, 1, 2, 5, 6, 1, 'SA0096', 'TEE CON REDUCCIÓN DESAGUE', '3\" - 2\"', 0.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(153, 1, 2, 5, 6, 1, 'SA0097', 'TEE CON REDUCCIÓN DESAGUE', '4\" - 2\"', 0.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(154, 1, 2, 5, 6, 1, 'SA0098', 'TEE CON REDUCCIÓN DESAGUE', '4\" - 3\"', 0.00, 0, NULL, 16.00, 0.00, 0.00, 'H'),
(155, 1, 2, 5, 6, 1, 'SA0099', 'TEE DOBLE DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(156, 1, 2, 5, 6, 1, 'SA0100', 'TEE DOBLE DESAGUE', '3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(157, 1, 2, 5, 6, 1, 'SA0101', 'TEE DOBLE DESAGUE', '4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(158, 1, 2, 5, 6, 1, 'SA0102', 'TRAMPA DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(159, 1, 2, 5, 5, 1, 'SA0103', 'TRAMPA CORRUGADA DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(160, 1, 2, 5, 5, 1, 'SA0104', 'TRAMPA CORRUGADA DOBLE DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(161, 1, 2, 5, 6, 1, 'SA0105', 'REDUCCIÓN DESAGUE', '3\" - 2\"', 197.00, 0, NULL, 4.50, 0.00, 0.00, 'H'),
(162, 1, 2, 5, 6, 1, 'SA0106', 'REDUCCIÓN DESAGUE', '4\" - 2\"', 75.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(163, 1, 2, 5, 6, 1, 'SA0107', 'REDUCCIÓN DESAGUE', '4\" - 3\"', 100.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(164, 1, 2, 5, 6, 1, 'SA0108', 'YEE DESAGUE', '2\"', 144.00, 0, NULL, 5.50, 0.00, 0.00, 'H'),
(165, 1, 2, 5, 6, 1, 'SA0109', 'YEE DESAGUE', '3\"', 0.00, 0, NULL, 9.50, 0.00, 0.00, 'H'),
(166, 1, 2, 5, 6, 1, 'SA0110', 'YEE DESAGUE', '4\"', 19.00, 0, NULL, 16.00, 0.00, 0.00, 'H'),
(167, 1, 2, 5, 6, 1, 'SA0111', 'YEE CON REDUCCIÓN DESAGUE', '3\" - 2\"', 62.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(168, 1, 2, 5, 6, 1, 'SA0112', 'YEE CON REDUCCIÓN DESAGUE', '4\" - 2\"', 42.00, 0, NULL, 11.00, 0.00, 0.00, 'H'),
(169, 1, 2, 5, 6, 1, 'SA0113', 'YEE CON REDUCCIÓN DESAGUE', '4\" - 3\"', 25.00, 0, NULL, 13.00, 0.00, 0.00, 'H'),
(170, 1, 2, 5, 6, 1, 'SA0114', 'YEE DOBLE DESAGUE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(171, 1, 2, 5, 6, 1, 'SA0115', 'YEE DOBLE DESAGUE', '3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(172, 1, 2, 5, 6, 1, 'SA0116', 'YEE DOBLE DESAGUE', '4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(173, 1, 2, 5, 6, 1, 'SA0117', 'SIFON  - LAVADERO ALUMINIO DESAGUE', '3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(174, 1, 2, 5, 6, 1, 'SA0118', 'UNIÓN DESAGUE', '2\"', 0.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(175, 1, 2, 5, 6, 1, 'SA0119', 'UNIÓN DESAGUE', '3\"', 0.00, 0, NULL, 4.00, 0.00, 0.00, 'H'),
(176, 1, 2, 5, 6, 1, 'SA0120', 'UNIÓN DESAGUE', '4\"', 0.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(177, 1, 2, 5, 6, 1, 'SA0121', 'REDUCCIÓN EXCENTRICA DESAGUE ', '4\" - 2\"', 0.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(178, 1, 2, 5, 6, 1, 'SA0122', 'ADAPTADOR CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(179, 1, 2, 5, 6, 1, 'SA0123', 'ADAPTADOR CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(180, 1, 2, 5, 6, 1, 'SA0124', 'CODO 45 CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(181, 1, 2, 5, 6, 1, 'SA0125', 'CODO 45 CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(182, 1, 2, 5, 6, 1, 'SA0126', 'CODO 90 CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(183, 1, 2, 5, 6, 1, 'SA0127', 'CODO 90 CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(184, 1, 2, 5, 6, 1, 'SA0128', 'REDUCCIÓN CPVC', '3/4\" - 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(185, 1, 2, 5, 6, 1, 'SA0129', 'TEE CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(186, 1, 2, 5, 6, 1, 'SA0130', 'TEE CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(187, 1, 2, 5, 6, 1, 'SA0131', 'UNIÓN CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(188, 1, 2, 5, 6, 1, 'SA0132', 'UNIÓN CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(189, 1, 2, 5, 6, 1, 'SA0133', 'UNIÓN UNIVERSAL CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(190, 1, 2, 5, 6, 1, 'SA0134', 'UNIÓN UNIVERSAL CPVC', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(191, 1, 2, 5, 9, 1, 'SA0135', 'VALVULA CPVC', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(192, 1, 3, 5, 6, 1, 'EA0001', 'CURVA LUZ', '3/4\"', 959.00, 0, NULL, 0.70, 0.00, 0.00, 'H'),
(193, 1, 3, 5, 6, 1, 'EA0002', 'CURVA LUZ', '1\"', 76.00, 0, NULL, 1.50, 0.00, 0.00, 'H'),
(194, 1, 3, 5, 6, 1, 'EA0003', 'CONECTOR LUZ', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(195, 1, 3, 5, 6, 1, 'EA0004', 'CONECTOR LUZ', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(196, 1, 3, 5, 6, 1, 'EA0005', 'UNIÓN LUZ', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(197, 1, 3, 5, 6, 1, 'EA0006', 'UNIÓN LUZ', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(198, 1, 3, 5, 6, 1, 'EA0007', 'CAJA DE PASE RECTANGULAR LUZ', '1', 278.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(199, 1, 3, 5, 6, 1, 'EA0008', 'CAJA DE PASE OCTOGONAL LUZ', '1', 56.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(200, 1, 3, 5, 6, 1, 'EA0009', 'CAJA DE PASE OCTOGONAL LUZ', '2', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(201, 1, 2, 5, 10, 1, 'SA0136', 'CODO 45 GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(202, 1, 2, 5, 10, 1, 'SA0137', 'CODO 45 GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(203, 1, 2, 5, 10, 1, 'SA0138', 'CODO 45 GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(204, 1, 2, 5, 10, 1, 'SA0139', 'CODO 90 GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(205, 1, 2, 5, 10, 1, 'SA0140', 'CODO 90 GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(206, 1, 2, 5, 10, 1, 'SA0141', 'CODO 90 GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(207, 1, 2, 5, 10, 1, 'SA0142', 'UNIÓN GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(208, 1, 2, 5, 10, 1, 'SA0143', 'UNIÓN GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(209, 1, 2, 5, 10, 1, 'SA0144', 'UNIÓN GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(210, 1, 2, 5, 10, 1, 'SA0145', 'NIPLE GALVANIZADO', '1/2\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(211, 1, 2, 5, 10, 1, 'SA0146', 'NIPLE GALVANIZADO', '1/2\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(212, 1, 2, 5, 10, 1, 'SA0147', 'NIPLE GALVANIZADO', '1/2\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(213, 1, 2, 5, 10, 1, 'SA0148', 'NIPLE GALVANIZADO', '1/2\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(214, 1, 2, 5, 10, 1, 'SA0149', 'NIPLE GALVANIZADO', '1/2\" x 4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(215, 1, 2, 5, 10, 1, 'SA0150', 'NIPLE GALVANIZADO', '3/4\" x 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(216, 1, 2, 5, 10, 1, 'SA0151', 'NIPLE GALVANIZADO', '3/4\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(217, 1, 2, 5, 10, 1, 'SA0152', 'NIPLE GALVANIZADO', '3/4\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(218, 1, 2, 5, 10, 1, 'SA0153', 'NIPLE GALVANIZADO', '3/4\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(219, 1, 2, 5, 10, 1, 'SA0154', 'NIPLE GALVANIZADO', '3/4\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(220, 1, 2, 5, 10, 1, 'SA0155', 'NIPLE GALVANIZADO', '1\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(221, 1, 2, 5, 10, 1, 'SA0156', 'NIPLE GALVANIZADO', '1\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(222, 1, 2, 5, 10, 1, 'SA0157', 'NIPLE GALVANIZADO', '1\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(223, 1, 2, 5, 10, 1, 'SA0158', 'NIPLE GALVANIZADO', '1\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(224, 1, 2, 5, 10, 1, 'SA0159', 'NIPLE GALVANIZADO', '1\" x 4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(225, 1, 2, 5, 10, 1, 'SA0160', 'UNIÓN UNIVERSAL GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(226, 1, 2, 5, 10, 1, 'SA0161', 'UNIÓN UNIVERSAL GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(227, 1, 2, 5, 10, 1, 'SA0162', 'UNIÓN UNIVERSAL GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(228, 1, 2, 5, 10, 1, 'SA0163', 'TEE GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(229, 1, 2, 5, 10, 1, 'SA0164', 'TEE GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(230, 1, 2, 5, 10, 1, 'SA0165', 'TEE GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(231, 1, 2, 5, 10, 1, 'SA0166', 'TAPÓN MACHO GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(232, 1, 2, 5, 10, 1, 'SA0167', 'TAPÓN MACHO GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(233, 1, 2, 5, 10, 1, 'SA0168', 'TAPÓN MACHO GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(234, 1, 2, 5, 10, 1, 'SA0169', 'TAPÓN HEMBRA GALVANIZADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(235, 1, 2, 5, 10, 1, 'SA0170', 'TAPÓN HEMBRA GALVANIZADO', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(236, 1, 2, 5, 10, 1, 'SA0171', 'TAPÓN HEMBRA GALVANIZADO', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(237, 1, 2, 5, 10, 1, 'SA0172', 'ADAPTADOR BUSHIN CORTO BRONCE', '1/2\"', -15.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(238, 1, 2, 5, 10, 1, 'SA0173', 'ADAPTADOR BUSHIN LARGO BRONCE', '1/2\"', -68.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(239, 1, 2, 5, 10, 1, 'SA0174', 'CODO 45 BRONCE', '1/2\"', 4.00, 0, NULL, 4.00, 0.00, 0.00, 'H'),
(240, 1, 2, 5, 10, 1, 'SA0175', 'CODO 45 BRONCE', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(241, 1, 2, 5, 10, 1, 'SA0176', 'CODO 45 BRONCE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(242, 1, 2, 5, 10, 1, 'SA0177', 'CODO 90 BRONCE', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(243, 1, 2, 5, 10, 1, 'SA0178', 'CODO 90 BRONCE', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(244, 1, 2, 5, 10, 1, 'SA0179', 'CODO 90 BRONCE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(245, 1, 2, 5, 10, 1, 'SA0180', 'UNIÓN BRONCE', '1/2\"', 5.00, 0, NULL, 4.00, 0.00, 0.00, 'H'),
(246, 1, 2, 5, 10, 1, 'SA0181', 'UNIÓN BRONCE', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(247, 1, 2, 5, 10, 1, 'SA0182', 'UNIÓN BRONCE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(248, 1, 2, 5, 10, 1, 'SA0183', 'NIPLE BRONCE', '1/2\" X 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(249, 1, 2, 5, 10, 1, 'SA0184', 'NIPLE BRONCE', '1/2\" X 2\"', 5.00, 0, NULL, 3.00, 0.00, 0.00, 'H'),
(250, 1, 2, 5, 10, 1, 'SA0185', 'NIPLE BRONCE', '1/2\" X 3\"', 5.00, 0, NULL, 4.50, 0.00, 0.00, 'H'),
(251, 1, 2, 5, 10, 1, 'SA0186', 'TEE BRONCE', '1/2\"', 5.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(252, 1, 2, 5, 10, 1, 'SA0187', 'TEE BRONCE', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(253, 1, 2, 5, 10, 1, 'SA0188', 'TEE BRONCE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(254, 1, 2, 5, 11, 1, 'SA0189', 'VALVULA CHECK BRONCE', '1/2\"', 2.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(255, 1, 2, 5, 11, 1, 'SA0190', 'VALVULA CHECK BRONCE', '3/4\"', 1.00, 0, NULL, 28.00, 0.00, 0.00, 'H'),
(256, 1, 2, 5, 11, 1, 'SA0191', 'VALVULA CHECK BRONCE', '1\"', 1.00, 0, NULL, 40.00, 0.00, 0.00, 'H'),
(257, 1, 2, 5, 11, 1, 'SA0192', 'CANASTILLA BRONCE', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(258, 1, 2, 5, 11, 1, 'SA0193', 'CANASTILLA BRONCE', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(259, 1, 2, 5, 11, 1, 'SA0194', 'CANASTILLA BRONCE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(260, 1, 2, 6, 12, 1, 'SC0001', 'CAÑO CON PASE PARA LAVADERO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(261, 1, 2, 6, 13, 1, 'SC0002', 'CAÑO DORADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(262, 1, 2, 6, 13, 1, 'SC0003', 'CAÑO PLATEADO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(263, 1, 2, 6, 14, 1, 'SC0004', 'CAÑO ASA ROJA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(264, 1, 2, 7, 15, 1, 'SL0001', 'LLAVE DE DUCHA', '1/2\"', 3.00, 0, NULL, 30.00, 0.00, 0.00, 'H'),
(265, 1, 2, 5, 16, 1, 'SA0195', 'SUMIDERO', '2\"', 0.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(266, 1, 2, 5, 16, 1, 'SA0196', 'SUMIDERO', '3\"', 3.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(267, 1, 2, 5, 16, 1, 'SA0197', 'SUMIDERO', '4\"', 3.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(268, 1, 2, 5, 16, 1, 'SA0198', 'SUMIDERO', '6\"', 1.00, 0, NULL, 25.00, 0.00, 0.00, 'H'),
(269, 1, 2, 5, 16, 1, 'SA0199', 'TAPA DE REGISTRO', '2\"', 1.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(270, 1, 2, 5, 16, 1, 'SA0200', 'TAPA DE REGISTRO', '3\"', 2.00, 0, NULL, 8.00, 0.00, 0.00, 'H'),
(271, 1, 2, 5, 16, 1, 'SA0201', 'TAPA DE REGISTRO', '4\"', 2.00, 0, NULL, 11.00, 0.00, 0.00, 'H'),
(272, 1, 2, 5, 16, 1, 'SA0202', 'TAPÓN REJILLA', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(273, 1, 2, 5, 16, 1, 'SA0203', 'TAPÓN REJILLA', '3\"', 3.00, 0, NULL, 7.50, 0.00, 0.00, 'H'),
(274, 1, 2, 5, 16, 1, 'SA0204', 'TAPÓN REJILLA', '4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(275, 1, 2, 5, 17, 1, 'SA0205', 'TUBO DE ABASTO LAVADERO', '1/2\" - 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(276, 1, 2, 5, 17, 1, 'SA0206', 'TUBO DE ABASTO INODORO', '3/4\" - 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(277, 1, 2, 5, 17, 1, 'SA0207', 'TEFLON', 'AMARILLO', 10.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(278, 1, 2, 5, 17, 1, 'SA0208', 'TEFLON', 'ROJO', 8.00, 0, NULL, 1.50, 0.00, 0.00, 'H'),
(279, 1, 3, 8, 18, 1, 'EE0001', 'TRIPLE BLANCO', '4 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(280, 1, 3, 8, 18, 1, 'EE0002', 'TRIPLE BLANCO', '5 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(281, 1, 3, 8, 18, 1, 'EE0003', 'TRIPLE BLANCO', '6 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(282, 1, 3, 8, 18, 1, 'EE0004', 'TRIPLE BLANCO', '8 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(283, 1, 3, 8, 18, 1, 'EE0005', 'TRIPLE BLANCO', '10 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(284, 1, 3, 8, 18, 1, 'EE0006', 'TRIPLE ANARANJADO', '4 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(285, 1, 3, 8, 18, 1, 'EE0007', 'TRIPLE ANARANJADO', '5 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(286, 1, 3, 8, 18, 1, 'EE0008', 'TRIPLE ANARANJADO', '6 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(287, 1, 3, 8, 18, 1, 'EE0009', 'TRIPLE ANARANJADO', '8 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(288, 1, 3, 8, 18, 1, 'EE0010', 'TRIPLE ANARANJADO', '10 METROS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(289, 1, 3, 5, 19, 1, 'EA0010', 'TOMACORRIENTE AL AIRE SAPITO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(290, 1, 3, 5, 19, 1, 'EA0011', 'TOMACORRIENTE AL AIRE', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(291, 1, 3, 5, 19, 1, 'EA0012', 'TOMACORRIENTE AL AIRE', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(292, 1, 3, 5, 19, 1, 'EA0013', 'TOMACORRIENTE AL AIRE', 'TRIPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(293, 1, 3, 5, 19, 1, 'EA0014', 'TOMACORRIENTE AL AIRE', 'CUADRUPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(294, 1, 3, 5, 19, 1, 'EA0015', 'TOMACORRIENTE AL AIRE', 'QUINTUPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(295, 1, 3, 5, 19, 1, 'EA0016', 'TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(296, 1, 3, 5, 19, 1, 'EA0017', 'TOMACORRIENTE EMPOTRADO', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(297, 1, 3, 5, 19, 1, 'EA0018', 'TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(298, 1, 3, 5, 19, 1, 'EA0019', 'TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(299, 1, 3, 5, 19, 1, 'EA0020', 'TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(300, 1, 3, 5, 19, 1, 'EA0021', 'TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(301, 1, 3, 5, 19, 1, 'EA0022', 'INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(302, 1, 3, 5, 19, 1, 'EA0023', 'INTERRUPTOR EMPOTRADO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(303, 1, 3, 5, 19, 1, 'EA0024', 'INTERRUPTOR EMPOTRADO', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(304, 1, 3, 5, 20, 1, 'EA0025', 'INTERRUPTOR CONMUTADOR', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(305, 1, 3, 5, 20, 1, 'EA0026', 'INTERRUPTOR CONMUTADOR', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(306, 1, 3, 5, 20, 1, 'EA0027', 'INTERRUPTOR CONMUTADOR', 'TRIPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(307, 1, 3, 5, 20, 1, 'EA0028', 'TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(308, 1, 3, 5, 20, 1, 'EA0029', 'TOMACORRIENTE EMPOTRADO', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(309, 1, 3, 5, 20, 1, 'EA0030', 'TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(310, 1, 3, 5, 20, 1, 'EA0031', 'TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(311, 1, 3, 5, 20, 1, 'EA0032', 'TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(312, 1, 3, 5, 20, 1, 'EA0033', 'TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(313, 1, 3, 5, 20, 1, 'EA0034', 'INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(314, 1, 3, 5, 20, 1, 'EA0035', 'INTERRUPTOR EMPOTRADO', 'SIMPLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(315, 1, 3, 5, 20, 1, 'EA0036', 'INTERRUPTOR EMPOTRADO', 'DOBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(316, 1, 3, 5, 19, 1, 'EA0037', 'SOCKET', 'SIMBLE', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(317, 1, 3, 5, 19, 1, 'EA0038', 'SOCKET', 'PLAFON', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(318, 1, 3, 5, 19, 1, 'EA0039', 'SOCKET', 'OVALADO', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(319, 1, 3, 5, 20, 1, 'EA0040', 'SOCKET', 'PLAFON', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(320, 1, 3, 5, 20, 1, 'EA0041', 'SOCKET', 'OVALADO', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(321, 1, 3, 9, 21, 1, 'EL0001', 'FOCO LED', '5 W', 1.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(322, 1, 3, 9, 21, 1, 'EL0002', 'FOCO LED', '7 W', 1.00, 0, NULL, 8.00, 0.00, 0.00, 'H'),
(323, 1, 3, 9, 21, 1, 'EL0003', 'FOCO LED', '9 W', 2.00, 0, NULL, 9.00, 0.00, 0.00, 'H'),
(324, 1, 3, 9, 21, 1, 'EL0004', 'FOCO LED', '11 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(325, 1, 3, 9, 21, 1, 'EL0005', 'FOCO LED TIPO PLATO', '11 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(326, 1, 3, 9, 21, 1, 'EL0006', 'FOCO LED TIPO PLATO', '20 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(327, 1, 3, 9, 21, 1, 'EL0007', 'FOCO LED TIPO GLOBO', '11 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(328, 1, 3, 9, 21, 1, 'EL0008', 'FOCO LED TIPO GLOBO', '20 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(329, 1, 3, 10, 22, 1, 'EC0001', 'CABLE 7 HIJOS', '14 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(330, 1, 3, 10, 22, 1, 'EC0002', 'CABLE 7 HIJOS', '12 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(331, 1, 3, 10, 23, 1, 'EC0003', 'CABLE MELLIZO', '14 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(332, 1, 3, 10, 23, 1, 'EC0004', 'CABLE MELLIZO', '16 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(333, 1, 3, 10, 23, 1, 'EC0005', 'CABLE MELLIZO', '18 W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(334, 1, 3, 11, 24, 1, 'EM0001', 'TERMOMAGNETICO', '16 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(335, 1, 3, 11, 24, 1, 'EM0002', 'TERMOMAGNETICO', '20 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(336, 1, 3, 11, 24, 1, 'EM0003', 'TERMOMAGNETICO', '25 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(337, 1, 3, 11, 24, 1, 'EM0004', 'TERMOMAGNETICO', '32 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(338, 1, 3, 11, 20, 1, 'EM0005', 'TERMOMAGNETICO', '16 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(339, 1, 3, 11, 20, 1, 'EM0006', 'TERMOMAGNETICO', '20 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(340, 1, 3, 11, 20, 1, 'EM0007', 'TERMOMAGNETICO', '25 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(341, 1, 3, 11, 20, 1, 'EM0008', 'TERMOMAGNETICO', '32 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(342, 1, 3, 11, 20, 1, 'EM0009', 'DIFERENCIAL', '16 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(343, 1, 3, 11, 20, 1, 'EM0010', 'DIFERENCIAL', '20 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(344, 1, 3, 11, 20, 1, 'EM0011', 'DIFERENCIAL', '25 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(345, 1, 3, 11, 20, 1, 'EM0012', 'DIFERENCIAL', '32 A', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(346, 1, 3, 12, 16, 1, 'EJ0001', 'CAJA DE CUCHILLA', '2 POLOS', 0.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(347, 1, 3, 12, 16, 1, 'EJ0002', 'CAJA DE CUCHILLA', '4 POLOS', -3.00, 0, NULL, 9.00, 0.00, 0.00, 'H'),
(348, 1, 3, 12, 16, 1, 'EJ0003', 'CAJA DE CUCHILLA', '8 POLOS', 2.00, 0, NULL, 12.00, 0.00, 0.00, 'H'),
(349, 1, 3, 12, 16, 1, 'EJ0004', 'CAJA DE CUCHILLA', '12 POLOS', -3.00, 0, NULL, 17.00, 0.00, 0.00, 'H'),
(350, 1, 3, 12, 16, 1, 'EJ0005', 'CAJA DE CUCHILLA', '18 POLOS', 0.00, 0, NULL, 26.00, 0.00, 0.00, 'H'),
(351, 1, 3, 12, 16, 1, 'EJ0006', 'CAJA DE PASE', '10 X 10', 2.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(352, 1, 3, 12, 16, 1, 'EJ0007', 'CAJA DE PASE', '15 X 15', 2.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(353, 1, 3, 12, 16, 1, 'EJ0008', 'CAJA DE PASE', '20 X 20', 0.00, 0, NULL, 15.00, 0.00, 0.00, 'H'),
(354, 1, 4, 13, 25, 1, 'DC0001', 'DISCO DE FIERRO', '4 1/2\"', 22.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(355, 1, 4, 13, 25, 1, 'DC0002', 'DISCO DE FIERRO', '7 1/4\"', 14.00, 0, NULL, 9.00, 0.00, 0.00, 'H'),
(356, 1, 4, 13, 25, 1, 'DC0003', 'DISCO DE FIERRO', '9 5/64\"', 25.00, 0, NULL, 12.00, 0.00, 0.00, 'H'),
(357, 1, 4, 13, 25, 1, 'DC0004', 'DISCO DE FIERRO TRENZADORA', '14\"', 8.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(358, 1, 4, 13, 26, 1, 'DC0005', 'DISCO DE FIERRO', '4 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(359, 1, 4, 13, 26, 1, 'DC0006', 'DISCO DE FIERRO', '7 1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(360, 1, 4, 13, 26, 1, 'DC0007', 'DISCO DE FIERRO', '9 5/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(361, 1, 4, 13, 26, 1, 'DC0008', 'DISCO DE FIERRO TRENZADORA', '14\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(362, 1, 4, 13, 27, 1, 'DC0009', 'DISCO DE MADERA 24 T', '4 1/2\"', 3.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(363, 1, 4, 13, 27, 1, 'DC0010', 'DISCO DE MADERA 24 T', '7 1/4\"', 2.00, 0, NULL, 16.00, 0.00, 0.00, 'H'),
(364, 1, 4, 13, 27, 1, 'DC0011', 'DISCO DE MADERA 40 T', '4 1/2\"', 2.00, 0, NULL, 12.00, 0.00, 0.00, 'H'),
(365, 1, 4, 13, 27, 1, 'DC0012', 'DISCO DE MADERA 40 T', '7 1/4\"', 1.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(366, 1, 4, 13, 28, 1, 'DC0013', 'DISCO DE MADERA 24 T', '4 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(367, 1, 4, 13, 28, 1, 'DC0014', 'DISCO DE MADERA 24 T', '7 1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(368, 1, 4, 13, 28, 1, 'DC0015', 'DISCO DE MADERA 40 T', '4 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(369, 1, 4, 13, 28, 1, 'DC0016', 'DISCO DE MADERA 40 T', '7 1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(370, 1, 4, 13, 27, 1, 'DC0017', 'DISCO DE CONCRETO', '4 1/2\"', 2.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(371, 1, 4, 13, 27, 1, 'DC0018', 'DISCO DE CONCRETO', '7 1/4\"', 0.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(372, 1, 4, 13, 27, 1, 'DC0019', 'DISCO DE CERAMICA', '4 1/2\"', 3.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(373, 1, 4, 13, 27, 1, 'DC0020', 'DISCO DE CERAMICA', '7 1/4\"', -1.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(374, 1, 4, 14, 26, 1, 'DD0001', 'DISCO DE FIERRO', '4 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(375, 1, 4, 15, 26, 1, 'DP0001', 'DISCO DE FIERRO', '4 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(376, 1, 4, 16, 29, 1, 'DB0001', 'BROCA DE FIERRO', '5/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(377, 1, 4, 16, 29, 1, 'DB0002', 'BROCA DE FIERRO', '9/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(378, 1, 4, 16, 29, 1, 'DB0003', 'BROCA DE FIERRO', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(379, 1, 4, 16, 29, 1, 'DB0004', 'BROCA DE FIERRO', '7/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(380, 1, 4, 16, 29, 1, 'DB0005', 'BROCA DE FIERRO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(381, 1, 4, 16, 29, 1, 'DB0006', 'BROCA DE FIERRO', '5/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(382, 1, 4, 16, 29, 1, 'DB0007', 'BROCA DE FIERRO', '7/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(383, 1, 4, 16, 29, 1, 'DB0008', 'BROCA DE FIERRO', '13/34\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(384, 1, 4, 16, 29, 1, 'DB0009', 'BROCA DE FIERRO', '3/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(385, 1, 4, 16, 29, 1, 'DB0010', 'BROCA DE FIERRO', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(386, 1, 4, 16, 29, 1, 'DB0011', 'BROCA DE FIERRO', '11/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(387, 1, 4, 16, 29, 1, 'DB0012', 'BROCA DE FIERRO', '7/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(388, 1, 4, 16, 29, 1, 'DB0013', 'BROCA DE FIERRO', '3/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(389, 1, 4, 16, 29, 1, 'DB0014', 'BROCA DE FIERRO', '5/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(390, 1, 4, 16, 29, 1, 'DB0015', 'BROCA DE FIERRO', '1/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(391, 1, 4, 16, 29, 1, 'DB0016', 'BROCA DE FIERRO', '3/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(392, 1, 4, 16, 29, 1, 'DB0017', 'BROCA DE FIERRO', '1/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(393, 1, 4, 16, 29, 1, 'DB0018', 'BROCA DE FIERRO', '1/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(394, 1, 4, 16, 29, 1, 'DB0019', 'BROCA DE FIERRO', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(395, 1, 4, 16, 29, 1, 'DB0020', 'BROCA DE FIERRO', '9/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(396, 1, 4, 16, 30, 1, 'DB0021', 'BROCA DE MADERA', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(397, 1, 4, 16, 30, 1, 'DB0022', 'BROCA DE MADERA', '5/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(398, 1, 4, 16, 30, 1, 'DB0023', 'BROCA DE MADERA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(399, 1, 4, 16, 30, 1, 'DB0024', 'BROCA DE MADERA', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(400, 1, 4, 16, 30, 1, 'DB0025', 'BROCA DE MADERA', '3/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(401, 1, 4, 16, 30, 1, 'DB0026', 'BROCA DE MADERA', '7/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(402, 1, 4, 16, 30, 1, 'DB0027', 'BROCA DE MADERA', '3/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(403, 1, 4, 16, 30, 1, 'DB0028', 'BROCA DE MADERA', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(404, 1, 4, 16, 29, 1, 'DB0029', 'BROCA DE CONCRETO', '9/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(405, 1, 4, 16, 29, 1, 'DB0030', 'BROCA DE CONCRETO', '7/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(406, 1, 4, 16, 29, 1, 'DB0031', 'BROCA DE CONCRETO', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(407, 1, 4, 16, 29, 1, 'DB0032', 'BROCA DE CONCRETO', '7/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(408, 1, 4, 16, 29, 1, 'DB0033', 'BROCA DE CONCRETO', '3/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(409, 1, 4, 16, 29, 1, 'DB0034', 'BROCA DE CONCRETO', '5/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(410, 1, 4, 16, 29, 1, 'DB0035', 'BROCA DE CONCRETO', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(411, 1, 5, 17, 19, 1, 'PT0001', 'TORNILLO TIRAFON', '1/4\" X 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(412, 1, 5, 17, 19, 1, 'PT0002', 'TORNILLO TIRAFON', '1/4\" X 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(413, 1, 5, 17, 19, 1, 'PT0003', 'TORNILLO TIRAFON', '1/4\" X 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(414, 1, 5, 17, 19, 1, 'PT0004', 'TORNILLO TIRAFON', '1/4\" X 4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(415, 1, 5, 17, 19, 1, 'PT0005', 'TORNILLO TIRAFON', '1/4\" X 5\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(416, 1, 5, 17, 19, 1, 'PT0006', 'TORNILLO SPACK', '6\" X 8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(417, 1, 5, 17, 19, 1, 'PT0007', 'TORNILLO SPACK', '5\" X 7\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(418, 1, 5, 17, 19, 1, 'PT0008', 'TORNILLO SPACK', '3.5\" X 16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(419, 1, 5, 17, 19, 1, 'PT0009', 'TORNILLO SPACK', '3.5\" X 20\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(420, 1, 5, 17, 19, 1, 'PT0010', 'TORNILLO SPACK', '3.5\" X 40\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(421, 1, 5, 17, 19, 1, 'PT0011', 'TORNILLO SPACK', '3.5\" X 59\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(422, 1, 5, 17, 19, 1, 'PT0012', 'TORNILLO SPACK', '3\" X 16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(423, 1, 5, 17, 19, 1, 'PT0013', 'TORNILLO SPACK', '4\" X 20\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(424, 1, 5, 17, 19, 1, 'PT0014', 'TORNILLO SPACK', '4\" X 25\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(425, 1, 5, 17, 19, 1, 'PT0015', 'TORNILLO SPACK', '4\" X 30\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(426, 1, 5, 17, 19, 1, 'PT0016', 'TORNILLO SPACK', '4\" X 40\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(427, 1, 5, 17, 19, 1, 'PT0017', 'TORNILLO SPACK', '4\" X 50\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(428, 1, 5, 17, 19, 1, 'PT0018', 'TORNILLO SPACK', '5\" X 40\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(429, 1, 5, 17, 19, 1, 'PT0019', 'TORNILLO SPACK', '5\" X 50\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(430, 1, 5, 17, 19, 1, 'PT0020', 'TORNILLO SPACK', '5\" X 60\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(431, 1, 5, 17, 19, 1, 'PT0021', 'TORNILLO SPACK', '5\" X 80\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(432, 1, 5, 17, 19, 1, 'PT0022', 'TORNILLO AUTOPERFORANTE', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(433, 1, 5, 17, 19, 1, 'PT0023', 'TORNILLO AUTOPERFORANTE', '1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(434, 1, 5, 17, 19, 1, 'PT0024', 'TORNILLO AUTOPERFORANTE', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(435, 1, 5, 17, 19, 1, 'PT0025', 'TORNILLO AUTOPERFORANTE', '2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(436, 1, 5, 17, 19, 1, 'PT0026', 'TORNILLO AUTOROSCANTE STOVE BOLT', '6\" X 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(437, 1, 5, 17, 19, 1, 'PT0027', 'TORNILLO AUTOROSCANTE STOVE BOLT', '6\" X 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(438, 1, 5, 18, 19, 1, 'PP0001', 'PERNO HEXAGONAL', '1/4\" X 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(439, 1, 5, 18, 19, 1, 'PP0002', 'PERNO HEXAGONAL', '1/4\" X 3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(440, 1, 5, 18, 19, 1, 'PP0003', 'PERNO HEXAGONAL', '1/4\" X 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(441, 1, 5, 18, 19, 1, 'PP0004', 'PERNO HEXAGONAL', '1/4\" X 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(442, 1, 5, 18, 19, 1, 'PP0005', 'PERNO HEXAGONAL', '1/4\" X 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(443, 1, 5, 18, 19, 1, 'PP0006', 'PERNO HEXAGONAL', '1/4\" X 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(444, 1, 5, 18, 19, 1, 'PP0007', 'PERNO HEXAGONAL', '1/4\" X 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(445, 1, 5, 18, 19, 1, 'PP0008', 'PERNO HEXAGONAL', '1/4\" X 3 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(446, 1, 5, 18, 19, 1, 'PP0009', 'PERNO HEXAGONAL', '5/16\" x 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(447, 1, 5, 18, 19, 1, 'PP0010', 'PERNO HEXAGONAL', '5/16\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(448, 1, 5, 18, 19, 1, 'PP0011', 'PERNO HEXAGONAL', '5/16\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(449, 1, 5, 18, 19, 1, 'PP0012', 'PERNO HEXAGONAL', '5/16\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(450, 1, 5, 18, 19, 1, 'PP0013', 'PERNO HEXAGONAL', '5/16\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(451, 1, 5, 18, 19, 1, 'PP0014', 'PERNO HEXAGONAL', '5/16\" x 3 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(452, 1, 5, 18, 19, 1, 'PP0015', 'PERNO HEXAGONAL', '3/8\" x 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(453, 1, 5, 18, 19, 1, 'PP0016', 'PERNO HEXAGONAL', '3/8\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(454, 1, 5, 18, 19, 1, 'PP0017', 'PERNO HEXAGONAL', '3/8\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(455, 1, 5, 18, 19, 1, 'PP0018', 'PERNO HEXAGONAL', '3/8\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(456, 1, 5, 18, 19, 1, 'PP0019', 'PERNO HEXAGONAL', '1/2\" x 1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(457, 1, 5, 18, 19, 1, 'PP0020', 'PERNO HEXAGONAL', '1/2\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(458, 1, 5, 18, 19, 1, 'PP0021', 'PERNO HEXAGONAL', '1/2\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(459, 1, 5, 18, 19, 1, 'PP0022', 'PERNO COCHE', '1/4\" x 1 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(460, 1, 5, 18, 19, 1, 'PP0023', 'PERNO COCHE', '1/4\" x 2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(461, 1, 5, 18, 19, 1, 'PP0024', 'PERNO COCHE', '1/4\" x 2 1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(462, 1, 5, 18, 19, 1, 'PP0025', 'PERNO COCHE', '1/4\" x 3\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(463, 1, 5, 18, 19, 1, 'PP0026', 'PERNO COCHE', '1/4\" x 4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(464, 1, 5, 19, 19, 1, 'PR0001', 'MADERA', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(465, 1, 5, 19, 19, 1, 'PR0002', 'MADERA', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(466, 1, 5, 19, 19, 1, 'PR0003', 'MADERA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(467, 1, 5, 19, 19, 1, 'PR0004', 'MADERA', '5/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(468, 1, 5, 19, 19, 1, 'PR0005', 'PLASTICO', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(469, 1, 5, 19, 19, 1, 'PR0006', 'PLASTICO', '5/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(470, 1, 5, 19, 19, 1, 'PR0007', 'PLASTICO', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(471, 1, 5, 19, 19, 1, 'PR0008', 'PLASTICO', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(472, 1, 5, 19, 19, 1, 'PR0009', 'ARANDELA', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(473, 1, 5, 19, 19, 1, 'PR0010', 'ARANDELA', '5/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(474, 1, 5, 19, 19, 1, 'PR0011', 'ARANDELA', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(475, 1, 5, 19, 19, 1, 'PR0012', 'ARANDELA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(476, 1, 5, 19, 19, 1, 'PR0013', 'TUERCA', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(477, 1, 5, 19, 19, 1, 'PR0014', 'TUERCA', '5/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(478, 1, 5, 19, 19, 1, 'PR0015', 'TUERCA', '3/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(479, 1, 5, 19, 19, 1, 'PR0016', 'TUERCA', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(480, 1, 6, 20, 31, 1, 'HE0001', 'AMOLADORA', ' ', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(481, 1, 6, 20, 31, 1, 'HE0002', 'TALADRO', '650W', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(482, 1, 6, 21, 16, 1, 'HM0001', 'HUINCHA', '5M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(483, 1, 6, 21, 16, 1, 'HM0002', 'HUINCHA', '10M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(484, 1, 6, 21, 19, 1, 'HM0003', 'HUINCHA', '5M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(485, 1, 6, 21, 19, 1, 'HM0004', 'HUINCHA', '10M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(486, 1, 6, 21, 32, 1, 'HM0005', 'HUINCHA PASACABLE METAL', '10M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(487, 1, 6, 21, 32, 1, 'HM0006', 'HUINCHA PASACABLE METAL', '15M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(488, 1, 6, 21, 32, 1, 'HM0007', 'HUINCHA PASACABLE METAL', '20M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(489, 1, 6, 21, 32, 1, 'HM0008', 'HUINCHA PASACABLE PLASTICO', '10M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(490, 1, 6, 21, 32, 1, 'HM0009', 'HUINCHA PASACABLE PLASTICO', '15M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(491, 1, 6, 21, 32, 1, 'HM0010', 'HUINCHA PASACABLE PLASTICO', '20M', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(492, 1, 6, 21, 19, 1, 'HM0011', 'GUANTE TELEGOMA AZUL', 'M', 8.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(493, 1, 6, 21, 19, 1, 'HM0012', 'GUANTE TELEGOMA ROJO', 'M', 8.00, 0, NULL, 7.00, 0.00, 0.00, 'H');
INSERT INTO `producto` (`id`, `id_tienda`, `id_familia`, `id_linea`, `id_marca`, `id_descuento`, `codigo`, `nombre`, `medida`, `cantidad`, `paquete`, `imagen`, `preciob`, `preciof`, `precioc`, `est`) VALUES
(494, 1, 6, 21, 19, 1, 'HM0013', 'LIJA DE FIERRO', 'VARIOS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(495, 1, 6, 21, 19, 1, 'HM0014', 'LIJA DE AGUA', 'VARIOS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(496, 1, 6, 21, 19, 1, 'HM0015', 'LIJA DE MADERA', 'VARIOS', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(497, 1, 6, 21, 33, 1, 'HM0016', 'CINTA AISLANTE', 'GRANDE', 8.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(498, 1, 6, 21, 33, 1, 'HM0017', 'CINTA AISLANTE', 'CHICO', 7.00, 0, NULL, 3.00, 0.00, 0.00, 'H'),
(499, 1, 6, 21, 34, 1, 'HM0018', 'CINTA MASKING', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(500, 1, 6, 21, 34, 1, 'HM0019', 'CINTA MASKING', '1\"', 5.00, 0, NULL, 5.00, 0.00, 0.00, 'H'),
(501, 1, 6, 21, 34, 1, 'HM0020', 'CINTA MASKING', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(502, 1, 6, 21, 34, 1, 'HM0021', 'CINTA MASKING', '2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(503, 1, 6, 21, 19, 1, 'HM0022', 'HILO DE PESCAR', '6\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(504, 1, 6, 21, 19, 1, 'HM0023', 'HILO DE PESCAR', '8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(505, 1, 6, 21, 19, 1, 'HM0024', 'HILO DE PESCAR', '1\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(506, 1, 6, 21, 19, 1, 'HM0025', 'CUTTER', 'SIMPLE', 2.00, 0, NULL, 2.00, 0.00, 0.00, 'H'),
(507, 1, 6, 21, 19, 1, 'HM0026', 'CUTTER', 'MÁS REPUESTO', 5.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(508, 1, 6, 21, 35, 1, 'HM0027', 'HOJA DE SIERRA', ' .', 98.00, 0, NULL, 6.00, 0.00, 0.00, 'H'),
(509, 1, 7, 22, 36, 1, 'SE0001', 'ELECTRODO', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(510, 1, 7, 22, 37, 1, 'SE0002', 'ELECTRODO', '1/8\"', 5.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(511, 1, 7, 22, 38, 1, 'SE0003', 'ELECTRODO', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(512, 1, 7, 22, 39, 1, 'SE0004', 'ELECTRODO', '3/32\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(513, 1, 8, 23, 40, 1, 'LL0001', 'LIMPIAVIDRIO', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(514, 1, 8, 23, 40, 1, 'LL0002', 'QUITASARRO', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(515, 1, 8, 23, 40, 1, 'LL0003', 'ACIDO EXTRAFUERTE', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(516, 1, 8, 23, 40, 1, 'LL0004', 'RON DE QUEMAR', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(517, 1, 8, 23, 40, 1, 'LL0005', 'THINER', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(518, 1, 8, 23, 40, 1, 'LL0006', 'THINER', '1 GL', 3.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(519, 1, 8, 23, 40, 1, 'LL0007', 'PERFUMADOR', '1 LT', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(520, 1, 8, 24, 40, 1, 'LS0001', 'SODA EN ESCAMAS', '1 KG', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(521, 1, 9, 25, 41, 1, 'AP0001', 'CELESTE-AZUL', '1/4\"', 6.00, 0, NULL, 48.00, 0.00, 0.00, 'H'),
(522, 1, 9, 25, 41, 1, 'AP0002', 'CELESTE-AZUL', '1/8\"', 8.00, 0, NULL, 35.00, 0.00, 0.00, 'H'),
(523, 1, 9, 25, 41, 1, 'AP0003', 'CELESTE-AZUL', '1/16\"', 24.00, 0, NULL, 18.00, 0.00, 0.00, 'H'),
(524, 1, 9, 25, 41, 1, 'AP0004', 'CELESTE-AZUL', '1/32\"', 24.00, 0, NULL, 12.00, 0.00, 0.00, 'H'),
(525, 1, 9, 25, 41, 1, 'AP0005', 'CELESTE-AZUL', '1/64\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(526, 1, 9, 25, 41, 1, 'AP0006', 'DORADO-BLANCO', '1/4\"', 8.00, 0, NULL, 38.00, 0.00, 0.00, 'H'),
(527, 1, 9, 25, 41, 1, 'AP0007', 'DORADO-BLANCO', '1/8\"', 6.00, 0, NULL, 27.00, 0.00, 0.00, 'H'),
(528, 1, 9, 25, 41, 1, 'AP0008', 'DORADO-BLANCO', '1/16\"', 2.00, 0, NULL, 17.00, 0.00, 0.00, 'H'),
(529, 1, 9, 25, 41, 1, 'AP0009', 'DORADO-BLANCO', '1/32\"', 25.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(530, 1, 9, 25, 41, 1, 'AP0010', 'DORADO-BLANCO', '1/64\"', 1.00, 0, NULL, 8.00, 0.00, 0.00, 'H'),
(531, 1, 9, 25, 41, 1, 'AP0011', 'ANARANJADO CPVC', '1/32\"', 2.00, 0, NULL, 17.00, 0.00, 0.00, 'H'),
(532, 1, 9, 25, 41, 1, 'AP0012', 'ANARANJADO CPVC', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(533, 1, 9, 25, 41, 1, 'AP0013', 'ANARANJADO CPVC', '1/16\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(534, 1, 9, 25, 42, 1, 'AP0014', 'TEROKAL', '1/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(535, 1, 9, 25, 42, 1, 'AP0015', 'TEROKAL', '1/8\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(536, 1, 9, 26, 43, 1, 'AS0001', 'SIKASIL', '280ML', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(537, 1, 9, 26, 43, 1, 'AS0002', 'SIKAFLEX', '280ML', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(538, 1, 10, 27, 19, 1, 'PI0001', 'SPRAY PLATEADO O DORADO', 'LATA', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(539, 1, 10, 27, 19, 1, 'PI0002', 'SPRAY COLORES', 'LATA', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(540, 1, 10, 27, 44, 1, 'PI0003', 'LATEX', '1 GL', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(541, 1, 10, 27, 44, 1, 'PI0004', 'ESMALTE', '1 GL', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(542, 1, 10, 27, 44, 1, 'PI0005', 'IMPRIMANTE', '1 GL', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(543, 1, 10, 27, 44, 1, 'PI0006', 'SELLADOR', '1 GL', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(544, 1, 10, 27, 44, 1, 'PI0007', 'TEMPLE', '1 GL', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(545, 1, 11, 28, 45, 1, 'CC0001', 'PORTALND TIPO 1', '42.5KG', 246.00, 0, NULL, 29.50, 0.00, 0.00, 'H'),
(546, 1, 11, 28, 46, 1, 'CC0002', 'PORTALND TIPO 1 CO', '42.5KG', 70.00, 0, NULL, 26.50, 0.00, 0.00, 'H'),
(547, 1, 11, 28, 47, 1, 'CC0003', 'SUELTO', '1KG', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(548, 1, 12, 29, 48, 1, 'LT0001', 'BLOQUETA', 'H 15', 897.00, 0, NULL, 2.50, 0.00, 0.00, 'H'),
(549, 1, 12, 29, 48, 1, 'LT0002', 'BLOQUETA', 'H 12', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(550, 1, 12, 30, 49, 1, 'LM0001', 'PANDERETA', 'H 6', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(551, 1, 12, 30, 49, 1, 'LM0002', 'KING KONG', 'H 18', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(552, 1, 12, 30, 50, 1, 'LM0003', 'KING KONG', 'H 19', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(553, 1, 12, 30, 51, 1, 'LM0004', 'KING KONG', 'H 20', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(554, 1, 13, 31, 19, 1, 'PC0001', 'PLANCHA METALICA', '1.80 X 0.14', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(555, 1, 13, 31, 19, 1, 'PC0002', 'PLANCHA METALICA', '1.80 X 0.20', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(556, 1, 13, 31, 19, 1, 'PC0003', 'PLANCHA METALICA', '1.80 X 0.22', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(557, 1, 13, 31, 19, 1, 'PC0004', 'PLANCHA METALICA', '3.60 X 0.14', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(558, 1, 13, 31, 19, 1, 'PC0005', 'PLANCHA METALICA', '3.60 X 0.20', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(559, 1, 13, 31, 19, 1, 'PC0006', 'PLANCHA METALICA ROJA', '3.60 X 0.22', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(560, 1, 13, 32, 52, 1, 'PS0001', 'PLANCHA AMBAR', '1.80 X 1', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(561, 1, 13, 32, 52, 1, 'PS0002', 'PLANCHA AMBAR', '3.60 X 1', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(562, 1, 13, 32, 52, 1, 'PS0003', 'PLANCHA BLANCA', '1.80 X 1', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(563, 1, 13, 32, 52, 1, 'PS0004', 'PLANCHA BLANCA', '3.60 X 1', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(564, 1, 13, 33, 19, 1, 'PY0001', 'TRIPLAY PLYWOOD', '1.22 X 2.44', 28.00, 0, NULL, 24.00, 0.00, 0.00, 'H'),
(565, 1, 14, 34, 53, 1, 'TT0001', 'ELEVADO COLOR ARENA', '1100L', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(566, 1, 14, 34, 53, 1, 'TT0002', 'ELEVADO COLOR ARENA', '1500L', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(567, 1, 14, 34, 53, 1, 'TT0003', 'ELEVADO COLOR ARENA', '2000L', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(568, 1, 14, 35, 53, 1, 'TC0001', 'ENTERRADO COLOR CELESTE', '1200L', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(569, 1, 14, 35, 53, 1, 'TC0002', 'ENTERRADO COLOR CELESTE', '2800L', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(570, 1, 15, 36, 54, 1, 'TP0001', 'PLANCHA TECNOPOR 1.20 X 2.40', '1/2\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(571, 1, 15, 36, 54, 1, 'TP0002', 'PLANCHA TECNOPOR 1.20 X 2.41', '3/4\"', 0.00, 0, NULL, 0.00, 0.00, 0.00, 'H'),
(572, 1, 15, 36, 54, 1, 'TP0003', 'PLANCHA TECNOPOR 1.20 X 2.42', '1\"', 38.00, 0, NULL, 10.00, 0.00, 0.00, 'H'),
(573, 1, 15, 36, 54, 1, 'TP0004', 'PLANCHA TECNOPOR 1.20 X 2.43', '2\"', 0.00, 0, NULL, 20.00, 0.00, 0.00, 'H'),
(574, 1, 15, 37, 54, 1, 'TN0001', 'CASETON TECNOPOR 1.20 X 0.30', 'X15', 106.00, 0, NULL, 8.00, 0.00, 0.00, 'H'),
(575, 1, 15, 37, 54, 1, 'TN0002', 'CASETON TECNOPOR 1.20 X 0.30', 'X12', 0.00, 0, NULL, 7.00, 0.00, 0.00, 'H'),
(576, 1, 3, 12, 16, 1, 'EJ0100', 'Caja de Pase Electrico', '30 x 30', 6.00, 0, '', 20.00, 0.00, 0.00, 'H'),
(577, 1, 12, 30, 51, 1, 'VV0100', 'vvPrueba', '4 \"', 200.00, 0, '', 5.50, 0.00, 0.00, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_abastecer`
--

CREATE TABLE `producto_abastecer` (
  `id` int(255) NOT NULL,
  `id_abastecer` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `precio` float(100,2) DEFAULT NULL,
  `cantidad` float(100,2) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_abastecer`
--

INSERT INTO `producto_abastecer` (`id`, `id_abastecer`, `id_producto`, `precio`, `cantidad`, `est`) VALUES
(1, 1, 1, 149.00, 100.00, 'H'),
(2, 2, 20, 5.00, 0.50, 'H'),
(3, 3, 19, 6.00, 1.50, 'H'),
(4, 4, 9, 0.00, 20.00, 'H'),
(5, 5, 15, 0.00, 1.00, 'H'),
(6, 6, 15, 0.00, 200.00, 'H'),
(7, 7, 21, 0.00, 10.00, 'H'),
(8, 12, 21, 0.00, 10.00, 'H'),
(9, 13, 21, 0.00, 20.00, 'H'),
(10, 14, 22, 0.00, 20.00, 'H'),
(11, 15, 53, 0.00, 20.00, 'H'),
(12, 16, 94, 0.00, 10.00, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_cuaderno`
--

CREATE TABLE `producto_cuaderno` (
  `id` int(255) NOT NULL,
  `id_cuaderno` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `precio` float(100,2) DEFAULT NULL,
  `cantidad` float(100,2) NOT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_cuaderno`
--

INSERT INTO `producto_cuaderno` (`id`, `id_cuaderno`, `id_producto`, `precio`, `cantidad`, `est`) VALUES
(1, 1, 237, 5.00, 20.00, 'H'),
(2, 1, 373, 20.00, 3.00, 'H'),
(3, 1, 15, 20.00, 30.00, 'H'),
(4, 2, 1, 159.88, 10.00, 'H'),
(5, 3, 238, 6.00, 2.00, 'H'),
(6, 4, 531, 17.00, 5.00, 'H'),
(7, 5, 531, 17.00, 1.00, 'H'),
(8, 6, 237, 4.95, 9.00, 'H'),
(9, 6, 238, 5.91, 5.00, 'H'),
(10, 6, 57, 2.00, 10.00, 'H'),
(11, 7, 4, 39.97, 11.00, 'H'),
(12, 8, 11, 83.12, 10.00, 'H'),
(13, 8, 15, 20.38, 7.00, 'H'),
(14, 9, 15, 20.38, 8.00, 'H'),
(15, 9, 12, 56.52, 10.00, 'H'),
(16, 10, 15, 20.38, 8.00, 'H'),
(17, 11, 20, 5.50, 1.00, 'H'),
(18, 12, 20, 5.50, 0.50, 'H'),
(19, 13, 20, 5.50, 0.50, 'H'),
(20, 14, 546, 26.00, 50.00, 'H'),
(21, 15, 546, 26.00, 50.00, 'H'),
(22, 16, 546, 26.00, 50.00, 'H'),
(23, 18, 546, 26.00, 50.00, 'H'),
(24, 19, 546, 26.00, 50.00, 'H'),
(25, 20, 57, 2.00, 1.00, 'H'),
(26, 20, 546, 26.50, 1.00, 'H'),
(27, 21, 15, 20.38, 1.00, 'H'),
(28, 22, 238, 6.00, 35.00, 'H'),
(29, 23, 548, 2.60, 103.00, 'H'),
(30, 24, 348, 12.30, 7.00, 'H'),
(31, 25, 237, 5.00, 1.00, 'H'),
(32, 26, 238, 5.60, 70.00, 'H'),
(33, 26, 19, 5.50, 20.50, 'H'),
(34, 27, 237, 5.00, 2.00, 'H'),
(35, 28, 20, 5.50, 7.00, 'H'),
(36, 29, 20, 5.50, 20.00, 'H'),
(37, 30, 270, 8.00, 5.00, 'H'),
(38, 30, 161, 4.50, 6.00, 'H'),
(39, 31, 52, 34.50, 10.00, 'H'),
(40, 32, 362, 10.00, 10.00, 'H'),
(41, 33, 57, 2.00, 1.00, 'H'),
(42, 34, 545, 29.50, 20.00, 'H'),
(43, 35, 546, 26.50, 10.00, 'H'),
(44, 36, 347, 9.00, 5.00, 'H'),
(45, 36, 545, 29.50, 10.00, 'H'),
(46, 37, 349, 17.00, 4.00, 'H'),
(47, 37, 576, 20.00, 4.00, 'H'),
(48, 38, 102, 2.00, 10.00, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(255) NOT NULL,
  `id_ciudad` int(255) NOT NULL,
  `numruc` char(20) NOT NULL,
  `nombrecom` varchar(255) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `numcel` char(12) DEFAULT NULL,
  `est` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `id_ciudad`, `numruc`, `nombrecom`, `direccion`, `numcel`, `est`) VALUES
(1, 3, '13134579256', 'Sider Perú', 'Av. las lomas Lima', '965412450', 'H'),
(2, 4, '22145789421', 'La Roca', 'Calle Real 1510 Azapampa', '966478154', 'H'),
(3, 3, '22457815432', 'PAVCO', 'Av Javier Prado N° 1542', '921457800', 'H');

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
(1, 4, 'TIENDA AZAPAMPA', 'Av. Calle Real 2482', 'H'),
(2, 1, 'TIENDA HUANCAN', 'Av. Panamericana Sur 1387', 'H');

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
(1, 1, '10101010', 'Administrador', 'Rosario', 'Arosario', '$2y$04$FSYFxkpM.UNu4xtphbbMVe4g6mU.a5wU8wabFqwMhi/ANVBQYg/yK', 'admin', '', 'H'),
(2, 1, '47361185', 'prueba', 'prueba', 'prueba', '$2y$04$y7DBni14zWZxI93pkEA/LOf8fGek1Ee5uETRHY.n3PGn4lyvpWaLW', 'user', '', 'H');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abastecer`
--
ALTER TABLE `abastecer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_abastecer_tienda` (`id_tienda`),
  ADD KEY `fk_abastecer_usuario` (`id_usuario`),
  ADD KEY `fk_abastecer_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `arqueo`
--
ALTER TABLE `arqueo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_arqueo_usuario` (`id_usuario`);

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
-- Indices de la tabla `egreso`
--
ALTER TABLE `egreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_egreso_tienda` (`id_tienda`),
  ADD KEY `fk_egreso_usuario` (`id_usuario`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingreso_tienda` (`id_tienda`),
  ADD KEY `fk_ingreso_cliente` (`id_cliente`),
  ADD KEY `fk_ingreso_cuaderno` (`id_cuaderno`),
  ADD KEY `fk_ingreso_usuario` (`id_usuario`);

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
-- Indices de la tabla `producto_abastecer`
--
ALTER TABLE `producto_abastecer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_abastecer_abastecer` (`id_abastecer`),
  ADD KEY `fk_producto_abastecer_producto` (`id_producto`);

--
-- Indices de la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_cuaderno_cuaderno` (`id_cuaderno`),
  ADD KEY `fk_producto_cuaderno_producto` (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedor_ciudad` (`id_ciudad`);

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
-- AUTO_INCREMENT de la tabla `abastecer`
--
ALTER TABLE `abastecer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `arqueo`
--
ALTER TABLE `arqueo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuaderno`
--
ALTER TABLE `cuaderno`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `egreso`
--
ALTER TABLE `egreso`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `precio`
--
ALTER TABLE `precio`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT de la tabla `producto_abastecer`
--
ALTER TABLE `producto_abastecer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `abastecer`
--
ALTER TABLE `abastecer`
  ADD CONSTRAINT `fk_abastecer_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `fk_abastecer_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `fk_abastecer_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `arqueo`
--
ALTER TABLE `arqueo`
  ADD CONSTRAINT `fk_arqueo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

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
-- Filtros para la tabla `egreso`
--
ALTER TABLE `egreso`
  ADD CONSTRAINT `fk_egreso_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `fk_egreso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_ingreso_cuaderno` FOREIGN KEY (`id_cuaderno`) REFERENCES `cuaderno` (`id`),
  ADD CONSTRAINT `fk_ingreso_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

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
-- Filtros para la tabla `producto_abastecer`
--
ALTER TABLE `producto_abastecer`
  ADD CONSTRAINT `fk_producto_abastecer_abastecer` FOREIGN KEY (`id_abastecer`) REFERENCES `abastecer` (`id`),
  ADD CONSTRAINT `fk_producto_abastecer_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `producto_cuaderno`
--
ALTER TABLE `producto_cuaderno`
  ADD CONSTRAINT `fk_producto_cuaderno_cuaderno` FOREIGN KEY (`id_cuaderno`) REFERENCES `cuaderno` (`id`),
  ADD CONSTRAINT `fk_producto_cuaderno_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`);

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
