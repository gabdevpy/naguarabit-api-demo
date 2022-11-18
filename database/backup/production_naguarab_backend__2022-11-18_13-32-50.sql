-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2022 at 06:32 PM
-- Server version: 10.3.36-MariaDB-log-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naguarab_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks_pais`
--

CREATE TABLE `banks_pais` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `nombre_largo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo del pais',
  `tipo_pago` text COLLATE utf8_unicode_ci NOT NULL COMMENT '''DEP'': deposito bancario, ''GIRO''',
  `observ` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Observaciones, notas del tipo de pago',
  `activo` tinyint(1) NOT NULL COMMENT 'Estatus. 1:activo, 0:inactivo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='TABLA EN USO. BANCOS POR PAIS';

--
-- Dumping data for table `banks_pais`
--

INSERT INTO `banks_pais` (`id`, `codigo`, `nombre`, `nombre_largo`, `codpais`, `tipo_pago`, `observ`, `activo`) VALUES
(1, 'BDV', 'Banco de Venezuela', 'Banco de Venezuela', 'VEN', 'DEP', NULL, 1),
(2, 'BPROV', 'Provincial', 'Banco BBVA Provincial (Venezuela)', 'VEN', 'DEP', NULL, 1),
(3, 'BANSC', 'Banesco', 'Banesco', 'VEN', 'DEP', NULL, 1),
(4, 'BMERC', 'Mercantil', 'Banco Mercantil', 'VEN', 'DEP', NULL, 1),
(5, 'BCARI', 'Bancaribe', NULL, 'VEN', 'DEP', NULL, 1),
(6, 'BTES', 'Bancamiga', 'Bancamiga', 'VEN', 'DEP', NULL, 1),
(7, 'BICNT', 'Bicentenario', 'Banco Bicentenario', 'VEN', 'DEP', NULL, 1),
(8, 'BCARO', 'Banco Caroní', NULL, 'VEN', 'DEP', NULL, 0),
(9, 'BCP', 'BCP', 'Banco Central de Perú', 'PER', 'DEP', NULL, 1),
(10, 'BITAU', 'Banco Itaú', 'Banco Itaú Paraguay', 'PAR', 'DEP', NULL, 0),
(11, 'EFECT', 'Efectivo', 'Pago en efectivo en Paraguay', 'PAR', 'GIRO', 'Pensar cómo activarlo', 1),
(12, 'GT', 'Giros Tigo', 'Giros Tigo Money en Paraguay', 'PAR', 'GIRO', '', 1),
(13, 'GC', 'Giros Claro', 'Giros Claro en Paraguay', 'PAR', 'GIRO', NULL, 1),
(14, 'GP', 'Billetera Personal', 'Billetera Personal en Paraguay', 'PAR', 'GIRO', 'Activar', 1),
(15, 'WU', 'Western Union', 'Wester Union en Paraguay', 'PAR', 'WU', NULL, 1),
(17, 'BEXT', 'Banco Exterior', 'Banco Exterior Venezuela', 'VEN', 'DEP', NULL, 1),
(18, 'BFAM', 'Banco Familiar', 'Banco Familiar Paraguay', 'PAR', 'DEP', NULL, 1),
(19, 'BVIS', 'Banco Visión', 'Banco Visión Paraguay', 'PAR', 'DEP', '', 1),
(20, 'BSUDA', 'Banco Sudameris', 'Sudameris Bank Paraguay', 'PAR', 'DEP', '', 1),
(21, 'BNC', 'Banco Nacional de Crédito', 'Banco Nacional de Crédito', 'VEN', 'DEP', NULL, 1),
(22, 'WALLY', 'Billetera Wally', 'Billetera Wally', 'PAR', 'DEP', 'Activar', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bitacora_login`
--

CREATE TABLE `bitacora_login` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cliente_software` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'descripcion de cliente software usado, sistema operativo, navegador, etc.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bitacora_tablas`
--

CREATE TABLE `bitacora_tablas` (
  `id` int(11) NOT NULL,
  `nombre_tabla` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_ref` int(11) NOT NULL,
  `tipo_mov` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A:actualizar, I:insertar, E:eliminar',
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `valor_actual` int(11) NOT NULL COMMENT 'valores actuales del registro, aplica para Actualizacion y Eliminacion',
  `valor_nuevo` int(11) NOT NULL COMMENT 'valores nuevo del registro, aplica para Insercion y Actualizacion',
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='campos para rastrear movimiento CRUD de todas las tablas';

-- --------------------------------------------------------

--
-- Table structure for table `btc_paridad`
--

CREATE TABLE `btc_paridad` (
  `id` int(11) NOT NULL,
  `cod_moneda` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo de moneda',
  `nombre_par` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'descripcion de moneda',
  `valor_paridad` double DEFAULT NULL COMMENT 'valor del BTC contra la moneda',
  `valor_compra` double DEFAULT 0 COMMENT 'Valor del BTC frente a la moneda, para comprar',
  `valor_venta` double DEFAULT NULL COMMENT 'valor para cambiar btc a esta moneda',
  `fecha` date DEFAULT NULL,
  `fechahora` timestamp NULL DEFAULT current_timestamp() COMMENT 'este campo se actualiza cuando se inserta o actualiza',
  `date_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'fecha ultima actualizacion'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Valores del BTC contra cada moneda';

--
-- Dumping data for table `btc_paridad`
--

INSERT INTO `btc_paridad` (`id`, `cod_moneda`, `nombre_par`, `valor_paridad`, `valor_compra`, `valor_venta`, `fecha`, `fechahora`, `date_updated`) VALUES
(1, 'VES', 'BTC/VES', 155863448, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:55:11'),
(2, 'USD', 'BTC/USD', 11419, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:56:15'),
(3, 'USD-VES', 'USD/VES', 13622, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:56:56'),
(6, 'GS', 'Guaraní', NULL, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:55:11'),
(5, 'PCHI', 'PESO CHILENO', NULL, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:55:11'),
(7, 'SOL', 'SOL PERUANO', NULL, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:55:11'),
(8, 'ARS', 'PESO ARGENTINO', NULL, 0, NULL, NULL, '2019-07-22 20:49:48', '2019-08-12 17:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `casos_atenciones`
--

CREATE TABLE `casos_atenciones` (
  `id` int(11) NOT NULL,
  `id_reclamo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `respuesta` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user_admin` int(11) NOT NULL,
  `nombre_user_admin` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nombre del usuario admin que realizó esta atención',
  `id_transaccion` int(11) DEFAULT NULL COMMENT 'relacion con tabla transaccion, en caso que aplique'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='atencion a los reclamos de usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `casos_reclamos`
--

CREATE TABLE `casos_reclamos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `check_respondido` tinyint(1) DEFAULT NULL,
  `check_resuelto` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='reclamos de usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cod_pais` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo del pais al que pertenece la ciudad',
  `observ` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Observaciones, notas',
  `activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:activo, 0:inactivo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`id`, `codigo`, `nombre`, `cod_pais`, `observ`, `activo`) VALUES
(1, 'PAR_W', 'Western Union Paragu', '', '', 1),
(2, 'CCS', 'Caracas', 'VEN', '', 1),
(3, 'BQTO', 'Barquisimeto', 'VEN', 'prueba. linea 2, sdsds', 1),
(4, 'SF', 'San Felipe', 'VEN', '', 1),
(5, 'LMB', 'Lambaré', 'PAR', '', 1),
(6, 'SLRNZ', 'San Lorenzo', 'PAR', '', 1),
(7, 'SANT', 'Santiago', 'CHI', '', 1),
(8, 'VAL', 'Valencia', 'VEN', '', 1),
(9, 'BOG', 'Bogotá', 'COL', '', 1),
(10, 'CAL', 'Cali', 'COL', '', 1),
(11, 'LIM', 'Lima', 'PER', '', 1),
(12, 'BA', 'Buenos Aires', 'ARG', 'Llenar COMBO DE PAISES CON BD', 1),
(13, 'FM', 'Fernando de la Mora', 'PAR', '', 1),
(16, 'MARCB', 'Maracaibo', 'VEN', '', 1),
(17, 'Villa', 'Villa Elisa', 'PAR', '', 1),
(18, 'LUQUE', 'Luque', 'PAR', '', 1),
(19, 'CAPIA', 'Capiatá', 'PAR', '', 1),
(20, 'ITA', 'Itá', 'PAR', '', 1),
(21, 'ITAGU', 'Itaguá', 'PAR', '', 1),
(22, 'AREGU', 'Areguá', 'PAR', '', 1),
(23, 'SNBER', 'San Bernardino', 'PAR', '', 1),
(24, 'CABUD', 'Cabudare', 'VEN', 'Estado Lara', 1),
(25, 'ASU', 'Asunción', 'PAR', '', 1),
(27, 'MRA', 'Mariano Roque Alonso', 'PAR', '', 1),
(28, 'BARC', 'Barcelona', 'VEN', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comisiones`
--

CREATE TABLE `comisiones` (
  `id` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `origen_login_operador` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'PAR' COMMENT 'login de operador en origen',
  `destino_login_operador` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VEN' COMMENT 'login operador en pais destino',
  `origen_monto_comision` double DEFAULT NULL COMMENT 'monto comision a operador de origen',
  `destino_monto` double NOT NULL,
  `comision_dolares` double DEFAULT NULL COMMENT 'monto comision total en dolares, segun calculos de ganancia',
  `tasa_dolar_origen` double NOT NULL COMMENT 'tasa dolar respecto a moneda origen, al momento de realizar el calculo',
  `tasa_dolar_destino` double DEFAULT NULL COMMENT 'tasa dolar respecto a moneda destino, , al momento de realizar el calculo',
  `destino_observ` tinytext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones sobre el pago destino, escrito por el usuario',
  `observ_admin` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones escritas por un usuario administrador',
  `fechahora_origen` timestamp NULL DEFAULT current_timestamp() COMMENT 'fecha y hora en que se hizo el registro en el sistema, segun huso horario de pais origen',
  `fechahora_destino` timestamp NULL DEFAULT NULL COMMENT 'fecha/hora de registro, segun huso horario de pais destino',
  `check_admin` int(11) DEFAULT NULL COMMENT 'verificacion por parte de un usuario admin. verifica que los datos, montos, tasas, etc, registrados son correctos. Y que se puede proceder a realizar la operacion',
  `user_admin` int(20) DEFAULT NULL COMMENT 'login del usuario admin que hizo la verificacion',
  `fechahora_check` timestamp NULL DEFAULT NULL COMMENT 'fecha y hora de verificacion por parte de un user admin segun el servidor',
  `date_created` timestamp NULL DEFAULT current_timestamp() COMMENT 'fecha y hora en que se hizo el registro en el sistema, segun hora del servidor',
  `date_updated` timestamp NULL DEFAULT NULL COMMENT 'ultima fecha en que se actualizo el registro',
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'New' COMMENT 'NEW, ORI_OK, DES_OK, FIN, CANC, ANUL',
  `status_PO` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'status de pago en origen. A:agregado por cliente. OK: verificado por operador	',
  `status_PD` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'status de pago en destino: A: por cliente. OK: verificado por operador',
  `activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: activo, 0: inactiva. indica si la transaccion esta activa o no',
  `id_formapago_origen` int(11) NOT NULL COMMENT 'id forma de pago elegida en origen	',
  `porc_comision` double DEFAULT NULL,
  `monto_comision_dolares` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='transacciones, implica calculo de pago en origen. pago en destino. comisiones';

--
-- Dumping data for table `comisiones`
--

INSERT INTO `comisiones` (`id`, `login`, `origen_login_operador`, `destino_login_operador`, `origen_monto_comision`, `destino_monto`, `comision_dolares`, `tasa_dolar_origen`, `tasa_dolar_destino`, `destino_observ`, `observ_admin`, `fechahora_origen`, `fechahora_destino`, `check_admin`, `user_admin`, `fechahora_check`, `date_created`, `date_updated`, `status`, `status_PO`, `status_PD`, `activo`, `id_formapago_origen`, `porc_comision`, `monto_comision_dolares`) VALUES
(4, 'jmercado', 'PAR', 'VEN', 6000, 13000, 6000, 0, 13000, NULL, NULL, '2019-08-05 21:04:40', NULL, NULL, NULL, NULL, '2019-08-05 21:04:40', NULL, 'PO', 'A', 'A', 1, 0, NULL, NULL),
(44, 'joseidy', 'PAR', 'VEN', 7472, 3939174, 1, 7472.3, 3939174, NULL, NULL, '2021-07-29 13:12:09', NULL, NULL, NULL, NULL, '2021-07-29 13:12:09', NULL, 'New', '', '', 1, 2, NULL, NULL),
(45, 'Acruzp', 'PAR', 'VEN', 1060000, 536771500, 142.12, 7458.43, 3776861, NULL, NULL, '2021-07-31 18:13:56', NULL, NULL, NULL, NULL, '2021-07-31 18:13:56', NULL, 'FIN', 'OK', 'OK', 1, 4, NULL, NULL),
(46, 'joseidy', 'PAR', 'VEN', 7485, 3773402, 1, 7484.56, 3773402, NULL, NULL, '2021-08-07 02:10:16', NULL, NULL, NULL, NULL, '2021-08-07 02:10:16', NULL, 'New', '', '', 1, 3, NULL, NULL),
(47, 'admin', 'PAR', 'VEN', 7485, 3711905, 1, 7484.56, 3711905, NULL, NULL, '2021-08-07 02:55:54', NULL, NULL, NULL, NULL, '2021-08-07 02:55:54', NULL, 'New', '', '', 1, 2, NULL, NULL),
(48, 'admin', 'PAR', 'VEN', 7485, 3711905, 1, 7484.56, 3711905, NULL, NULL, '2021-08-07 03:00:12', NULL, NULL, NULL, NULL, '2021-08-07 03:00:12', NULL, 'New', '', '', 1, 4, NULL, NULL),
(49, 'admin', 'PAR', 'VEN', 7485, 3718046, 1, 7484.56, 3718046, NULL, NULL, '2021-08-07 03:10:23', NULL, NULL, NULL, NULL, '2021-08-07 03:10:23', NULL, 'New', '', '', 1, 4, NULL, NULL),
(50, 'gperez', 'PAR', 'VEN', 7485, 3687796, 1, 7484.56, 3687796, NULL, NULL, '2021-08-07 03:10:45', NULL, NULL, NULL, NULL, '2021-08-07 03:10:45', NULL, 'New', '', '', 1, 2, NULL, NULL),
(51, 'admin', 'PAR', 'VEN', 7485, 3902097, 1, 7484.56, 3902097, NULL, NULL, '2021-08-07 14:54:43', NULL, NULL, NULL, NULL, '2021-08-07 14:54:43', NULL, 'New', '', '', 1, 4, NULL, NULL),
(52, 'gperez', 'PAR', 'VEN', 7485, 3902176, 1, 7484.56, 3902176, NULL, NULL, '2021-08-07 14:57:46', NULL, NULL, NULL, NULL, '2021-08-07 14:57:46', NULL, 'New', '', '', 1, 4, NULL, NULL),
(53, 'admin', 'PAR', 'VEN', 7512, 3958370, 1, 7511.55, 3958370, NULL, NULL, '2021-08-08 00:34:45', NULL, NULL, NULL, NULL, '2021-08-08 00:34:45', NULL, 'New', '', '', 1, 2, NULL, NULL),
(54, 'admin', 'PAR', 'VEN', 7512, 3965078, 1, 7511.55, 3965078, NULL, NULL, '2021-08-08 00:41:31', NULL, NULL, NULL, NULL, '2021-08-08 00:41:31', NULL, 'New', '', '', 1, 4, NULL, NULL),
(55, 'gperez', 'PAR', 'VEN', 7512, 3965078, 1, 7511.55, 3965078, NULL, NULL, '2021-08-08 00:43:05', NULL, NULL, NULL, NULL, '2021-08-08 00:43:05', NULL, 'New', '', '', 1, 4, NULL, NULL),
(56, 'gperez', 'PAR', 'VEN', 7512, 3929552, 1, 7511.55, 3929552, NULL, NULL, '2021-08-08 01:05:04', NULL, NULL, NULL, NULL, '2021-08-08 01:05:04', NULL, 'New', '', '', 1, 4, NULL, NULL),
(57, 'admin', 'PAR', 'VEN', 7512, 3951742, 1, 7511.55, 3951742, NULL, NULL, '2021-08-08 02:06:55', NULL, NULL, NULL, NULL, '2021-08-08 02:06:55', NULL, 'New', '', '', 1, 4, NULL, NULL),
(58, 'admin', 'PAR', 'VEN', 50000, 26145563, 6.66, 7511.55, 3927874, NULL, NULL, '2021-08-08 02:13:07', NULL, NULL, NULL, NULL, '2021-08-08 02:13:07', NULL, 'New', '', '', 1, 4, NULL, NULL),
(59, 'joseidy', 'PAR', 'VEN', 7512, 3940067, 1, 7511.55, 3940067, NULL, NULL, '2021-08-08 02:33:17', NULL, NULL, NULL, NULL, '2021-08-08 02:33:17', NULL, 'New', '', '', 1, 4, NULL, NULL),
(60, 'admin', 'PAR', 'VEN', 350000, 198313439, 48.02, 7289.15, 4130104.0043201, NULL, NULL, '2021-08-11 17:51:32', NULL, NULL, NULL, NULL, '2021-08-11 17:51:32', NULL, 'New', '', '', 1, 4, NULL, NULL),
(61, 'admin', 'PAR', 'VEN', 373695, 202021700, 50, 7473.9, 4040434, NULL, NULL, '2021-08-14 20:34:16', NULL, NULL, NULL, NULL, '2021-08-14 20:34:16', NULL, 'New', '', '', 1, 3, NULL, NULL),
(62, 'joseidy', 'PAR', 'VEN', 300000, 160435506, 40.1, 7480.72, 4000577, NULL, NULL, '2021-08-16 23:42:42', NULL, NULL, NULL, NULL, '2021-08-16 23:42:42', NULL, 'New', '', '', 1, 4, NULL, NULL),
(63, 'admin', 'PAR', 'VEN', 7472, 3932719, 1, 7472.07, 3932719, NULL, NULL, '2021-08-17 12:31:14', NULL, NULL, NULL, NULL, '2021-08-17 12:31:14', NULL, 'New', '', '', 1, 4, NULL, NULL),
(64, 'cvillarroque', 'PAR', 'VEN', 800000, 421326781, 107.07, 7472.07, 3935229, NULL, NULL, '2021-08-17 18:58:50', NULL, NULL, NULL, NULL, '2021-08-17 18:58:50', NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL),
(65, 'admin', 'PAR', 'VEN', 7472, 4020535, 1, 7472.07, 4020535, NULL, NULL, '2021-08-17 22:47:54', NULL, NULL, NULL, NULL, '2021-08-17 22:47:54', NULL, 'New', '', '', 1, 2, NULL, NULL),
(66, 'admin', 'PAR', 'VEN', 7472, 4050345, 1, 7472.07, 4050345, NULL, NULL, '2021-08-17 23:30:44', NULL, NULL, NULL, NULL, '2021-08-17 23:30:44', NULL, 'New', '', '', 0, 2, NULL, NULL),
(67, 'williamvillasmil', 'PAR', 'VEN', 150000, 79720519, 20.07, 7472.07, 3971182, 'a la hora de gabriel registrar la remesa los montos fueron:\r\ndestino_monto = 80.343.961 Bs.\r\n\r\ntasa_dolar_destino = 4.002.238', 'esta cuenta no cuadra mucho:\r\n\r\n20,07 * 3971182 = 79701622.74', '2021-08-18 12:36:35', NULL, NULL, NULL, NULL, '2021-08-18 12:36:35', NULL, 'FIN', 'OK', 'OK', 1, 2, 8, NULL),
(41, 'cvillarroque', 'PAR', 'VEN', 800088, 414337303, 107.25, 7460.02, 3863462, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, NULL, NULL, '2021-07-26 17:42:11', NULL, 'ANUL', '', '', 0, 2, NULL, NULL),
(40, 'cvillarroque', 'PAR', 'VEN', 800000, 418947800, 107.25, 7460.37, 3863462, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, NULL, NULL, '2021-07-26 17:42:11', NULL, 'FIN', 'OK', 'OK', 1, 2, NULL, NULL),
(68, 'franrodriguez', 'PAR', 'VEN', 374144, 199945250, 50, 7482.87, 3998905, NULL, NULL, '2021-08-19 18:23:41', NULL, NULL, NULL, NULL, '2021-08-19 18:23:41', NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL),
(69, 'invitado', 'PAR', 'VEN', 7496, 3881517, 1, 7496.5, 3881776, NULL, NULL, '2021-08-21 03:51:46', NULL, NULL, NULL, NULL, '2021-08-21 03:51:46', NULL, 'New', '', '', 1, 1, NULL, NULL),
(70, 'invitado', 'PAR', 'VEN', 7497, 3850702, 1, 7496.5, 3850702, NULL, NULL, '2021-08-21 04:02:08', NULL, NULL, NULL, NULL, '2021-08-21 04:02:08', NULL, 'New', '', '', 1, 4, NULL, NULL),
(71, 'admin', 'PAR', 'VEN', 14964, 7748412, 2, 7496.5, 3881714, NULL, NULL, '2021-08-21 04:16:55', NULL, NULL, NULL, NULL, '2021-08-21 04:16:55', NULL, 'New', '', '', 1, 2, NULL, NULL),
(72, 'admin', 'PAR', 'VEN', 73230, 41188147, 10, 7322.97, 4118814.7373568, NULL, NULL, '2021-08-21 04:27:05', NULL, NULL, NULL, NULL, '2021-08-21 04:27:05', NULL, 'New', '', '', 1, 2, NULL, NULL),
(73, 'invitado', 'PAR', 'VEN', 74829, 40387810, 10, 7482.93, 4038781, NULL, NULL, '2021-08-22 14:40:46', NULL, NULL, NULL, NULL, '2021-08-22 14:40:46', NULL, 'New', '', '', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estatus`
--

CREATE TABLE `estatus` (
  `id` int(11) NOT NULL,
  `codigo` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `detalles` text COLLATE utf16_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `estatus`
--

INSERT INTO `estatus` (`id`, `codigo`, `descripcion`, `detalles`) VALUES
(1, '\0N\0e\0w', 'Transacción Nueva', 'Remesa Iniciado, el cliente no ha realizado el pago en moneda de origen'),
(2, '\0P\0O', 'Pago en origen', 'Fue pagado en origen, o pago verificado de dicho pago'),
(3, '\0P\0D', 'Pago en destino', 'Se debe pagar o verificar pago en moneda destino'),
(4, '\0F\0I\0N', 'Completada', 'Transacción Finalizada'),
(5, '\0C\0C', 'Cancelada por cliente', 'Transacción Cancelada por el cliente'),
(6, '\0C\0O', 'Cancelada por Operador', 'Transacción Cancelada por el operador'),
(7, '\0C\0A', 'Cancelada por Administrador', 'Cancelada por administrador de la plataforma'),
(8, 'CANC', 'Cancelada', 'posible: no usar este estatus para las descripciones');

-- --------------------------------------------------------

--
-- Table structure for table `formapago_origen`
--

CREATE TABLE `formapago_origen` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción corta forma de pago',
  `codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo del pais',
  `cod_banco` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo de banco, relacion con tabla banks_pais',
  `nombre_largo` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descripción larga',
  `nombretitular` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctitular` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nrocuenta` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipocuenta` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A:ahorros, C:corriente, V:virtual',
  `tipocuenta_desc` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'nombre largo para tipo de cuenta',
  `ciudad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ciudad donde está el operador, para efectivo y WU',
  `observ` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Observaciones, notas del tipo de pago',
  `activo` tinyint(1) NOT NULL COMMENT 'Estatus. 1:activo, 0:inactivo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='usuarios operadores, tabla en desarrollo';

--
-- Dumping data for table `formapago_origen`
--

INSERT INTO `formapago_origen` (`id`, `codigo`, `nombre`, `codpais`, `cod_banco`, `nombre_largo`, `nombretitular`, `doctitular`, `nrocuenta`, `tipocuenta`, `tipocuenta_desc`, `ciudad`, `observ`, `activo`) VALUES
(1, 'PAR_WU_1', 'Western Union Paraguay 1', 'PAR', 'WU', 'Western Unión Paraguay, Joseidy Aguilar, Pasaporte 15111222', 'Joseidy Aguilar', '12345678', '', NULL, NULL, 'Asunción', '', 1),
(2, 'PAR_BF1', 'Banco Familiar Paraguay, cuenta 1', 'PAR', 'BFAM', 'Banco Familiar\r\nCuenta Ahorros\r\nGabriel Perez\r\nC.I. 8.656.754', 'Gabriel Pérez', '8656754', '38320143', 'A', 'Caja de Ahorros', NULL, '', 0),
(3, 'PAR_BV1', 'Banco Visión', 'PAR', 'BVIS', 'Nro Caja de Ahorro: 16091168/ Titular: Gabriel Pérez / C.I. : 8.656.754', 'Gabriel Pérez', '8656754', '14582873', 'A', 'Caja de Ahorros', NULL, '', 0),
(4, 'ITAU1', 'Banco Itaú, cuenta 1', 'PAR', 'BITAU', 'Caja de Ahorros: 25207909 / Titular: Dina Osma / C.I. : 8.532.292', 'Dina Osma', '8532288', '25207909', 'A', 'Caja de Ahorros', '', '', 0),
(5, 'PAR_BV2', 'Banco Visión Cuenta 2', 'PAR', 'BVIS', 'Nro Caja de Ahorro: 14582873 / Titular: Carlos Gutiérrez / C.I. : 8.532.291', 'Carlos Gutiérrez', '8532291', '14582873', 'A', 'Caja de Ahorros', NULL, '', 0),
(6, 'ITAU1', 'Banco Sudameris', 'PAR', 'BSUDA', 'Caja de Ahorros: 3953106/ Titular: JOSEIDY AGUILAR / C.I. : 8.532.292', 'JOSEIDY AGUILAR', '8731933', '3953106', 'A', 'Caja de Ahorros', '', '', 1),
(7, 'EFECT1', 'Efectivo en Asunción', 'PAR', '$PAR', 'Pago en efectivo, entrega a un operador en la ciudad de Asunción', 'GABRIEL PEREZ', '8656754', '', '', 'Efectivo', 'Asunción', '', 1),
(8, 'GIRO_CLARO', 'Giro Claro', 'PAR', 'GC', 'Giros Claro.\r\nGabriel Pérez\r\nCedula 8656754\r\nTelefono 0992-860184', 'GABRIEL PEREZ', '8656754', '0992860184', NULL, 'Giro Claro', '', '', 1),
(9, 'GIRO_TIGO', 'Giros Tigo Money', 'PAR', 'GT', 'Giros TIGO. GABRIEL PEREZ. Cedula 8656754. Teléfono 0985-969722', 'GABRIEL PEREZ', '8656754', '0985-969722', NULL, 'Giros TIGO', '', '', 0),
(10, 'PER_BCP1', 'Banco Central de Perú, cuenta 1', 'PER', 'BCP1', 'Banco Central de Perú\r\nCuenta Ahorros\r\nMARIANGEL SUAREZ\r\nC.I. 8.656.754', 'MARIANGEL SUAREZ', '---', '12345678', 'A', 'Caja de Ahorros', NULL, 'LA MANEJA CARLITOS EL HIJO DE MARIANGEL.\r\nACTIVAR QUE SE VEA EN LA CALCULADORA', 1),
(11, 'PAR_BF1', 'Banco Familiar Paraguay, cuenta 2', 'PAR', 'BFAM', 'Banco Familiar\r\nCuenta Ahorros # 81-108635\r\nHilder Portal\r\nC.I. 8844430', 'Hilder Portal', '8844430', '81-108635', 'A', 'Caja de Ahorros', NULL, '', 1),
(12, 'GIRO_TIGO', 'Giros Tigo Money', 'PAR', 'GT', 'Giros TIGO. Hilder Portal. Cédula 8844430. Teléfono 0981-011824', 'Hilder Portal', '8844430', '0981-011824', NULL, 'Giros TIGO', '', '', 1),
(13, 'BWALLY', 'Billetera Wally', 'PAR', 'GT', 'Billetera Wally. Hilder Portal. Cédula 8844430. Teléfono 0984-835868\r\n\r\nNota: Lo puedes realizar mediante PractiPago y Pago Express.', 'Hilder Portal', '8844430', '0984-835868', NULL, 'Billetera Wally', '', '', 1),
(14, 'GP', 'Billetera Personal', 'PAR', 'GT', 'Billetera Personal. Hilder Portal. Cédula 8844430. Teléfono 0973-752998\r\n\r\nNota: Lo puedes realizar mediante PractiPago, Pago Express, AquiPago y AcaPuedo.', 'Hilder Portal', '8844430', '0973-752998', NULL, 'Billetera Personal', '', '', 1),
(15, 'PAR_VIS3', 'Banco Visión Paraguay, cuenta Hilder Portal', 'PAR', 'BVIS', 'Banco Visión\r\nCuenta Ahorros\r\nHilder Portal\r\nCédula 8844430', 'Hilder Portal', '8844430', '18418517', 'A', 'Caja de Ahorros', NULL, 'Cuenta agregada a la plataforma en fecha 9/Abril/2022', 1);

-- --------------------------------------------------------

--
-- Table structure for table `huso_horario`
--

CREATE TABLE `huso_horario` (
  `id` int(11) NOT NULL,
  `cod_pais` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `huso_horario` int(11) NOT NULL COMMENT 'nro que indica el huso horario. ej: PAR: +3, VEN: +3',
  `fecha_actual` date DEFAULT NULL,
  `hora_actual` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_ciudad` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cod de ciudad, para paises con varios husos horarios. ej: brazil'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='almacena datos de husos horario actual de cada pais';

--
-- Dumping data for table `huso_horario`
--

INSERT INTO `huso_horario` (`id`, `cod_pais`, `huso_horario`, `fecha_actual`, `hora_actual`, `cod_ciudad`) VALUES
(1, 'VEN', -4, NULL, NULL, ''),
(2, 'PAR', -4, NULL, NULL, ''),
(3, 'COL', -5, NULL, NULL, ''),
(4, 'ARG', -3, NULL, NULL, ''),
(5, 'BOL', -4, NULL, NULL, ''),
(6, 'CHI', -4, NULL, NULL, ''),
(7, 'ECU', -5, NULL, NULL, ''),
(8, 'PER', -5, NULL, NULL, ''),
(9, 'URU', -3, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `moneda`
--

CREATE TABLE `moneda` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo de moneda',
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'descripcion de moneda',
  `nombre_plural` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `simbolo` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'simbolo internacional usado',
  `activo` int(11) NOT NULL DEFAULT 1 COMMENT ' 0 es desactivado. 1 es activado '
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `moneda`
--

INSERT INTO `moneda` (`id`, `codigo`, `nombre`, `nombre_plural`, `simbolo`, `activo`) VALUES
(1, 'Bs.', 'Bolívar', 'Bolívares Soberanos', 'VES', 1),
(2, 'USD', 'Dólar EEUU', 'Dólares', '$USD', 1),
(3, '$COL', 'Peso colombiano', 'Pesos colombianos', '$', 1),
(6, 'Gs', 'Guaraní', 'Guaraníes', '₲', 1),
(5, '$CHI', 'Peso Chileno', 'Pesos Chilenos', '$', 1),
(7, 'SOL', 'Sol', 'Soles', 'S/', 1),
(8, '$ARS', 'Peso Argentino', 'Pesos Arg.', '$', 1),
(9, '$BOL', 'Peso Boliviano', 'Pesos Bolivianos', 'b$.', 1),
(10, 'BAL', 'Balboa', 'Balboas', 'BAL', 0),
(11, 'EUR', 'Euro', 'Euros', 'EUR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monedas_pares`
--

CREATE TABLE `monedas_pares` (
  `id` int(11) NOT NULL,
  `cod_moneda` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo de moneda',
  `cod_moneda_contra` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_par` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'descripcion de moneda',
  `valor_par` double DEFAULT 0 COMMENT 'Valor de una moneda respecto a otra. Cuantas unidades se necesitan de una cantidad para comprar 1 unidad de la otra'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `monedas_pares`
--

INSERT INTO `monedas_pares` (`id`, `cod_moneda`, `cod_moneda_contra`, `nombre_par`, `valor_par`) VALUES
(1, 'BS', '', 'Bolívar', 0),
(2, 'USD', '', 'Dolar Americano', 0),
(3, 'PCOL', '', 'Peso colombiano', 0),
(6, 'GS', '', 'Guaraní', 0),
(5, 'PCHI', '', 'PESO CHILENO', 0),
(7, 'SOL', '', 'SOL PERUANO', 0),
(8, 'ARS', '', 'PESO ARGENTINO', 0),
(9, 'VES', 'USD', 'Bolivar contra dolar', 11000);

-- --------------------------------------------------------

--
-- Table structure for table `monedas_paridad_tentativo`
--

CREATE TABLE `monedas_paridad_tentativo` (
  `id` int(11) NOT NULL,
  `cod_moneda` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo de moneda',
  `cod_moneda_contra` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_par` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'descripcion de moneda',
  `valor_compra` double DEFAULT 0 COMMENT 'Valor del BTC frente a la moneda, para comprar',
  `valor_venta` double DEFAULT NULL COMMENT 'valor para cambiar btc a esta moneda',
  `fecha` date DEFAULT NULL,
  `fechahora` timestamp NULL DEFAULT current_timestamp() COMMENT 'este campo se actualiza cuando se inserta o actualiza',
  `valor_paridad` double DEFAULT NULL COMMENT 'valor parida de una moneda contra, sin importar si es compra o venta'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Valores del BTC contra cada moneda';

--
-- Dumping data for table `monedas_paridad_tentativo`
--

INSERT INTO `monedas_paridad_tentativo` (`id`, `cod_moneda`, `cod_moneda_contra`, `nombre_par`, `valor_compra`, `valor_venta`, `fecha`, `fechahora`, `valor_paridad`) VALUES
(1, 'BS', '', 'Bolívar', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(2, 'USD', '', 'Dolar Americano', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(3, 'PCOL', '', 'Peso colombiano', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(6, 'GS', '', 'Guaraní', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(5, 'PCHI', '', 'PESO CHILENO', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(7, 'SOL', '', 'SOL PERUANO', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(8, 'ARS', '', 'PESO ARGENTINO', 0, NULL, NULL, '2019-07-22 20:49:48', NULL),
(9, 'VES', 'USD', 'Bolivar contra dolar', 11000, NULL, NULL, '2019-07-22 20:49:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL COMMENT 'id de la notificacion',
  `cod_tipo` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'definir cuando se programen las notificaciones',
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'login de usuario que recibe la notificacion',
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'texto de la notificacion',
  `user_checked` tinyint(1) DEFAULT NULL COMMENT 'indica que el usuario ya vio la notificacion'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='notificaciones del sistema a usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `notificacion_respuesta`
--

CREATE TABLE `notificacion_respuesta` (
  `id` int(11) NOT NULL,
  `id_notificacion` int(11) NOT NULL,
  `respuesta_user` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='respuesta de usuarios a notificaciones';

-- --------------------------------------------------------

--
-- Table structure for table `notificacion_tipo`
--

CREATE TABLE `notificacion_tipo` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL COMMENT 'codigo de tipo',
  `descripcion` int(11) NOT NULL COMMENT 'descripcion tipo de notificacion',
  `observaciones` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tipos de notificaciones a usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `pago_destino`
--

CREATE TABLE `pago_destino` (
  `id` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL COMMENT 'relacion con tabla transaccion',
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cod_pais` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cod pais destino',
  `monto` double(20,2) NOT NULL COMMENT 'monto del pago en moneda de destino',
  `cod_banco` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nroctabank` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nro de cuenta bancaria',
  `tipo_cta` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A: ahorros, C: corriente, V: virtual, N:nomina O: otra	',
  `doc_titular` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'documento del titular de la cuenta	',
  `nombre_titular` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'nombre del titular de la cuenta',
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email del titular de la cuenta',
  `telefono` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'telefono del titular de la cuenta',
  `ind_pagomovil` tinyint(1) DEFAULT 0 COMMENT 'indica si el pago a destino se hace por modo pago movil',
  `check_realizado` tinyint(1) DEFAULT 0 COMMENT 'indica si el pago/transferencia ya fue realizado',
  `login_user_pagador` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'login de user OPERADOR que hizo la transferencia',
  `img_comprob` tinytext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url de imagen que comprueba la transaccion, bien sea foto o imagen escaneada',
  `fechahora_comprobante` timestamp NULL DEFAULT NULL COMMENT 'fecha/hora de comprobante de pago por parte del banco',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fecha y hora de registro, segun hora del servidor',
  `check_admin` int(11) DEFAULT NULL COMMENT 'verificacion por parte de un usuario admin. OPCIONAL',
  `login_user_check` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'login del usuario que hace la confirmacion por parte del cliente o beneficiario',
  `fechahora_check` timestamp NULL DEFAULT NULL COMMENT 'fecha y hora de verificacion por parte de un user admin. OPCIONAL',
  `observ_user_check` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones registrador por usuario que hace el chequeo de la transferencia. OPCIONAL',
  `observ_user` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones registrada por usuario',
  `check_user_cliente` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'verificacion por parte del usuario cliente, de que la transferencia se le acredito con exito'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='pagos realizados a cuenta de usuarios';

--
-- Dumping data for table `pago_destino`
--

INSERT INTO `pago_destino` (`id`, `id_transaccion`, `login`, `cod_pais`, `monto`, `cod_banco`, `nroctabank`, `tipo_cta`, `doc_titular`, `nombre_titular`, `email`, `telefono`, `ind_pagomovil`, `check_realizado`, `login_user_pagador`, `img_comprob`, `fechahora_comprobante`, `date_created`, `check_admin`, `login_user_check`, `fechahora_check`, `observ_user_check`, `observ_user`, `check_user_cliente`) VALUES
(1, 4, 'jmercado', 'VEN', 999999.99, 'MERC', '01052222333344445555', 'O', NULL, NULL, NULL, NULL, 0, 1, 'gperez', 'img/comprobantes/destino/vzla/4.jpg', NULL, '2019-08-16 20:16:33', NULL, NULL, NULL, NULL, NULL, 0),
(2, 4, 'jmercado', 'VEN', 2000.00, 'BDV', '01021212121212121555', 'O', NULL, NULL, NULL, NULL, 0, 1, 'gperez', NULL, NULL, '2019-08-16 20:29:41', NULL, NULL, NULL, NULL, NULL, 0),
(3, 4, 'jmercado', 'VEN', 1000.00, 'PROV', '01082222333344445555', 'O', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2019-08-16 20:29:41', NULL, NULL, NULL, NULL, NULL, 0),
(4, 40, 'cvillarroque', 'VEN', 309206942.54, 'BDV', '01020101260000016395', 'O', NULL, NULL, NULL, NULL, 0, 1, 'ccolmenarez', 'img/comprobantes/destino/vzla/1.png', NULL, '2021-07-26 23:48:37', NULL, NULL, NULL, 'en esta tabla faltan los campos del beneficiario: titular nombre, cedula titular, telefono, email', 'El usuario pregunta cuanto es la tasa de cambio, pero luego que se hizo la remesa. Para compararla con otras opciones.', 1),
(5, 40, 'cvillarroque', 'VEN', 109740857.46, 'BAMIG', '01720110711105221012', 'O', NULL, NULL, NULL, NULL, 0, 1, 'ccolmenarez', 'img/comprobantes/destino/vzla/2.png', NULL, '2021-07-26 23:48:37', NULL, NULL, NULL, '', 'El usuario pregunta cuanto es la tasa de cambio, pero luego que se hizo la remesa. Para compararla con otras opciones.', 1),
(6, 45, 'alejandropiñera', 'VEN', 536771500.00, 'BANSC', '01340406284061048089', 'O', NULL, NULL, NULL, NULL, 0, 1, 'ccolmenarez', 'img/comprobantes/destino/vzla/par_ven_45_1.png', NULL, '2021-07-26 23:48:37', NULL, NULL, NULL, 'Recibido, Gracias.', 'La cuenta es de su hermana, quien está en Venezuela.', 1),
(7, 56, 'gperez', 'VEN', 3929552.00, 'BTES', '12345678901234567890', 'C', '123456789012', 'GABRIEL ALEXANDER PEREZ FONSECA BONALDE', 'GAB.PEREZ.PY@GMAIL.COM', '992860184', 0, 0, NULL, NULL, NULL, '2021-08-08 01:09:43', NULL, NULL, NULL, NULL, 'pago destino guardado?', 0),
(8, 57, 'admin', 'VEN', 3951742.00, 'BTES', '12345678901234567890', 'C', '123456789012', 'GABRIEL ALEXANDER PEREZ FONSECA BONALDE', 'GAB.PEREZ.PY@GMAIL.COM', '992860184', 0, 0, NULL, NULL, NULL, '2021-08-08 02:07:11', NULL, NULL, NULL, NULL, 'ok', 0),
(51, 115, 'acruzp', 'VEN', 43.70, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', '', '', 1, 2, 'gperez', NULL, '2021-11-03 16:59:47', '2021-11-03 15:32:06', 1, 'gperez', NULL, 'Verificado por operador gperez', 'El destinatario es hermana del cliente', 1),
(11, 62, 'joseidy', 'VEN', 160435506.00, 'BDV', '12345678901234567890', 'C', '123456789012', 'CAROLINA CHIRINOS', 'GAB.PEREZ.PY@GMAIL.COM', '58', 0, 2, 'admin', NULL, '2021-11-17 02:27:51', '2021-08-16 23:43:35', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '15 DOLARES PARA 1ER PERSONA\n20 DOLARES PARA 2DA PERSONA\n5 DOLARES PARA 3ERA PERSONA', 1),
(12, 64, 'admin', 'VEN', 421326781.00, '', '', '', '', '', 'iralyskvb@gmail.com', '2147483647', 0, 1, 'mirlaychirinos', NULL, NULL, '2021-08-17 19:00:52', NULL, NULL, NULL, NULL, '', 1),
(15, 67, 'gabriel', 'VEN', 79720519.00, 'BANSC', '01340073310731064329', 'C', '18723229', 'Willnelson Parra', 'sinmail@mail.com', '2147483647', 0, 1, 'mirlaychirinos', NULL, NULL, '2021-08-18 12:38:59', NULL, '0', NULL, NULL, 'cliente: maracucho, William Villasmil. \r\n150.000 Gs.\r\nentrega en efectivo a: Gabriel\r\ncorregir en la base: Bs. enviado: 79720519\r\n20.07 USD\r\nsegun cotizacion antes de comprar los btcbanesco de Mirlay, quien hizo el pago\r\n\r\nSe pago con cuenta banesco Mirla', 1),
(16, 68, 'gabriel', 'VEN', 199945250.00, 'BPROV', '01080125791500020284', 'C', '999999', 'FRANCISCO.VEN-COL-PERU-PAR', 'pedir@elmail.com', '0', 0, 1, 'gabriel', NULL, NULL, '2021-08-19 18:28:25', NULL, '0', NULL, NULL, 'remesa de Francisco,\r\nbtc comprados: 0.00114998\r\npagados: 371,002.00 PYG\r\ntasa: 322,616,045.50 PYG\r\n-----\r\nbs enviados. 200.207.700\r\ngs recibido. 360.000 Gs.\r\ndolares: 50', 1),
(50, 114, 'admin', 'VEN', 523.97, 'BTES', '01720110711105221012', 'C', '29698227', 'Iralys Villarroel', '', '', 0, 1, 'admin', NULL, '2021-11-08 20:39:07', '2021-11-02 18:30:45', NULL, NULL, NULL, 'Verificado por operador', 'El cliente deposito hoy en banco vision el monto de 800.000.\nDespues notifica que quiere que lleguen 120 dolares.\nPara lo cual se le presta 100.000 Gs. de los fondos.', 0),
(49, 112, 'cvillaroque', 'VEN', 522.77, 'BCARI', '01720110711105221012', 'C', '29698227', 'Iralys Villarroel', '', '', 0, 0, NULL, NULL, NULL, '2021-11-02 18:26:48', NULL, NULL, NULL, NULL, 'El cliente deposito en banco vision hoy 800.000 Gs, ma#ana va a depositar el resto', 0),
(20, 74, 'williamvillasmil', 'VEN', 40409604.00, 'BANSC', '01340073310731064329', 'C', '18723229', 'willnelson Parra', '', '4246799139', 0, 1, 'gabriel', NULL, NULL, '2021-08-28 15:02:58', NULL, NULL, NULL, NULL, 'Pago movil. Cedula 18723229, telefono 04246799139', 1),
(21, 75, 'Acruzp', 'VEN', 146234890.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'pedir@elmail.com', '9999999', 0, 0, NULL, NULL, NULL, '2021-08-31 11:42:34', NULL, NULL, NULL, NULL, 'PEDIR DATOS DE BENEFICIARIO: CEDULA, TELEFONO/CORREO.\nPAGO RECIBIDO EN EFECTIVO, DEPOSITADO EN BANCO VISION DE GABRIEL.\nNRO COMPROBANTE: 21259312\nNRO DE SOBRE: 1144185', 0),
(22, 76, 'acruzp', 'VEN', 46606632.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', '', '4126369603', 0, 1, NULL, NULL, NULL, '2021-09-02 12:26:50', NULL, NULL, NULL, NULL, 'Pedir el correo, pago movil activado', 0),
(23, 77, 'Acruzp', 'VEN', 19455852.00, 'BDV', '', 'O', '', '', '', '0', 0, 0, NULL, NULL, NULL, '2021-09-03 02:18:44', NULL, NULL, NULL, NULL, 'Pago móvil', 0),
(24, 78, 'yamilethchirinos', 'VEN', 329403788.00, 'BPROV', '01082456740200058786', 'C', '7357750', 'ZENAIDA ESCALONA', 'yamilethchirinos@gmail.com', '999999', 0, 1, 'gabriel', NULL, NULL, '2021-09-10 22:17:51', NULL, NULL, '2021-09-11 02:43:17', 'enviado a cuenta de Zenaida, que la maneja Carolina.', 'cliente entrego dinero en efectivo, se hace remesa comprando con fondos en banco familiar, se debe depositar el dinero recibido en el banco nuevamente', 1),
(25, 79, 'cvillarroque', 'VEN', 461463310.00, 'BAMIG', '01720110711105221012', 'C', '29698227', 'Iralys Villarroel', 'monto real original era de 465.463.310.\r\n\r\nhay que restarle la comision pago movil.\r\nque fue de 1.384.389,93 Bs.\r\n\r\nse le envio al cliente el monto 461.463.310\r\n\r\nentonces al cliente se le deben Bs. 2.615.610.07\r\n\r\nse le pagara en la proxima remesa.', '4168069516', 0, 1, 'gabriel', '', NULL, '2021-07-26 23:48:37', NULL, NULL, NULL, '', 'El usuario pago en origen el dia lunes 13.sep en la ma#ana. Mediante telecajero. Se hizo efectivo a las 13.00 horas.\r\n\r\nEl operador gabriel, compro los btc en la ma#ana con dinero propio, pero fue imposible hacer la venta temprano, porque se bloqueo la cu', 1),
(26, 80, 'yamilethchirinos', 'VEN', 76902705.00, 'BMERC', '01050045190045405751', 'A', '12933775', 'Seidee Chirinos', 'SEIDEE@GMAIL.COM', '4267096680', 0, 1, 'gabriel', NULL, NULL, '2021-09-18 14:31:01', NULL, NULL, NULL, NULL, 'pago en origen a recibir por Gabriel, se hace la remesa a credito. el cliente ofrecio el pago para hoy sabado 18.sep', 1),
(27, 81, 'admin', 'VEN', 266694413.00, 'BTES', '01720110711105221012', 'C', '29698227', 'IRALYS VILLARROEL', 'iralyskvb@gmail.com', '04168069516', 0, 1, 'admin', NULL, '2021-11-08 16:53:43', '2021-09-21 21:22:56', NULL, NULL, NULL, 'Verificado por operador', 'enviar por pago movil', 0),
(28, 82, 'yasmary', 'VEN', 91956803.00, 'BANSC', '01340946360001365291', 'O', '20443581', 'ALEXANDRA FELICIANDY VIELMA SANCHEZ', '', '+595992807765', 0, 0, NULL, NULL, NULL, '2021-09-23 14:58:05', NULL, NULL, NULL, NULL, 'EL TELEFONO ES DE LA CHICA, Tahiana Torres, QUE ME ENVIO LOS DATOS E HIZO EL DEPOSITO EN EL BANCO VISION', 0),
(29, 83, 'yamilethchirinos', 'VEN', 81336709.00, 'BPROV', '01082416840200284346', 'O', '17308555', 'EDGLINE CHIRINOS', 'pedirluego@gmail.com', '+584261304008', 0, 0, NULL, NULL, NULL, '2021-09-27 12:10:33', NULL, NULL, NULL, NULL, 'dinero recibido en efectivo, depositar en caja ahorros del banco vision.\naveriguar el tipo de cuenta del beneficiario', 0),
(30, 85, 'acruzp', 'VEN', 675.00, 'BANSC', '0134040628406104808', 'C', '15645288', 'LILA VASQUEZ', '', '', 0, 0, NULL, NULL, NULL, '2021-10-02 13:59:50', NULL, NULL, NULL, NULL, '', 0),
(31, 86, 'acruzp', 'VEN', 700.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', '', '', 1, 1, NULL, NULL, NULL, '2021-10-02 14:06:42', NULL, NULL, NULL, NULL, 'si no se puede enviar a bancaribe, hacer por pago movil, lo tiene activado', 1),
(32, 87, 'acruzp', 'VEN', 20.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'Lila Esther Vasquez Cueto', 'acruzpmi@gmail.com', '+58 412-9975724', 0, 1, NULL, NULL, NULL, '2021-10-02 15:32:46', NULL, NULL, NULL, NULL, 'se hizo por pago movil', 0),
(33, 88, 'yasmary', 'VEN', 54.00, 'BCARI', '01340946360001365291', 'A', '20443581', 'ALEXANDRA FELICIANDY VIELMA SANCHEZ', '', '', 0, 0, NULL, NULL, NULL, '2021-10-06 19:39:28', NULL, NULL, NULL, NULL, 'calculado por operador Gabriel. esperando confirmacion para proceder', 0),
(34, 89, 'joseidy', 'VEN', 107.00, 'BPROV', '01082456740100147471', 'C', '245674010014', 'Seidee Chirinos', '', '04267096680', 0, 2, 'admin', NULL, '2021-11-12 22:04:14', '2021-10-11 13:24:35', NULL, 'admin', NULL, 'Verificado por operador', 'De Yami y Joseidy para Edgline', 1),
(35, 92, 'nailynsilva', 'VEN', 200.00, 'BANSC', '', 'O', '9659599', 'María Martínez', '', '04243202091', 1, 1, 'gperez', NULL, '2021-10-17 21:04:00', '2021-10-17 16:39:04', 1, NULL, '2021-10-17 20:10:00', 'El usuario desconfiaba de los giros por haber sido victima de estafa.\r\nSe le hizo la remesa y luego se fue a retirar el dinero en efectivo.\r\nSe deposito en banco familiar.', 'Pago móvil', 1),
(36, 94, 'jesussoto', 'VEN', 32.00, 'BDV', '01020740120000207311', 'O', '20697444', 'ADRIAN PACHECO', '', '', 0, 2, 'admin', NULL, '2021-11-17 02:20:47', '2021-10-18 14:51:02', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'PAGARA EN BANCO VISION', 1),
(37, 95, 'nazareth', 'VEN', 107.00, 'BDV', '01020146280000322050', 'O', '14182297', 'CARMEN PEREZ', '', '', 0, 2, 'admin', NULL, '2021-11-04 13:17:08', '2021-10-18 17:00:57', NULL, 'admin', NULL, 'Verificado por operador', 'CUÑADA DE CLIENTA NAILYN SANCHEZ', 1),
(38, 96, 'yamilethchirinos', 'VEN', 54.00, 'BANSC', '01340326143262177089', 'A', '14176395', 'Mirlay Chirinos', '', '+584149553707', 0, 1, 'gperez', NULL, NULL, '2021-10-19 12:46:51', 1, NULL, '2021-10-19 16:26:00', NULL, 'Para torta de cumple Haydee', 1),
(39, 98, 'yasmary', 'VEN', 54.00, 'BMERC', '01050670150670102954', 'O', '16153005', 'LENIS RIVAS', '', '', 0, 1, 'gperez', NULL, NULL, '2021-10-22 15:02:32', NULL, NULL, NULL, NULL, 'enviar urgente, notificar al cliente por whatsapp', 1),
(46, 108, 'nazareth', 'VEN', 400.00, 'BDV', '01020146280000322050', 'O', '14182297', 'CARMEN PEREZ', '', '', 0, 1, 'gabriel', NULL, '2021-10-30 18:50:00', '2021-10-30 18:00:44', 1, NULL, '2021-10-30 18:51:00', NULL, 'Entrega dinero en efectivo a Gabriel, y se deposita en banco Sudameris de Joseidy. Se le quito prestado a esa cuenta para comprar la cripto', 1),
(47, 110, 'admin', 'VEN', 4.00, 'BTES', '01340406284061048089', 'C', '999999', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '+58-426-7096680', 0, 0, NULL, NULL, NULL, '2021-10-31 19:42:53', NULL, NULL, NULL, NULL, 'Prueba', 0),
(48, 111, 'yamilethchirinos', 'VEN', 57.67, 'BPROV', '01082457501500005864', 'C', '15447794', 'YOLMARY CHIRINOS', '', '+58 424-4001007', 0, 1, 'gabriel', NULL, '2021-11-02 18:00:00', '2021-11-02 13:28:43', 1, NULL, '2021-11-02 18:35:00', NULL, '', 1),
(52, 116, 'williamvillasmil', 'VEN', 209.09, 'BCARI', '01340073310731064329', 'C', '18723229', 'Willnelson Parra', '', '', 0, 2, 'admin', NULL, '2021-11-09 23:46:36', '2021-11-09 21:56:47', NULL, 'admin', NULL, 'Verificado por operador', 'Hermano del cliente, para tratamiento dental', 1),
(53, 117, 'admin', 'VEN', 223.00, 'BANSC', '01340946310001071384', 'O', '9659599', 'Maria Martinez', '', '', 0, 2, 'admin', NULL, '2021-11-10 15:50:50', '2021-11-10 12:13:28', NULL, 'admin', NULL, 'Verificado por operador', 'Ofrecida para mediodia.\nCarlos villarroel fue a buscar el efectivo en casa de la cliente.\nY lo deposito en banco Visión', 1),
(54, 118, 'cvillaroque', 'VEN', 301.02, 'BDV', '01020613880100005072', 'A', '8374129', 'Victor Villarroel', '', '', 0, 0, NULL, NULL, NULL, '2021-11-10 12:41:47', NULL, NULL, NULL, NULL, '', 0),
(55, 119, 'cvillaroque', 'VEN', 302.36, '', '01020613880100005072', 'A', '8374129', 'Victor Villarroel', '', '', 0, 0, NULL, NULL, NULL, '2021-11-10 12:44:35', NULL, NULL, NULL, NULL, 'Pago 300.000 Gs como primer pago, el resto 200.000 Gs es a credito, pagara el dia jueves 12.nov', 0),
(56, 120, 'cvillarroque', 'VEN', 302.36, 'BDV', '01020613880100005072', 'A', '8374129', 'Victor Villarroel', '', '', 0, 2, 'admin', NULL, '2021-11-10 14:37:18', '2021-11-10 12:47:50', NULL, 'admin', NULL, 'Verificado por operador', 'Pago en banco familiar una parte de 300.000 Gs. El resto es a credito, 200.000 Gs. lo ofrecio pagar el jueves 12.nov', 1),
(57, 121, 'yamilethchirinos', 'VEN', 121.16, 'BPROV', '01082456740200058786', 'A', '7357750', 'ZENAIDA ESCALONA', '', '', 0, 2, 'admin', NULL, '2021-11-12 17:10:44', '2021-11-12 16:50:44', NULL, 'admin', NULL, 'Verificado por operador', '', 1),
(58, 122, 'nailynsilva', 'VEN', 116.00, 'BANSC', '01340026130263126481', 'C', '8186593', 'Livia Ortíz', '', '', 0, 2, 'admin', NULL, '2021-11-17 17:00:42', '2021-11-17 15:06:42', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'El cliente va a pagar por giro claro o deposito bancario', 1),
(59, 123, 'nailynsilva', 'VEN', 48.80, 'BPROV', '01080124980100289762', 'O', '7226248', 'Carmen Silva', '', '', 0, 2, 'admin', NULL, '2021-11-19 15:08:29', '2021-11-19 15:00:24', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'el cliente pagara por giro claro Gabriel, o entrega en efectivo', 1),
(63, 129, 'jesussoto', 'VEN', 48.90, 'BDV', '01020159450103148814', '', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 2, 'admin', NULL, '2021-11-25 16:42:36', '2021-11-25 15:40:06', 1, 'gperez', NULL, 'Verificado por operador desde el backend', '', 1),
(61, 126, 'nailynsilva', 'VEN', 48.10, 'BANSC', '01340026130263126481', 'C', '8186593', 'Livia Ortíz', '', '', 0, 2, 'admin', NULL, '2021-11-21 18:34:52', '2021-11-21 17:39:58', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'el cliente traera el dinero en efectivo, se deberia depositar en banco para hacer compra de cripto', 1),
(62, 127, 'cvillarroque', 'VEN', 242.50, 'BANSC', '01720110711105221012', 'C', '999999', 'Victor Villarroel', 'victor@GMAIL.COM', '', 0, 0, NULL, NULL, NULL, '2021-11-22 01:31:49', NULL, NULL, NULL, NULL, '', 0),
(92, 177, 'cvillarroque', 'VEN', 608.40, 'BTES', '01720110711105221012', 'C', '29698227', 'IRALYS VILLARROEL', 'pedirlo@GMAIL.COM', '4168069516', 0, 2, 'admin', NULL, '2021-12-16 15:45:19', '2021-12-16 14:52:47', NULL, 'cvillarroque', NULL, 'Verificado por operador desde el backend', 'deposito 900.000 en banco vision.\nGabriel y Yosi le debe 100.000 que deben colocarlo para esta transaccion', 1),
(65, 141, 'nailynsilva', 'VEN', 72.90, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 2, 'admin', NULL, '2021-11-29 23:36:58', '2021-11-29 23:01:46', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(90, 175, 'yamilethchirinos', 'VEN', 184.67, 'BPROV', '01082456740200058786', 'C', '7357750', 'ZENAIDA ESCALONA', 'yamilethchirinos@gmail.com', '999999', 0, 2, 'admin', NULL, '2021-12-14 17:54:37', '2021-12-14 14:08:57', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '50% para Carolina, 50% para Haydee.', 1),
(85, 168, 'joseidy', 'VEN', 47.30, 'BMERC', '01050666210666289085', 'A', '7466624', 'MARIA ELENA MUJICA', 'elena10055@gmail.com', '', 0, 2, 'admin', NULL, '2021-12-10 15:31:21', '2021-12-08 14:54:50', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '10 USD A TASA DEL PARALELO', 1),
(91, 176, 'cvillarroque', 'VEN', 543.88, 'BTES', '01720110711105221012', 'C', '29698227', 'IRALYS VILLARROEL', 'cvillaroque@GMAIL.COM', '4168069516', 0, 0, NULL, NULL, NULL, '2021-12-16 14:42:56', NULL, NULL, NULL, NULL, 'enviar a su hija', 0),
(89, 174, 'yamilethchirinos', 'VEN', 226.93, 'BPROV', '01082456740200058786', 'C', '7357750', 'ZENAIDA ESCALONA', 'yamilethchirinos@gmail.com', '', 0, 1, 'admin', NULL, '2021-12-14 01:53:58', '2021-12-13 22:42:36', NULL, NULL, NULL, 'Verificado por operador desde el backend', 'Mitad para Carolina.\nMitad para Haydee.', 0),
(86, 169, 'joseidy', 'VEN', 154.11, 'BPROV', '01082433810100003008', 'C', 'J-08513316-0', 'JOSEIDY AGUILAR', 'honim.confirmar@gmail.com', '', 0, 2, 'admin', NULL, '2021-12-11 23:40:24', '2021-12-08 14:59:01', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'PARA NI#O DEL HONIM', 1),
(87, 170, 'nailynsilva', 'VEN', 228.00, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 2, 'admin', NULL, '2021-12-10 16:27:04', '2021-12-10 00:19:07', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Pago del cliente via efectivo. 260.000 gs.\n Y resto descontado de intercambio de servicio personal. 110 mil', 1),
(75, 154, 'joseavilioquintero', 'VEN', 94.41, 'BMERC', '01050745600745033806', 'O', '16253733', 'María Guevara', '', '', 0, 2, 'admin', NULL, '2021-12-01 23:03:52', '2021-12-01 22:37:59', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Parte de remesa completa que son 550.000 Bs.', 1),
(93, 179, 'luisdominicano', 'VEN', 61.14, 'BNC', '01910164952100002273', 'O', '8781892', 'Julio Arraiz', '', '', 0, 2, 'admin', NULL, '2021-12-20 17:43:42', '2021-12-20 12:36:10', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(77, 156, 'joseavilioquintero', 'VEN', 125.34, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', '', '', 0, 2, 'admin', NULL, '2021-12-01 23:24:57', '2021-12-01 22:42:58', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Remesa parte 2, de remesa completa que son 550.000 Gs.', 1),
(78, 157, 'joseavilioquintero', 'VEN', 62.19, 'BDV', '01020734770000012289', 'O', '20006934', 'Frank Molina', '', '', 0, 2, 'admin', NULL, '2021-12-02 17:57:46', '2021-12-02 14:10:36', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '3ra Parte de remesa, total 550.000 Gs', 1),
(83, 166, 'oswaldozambrano', 'VEN', 33.18, 'BDV', '01020726630000172941', 'C', '12183858', 'Yuraima Labarca', '', '', 0, 2, 'admin', NULL, '2021-12-06 18:11:48', '2021-12-06 15:33:37', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'cliente pago por giro claro, pero solo llego el monto 50.000 Gs. exactos a la billetera', 1),
(80, 162, 'joseavilioquintero', 'VEN', 62.60, 'BDV', '01020317110000352761', 'C', '16241189', 'YOSMAR NAVEDA', '', '', 0, 2, 'admin', NULL, '2021-12-02 18:07:17', '2021-12-02 17:38:03', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '. ultima remesa del cliente, como un total de 4 transacciones', 1),
(81, 164, 'nailynsilva', 'VEN', 48.10, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 2, 'admin', NULL, '2021-12-04 17:29:33', '2021-12-04 11:52:54', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(84, 167, 'williamvillasmil', 'VEN', 222.15, 'BANSC', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'pedirsinemail@mail.com', '4246799139', 0, 2, 'admin', NULL, '2021-12-07 02:04:28', '2021-12-06 15:46:25', NULL, 'williamvillasmil', NULL, 'Verificado por operador desde el backend', 'dinero recibido en efectivo, depositado en banco familiar', 1),
(94, 181, 'joseavilioquintero', 'VEN', 122.24, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', '', '', 0, 2, 'admin', NULL, '2021-12-20 21:29:29', '2021-12-20 18:55:15', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'papa del cliente, para comprar carne para hallacas :D', 1),
(95, 183, 'williamvillasmil', 'VEN', 215.73, 'BCARI', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 2, 'admin', NULL, '2021-12-21 12:38:55', '2021-12-20 19:41:47', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Para su hermano, sin apuro', 1),
(96, 184, 'joseavilioquintero', 'VEN', 184.10, 'BDV', '01020169190100038429', 'A', '13951192', 'Adrianyela Díaz Martínez', '', '', 0, 2, 'admin', NULL, '2021-12-20 22:48:46', '2021-12-20 21:55:49', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'la que envia realmente es la esposa de jose avilio quintero. Tarea: Crear otro usuario para ella', 1),
(97, 185, 'nailynsilva', 'VEN', 797.75, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 2, 'admin', NULL, '2021-12-21 12:21:23', '2021-12-20 22:11:42', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Tratar de que sea hoy', 1),
(98, 186, 'invitado', 'VEN', 306.83, 'BANSC', '01340893928932000750', 'O', '9435835', 'Mariela Perez', '', '', 0, 2, 'admin', NULL, '2021-12-21 12:28:51', '2021-12-20 22:13:14', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Esposo de Nailyn', 1),
(99, 188, 'nailynsilva', 'VEN', 67.50, 'BDV', '01020333320000135645', 'C', '15610513', 'Eglis Rebolledo', '', '', 0, 2, 'admin', NULL, '2021-12-21 02:11:10', '2021-12-20 22:15:47', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Familiar de Nailyn', 1),
(100, 189, 'joseavilioquintero', 'VEN', 91.46, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', '', '', 0, 2, 'admin', NULL, '2021-12-21 16:18:50', '2021-12-21 15:50:40', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(101, 192, 'franrodriguez', 'VEN', 613.83, 'BPROV', '01080125791500020284', 'C', '20981283', 'Stephany Rodriguez', 'pedir@elmail.com', '', 0, 2, 'admin', NULL, '2021-12-21 21:32:06', '2021-12-21 19:47:21', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(102, 190, 'jenireevilla', 'VEN', 540.00, 'BDV', '01020159460000251956', 'C', '16872539', 'Mariangelys Villa', '', '', 0, 2, 'admin', NULL, '2021-12-21 23:06:54', '2021-12-21 20:56:10', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(103, 193, 'Acruzp', 'VEN', 219.00, 'BANSC', '01340014890141131689', 'O', '26227577', 'Robert Montaño', '', '', 0, 2, 'admin', NULL, '2021-12-23 19:36:47', '2021-12-23 18:14:36', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(104, 194, 'nailynsilva', 'VEN', 308.00, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 2, 'admin', NULL, '2021-12-28 12:19:32', '2021-12-24 14:47:34', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(105, 195, 'zenaidaescalona', 'VEN', 193.13, 'BPROV', '01080061740100230014', 'O', '', 'YENIFER MUJICA', '', '', 0, 2, 'admin', NULL, '2021-12-29 20:53:53', '2021-12-29 20:49:38', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Pago origen recibido en efectivo. Debe depositarte en algun banco', 1),
(106, 196, 'invitado', 'VEN', 142.50, 'BANSC', '01340893928932000750', 'C', '9435835', 'Mariela Pérez', '', '', 0, 2, 'admin', NULL, '2021-12-31 13:46:37', '2021-12-30 00:01:20', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(107, 91, 'yamilethchirinos', 'VEN', 200.00, 'BANSC', '01340326143262177089', 'A', '14176395', 'Mirlay Chirinos', '', '+584149553707', 0, 2, 'gperez', NULL, NULL, '2021-10-14 19:20:00', 1, 'admin', '2021-12-30 12:30:00', NULL, 'Corregir: cuenta destino, Edgline Chirinos.\r\npago destino ingresado manualmente por operador pues no se grabo correctamente usando la calculadora del backend.', 1),
(108, 197, 'williamvillasmil', 'VEN', 92.40, 'BCARI', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 2, 'admin', NULL, '2021-12-31 09:39:40', '2021-12-30 18:25:29', NULL, 'admin', NULL, 'Verificado por operador desde el backend', 'Pago origen en efectivo. A depositarse en banco familiar', 1),
(109, 198, 'joseavilioquintero', 'VEN', 123.52, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', '', '', 0, 2, 'admin', NULL, '2021-12-31 19:23:52', '2021-12-31 18:23:47', NULL, 'joseavilioquintero', NULL, 'Verificado por operador desde el backend', '', 1),
(110, 199, 'joseavilioquintero', 'VEN', 123.79, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', '', '', 0, 2, 'admin', NULL, '2021-12-31 19:50:17', '2021-12-31 18:26:54', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(111, 200, 'joseavilioquintero', 'VEN', 62.03, 'BDV', '01020317110000352761', 'C', '16241189', 'YOSMAR NAVEDA', '', '', 0, 2, 'admin', NULL, '2021-12-31 19:26:49', '2021-12-31 18:46:10', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(112, 201, 'joseavilioquintero', 'VEN', 62.16, 'BDV', '01020734770000012289', 'O', '20006934', 'FRANK MOLINA', '', '', 0, 2, 'admin', NULL, '2021-12-31 19:28:49', '2021-12-31 18:47:01', NULL, 'admin', NULL, 'Verificado por operador desde el backend', '', 1),
(113, 202, 'Acruzp', 'VEN', 464.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'pediremaillilavasquez@GMAIL.COM', '04126369603', 1, 1, 'gperez', NULL, NULL, '2022-01-03 13:11:46', 1, 'gperez', '2022-01-03 16:51:00', 'El pago llegó correctamente. Confirmado por mensaje whatsapp y telegram', '', 1),
(114, 203, 'gperez', 'VEN', 47.90, 'BDV', '01020365110000630140', 'O', '13502934', 'Cristian Ybarra', '', '', 0, 0, NULL, NULL, NULL, '2022-01-06 19:23:48', NULL, NULL, NULL, NULL, 'Donacion a primo', 0),
(115, 204, 'gperez', 'VEN', 196.59, 'BDV', '01020743600000340650', 'C', '7915982', 'ALONZO FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-01-09 13:12:44', NULL, NULL, NULL, NULL, 'para pagar deuda de hermana Fredmari', 0),
(116, 205, 'nailynsilva', 'VEN', 242.50, 'BANSC', '01340946310001071384', 'C', '9659599', 'MARIA MARTINEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-01-10 15:18:07', NULL, NULL, NULL, NULL, 'cliente pagarA en efectivo, se depositarA en banco familiar', 0),
(117, 207, 'joseavilioquintero', 'VEN', 62.40, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', '', '', 0, 0, NULL, NULL, NULL, '2022-01-11 18:15:36', NULL, NULL, NULL, NULL, 'papa del cliente', 0),
(118, 208, 'joseavilioquintero', 'VEN', 62.53, 'BDV', '01020310470009740604', 'A', '8134278', 'José Quintero Monsalve', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-01-11 18:18:18', NULL, NULL, NULL, NULL, '', 0),
(119, 209, 'gperez', 'VEN', 141.30, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-01-11 18:51:59', NULL, NULL, NULL, NULL, 'primera parte de envio del mes a mi mamA', 0),
(120, 210, 'danielhernandez', 'VEN', 157.59, 'BANSC', '01340946340001504207', 'C', '19710482', 'Yexiree Zapata', 'pediremailalgundia@GMAIL.COM', '', 0, 0, 'gperez', NULL, NULL, '2022-01-12 16:29:00', 0, 'gperez', '2022-01-12 20:06:46', '', 'usuario llego por recomendacion de Estefani Gamboa, del equipo de softbol (ella aun no es cliente)', 0),
(121, 212, 'ilder', 'VEN', 471.00, 'BMERC', '9999999', 'C', '123', 'ILDER PPORTAL', '', '', 0, 0, NULL, NULL, NULL, '2022-01-12 18:43:26', NULL, NULL, NULL, NULL, 'EL CLIENTE ENVIA 100 USD DE VZLA A PARAGUAY, DEBEMOS AJUSTAR LA CALCULADORA PARA ESE PAR', 0),
(122, 214, 'zenaidaescalona', 'VEN', 248.97, 'BPROV', '01082456740200058786', 'A', '7357750', 'ZENAIDA ESCALONA', '', '', 0, 0, NULL, NULL, NULL, '2022-01-17 15:51:09', NULL, NULL, NULL, NULL, 'para carolina tratamiento de su hija, y limpieza de patio casa Zena', 0),
(123, 215, 'jesussoto', 'VEN', 70.80, 'BDV', '01020159450103148814', 'O', '11352433', 'ELKA ARMAS', '', '', 0, 0, NULL, NULL, NULL, '2022-01-18 16:21:40', NULL, NULL, NULL, NULL, 'mama del cliente', 0),
(124, 216, 'ilder', 'VEN', 23.55, 'BEXT', '9999999', 'A', '123', 'ILDER PPORTAL', '', '', 0, 0, NULL, NULL, NULL, '2022-01-18 19:07:22', NULL, NULL, NULL, NULL, 'prueba de operador', 0),
(125, 217, 'joseidy', 'VEN', 48.24, 'BMERC', '01050107510107299305', 'C', '19180462', 'Joseidy Aguilar. Transferir a Doris Palencia Banesco', 'honim.confirmar@gmail.com', '', 0, 2, 'gperez', NULL, '2022-01-19 13:57:00', '2022-01-19 11:36:50', 1, 'gperez', '2022-01-19 14:00:00', NULL, 'enviado a Doris, donacion para perra canela', 1),
(126, 218, 'nailynsilva', 'VEN', 47.40, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 1, 'hilder', NULL, '2022-01-21 13:42:06', '2022-01-21 13:42:06', NULL, NULL, NULL, NULL, '', 0),
(127, 220, 'Michelle', 'VEN', 71.40, 'BPROV', '01080530950200093617', 'A', '7131989', 'Yaneth González', '', '', 0, 0, NULL, NULL, NULL, '2022-01-22 12:53:40', NULL, NULL, NULL, NULL, '', 0),
(128, 221, 'Michelle', 'VEN', 95.39, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '', 0, 2, 'hilder', NULL, '2022-01-22 19:18:00', '2022-01-22 13:15:35', 1, 'michelle', '2022-01-22 22:46:00', NULL, 'enviado a su mamá', 1),
(129, 222, 'williamvillasmil', 'VEN', 235.50, 'BANSC', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-01-24 19:15:56', NULL, NULL, NULL, NULL, 'HNO DE WILLIAM', 0),
(130, 223, 'franrodriguez', 'VEN', 214.94, 'BANSC', '01080530950200093617', 'C', '6332747', 'ABEL FERREIRA', '', '', 0, 0, NULL, NULL, NULL, '2022-01-25 18:22:17', NULL, NULL, NULL, NULL, '', 0),
(131, 224, 'joseavilioquintero', 'VEN', 119.68, 'BDV', '01020310470009740604', 'C', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-01-31 12:43:12', NULL, NULL, NULL, NULL, '', 0),
(132, 225, 'joseavilioquintero', 'VEN', 119.68, 'BMERC', '01050745600745033806', 'A', '16253733', 'MARÍA GUEVARA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-01-31 12:46:20', NULL, NULL, NULL, NULL, '', 0),
(133, 226, 'joseavilioquintero', 'VEN', 59.84, 'BDV', '01020734770000012289', 'C', '20006934', 'FRANK MOLINA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-01-31 12:48:48', NULL, NULL, NULL, NULL, '', 0),
(134, 227, 'jesussoto', 'VEN', 46.10, 'BDV', '01020159450103148814', 'O', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-01-31 13:12:11', NULL, NULL, NULL, NULL, 'urgente, para comida', 0),
(135, 228, 'gperez', 'VEN', 272.40, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-02-02 12:45:23', NULL, NULL, NULL, NULL, '', 0),
(136, 229, 'Acruzp', 'VEN', 410.40, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-02-03 11:29:08', NULL, NULL, NULL, NULL, '', 0),
(137, 231, 'yasmary', 'VEN', 70.20, 'BDV', '01020114420000992671', 'A', '', 'Nicolas Mejias', '', '', 0, 0, NULL, NULL, NULL, '2022-02-07 13:20:24', NULL, NULL, NULL, NULL, '', 0),
(138, 233, 'nailynsilva', 'VEN', 66.90, 'BDV', '01020358980000246482', 'C', '5265771', 'PEDRO VICENTE SILVA TORRES', '', '', 0, 0, NULL, NULL, NULL, '2022-02-08 16:16:22', NULL, NULL, NULL, NULL, '', 0),
(139, 234, 'nailynsilva', 'VEN', 223.00, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-02-08 16:18:49', NULL, NULL, NULL, NULL, '', 0),
(140, 235, 'zenaidaescalona', 'VEN', 89.60, '', '', '', '', '', '', '', 0, 0, NULL, NULL, NULL, '2022-02-08 17:46:56', NULL, NULL, NULL, NULL, '', 0),
(141, 236, 'zenaidaescalona', 'VEN', 89.60, 'BANSC', '01340326143262177089', 'C', '14176395', 'Mirlay Chirinos', '', '+58 414-9553707', 0, 0, NULL, NULL, NULL, '2022-02-08 17:57:39', NULL, NULL, NULL, NULL, 'Zenaida envia a Mirlay 18 usd a tasa del paralelo para agua', 0),
(142, 237, 'zenaidaescalona', 'VEN', 82.86, 'BANSC', '01340326143262177089', 'C', '14176395', 'MIRLAY CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-02-08 18:20:14', NULL, NULL, NULL, NULL, '', 0),
(143, 238, 'williamvillasmil', 'VEN', 89.20, 'BCARI', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-02-09 12:59:53', NULL, NULL, NULL, NULL, 'atender tranquilamente', 0),
(144, 239, 'franrodriguez', 'VEN', 93.87, '', '', 'O', '', '', '', '', 0, 0, NULL, NULL, NULL, '2022-02-09 14:19:23', NULL, NULL, NULL, NULL, 'Transferir a Billetera Binance', 0),
(145, 240, 'joseavilioquintero', 'VEN', 201.15, 'BNC', '01910010372110019616', 'C', '13580258', 'Jonathan José Acosta', '', '', 0, 0, NULL, NULL, NULL, '2022-02-09 16:54:18', NULL, NULL, NULL, NULL, '', 0),
(146, 241, 'gperez', 'VEN', 45.73, 'BDV', '01020743600000340650', 'C', '7915982', 'ALONZO FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-02-09 19:31:24', NULL, NULL, NULL, NULL, '', 0),
(147, 242, 'gperez', 'VEN', 44.90, '', '', '', '', 'Lisset de Barquisimeto', '', '04161525361', 0, 0, NULL, NULL, NULL, '2022-02-12 17:29:12', NULL, NULL, NULL, NULL, '', 0),
(148, 243, 'joseidy', 'VEN', 115.25, 'BMERC', '01050666210666289085', 'A', '7466624', 'MARIA ELENA MUJICA', 'honim.confirmar@gmail.com', '992860184', 0, 0, NULL, NULL, NULL, '2022-02-14 14:07:56', NULL, NULL, NULL, NULL, '', 0),
(149, 244, 'gperez', 'VEN', 90.20, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-02-17 14:38:21', NULL, NULL, NULL, NULL, 'Envío para consulta odontológica', 0),
(150, 245, 'cvillarroque', 'VEN', 357.89, 'BTES', '01720110711105221012', 'C', '29698227', 'IRALYS VILLARROEL', 'pedirvillarroel@GMAIL.COM', '4168069516', 0, 0, NULL, NULL, NULL, '2022-02-19 11:42:13', NULL, NULL, NULL, NULL, '', 0),
(151, 246, 'joseidy', 'VEN', 59.52, 'BDV', '01026565656565656565', 'A', '16594651', 'KENYA FONSECA', '', '04261234567', 0, 0, NULL, NULL, NULL, '2022-02-19 13:59:23', NULL, NULL, NULL, NULL, '', 0),
(152, 247, 'kenyafonseca', 'VEN', 119.03, 'BANSC', '01050033030300303030', 'C', '12345678', 'KENYA FONSECA', '', '03403243243242', 0, 0, NULL, NULL, NULL, '2022-02-19 14:04:24', NULL, NULL, NULL, NULL, 'PRUEBA MEETING', 0),
(153, 249, 'zenaidaescalona', 'VEN', 45.40, 'BPROV', '01082456740200058786', 'A', '7357750', 'ZENAIDA ESCALONA', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-02-20 12:43:54', NULL, NULL, NULL, NULL, '', 0),
(154, 250, 'Michelle', 'VEN', 59.33, 'BPROV', '01080953360100015724', 'C', '7080051', 'Rafael Erazo', '', '', 0, 0, NULL, NULL, NULL, '2022-02-22 20:40:51', NULL, NULL, NULL, NULL, '', 0),
(155, 251, 'joseavilioquintero', 'VEN', 149.91, 'BNC', '01910010312110014789', 'C', '17146117', 'Candelario Rodríguez', '', '', 0, 0, NULL, NULL, NULL, '2022-02-23 21:56:22', NULL, NULL, NULL, NULL, '', 0),
(156, 253, 'Acruzp', 'VEN', 89.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-02-25 15:30:34', NULL, NULL, NULL, NULL, '', 0),
(157, 257, 'joseavilioquintero', 'VEN', 86.40, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-03-01 15:01:44', NULL, NULL, NULL, NULL, '', 0),
(158, 258, 'joseavilioquintero', 'VEN', 114.94, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-03-01 15:04:27', NULL, NULL, NULL, NULL, '', 0),
(159, 259, 'joseavilioquintero', 'VEN', 28.80, 'BDV', '01020734770000012289', 'O', '20006934', 'FRANK MOLINA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-03-01 15:06:14', NULL, NULL, NULL, NULL, '', 0),
(160, 260, 'franrodriguez', 'VEN', 335.41, 'BPROV', '01080125791500020284', 'C', '20981283', 'Stephany Rodríguez', '', '', 0, 0, NULL, NULL, NULL, '2022-03-02 18:07:29', NULL, NULL, NULL, NULL, '', 0),
(161, 261, 'nailynsilva', 'VEN', 56.30, 'BDV', '01020358980000246482', 'C', '5265771', 'PEDRO VICENTE SILVA TORRES', '', '', 0, 0, NULL, NULL, NULL, '2022-03-03 14:35:39', NULL, NULL, NULL, NULL, '', 0),
(162, 262, 'joseavilioquintero', 'VEN', 84.11, 'BDV', '01020406210100019702', 'C', '18857633', 'Génesis Moreno', '', '', 0, 0, NULL, NULL, NULL, '2022-03-04 12:11:37', NULL, NULL, NULL, NULL, '', 0),
(163, 263, 'Acruzp', 'VEN', 484.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-04 18:44:06', NULL, NULL, NULL, NULL, '', 0),
(164, 264, 'gperez', 'VEN', 116.88, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-03-05 16:45:39', NULL, NULL, NULL, NULL, '', 0),
(165, 265, 'gperez', 'VEN', 88.00, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-03-05 16:47:28', NULL, NULL, NULL, NULL, '', 0),
(166, 266, 'gperez', 'VEN', 50.03, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-03-05 16:48:35', NULL, NULL, NULL, NULL, '', 0),
(167, 267, 'oscar', 'VEN', 362.10, 'BDV', '01020743610000361464', 'C', '20892628', 'OSMARY JIMENEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-03-09 13:27:18', NULL, NULL, NULL, NULL, '', 0),
(168, 269, 'yasmary', 'VEN', 83.92, 'BDV', '01020114420000992671', 'A', '27925821', 'NICOLAS MEJIAS', '', '', 0, 0, NULL, NULL, NULL, '2022-03-09 22:10:13', NULL, NULL, NULL, NULL, '', 0),
(169, 270, 'nailynsilva', 'VEN', 229.17, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-03-10 12:12:16', NULL, NULL, NULL, NULL, '', 0),
(170, 271, 'yamilethchirinos', 'VEN', 142.03, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-03-11 14:09:33', NULL, NULL, NULL, NULL, '', 0),
(171, 272, 'nailynsilva', 'VEN', 228.29, 'BANSC', '01340946310001071384', 'O', '9659599', 'MARIA MARTINEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-03-11 16:02:33', NULL, NULL, NULL, NULL, '', 0),
(172, 273, 'Michelle', 'VEN', 34.48, 'BPROV', '01080953360100015724', 'C', '7080051', 'RAFAEL ERAZO', '', '', 0, 0, NULL, NULL, NULL, '2022-03-15 19:57:30', NULL, NULL, NULL, NULL, '', 0),
(173, 274, 'Acruzp', 'VEN', 21.70, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-16 19:13:39', NULL, NULL, NULL, NULL, '', 0),
(174, 275, 'matiasff', 'VEN', 254.26, 'BDV', '01020518290000162168', 'C', '10674546', 'MARY TERAN', '', '', 0, 0, NULL, NULL, NULL, '2022-03-18 20:02:18', NULL, NULL, NULL, NULL, '', 0),
(175, 276, 'Acruzp', 'VEN', 439.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-23 11:54:53', NULL, NULL, NULL, NULL, '', 0),
(176, 277, 'williamvillasmil', 'VEN', 221.00, 'BCARI', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-03-24 12:53:55', NULL, NULL, NULL, NULL, 'Para su mamá', 0),
(177, 278, 'gperez', 'VEN', 44.20, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-03-24 13:29:17', NULL, NULL, NULL, NULL, '', 0),
(178, 279, 'franklinurbina', 'VEN', 4.00, '', '01020101260000016395', 'C', '13348339', 'LUCILA CALZADILLA', '', '', 0, 0, NULL, NULL, NULL, '2022-03-26 15:00:05', NULL, NULL, NULL, NULL, 'prueba de operador GPEREZ', 0),
(179, 280, 'Acruzp', 'VEN', 89.80, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-26 16:08:11', NULL, NULL, NULL, NULL, '', 0),
(180, 282, 'Acruzp', 'VEN', 133.80, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-26 19:03:52', NULL, NULL, NULL, NULL, '', 0),
(181, 283, 'Acruzp', 'VEN', 111.25, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-03-29 16:42:15', NULL, NULL, NULL, NULL, '', 0),
(182, 284, 'Acruzp', 'VEN', 489.50, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-04-01 19:52:36', NULL, NULL, NULL, NULL, '', 0),
(183, 285, 'joseavilioquintero', 'VEN', 58.69, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-04-04 18:49:26', NULL, NULL, NULL, NULL, '', 0),
(184, 286, 'joseavilioquintero', 'VEN', 117.38, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-04-04 18:51:13', NULL, NULL, NULL, NULL, '', 0),
(185, 287, 'joseavilioquintero', 'VEN', 58.56, 'BDV', '01020317110000352761', 'C', '16241189', 'YOSMAR NAVEDA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-04-04 18:52:06', NULL, NULL, NULL, NULL, '', 0),
(186, 288, 'gperez', 'VEN', 89.80, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-04-05 17:34:28', NULL, NULL, NULL, NULL, '', 0),
(187, 289, 'Acruzp', 'VEN', 67.35, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-04-06 13:12:46', NULL, NULL, NULL, NULL, '', 0),
(188, 290, 'invitado', 'VEN', 5.00, 'BANSC', '01340893928932000750', 'O', '9435835', 'MARIELA PEREZ', '', '', 0, 0, NULL, NULL, NULL, '2022-04-09 16:00:53', NULL, NULL, NULL, NULL, '', 0),
(189, 291, 'williamvillasmil', 'VEN', 230.41, 'BANSC', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-04-12 14:09:57', NULL, NULL, NULL, NULL, '', 0),
(190, 292, 'Michelle', 'VEN', 121.00, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-04-12 15:56:11', NULL, NULL, NULL, NULL, '', 0),
(191, 293, 'yamilethchirinos', 'VEN', 184.66, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-04-13 18:22:07', NULL, NULL, NULL, NULL, '', 0),
(192, 294, 'hilder', 'VEN', 54.85, 'BANSC', '01341000370001004247', 'C', '7436238', 'FELIX RODRIGUEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-04-14 00:10:54', NULL, NULL, NULL, NULL, '', 0),
(193, 295, 'Michelle', 'VEN', 71.19, 'BDV', '01020159450103148814', 'C', '11352433', 'ELKA ARMAS', '', '', 0, 0, NULL, NULL, NULL, '2022-04-18 18:19:36', NULL, NULL, NULL, NULL, '', 0),
(194, 296, 'Michelle', 'VEN', 121.93, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-04-23 16:13:51', NULL, NULL, NULL, NULL, '', 0),
(195, 298, 'Acruzp', 'VEN', 609.40, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-04-29 17:28:38', NULL, NULL, NULL, NULL, '', 0),
(196, 299, 'joseavilioquintero', 'VEN', 124.37, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-04-29 19:09:58', NULL, NULL, NULL, NULL, '', 0),
(197, 300, 'joseavilioquintero', 'VEN', 62.18, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-04-29 19:10:54', NULL, NULL, NULL, NULL, '', 0),
(198, 323, 'oscar', 'VEN', 306.54, 'BDV', '01020189620100017325', 'C', '14758433', 'NUBIA LATORRE', '', '', 0, 0, NULL, NULL, NULL, '2022-05-03 18:34:36', NULL, NULL, NULL, NULL, '', 0),
(199, 324, 'oscar', 'VEN', 254.80, 'BDV', '01020743610000361464', 'C', '20892628', 'OSMARY JIMENEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-05-03 18:36:16', NULL, NULL, NULL, NULL, '', 0),
(200, 333, 'oscar', 'VEN', 254.80, 'BDV', '01020743610000361464', 'C', '20892628', 'OSMARY JIMENEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-05-05 19:42:32', NULL, NULL, NULL, NULL, '', 0),
(201, 337, 'invitado', 'VEN', 14.67, 'BANSC', '01340893928932000750', 'O', '9435835', 'MARIELA PEREZ', 'root@example.com', '956848383', 0, 0, NULL, NULL, NULL, '2022-05-06 22:25:39', NULL, NULL, NULL, NULL, 'lkklllll', 0),
(202, 435, 'invitado', 'VEN', 31.78, 'BDV', '', 'O', '26699429', 'YONIELIS VERGARA', '', '0412-1553503', 0, 0, NULL, NULL, NULL, '2022-05-08 21:51:39', NULL, NULL, NULL, NULL, 'Pago regalo día de las madres', 0),
(203, 436, 'zenaidaescalona', 'VEN', 49.68, 'BPROV', '01080132090100115547', 'C', '15306291', 'LILIANY RIERA', '', '', 0, 0, NULL, NULL, NULL, '2022-05-10 12:30:29', NULL, NULL, NULL, NULL, '', 0),
(204, 437, 'yamilethchirinos', 'VEN', 343.81, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-05-12 14:45:40', NULL, NULL, NULL, NULL, '', 0),
(205, 438, 'oscar', 'VEN', 103.34, 'BMERC', '01050150461150069787', 'A', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-05-12 17:03:13', NULL, NULL, NULL, NULL, '', 0),
(206, 439, 'franklinurbina', 'VEN', 102.55, 'BMERC', '01050150461150069787', 'A', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-05-12 17:04:47', NULL, NULL, NULL, NULL, '', 0),
(207, 440, 'franklinurbina', 'VEN', 104.33, 'BMERC', '01050150461150068787', 'A', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-05-12 18:07:05', NULL, NULL, NULL, NULL, '', 0),
(208, 443, 'cvillarroque', 'VEN', 681.62, 'BDV', '01020101260000016395', 'O', '6212561', 'Iraida Bastidas', '', '', 0, 0, NULL, NULL, NULL, '2022-05-16 17:19:46', NULL, NULL, NULL, NULL, 'Cuenta nueva, familiar del cliente', 0),
(209, 444, 'zenaidaescalona', 'VEN', 51.56, 'BPROV', '01082409510100147890', 'C', '17451016', 'KARINA LEAL', '', '', 0, 0, NULL, NULL, NULL, '2022-05-20 00:23:35', NULL, NULL, NULL, NULL, '', 0),
(210, 445, 'zenaidaescalona', 'VEN', 52.57, 'BPROV', '01082409510100147890', 'C', '17451016', 'KARINA LEAL', '', '', 0, 0, NULL, NULL, NULL, '2022-05-20 00:29:49', NULL, NULL, NULL, NULL, '', 0),
(211, 446, 'Michelle', 'VEN', 95.94, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-05-20 14:45:03', NULL, NULL, NULL, NULL, '', 0),
(212, 447, 'oscar', 'VEN', 259.88, 'BDV', '01020743610000361464', 'C', '20892628', 'OSMARY JIMENEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-05-24 19:33:46', NULL, NULL, NULL, NULL, '', 0),
(213, 448, 'Acruzp', 'VEN', 52.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-05-24 22:28:27', NULL, NULL, NULL, NULL, '', 0),
(214, 450, 'Acruzp', 'VEN', 681.20, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-06-01 21:14:25', NULL, NULL, NULL, NULL, '', 0),
(215, 451, 'Michelle', 'VEN', 55.67, 'BDV', '01020159450103148814', 'C', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-06-01 22:11:41', NULL, NULL, NULL, NULL, '', 0),
(216, 452, 'Michelle', 'VEN', 48.71, 'BDV', '01020114400106373308', 'A', '12772044', 'Dianis Armas', '', '', 0, 0, NULL, NULL, NULL, '2022-06-01 22:14:21', NULL, NULL, NULL, NULL, '', 0),
(217, 453, 'joseavilioquintero', 'VEN', 138.11, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-06-02 01:17:54', NULL, NULL, NULL, NULL, '', 0),
(218, 454, 'joseavilioquintero', 'VEN', 138.11, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-06-02 01:19:49', NULL, NULL, NULL, NULL, '', 0),
(219, 455, 'joseavilioquintero', 'VEN', 69.05, 'BMERC', '01050745600745033806', 'O', '16253733', 'MARÍA GUEVARA', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-06-02 01:20:35', NULL, NULL, NULL, NULL, '', 0),
(220, 456, 'leonardzambrano', 'VEN', 54.88, 'BDV', '01020435610000602013', 'C', '26075895', 'Aldo Jose Ichazu Rangel', '', '', 0, 0, NULL, NULL, NULL, '2022-06-08 21:15:07', NULL, NULL, NULL, NULL, '', 0),
(221, 457, 'yamilethchirinos', 'VEN', 147.37, 'BPROV', '01082409510100090686', 'C', '10776513', 'ELDA ESCALONA', '', '', 0, 0, NULL, NULL, NULL, '2022-06-09 20:58:22', NULL, NULL, NULL, NULL, '', 0),
(222, 458, 'franklinurbina', 'VEN', 73.91, 'BMERC', '01050150461150068787', 'A', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-06-11 19:16:44', NULL, NULL, NULL, NULL, '', 0),
(223, 459, 'franklinurbina', 'VEN', 73.78, 'BMERC', '01050150461150068787', 'C', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-06-11 19:18:48', NULL, NULL, NULL, NULL, '', 0),
(224, 460, 'Michelle', 'VEN', 251.95, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-06-13 17:47:14', NULL, NULL, NULL, NULL, '', 0),
(225, 461, 'moisesbarrios', 'VEN', 517.36, 'BANSC', '01340946390001485145', 'C', '20799419', 'GABRIELA GONZÁLEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-06-13 18:24:52', NULL, NULL, NULL, NULL, '', 0),
(226, 462, 'moisesbarrios', 'VEN', 517.36, 'BDV', '01020669320000050542', 'C', '24766458', 'RONALD GONZÁLEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-06-13 18:27:47', NULL, NULL, NULL, NULL, '', 0);
INSERT INTO `pago_destino` (`id`, `id_transaccion`, `login`, `cod_pais`, `monto`, `cod_banco`, `nroctabank`, `tipo_cta`, `doc_titular`, `nombre_titular`, `email`, `telefono`, `ind_pagomovil`, `check_realizado`, `login_user_pagador`, `img_comprob`, `fechahora_comprobante`, `date_created`, `check_admin`, `login_user_check`, `fechahora_check`, `observ_user_check`, `observ_user`, `check_user_cliente`) VALUES
(227, 463, 'Michelle', 'VEN', 113.29, 'BDV', '01020159450103148814', 'C', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-06-14 17:50:07', NULL, NULL, NULL, NULL, '', 0),
(228, 464, 'yamilethchirinos', 'VEN', 376.97, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-06-14 18:42:15', NULL, NULL, NULL, NULL, '', 0),
(229, 465, 'williamvillasmil', 'VEN', 285.00, 'BANSC', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-06-15 11:49:12', NULL, NULL, NULL, NULL, '', 0),
(230, 467, 'williamvillasmil', 'VEN', 288.91, 'BANSC', '01340073310731064329', 'C', '18723229', 'WILLNELSON PARRA', 'villasmilwilliam96@mail.com', '4246799139', 0, 0, NULL, NULL, NULL, '2022-06-16 17:11:48', NULL, NULL, NULL, NULL, '', 0),
(231, 468, 'hilder', 'VEN', 75.83, 'BANSC', '01341000370001004247', 'C', '7436238', 'FELIX RODRIGUEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-06-17 19:54:28', NULL, NULL, NULL, NULL, '', 0),
(232, 469, 'oscar', 'VEN', 86.14, 'BDV', '01020335010102280705', 'A', '26810552', 'JOHELYS MARIANA MARTÍNEZ BARRIOS', '', '', 0, 0, NULL, NULL, NULL, '2022-06-17 21:02:23', NULL, NULL, NULL, NULL, '', 0),
(233, 470, 'jcastro', 'VEN', 75.66, 'BANSC', '01340262132621030921', 'C', '22878058', 'Jose Castro', 'jcastros58@gmail.com', '', 0, 0, NULL, NULL, NULL, '2022-06-18 13:53:40', NULL, NULL, NULL, NULL, '', 0),
(234, 471, 'jcastro', 'VEN', 237.98, 'BANSC', '01340262132621030921', 'C', '22878058', 'JOSE CASTRO', 'jcastros58@gmail.com', '', 0, 0, NULL, NULL, NULL, '2022-06-18 15:49:42', NULL, NULL, NULL, NULL, '', 0),
(235, 472, 'yamilethchirinos', 'VEN', 226.64, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-06-20 19:49:43', NULL, NULL, NULL, NULL, '', 0),
(236, 473, 'yohanaot', 'VEN', 263.48, 'BDV', '01020518290000162168', 'C', '10674546', 'MARY YOCELLIS TERÁN PÁEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-06-20 20:37:31', NULL, NULL, NULL, NULL, '', 0),
(237, 474, 'Acruzp', 'VEN', 84.68, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-06-22 20:59:39', NULL, NULL, NULL, NULL, '', 0),
(238, 475, 'Michelle', 'VEN', 61.94, 'BDV', '01020159450103148814', 'C', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-06-24 21:01:53', NULL, NULL, NULL, NULL, '', 0),
(239, 476, 'Michelle', 'VEN', 186.53, 'BDV', '01020437230000142955', 'C', '21499440', 'ALFREDO LICETT', '', '', 0, 0, NULL, NULL, NULL, '2022-06-25 14:38:55', NULL, NULL, NULL, NULL, '', 0),
(240, 477, 'Acruzp', 'VEN', 748.80, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-07-01 17:09:12', NULL, NULL, NULL, NULL, '', 0),
(241, 478, 'Michelle', 'VEN', 191.66, 'BDV', '01020437230000142955', 'C', '21499440', 'ALFREDO LICETT', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-02 15:49:31', NULL, NULL, NULL, NULL, '', 0),
(242, 479, 'zenaidaescalona', 'VEN', 85.80, 'BPROV', '01082409510100147890', 'C', '17451016', 'KARINA LEAL', 'yamilethchirinos@gmail.com', '999999', 0, 0, NULL, NULL, NULL, '2022-07-02 23:06:29', NULL, NULL, NULL, NULL, '', 0),
(243, 480, 'jcastro', 'VEN', 68.40, 'BANSC', '01340262132621030921', 'C', '22878058', 'JOSE CASTRO', 'jcastros58@gmail.com', '', 0, 0, NULL, NULL, NULL, '2022-07-02 23:07:26', NULL, NULL, NULL, NULL, '', 0),
(244, 481, 'joseavilioquintero', 'VEN', 151.14, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-07-05 01:14:32', NULL, NULL, NULL, NULL, '', 0),
(245, 482, 'zenaidaescalona', 'VEN', 228.04, 'BMERC', '01050045190045405751', 'A', '12933775', 'SEIDEE CHIRINOS', '', '', 0, 0, NULL, NULL, NULL, '2022-07-05 16:39:45', NULL, NULL, NULL, NULL, '', 0),
(246, 483, 'Acruzp', 'VEN', 85.07, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-07-06 18:10:12', NULL, NULL, NULL, NULL, '', 0),
(247, 484, 'Michelle', 'VEN', 137.93, 'BDV', '01020159450103148814', 'C', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-07 21:37:47', NULL, NULL, NULL, NULL, '', 0),
(248, 485, 'Michelle', 'VEN', 190.85, 'BDV', '01020437230000142955', 'C', '21499440', 'ALFREDO LICETT', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-08 17:19:16', NULL, NULL, NULL, NULL, '', 0),
(249, 486, 'Acruzp', 'VEN', 289.12, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-07-11 14:35:09', NULL, NULL, NULL, NULL, '', 0),
(250, 487, 'franklinurbina', 'VEN', 76.81, 'BMERC', '01050150461150068787', 'A', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-07-13 15:56:33', NULL, NULL, NULL, NULL, '', 0),
(251, 488, 'jcastro', 'VEN', 68.08, 'BANSC', '01340262132621030921', 'C', '22878058', 'JOSE CASTRO', 'jcastros58@gmail.com', '', 0, 0, NULL, NULL, NULL, '2022-07-15 13:30:46', NULL, NULL, NULL, NULL, '', 0),
(252, 489, 'zenaidaescalona', 'VEN', 76.17, 'BANSC', '01340866110001102584', 'C', '11599008', 'DORYS PALENCIA', '', '', 0, 0, NULL, NULL, NULL, '2022-07-15 15:15:09', NULL, NULL, NULL, NULL, '', 0),
(253, 490, 'Michelle', 'VEN', 192.80, 'BDV', '01020437230000142955', 'C', '21499440', 'ALFREDO LICETT', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-16 19:59:37', NULL, NULL, NULL, NULL, '', 0),
(254, 491, 'Michelle', 'VEN', 114.47, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-18 23:36:47', NULL, NULL, NULL, NULL, '', 0),
(255, 492, 'gperez', 'VEN', 154.26, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-07-20 00:31:49', NULL, NULL, NULL, NULL, '', 0),
(256, 493, 'Acruzp', 'VEN', 77.02, '', '', '', '', '', '', '', 0, 0, NULL, NULL, NULL, '2022-07-20 22:11:08', NULL, NULL, NULL, NULL, '', 0),
(257, 495, 'Acruzp', 'VEN', 77.02, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-07-20 23:46:34', NULL, NULL, NULL, NULL, '', 0),
(258, 496, 'zenaidaescalona', 'VEN', 58.35, 'BPROV', '01082409510100090686', 'C', '10776513', 'ELDA ESCALONA', '', '', 0, 0, NULL, NULL, NULL, '2022-07-21 01:55:38', NULL, NULL, NULL, NULL, '', 0),
(259, 497, 'yamilethchirinos', 'VEN', 387.01, 'BPROV', '01082456740100147471', 'C', '12933775', 'SEIDEE CHIRINOS', '', '', 0, 0, NULL, NULL, NULL, '2022-07-22 00:53:39', NULL, NULL, NULL, NULL, '', 0),
(260, 498, 'Michelle', 'VEN', 186.94, 'BDV', '01020437230000142955', 'C', '21499440', 'ALFREDO LICETT', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-22 21:52:09', NULL, NULL, NULL, NULL, '', 0),
(261, 499, 'germontilla', 'VEN', 295.00, 'BNC', '01910265371100018297', 'O', '19262244', 'Ismael Montilla Virguez', '', '', 0, 0, NULL, NULL, NULL, '2022-07-23 17:19:23', NULL, NULL, NULL, NULL, 'Cliente vive en Chile', 0),
(262, 500, 'yamilethchirinos', 'VEN', 120.02, 'BPROV', '01082456740100147471', 'C', '12933775', 'SEIDEE CHIRINOS', 'seideechirinos@gmail.com', '+58426-7096680', 0, 0, NULL, NULL, NULL, '2022-07-26 15:30:06', NULL, NULL, NULL, NULL, '', 0),
(263, 502, 'invitado', 'VEN', 36.12, 'BDV', '01020656100000092746', 'C', '12016200', 'robert martinez', 'rjsemartinez7@gmail.com', '04147852181', 0, 0, NULL, NULL, NULL, '2022-07-27 18:38:32', NULL, NULL, NULL, NULL, '', 0),
(264, 503, 'robertmartinez', 'VEN', 36.18, 'BDV', '01020656100000092746', 'C', '12016200', 'Robert Martínez', '', '04147852181', 0, 0, NULL, NULL, NULL, '2022-07-27 22:03:21', NULL, NULL, NULL, NULL, 'Cloente super apurado. Confirmar pago en cuenta hilder', 0),
(265, 505, 'Michelle', 'VEN', 275.48, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-07-28 13:04:08', NULL, NULL, NULL, NULL, 'recibido fondos en banco familiar hilder, luego se pasaron a banco familiar Gabriel, por robo tlf de Hilder', 0),
(266, 506, 'invitado', 'VEN', 54.64, 'BANSC', '01340893928932000750', 'O', '9435835', 'MARIELA PEREZ', 'root@example.com', '956848383', 0, 0, NULL, NULL, NULL, '2022-07-30 21:56:29', NULL, NULL, NULL, NULL, '', 0),
(267, 507, 'joseidy', 'VEN', 198.43, 'BPROV', '01082409500100064316', 'O', '', 'ALEXIS ESCALONA', '', '', 0, 0, NULL, NULL, NULL, '2022-08-01 16:56:30', NULL, NULL, NULL, NULL, 'PARA HERMANO ENFERMO', 0),
(268, 508, 'Acruzp', 'VEN', 777.40, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-02 13:40:48', NULL, NULL, NULL, NULL, '', 0),
(269, 509, 'Acruzp', 'VEN', 776.75, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-02 13:48:15', NULL, NULL, NULL, NULL, '', 0),
(270, 510, 'jesussoto', 'VEN', 126.60, 'BDV', '01020159450103148814', 'O', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-08-02 17:01:27', NULL, NULL, NULL, NULL, '', 0),
(271, 511, 'Acruzp', 'VEN', 657.80, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-02 18:22:45', NULL, NULL, NULL, NULL, '', 0),
(272, 512, 'Acruzp', 'VEN', 658.90, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'acruzpmi@gmail.com', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-02 22:44:11', NULL, NULL, NULL, NULL, 'envio a su mamA', 0),
(273, 513, 'joseavilioquintero', 'VEN', 161.13, 'BDV', '01020310470009740604', 'O', '8134278', 'JOSÉ QUINTERO M', 'javilioqz@gmail.com', '+595981344505', 0, 0, NULL, NULL, NULL, '2022-08-04 14:33:36', NULL, NULL, NULL, NULL, '', 0),
(274, 515, 'gperez', 'VEN', 303.00, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-08-06 14:48:00', NULL, NULL, NULL, NULL, '', 0),
(275, 516, 'zenaidaescalona', 'VEN', 181.80, 'BMERC', '01050666210666289085', 'A', '7466624', 'MARIA ELENA MUJICA', 'elena10055@gmail.com', '', 0, 0, NULL, NULL, NULL, '2022-08-06 16:14:57', NULL, NULL, NULL, NULL, 'Obs. Tarea. Luego. Pedir nro tlf de titular', 0),
(276, 518, 'gperez', 'VEN', 120.40, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-08-08 13:58:44', NULL, NULL, NULL, NULL, 'compra cripto 19.2 USDT desde cuenta familiar Gabriel el dia sabado 06.ago.2022, monto Gs. 200.000 fue de se debe reponer alguna diferencia con el monto en Gs.\n\ncorreo:\nhttps://mail.google.com/mail/u/0/#search/familiar/FMfcgzGqPpbfVkrhkhdlDxZRtjTBpWZB', 0),
(277, 519, 'cvillarroque', 'VEN', 607.68, 'BAMIG', '01720110711105221012', 'C', '29698227', 'IRALYS VILLARROEL', 'victor@GMAIL.COM', '4168069516', 0, 0, NULL, NULL, NULL, '2022-08-11 12:41:42', NULL, NULL, NULL, NULL, '', 0),
(278, 520, 'franklinurbina	', 'VEN', 81.09, 'BMERC', '01050150461150068787', 'C', '6008231', 'FRANKLIN URBINA', '', '', 0, 0, NULL, NULL, NULL, '2022-08-13 02:58:56', NULL, NULL, NULL, NULL, '', 0),
(279, 521, 'Michelle', 'VEN', 348.67, 'BPROV', '01080530950200093617', 'A', '7131989', 'YANETH GONZÁLEZ', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-08-22 20:22:01', NULL, NULL, NULL, NULL, '', 0),
(280, 522, 'matiasff', 'VEN', 153.51, 'BDV', '01020518290000162168', 'C', '10674546', 'MARY TERAN', '', '', 0, 0, NULL, NULL, NULL, '2022-08-24 03:05:37', NULL, NULL, NULL, NULL, '', 0),
(281, 523, 'Acruzp', 'VEN', 425.00, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-26 15:29:29', NULL, NULL, NULL, NULL, '', 0),
(282, 524, 'jesussoto', 'VEN', 128.39, 'BDV', '01020159450103148814', 'O', '11352433', 'ELKA ARMAS', '', '04244718869', 0, 0, NULL, NULL, NULL, '2022-08-31 17:09:37', NULL, NULL, NULL, NULL, '', 0),
(283, 525, 'Acruzp', 'VEN', 1077.84, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-08-31 23:46:49', NULL, NULL, NULL, NULL, '', 0),
(284, 526, 'moisesbarrios', 'VEN', 826.92, 'BDV', '01020671570000048350', 'C', '16546288', 'Deysire Quijada', '', '', 0, 0, NULL, NULL, NULL, '2022-09-06 21:00:46', NULL, NULL, NULL, NULL, '', 0),
(285, 527, 'joseidy', 'VEN', 165.62, 'BMERC', '01050666210666289085', 'A', '7466624', 'MARIA ELENA MUJICA', 'seideechirinos@gmail.com', '992860184', 0, 0, NULL, NULL, NULL, '2022-09-07 14:07:32', NULL, NULL, NULL, NULL, '', 0),
(286, 528, 'gperez', 'VEN', 404.50, 'BMERC', '01050062130062381989', 'A', '7553399', 'MORAIMA FONSECA', '', '', 0, 0, NULL, NULL, NULL, '2022-09-09 21:28:45', NULL, NULL, NULL, NULL, 'envio Gabriel a Madre', 0),
(287, 529, 'Acruzp', 'VEN', 164.40, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', 'SEIDEE@GMAIL.COM', '9999999', 0, 0, NULL, NULL, NULL, '2022-09-13 15:33:56', NULL, NULL, NULL, NULL, '', 0),
(288, 530, 'Acruzp', 'VEN', 165.20, 'BANSC', '01340406284061048089', 'C', '15645288', 'LILA VASQUEZ', '', '', 0, 0, NULL, NULL, NULL, '2022-09-13 15:56:50', NULL, NULL, NULL, NULL, 'emergencia, se vende cripto con los fondos guardados', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pago_origen`
--

CREATE TABLE `pago_origen` (
  `id` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL COMMENT 'relacion: id de tabla transaccion',
  `nro_ref_transferencia` int(11) NOT NULL COMMENT 'nro referencia de transferencia',
  `login_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_pais` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAR' COMMENT 'codigo pais origen',
  `monto` double(8,2) NOT NULL COMMENT 'monto del pago',
  `formapago` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'forma de pago en origen. DEP: deposito bancario. GIRO: giro de alguna billetera )tigo, personal, claro, westerm)	',
  `detalles_formapago` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'debe ser relacion con otra tabla, llamada formaspago',
  `img_comprob` int(11) NOT NULL COMMENT 'url de imagen que comprueba la transaccion, bien sea foto o imagen escaneada',
  `fecha_oper` date DEFAULT NULL COMMENT 'fecha operacion indicada por el usuario',
  `hora_oper` time DEFAULT NULL COMMENT 'hota operacion registrada por usuario',
  `observ` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `detalles` text COLLATE utf8_unicode_ci NOT NULL,
  `check_admin` tinyint(1) DEFAULT NULL COMMENT 'verificacion por parte de un usuario admin. OPCIONAL',
  `user_admin` int(11) DEFAULT NULL COMMENT 'login del usuario admin que hizo la verificacion. OPCIONAL',
  `fechahora_check` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'fecha y hora de verificacion por parte de un user admin',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fechay hora de registro/actualizacion',
  `check_realizado` tinyint(1) DEFAULT NULL COMMENT 'indica si el pago/transferencia ya fue realizao, es marcado por un user admin',
  `id_formapago_origen` int(11) DEFAULT NULL COMMENT 'id forma de pago, relacion con tabla formapago_origen	'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='pagos en moneda local, realizados por usuarios a cuentas del sitio';

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_moneda` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT 'moneda oficial del pais',
  `observ` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Observaciones',
  `activo` tinyint(1) DEFAULT 1 COMMENT '0 es desactivado. 1 es activado',
  `url_img_bandera` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`id`, `codigo`, `nombre`, `cod_moneda`, `observ`, `activo`, `url_img_bandera`) VALUES
(27, 'VEN', 'Venezuela', 'Bs', 'Prueba', 1, NULL),
(2, 'PAR', 'Paraguay', 'Gs', 'Se deben agregar todas las ciudades', 1, NULL),
(3, 'COL', 'Colombia', '$COL', NULL, 1, NULL),
(4, 'PER', 'Peru', 'SOL', 'Perú', 1, NULL),
(5, 'CHI', 'Chile', 'SOL', '', 1, NULL),
(6, 'ECU', 'Ecuador', '$ARS', '', 1, NULL),
(13, 'BOL', 'Bolivia', '$BOL', '', 1, NULL),
(12, 'ARG', 'Argentina', '$ARS', 'Sur América', 1, NULL),
(25, 'PR', 'Puerto Rico', '', 'Agregar moneda', 0, NULL),
(15, 'URU', 'Uruguay', '', 'Agregar moneda', 0, NULL),
(18, 'BRA', 'Brasil', '', 'Agregar moneda', 0, NULL),
(19, 'PAN', 'Panama', 'BAL', 'Agregar moneda', 1, NULL),
(23, 'CR', 'Costa Rica', '', 'Agregar moneda.\r\nCentroAmerica', 0, NULL),
(31, 'ESP', 'España', 'EUR', 'EURO', 1, NULL),
(32, 'ARU', 'Aruba', 'BAL', '', 1, NULL),
(33, 'USA', 'Estados Unidos', 'USD', 'Prueab', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prueba`
--

CREATE TABLE `prueba` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t1`
--

CREATE TABLE `t1` (
  `a` int(11) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transacciones`
--

CREATE TABLE `transacciones` (
  `id` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_observ` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `origen_codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAR' COMMENT 'codigo pais origen',
  `destino_codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VEN' COMMENT 'codigo pais destino',
  `origen_monto` double NOT NULL,
  `destino_monto` double NOT NULL,
  `monto_dolares` double DEFAULT NULL COMMENT 'monto origen en dolares, segun calculadora',
  `tasa_dolar_origen` double NOT NULL COMMENT 'tasa dolar respecto a moneda origen, al momento de realizar el calculo',
  `tasa_dolar_destino` double DEFAULT NULL COMMENT 'tasa dolar respecto a moneda destino, , al momento de realizar el calculo',
  `destino_observ` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones sobre el pago destino, escrito por el usuario',
  `observ_admin` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones escritas por un usuario administrador',
  `fechahora_origen` timestamp NULL DEFAULT current_timestamp() COMMENT 'fecha y hora en que se hizo el registro en el sistema, segun huso horario de pais origen',
  `fechahora_destino` timestamp NULL DEFAULT NULL COMMENT 'fecha/hora de registro, segun huso horario de pais destino',
  `check_admin` int(11) DEFAULT NULL COMMENT 'verificacion por parte de un usuario admin. verifica que los datos, montos, tasas, etc, registrados son correctos. Y que se puede proceder a realizar la operacion',
  `user_admin` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'login del usuario admin que hizo la verificacion',
  `fechahora_check` timestamp NULL DEFAULT NULL COMMENT 'fecha y hora de verificacion por parte de un user admin segun el servidor',
  `date_created` timestamp NULL DEFAULT current_timestamp() COMMENT 'fecha y hora en que se hizo el registro en el sistema, segun hora del servidor',
  `date_updated` timestamp NULL DEFAULT NULL COMMENT 'ultima fecha en que se actualizo el registro',
  `date_end` timestamp NULL DEFAULT NULL COMMENT 'fecha y hora en que se hizo el finalizo la remesa en el sistema, segun hora del servidor',
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'New' COMMENT 'NEW, ORI_OK, DES_OK, FIN, CANC, ANUL',
  `status_PO` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'status de pago en origen. A:agregado por cliente. OK: verificado por operador	',
  `status_PD` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'status de pago en destino: A: por cliente. OK: verificado por operador',
  `activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: activo, 0: inactiva. indica si la transaccion esta activa o no',
  `id_formapago_origen` int(11) NOT NULL COMMENT 'id forma de pago elegida en origen	',
  `porc_comision` double DEFAULT NULL COMMENT 'porcentaje de comision aplicado sobre monto total',
  `monto_comision_dolares` double DEFAULT NULL COMMENT 'monto de comision en dolares',
  `monto_comision_btc` double DEFAULT NULL COMMENT 'monto de comision en btc',
  `monto_comision_usdt` double DEFAULT NULL COMMENT 'monto de comision en USDT-Tether'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='transacciones, implica calculo de pago en origen. pago en destino. comisiones';

--
-- Dumping data for table `transacciones`
--

INSERT INTO `transacciones` (`id`, `login`, `user_observ`, `origen_codpais`, `destino_codpais`, `origen_monto`, `destino_monto`, `monto_dolares`, `tasa_dolar_origen`, `tasa_dolar_destino`, `destino_observ`, `observ_admin`, `fechahora_origen`, `fechahora_destino`, `check_admin`, `user_admin`, `fechahora_check`, `date_created`, `date_updated`, `date_end`, `status`, `status_PO`, `status_PD`, `activo`, `id_formapago_origen`, `porc_comision`, `monto_comision_dolares`, `monto_comision_btc`, `monto_comision_usdt`) VALUES
(4, 'jmercado', 'Prueba insert', 'PAR', 'VEN', 6000, 13000, 6000, 0, 13000, NULL, NULL, '2019-08-05 21:04:40', NULL, NULL, NULL, NULL, '2019-08-05 21:04:40', NULL, NULL, 'CANC', '', '', 0, 0, NULL, NULL, NULL, NULL),
(45, 'Acruzp', 'Ya se registro en el frontend.\r\nSe actualizo su nombre de usuario manualmente.\r\n\r\nCuenta a recibir:\r\n01340406284061048089 Lila Vasquez 15645288\r\nCuenta corriente', 'PAR', 'VEN', 1060000, 536771500, 142.12, 7458.43, 3776861, NULL, NULL, '2021-07-31 18:13:56', NULL, NULL, NULL, NULL, '2021-07-31 18:13:56', NULL, NULL, 'FIN', 'OK', 'OK', 1, 4, NULL, NULL, NULL, NULL),
(62, 'joseidy', NULL, 'PAR', 'VEN', 300000, 160435506, 40.1, 7480.72, 4000577, NULL, NULL, '2021-08-16 23:42:42', '2021-11-17 02:27:55', NULL, NULL, NULL, '2021-08-16 23:42:42', NULL, '2021-11-17 02:27:55', 'FIN', '', 'PD_OK', 1, 4, NULL, NULL, NULL, NULL),
(64, 'cvillarroque', NULL, 'PAR', 'VEN', 800000, 421326781, 107.07, 7472.07, 3935229, NULL, NULL, '2021-08-17 18:58:50', NULL, NULL, NULL, NULL, '2021-08-17 18:58:50', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(67, 'williamvillasmil', 'Quería que llegaran 20 USD a Venezuela.\r\nPensaba que me iba a quedar debiendo.\r\n\r\nPagó en efectivo', 'PAR', 'VEN', 150000, 79720519, 20.07, 7472.07, 3971182, 'a la hora de gabriel registrar la remesa los montos fueron:\r\ndestino_monto = 80.343.961 Bs.\r\n\r\ntasa_dolar_destino = 4.002.238', 'esta cuenta no cuadra mucho:\r\n\r\n20,07 * 3971182 = 79701622.74', '2021-08-18 12:36:35', NULL, NULL, NULL, NULL, '2021-08-18 12:36:35', NULL, NULL, 'FIN', 'OK', 'OK', 1, 2, 8, NULL, NULL, NULL),
(41, 'cvillarroque', 'Prueba Remesa Carlos Villarroel, No tomada en cuenta', 'PAR', 'VEN', 800088, 414337303, 107.25, 7460.02, 3863462, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, 'CA', '', '', 0, 2, NULL, NULL, NULL, NULL),
(40, 'cvillarroque', 'Remesa Carlos Villarroel', 'PAR', 'VEN', 800000, 418947800, 107.25, 7460.37, 3863462, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, NULL, NULL, '2021-07-26 17:42:11', NULL, NULL, 'FIN', 'OK', 'OK', 1, 2, NULL, NULL, NULL, NULL),
(68, 'franrodriguez', NULL, 'PAR', 'VEN', 374144, 199945250, 50, 7482.87, 3998905, NULL, NULL, '2021-08-19 18:23:41', NULL, NULL, NULL, NULL, '2021-08-19 18:23:41', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(115, 'acruzp', 'El cliente queria enviar un monto superior', 'PAR', 'VEN', 74378, 43.7, 10, 7437.75, 4.37, NULL, 'Cancelada porque el cliente queria enviar un monto superior y no se uso esta transaccion', '2021-11-03 15:29:12', '2021-11-03 16:59:00', 1, 'gperez', NULL, '2021-11-03 15:29:12', '2021-11-08 23:41:00', '2021-11-08 15:05:00', 'CANC', '', '', 0, 3, NULL, NULL, NULL, NULL),
(74, 'williamvillasmil', NULL, 'PAR', 'VEN', 75000, 40409604, 10.01, 7489.37, 4035233, NULL, NULL, '2021-08-28 14:59:34', NULL, NULL, NULL, NULL, '2021-08-28 14:59:34', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(75, 'Acruzp', NULL, 'PAR', 'VEN', 280000, 146234890, 37.49, 7468.61, 3900612, NULL, NULL, '2021-08-31 11:38:51', NULL, NULL, NULL, NULL, '2021-08-31 11:38:51', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(76, 'Acruzp', NULL, 'PAR', 'VEN', 89457, 46606632, 12, 7454.79, 3883886, NULL, 'el usuario debe el pago en origen, se  REMESA A CREDITO POR Emergencia de salud en Vzla', '2021-09-01 11:37:44', NULL, NULL, NULL, NULL, '2021-09-01 11:37:44', NULL, NULL, 'FIN', 'OK', 'OK', 1, 2, NULL, NULL, NULL, NULL),
(77, 'Acruzp', NULL, 'PAR', 'VEN', 38000, 19455852, 5.08, 7475.93, 3827647, NULL, NULL, '2021-09-03 02:17:18', NULL, NULL, NULL, NULL, '2021-09-03 02:17:18', NULL, NULL, 'FIN', 'OK', 'OK', 1, 4, NULL, NULL, NULL, NULL),
(78, 'yamilethchirinos', 'no se ha registrado en el sitio', 'PAR', 'VEN', 600000, 329403788, 80.45, 7458.08, 4094533, NULL, NULL, '2021-09-10 22:16:45', '2021-09-11 02:50:35', NULL, '0', NULL, '2021-09-10 22:16:45', NULL, NULL, 'FIN', 'OK', 'OK', 1, 2, NULL, NULL, NULL, NULL),
(79, 'cvillarroque', '', 'PAR', 'VEN', 800000, 461463310, 109.82, 7284.46, 4238311.0771142, 'tiene pago movil activado.', 'hubo problemas para vender en localbitcoins cuenta de nbit, entonces se retraso la venta\r\n\r\nmonto real original era de 465.463.310.\r\n\r\nhay que restarle la comision pago movil.\r\nque fue de 1.384.389,93 Bs.\r\n\r\nse le envio al cliente el monto 461.463.310\r\n\r\n---\r\nse debe activar la cuenta localbitcoins de nbit.\r\n\r\nse debe devolver los fondos personales de btc a gabriel, quitando la ganancia de 4.5 USD.', '2021-09-13 16:24:33', NULL, NULL, '0', NULL, '2021-09-13 16:24:33', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(80, 'yamilethchirinos', 'Yamileth debe el pago, a crédito para el día siguiente.', 'PAR', 'VEN', 150000, 76902705, 20.12, 7456.7, 3822936, 'enviar a cuenta mercantil de Seidee Chirinos', NULL, '2021-09-18 14:29:03', NULL, NULL, NULL, NULL, '2021-09-18 14:29:03', NULL, NULL, 'FIN', '', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(81, 'cvillarroque', '', 'PAR', 'VEN', 500000, 266694413, 67.4, 7418.47, 3956929, '', '', '2021-09-21 14:30:00', NULL, 1, 'gperez', NULL, '2021-09-21 21:20:27', NULL, NULL, 'FIN', 'OK', 'OK', 1, 1, 8, NULL, NULL, NULL),
(82, 'yasmary', NULL, 'PAR', 'VEN', 170000, 91956803, 22.85, 7438.89, 4023862, NULL, NULL, '2021-09-23 14:52:53', NULL, NULL, NULL, NULL, '2021-09-23 14:52:53', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(83, 'yamilethchirinos', NULL, 'PAR', 'VEN', 150000, 81336709, 20.15, 7443.32, 4036101, 'pasar dinero recibido a banco vision', NULL, '2021-09-27 12:03:54', '2021-09-27 12:30:54', 1, NULL, NULL, '2021-09-27 12:03:54', NULL, NULL, 'FIN', '', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(84, 'williamvillasmil', NULL, 'PAR', 'VEN', 111480, 61195380, 15, 7432.01, 4079692, NULL, NULL, '2021-09-27 23:41:23', NULL, NULL, NULL, NULL, '2021-09-27 23:41:23', NULL, NULL, 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(85, 'acruzp', 'El cliente queria enviar un monto superior', 'PAR', 'VEN', 1006857, 675, 135, 7458.2, 5, NULL, 'Cancelada porque el cliente queria enviar un monto superior y no se uso esta transaccion', '2021-10-02 13:58:25', NULL, NULL, NULL, NULL, '2021-10-02 13:58:25', NULL, '2021-11-08 15:05:00', 'CA', '', '', 0, 4, NULL, NULL, NULL, NULL),
(86, 'acruzp', NULL, 'PAR', 'VEN', 1044148, 700, 140, 7458.2, 5, NULL, 'se completo el pago en dos partes.\r\nsabado y lunes, por la variacion de la tasa dolar/ves a causa de la reconversion monetaria en Vzla', '2021-10-02 14:05:36', NULL, NULL, NULL, NULL, '2021-10-02 14:05:36', NULL, NULL, 'FIN', 'OK', 'OK', 1, 4, NULL, NULL, NULL, NULL),
(87, 'acruzp', NULL, 'PAR', 'VEN', 37291, 20, 5, 7458.2, 4, NULL, NULL, '2021-10-02 15:32:09', NULL, NULL, NULL, NULL, '2021-10-02 15:32:09', NULL, NULL, 'FIN', 'OK', 'OK', 1, 4, NULL, NULL, NULL, NULL),
(88, 'yasmary', NULL, 'PAR', 'VEN', 100000, 54, 13.39, 7468.27, 4, NULL, 'Se calculo el 6 de Octubre, por pedido del cliente, pero el dia 7 pago el cliente en la noche. Ese dia yo estuve en un after despues de Cybira-Sudameris. Entonces se completo el dia 8', '2021-10-06 19:38:26', '2021-10-08 17:47:00', 1, 'gperez', '2021-10-29 12:33:00', '2021-10-06 19:38:26', NULL, '2021-10-08 17:47:00', 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(89, 'joseidy', NULL, 'PAR', 'VEN', 200000, 107, 26.86, 7447.15, 4, 'enviado a Provincial de Yolmary por indicaciones de Zenaida', NULL, '2021-10-11 13:23:02', '2021-10-14 19:45:00', 1, 'gperez', NULL, '2021-10-11 13:23:02', NULL, '2021-10-14 22:45:00', 'FIN', 'OK', 'OK', 1, 3, 8, NULL, NULL, NULL),
(91, 'yamilethchirinos', NULL, 'PAR', 'VEN', 200000, 107, 26.84, 7450.46, 4, NULL, NULL, '2021-10-14 19:20:37', '2021-12-30 10:32:44', NULL, NULL, NULL, '2021-10-14 19:20:37', NULL, '2021-12-30 10:32:44', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(92, 'nailynsilva', NULL, 'PAR', 'VEN', 372642, 200, 50, 7452.84, 4, NULL, NULL, '2021-10-17 15:14:02', '2021-10-17 16:55:00', 1, 'gperez', '2021-10-17 16:55:00', '2021-10-17 19:14:02', NULL, '2021-10-17 19:14:02', 'FIN', 'OK', 'OK', 1, 2, NULL, 8, 0, 0),
(94, 'jesussoto', NULL, 'PAR', 'VEN', 59665, 32, 8, 7458.15, 4, NULL, NULL, '2021-10-18 14:49:42', '2021-11-17 02:20:53', NULL, NULL, NULL, '2021-10-18 14:49:42', NULL, '2021-11-17 02:20:53', 'FIN', '', 'PD_OK', 1, 3, NULL, NULL, NULL, NULL),
(95, 'nazareth', NULL, 'PAR', 'VEN', 200000, 107, 26.82, 7458.15, 4, NULL, NULL, '2021-10-18 16:58:56', NULL, NULL, NULL, NULL, '2021-10-18 16:58:56', NULL, NULL, 'New', '', '', 1, 4, NULL, NULL, NULL, NULL),
(96, 'yamilethchirinos', NULL, 'PAR', 'VEN', 100000, 54, 13.45, 7435.98, 4, NULL, NULL, '2021-10-19 12:37:23', '2021-10-19 16:26:00', 1, 'gperez', '2021-10-19 16:30:00', '2021-10-19 12:37:23', '2021-11-18 01:33:00', '2021-10-19 16:26:00', 'FIN', 'OK', 'OK', 1, 3, 8, NULL, NULL, NULL),
(98, 'yasmary', NULL, 'PAR', 'VEN', 100000, 54, 13.4, 7465.41, 4, NULL, NULL, '2021-10-22 14:54:53', '2021-10-22 19:30:00', 1, 'gperez', '2021-10-26 12:58:00', '2021-10-22 14:54:53', NULL, '2021-10-22 19:33:00', 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(108, 'nazareth', NULL, 'PAR', 'VEN', 746800, 400, 100, 7468, 4, NULL, NULL, '2021-10-30 15:32:25', '2021-10-30 17:47:00', 1, 'gperez', '2021-10-30 17:50:00', '2021-10-30 15:32:25', NULL, NULL, 'FIN', 'OK', 'OK', 1, 6, 8, NULL, NULL, NULL),
(116, 'williamvillasmil', NULL, 'PAR', 'VEN', 350000, 209.09, 47.09, 7432.24, 4.44, NULL, NULL, '2021-11-09 21:44:36', '2021-11-09 05:00:00', NULL, NULL, NULL, '2021-11-09 21:44:36', '2021-12-09 00:08:00', '2021-11-09 05:00:00', 'FIN', '', '', 1, 6, NULL, NULL, NULL, NULL),
(117, 'nailynsilva', 'Envio el pago en efectivo via Carlos Villarroel, quien lo deposito en banco familiar', 'PAR', 'VEN', 371243, 223, 50, 7424.85, 4.46, NULL, NULL, '2021-11-10 12:06:04', NULL, NULL, NULL, NULL, '2021-11-10 12:06:04', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(111, 'zenaidaescalona', NULL, 'PAR', 'VEN', 100000, 57.67, 13.44, 7438.71, 4.29, '', 'El cliente es Zenaida Escalona. Se asigno inicialmente por error a yamilethchirinos.\r\nCambiado por admin en el backend', '2021-11-02 13:27:43', '2021-11-02 18:00:00', 1, 'gperez', '2021-11-02 18:35:00', '2021-11-02 13:27:43', NULL, '2021-11-02 18:35:00', 'FIN', 'OK', 'OK', 1, 3, NULL, NULL, NULL, NULL),
(114, 'cvillarroque', 'El ciente solicito la remesa a la hora: 10.30 am', 'PAR', 'VEN', 900000, 523.97, 120.73, 7454.59, 4.34, '', 'Pago destino realizado por pago movil. Comision fue de 1,56 VED.', '2021-11-02 14:51:00', '2021-11-02 22:27:45', 1, 'gperez', '2021-11-02 22:30:00', '2021-11-02 18:29:45', '2021-11-08 22:53:00', '2021-11-02 22:27:00', 'FIN', 'OK', 'OK', 1, 3, 8, NULL, NULL, 11.41),
(118, 'cvillaroque', NULL, 'PAR', 'VEN', 500000, 301.02, 67.34, 7424.85, 4.47, NULL, NULL, '2021-11-10 12:14:56', NULL, NULL, NULL, NULL, '2021-11-10 12:14:56', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(119, 'cvillaroque', NULL, 'PAR', 'VEN', 500000, 302.36, 67.34, 7424.85, 4.49, NULL, NULL, '2021-11-10 12:43:55', NULL, NULL, NULL, NULL, '2021-11-10 12:43:55', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(120, 'cvillarroque', NULL, 'PAR', 'VEN', 500000, 302.36, 67.34, 7424.85, 4.49, NULL, NULL, '2021-11-10 12:45:11', '2021-11-10 23:27:00', 1, 'gperez', '2021-11-10 23:40:00', '2021-11-10 12:45:11', '2021-11-25 02:01:00', '2021-11-02 22:40:00', 'FIN', 'OK', 'OK', 1, 2, 8, NULL, NULL, NULL),
(121, 'yamilethchirinos', NULL, 'PAR', 'VEN', 200000, 121.16, 26.92, 7428.23, 4.5, NULL, NULL, '2021-11-12 16:38:49', '2021-11-12 19:09:00', 1, 'gperez', '2021-11-12 19:30:00', '2021-11-12 16:38:49', '2021-11-25 01:43:00', '2021-11-12 19:30:00', 'FIN', 'OK', 'OK', 1, 2, 8, NULL, NULL, NULL),
(122, 'nailynsilva', NULL, 'PAR', 'VEN', 185450, 116, 25, 7417.98, 4.64, NULL, NULL, '2021-11-17 15:04:40', '2021-11-17 17:06:53', NULL, NULL, NULL, '2021-11-17 15:04:40', NULL, '2021-11-17 17:06:53', 'FIN', '', 'PD_OK', 1, 8, NULL, NULL, NULL, NULL),
(123, 'nailynsilva', NULL, 'PAR', 'VEN', 74026, 48.8, 10, 7402.62, 4.88, NULL, NULL, '2021-11-19 14:42:26', '2021-11-19 15:08:32', NULL, NULL, NULL, '2021-11-19 14:42:26', NULL, '2021-11-19 15:08:32', 'FIN', '', 'PD_OK', 1, 8, NULL, NULL, NULL, NULL),
(175, 'yamilethchirinos', NULL, 'PAR', 'VEN', 300000, 184.67, 40.77, 7359.19, 4.53, NULL, NULL, '2021-12-14 14:08:37', '2021-12-14 17:54:40', NULL, NULL, NULL, '2021-12-14 14:08:37', '2021-12-14 17:54:38', '2021-12-14 17:54:40', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(126, 'nailynsilva', NULL, 'PAR', 'VEN', 73883, 48.1, 10, 7388.33, 4.81, NULL, NULL, '2021-11-21 17:38:42', '2021-11-21 18:41:25', NULL, NULL, NULL, '2021-11-21 17:38:42', NULL, '2021-11-21 18:41:25', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(129, 'jesussoto', NULL, 'PAR', 'VEN', 73750, 48.9, 10, 7375.01, 4.89, NULL, NULL, '2021-11-25 15:39:23', '2021-11-25 19:40:04', NULL, NULL, NULL, '2021-11-25 15:39:23', NULL, '2021-11-25 19:40:04', 'FIN', '', 'PD_OK', 1, 3, NULL, NULL, NULL, NULL),
(168, 'joseidy', NULL, 'PAR', 'VEN', 76384, 47.3, 10.39, 7348.43, 4.55, NULL, NULL, '2021-12-08 14:52:32', '2021-12-10 15:31:24', NULL, NULL, NULL, '2021-12-08 14:52:32', '2021-12-10 15:31:21', '2021-12-10 15:31:24', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(176, 'cvillarroque', NULL, 'PAR', 'VEN', 900000, 543.88, 122.77, 7330.7, 4.43, NULL, 'Cancelada porque el cliente queria enviar un monto...', '2021-12-16 13:33:59', NULL, NULL, NULL, NULL, '2021-12-16 13:33:59', NULL, NULL, 'CA', '', '', 1, 3, NULL, NULL, NULL, NULL),
(169, 'joseidy', NULL, 'PAR', 'VEN', 250000, 154.11, 34.02, 7348.43, 4.53, NULL, NULL, '2021-12-08 14:57:28', '2021-12-11 23:40:27', NULL, NULL, NULL, '2021-12-08 14:57:28', '2021-12-11 23:40:25', '2021-12-11 23:40:27', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(141, 'nailynsilva', NULL, 'PAR', 'VEN', 110589, 72.9, 15, 7372.62, 4.86, NULL, NULL, '2021-11-29 23:01:22', '2021-11-30 01:40:28', NULL, NULL, NULL, '2021-11-29 23:01:22', NULL, '2021-11-30 01:40:28', 'FIN', '', 'PD_OK', 1, 8, NULL, NULL, NULL, NULL),
(181, 'joseavilioquintero', NULL, 'PAR', 'VEN', 197004, 122.24, 26.87, 7333.08, 4.55, NULL, NULL, '2021-12-20 18:45:45', '2021-12-20 22:50:18', NULL, NULL, NULL, '2021-12-20 18:45:45', '2021-12-20 21:29:29', '2021-12-20 22:50:18', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(182, 'joseavilioquintero', NULL, 'PAR', 'VEN', 300000, 185.73, 40.91, 7333.08, 4.54, NULL, NULL, '2021-12-20 18:54:52', NULL, NULL, NULL, NULL, '2021-12-20 18:54:52', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(183, 'williamvillasmil', NULL, 'PAR', 'VEN', 350000, 215.73, 47.73, 7333.08, 4.52, NULL, NULL, '2021-12-20 19:32:05', '2021-12-21 12:38:58', NULL, NULL, NULL, '2021-12-20 19:32:05', '2021-12-21 12:38:55', '2021-12-21 12:38:58', 'FIN', '', 'PD_OK', 1, 3, NULL, NULL, NULL, NULL),
(180, 'invitado', NULL, 'PAR', 'VEN', 197004, 122.5, 26.87, 7333.08, 4.56, NULL, 'Cancelada por operador', '2021-12-20 18:45:25', NULL, NULL, NULL, NULL, '2021-12-20 18:45:25', '2022-01-02 19:03:41', '2022-01-02 19:03:41', 'CANC', '', '', 1, 6, NULL, NULL, NULL, NULL),
(179, 'luisdominicano', NULL, 'PAR', 'VEN', 100000, 61.14, 13.53, 7392.77, 4.52, NULL, NULL, '2021-12-20 12:35:08', '2021-12-20 17:43:46', NULL, NULL, NULL, '2021-12-20 12:35:08', '2021-12-20 17:43:42', '2021-12-20 17:43:46', 'FIN', '', 'PD_OK', 1, 9, NULL, NULL, NULL, NULL),
(178, 'luisdominicano', NULL, 'PAR', 'VEN', 100000, 61.14, 13.53, 7392.77, 4.52, NULL, 'Cancelada por operador', '2021-12-20 12:28:04', NULL, NULL, NULL, NULL, '2021-12-20 12:28:04', '2022-01-02 16:27:50', '2022-01-02 16:27:50', 'CANC', '', '', 1, 9, NULL, NULL, NULL, NULL),
(174, 'yamilethchirinos', NULL, 'PAR', 'VEN', 370000, 226.93, 50.21, 7369.56, 4.52, NULL, 'Cancelada a pedido del usuario, inicialmente queria enviar 370.000 Gs, pero luego cambiO a 300.000 Gs. Se abrio otra transaccion por el monto final deseado', '2021-12-13 22:39:17', NULL, 1, 'gperez', '2021-12-30 12:25:00', '2021-12-13 22:39:17', '2021-12-14 01:53:59', '2021-12-30 12:25:00', 'CA', '', '', 0, 3, 8, NULL, NULL, NULL),
(151, 'anderson', NULL, 'PAR', 'VEN', 7387690, 4926.7, 1000, 7387.69048956, 4.9267496709551, NULL, NULL, '2021-12-01 17:21:14', NULL, NULL, NULL, NULL, '2021-12-01 17:21:14', NULL, NULL, 'CA', '', '', 1, 3, NULL, NULL, NULL, NULL),
(177, 'cvillarroque', NULL, 'PAR', 'VEN', 1000000, 608.4, 136.41, 7330.7, 4.46, NULL, NULL, '2021-12-16 14:52:16', '2021-12-16 18:25:09', NULL, NULL, NULL, '2021-12-16 14:52:16', '2021-12-16 15:45:19', '2021-12-16 18:25:09', 'FIN', '', 'PD_OK', 1, 3, NULL, NULL, NULL, NULL),
(154, 'joseavilioquintero', NULL, 'PAR', 'VEN', 150000, 94.41, 20.3, 7387.69, 4.65, NULL, NULL, '2021-12-01 22:36:58', '2021-12-01 23:03:55', NULL, NULL, NULL, '2021-12-01 22:36:58', NULL, '2021-12-01 23:03:55', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(184, 'joseavilioquintero', NULL, 'PAR', 'VEN', 300000, 184.1, 40.91, 7333.08, 4.5, NULL, NULL, '2021-12-20 21:53:21', '2021-12-21 18:23:15', NULL, NULL, NULL, '2021-12-20 21:53:21', '2021-12-20 22:48:47', '2021-12-21 18:23:15', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(156, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 125.34, 27.07, 7387.69, 4.63, NULL, NULL, '2021-12-01 22:42:08', '2021-12-01 23:25:41', NULL, NULL, NULL, '2021-12-01 22:42:08', NULL, '2021-12-01 23:25:41', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(157, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.19, 13.55, 7380.63, 4.59, NULL, NULL, '2021-12-02 14:06:28', '2021-12-02 17:58:12', NULL, NULL, NULL, '2021-12-02 14:06:28', NULL, '2021-12-02 17:58:12', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(185, 'nailynsilva', NULL, 'PAR', 'VEN', 1300000, 797.75, 177.28, 7333.08, 4.5, NULL, NULL, '2021-12-20 22:11:25', '2021-12-21 12:21:27', NULL, NULL, NULL, '2021-12-20 22:11:25', '2021-12-21 12:21:23', '2021-12-21 12:21:27', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(170, 'nailynsilva', NULL, 'PAR', 'VEN', 369699, 228, 50, 7393.98, 4.56, NULL, NULL, '2021-12-09 23:02:35', '2021-12-11 23:16:12', NULL, NULL, NULL, '2021-12-09 23:02:35', '2021-12-10 16:27:05', '2021-12-11 23:16:12', 'FIN', '', 'PD_OK', 1, 1, NULL, NULL, NULL, NULL),
(167, 'williamvillasmil', NULL, 'PAR', 'VEN', 350000, 222.15, 47.67, 7342.02, 4.66, NULL, NULL, '2021-12-06 15:45:55', '2021-12-07 03:56:00', NULL, NULL, NULL, '2021-12-06 15:45:55', '2021-12-09 00:05:00', '2021-12-07 03:59:00', 'FIN', '', '', 1, 2, NULL, NULL, NULL, NULL),
(166, 'oswaldozambrano', NULL, 'PAR', 'VEN', 52500, 33.18, 7.15, 7342.02, 4.64, NULL, NULL, '2021-12-06 23:56:33', '2021-12-06 23:57:42', NULL, NULL, NULL, '2021-12-06 15:32:22', '2021-12-08 23:59:21', '2021-12-06 20:09:00', 'FIN', 'OK', 'OK', 1, 8, 8, NULL, NULL, NULL),
(162, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.6, 13.55, 7380.63, 4.62, NULL, NULL, '2021-12-02 17:37:33', '2021-12-02 18:07:20', NULL, NULL, NULL, '2021-12-02 17:37:33', NULL, '2021-12-02 18:07:20', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(164, 'nailynsilva', NULL, 'PAR', 'VEN', 73641, 48.1, 10, 7364.05, 4.81, NULL, NULL, '2021-12-04 11:52:35', '2021-12-04 17:29:44', NULL, NULL, NULL, '2021-12-04 11:52:35', NULL, '2021-12-04 17:29:44', 'FIN', '', 'PD_OK', 1, 8, NULL, NULL, NULL, NULL),
(186, 'invitado', NULL, 'PAR', 'VEN', 500000, 306.83, 68.18, 7333.08, 4.5, NULL, NULL, '2021-12-20 22:12:15', '2021-12-21 12:28:54', NULL, NULL, NULL, '2021-12-20 22:12:15', '2021-12-21 12:28:51', '2021-12-21 12:28:54', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(187, 'nailynsilva', NULL, 'PAR', 'VEN', 110000, 67.5, 15, 7333.08, 4.5, NULL, NULL, '2021-12-20 22:14:14', NULL, NULL, NULL, NULL, '2021-12-20 22:14:14', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(188, 'nailynsilva', NULL, 'PAR', 'VEN', 110000, 67.5, 15, 7333.08, 4.5, NULL, NULL, '2021-12-20 22:14:42', '2021-12-21 12:29:16', NULL, NULL, NULL, '2021-12-20 22:14:42', '2021-12-21 02:11:10', '2021-12-21 12:29:16', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(189, 'joseavilioquintero', NULL, 'PAR', 'VEN', 150000, 91.46, 20.42, 7347.29, 4.48, NULL, NULL, '2021-12-21 15:49:45', '2021-12-21 18:29:01', NULL, NULL, NULL, '2021-12-21 15:49:45', '2021-12-21 16:18:51', '2021-12-21 18:29:01', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(190, 'jenireevilla', NULL, 'PAR', 'VEN', 881675, 540, 120, 7347.29, 4.5, NULL, NULL, '2021-12-21 18:32:28', '2021-12-23 19:37:08', NULL, NULL, NULL, '2021-12-21 18:32:28', '2021-12-21 23:06:55', '2021-12-23 19:37:08', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(191, 'frodriguez', NULL, 'PAR', 'VEN', 1000000, 613.83, 136.1, 7347.29, 4.51, NULL, 'Se cancela por el operador, error no se indicó cuenta destino, o no se grabó correctamente.', '2021-12-21 19:46:04', NULL, 1, 'gperez', NULL, '2021-12-21 19:46:04', '2022-01-01 15:24:00', '2022-01-01 15:33:00', 'CANC', '', '', 1, 2, 8, NULL, NULL, NULL),
(192, 'franrodriguez', NULL, 'PAR', 'VEN', 1000000, 613.83, 136.1, 7347.29, 4.51, NULL, NULL, '2021-12-21 19:46:30', '2021-12-23 13:51:36', NULL, NULL, NULL, '2021-12-21 19:46:30', '2021-12-21 21:32:06', '2021-12-23 13:51:36', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(193, 'Acruzp', NULL, 'PAR', 'VEN', 368354, 219, 50, 7367.07, 4.38, NULL, NULL, '2021-12-23 18:13:22', '2021-12-24 15:27:28', NULL, NULL, NULL, '2021-12-23 18:13:22', '2021-12-23 19:36:47', '2021-12-24 15:27:28', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(194, 'nailynsilva', NULL, 'PAR', 'VEN', 515302, 308, 70, 7361.45, 4.4, NULL, NULL, '2021-12-24 14:47:22', '2021-12-28 12:19:35', NULL, NULL, NULL, '2021-12-24 14:47:22', '2021-12-28 12:19:33', '2021-12-28 12:19:35', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(195, 'zenaidaescalona', NULL, 'PAR', 'VEN', 300000, 193.13, 40.83, 7347.5, 4.73, NULL, NULL, '2021-12-29 20:27:25', '2021-12-30 00:05:49', NULL, NULL, NULL, '2021-12-29 20:27:25', '2021-12-29 20:53:53', '2021-12-30 00:05:49', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(196, 'nailynsilva', NULL, 'PAR', 'VEN', 220425, 142.5, 30, 7347.5, 4.75, NULL, NULL, '2021-12-29 23:58:24', '2021-12-31 15:20:36', NULL, NULL, NULL, '2021-12-29 23:58:24', '2021-12-31 13:46:37', '2021-12-31 15:20:36', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(197, 'williamvillasmil', NULL, 'PAR', 'VEN', 147565, 92.4, 20, 7378.23, 4.62, NULL, NULL, '2021-12-30 18:25:00', '2021-12-31 09:40:51', NULL, NULL, NULL, '2021-12-30 18:25:00', '2021-12-31 09:39:40', '2021-12-31 09:40:51', 'FIN', '', 'PD_OK', 1, 2, NULL, NULL, NULL, NULL),
(198, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 123.52, 26.91, 7432.1, 4.59, NULL, NULL, '2021-12-31 18:23:34', '2021-12-31 19:29:19', NULL, NULL, NULL, '2021-12-31 18:23:34', '2021-12-31 19:23:52', '2021-12-31 19:29:19', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(199, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 123.79, 26.91, 7432.1, 4.6, NULL, NULL, '2021-12-31 18:26:40', '2021-12-31 19:50:20', NULL, NULL, NULL, '2021-12-31 18:26:40', '2021-12-31 19:50:18', '2021-12-31 19:50:20', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(200, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.03, 13.46, 7432.1, 4.61, NULL, NULL, '2021-12-31 18:46:01', '2021-12-31 19:29:32', NULL, NULL, NULL, '2021-12-31 18:46:01', '2021-12-31 19:26:49', '2021-12-31 19:29:32', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(201, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.16, 13.46, 7432.1, 4.62, NULL, NULL, '2021-12-31 18:46:34', '2021-12-31 19:28:53', NULL, NULL, NULL, '2021-12-31 18:46:34', '2021-12-31 19:28:49', '2021-12-31 19:28:53', 'FIN', '', 'PD_OK', 1, 6, NULL, NULL, NULL, NULL),
(202, 'Acruzp', NULL, 'PAR', 'VEN', 740506, 464, 100, 7405.06, 4.64, 'cliente confirmó que llegó el pago', NULL, '2022-01-03 13:11:19', '2022-01-03 16:25:19', NULL, NULL, NULL, '2022-01-03 13:11:19', '2022-01-03 16:30:00', '2022-01-03 16:30:00', 'FIN', 'OK', 'OK', 1, 6, 8, NULL, NULL, NULL),
(203, 'gperez', NULL, 'PAR', 'VEN', 74524, 47.9, 10, 7452.37, 4.79, NULL, NULL, '2022-01-06 19:22:44', NULL, NULL, NULL, NULL, '2022-01-06 19:22:44', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(204, 'gperez', NULL, 'PAR', 'VEN', 311516, 196.59, 41.3, 7542.77, 4.76, NULL, NULL, '2022-01-09 13:11:39', NULL, NULL, NULL, NULL, '2022-01-09 13:11:39', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(205, 'nailynsilva', NULL, 'PAR', 'VEN', 378551, 242.5, 50, 7571.02, 4.85, NULL, NULL, '2022-01-10 15:17:28', NULL, NULL, NULL, NULL, '2022-01-10 15:17:28', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(206, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.13, 13.22, 7564.21, 4.7, NULL, NULL, '2022-01-11 17:03:00', NULL, NULL, NULL, NULL, '2022-01-11 17:03:00', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(207, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.4, 13.22, 7564.21, 4.72, NULL, NULL, '2022-01-11 18:15:25', NULL, NULL, NULL, NULL, '2022-01-11 18:15:25', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(208, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.53, 13.22, 7564.21, 4.73, NULL, NULL, '2022-01-11 18:16:09', NULL, NULL, NULL, NULL, '2022-01-11 18:16:09', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(209, 'gperez', NULL, 'PAR', 'VEN', 226926, 141.3, 30, 7564.21, 4.71, NULL, NULL, '2022-01-11 18:50:55', NULL, NULL, NULL, NULL, '2022-01-11 18:50:55', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(210, 'danielhernandez', NULL, 'PAR', 'VEN', 250000, 157.59, 33.04, 7567.03, 4.77, NULL, NULL, '2022-01-12 16:29:29', NULL, NULL, NULL, NULL, '2022-01-12 16:29:29', NULL, NULL, 'New', '', '', 1, 4, NULL, NULL, NULL, NULL),
(211, 'invitado', NULL, 'PAR', 'VEN', 250000, 157.26, 33.04, 7567.03, 4.76, NULL, NULL, '2022-01-12 17:52:27', NULL, NULL, NULL, NULL, '2022-01-12 17:52:27', NULL, NULL, 'New', '', '', 1, 4, NULL, NULL, NULL, NULL),
(212, 'ilder', NULL, 'PAR', 'VEN', 756703, 471, 100, 7567.03, 4.71, NULL, NULL, '2022-01-12 18:42:53', NULL, NULL, NULL, NULL, '2022-01-12 18:42:53', NULL, NULL, 'New', '', '', 1, 1, NULL, NULL, NULL, NULL),
(213, 'admin', NULL, 'PAR', 'VEN', 7567, 5, 1, 7567.03, 4.76, NULL, NULL, '2022-01-12 23:18:10', NULL, NULL, NULL, NULL, '2022-01-12 23:18:10', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(214, 'zenaidaescalona', NULL, 'PAR', 'VEN', 400000, 248.97, 52.75, 7583.28, 4.72, NULL, NULL, '2022-01-17 15:46:51', NULL, NULL, NULL, NULL, '2022-01-17 15:46:51', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(215, 'jesussoto', NULL, 'PAR', 'VEN', 114020, 70.8, 15, 7601.31, 4.72, NULL, NULL, '2022-01-18 16:10:10', NULL, NULL, NULL, NULL, '2022-01-18 16:10:10', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(216, 'ilder', NULL, 'PAR', 'VEN', 38000, 23.55, 5, 7601.31, 4.71, NULL, NULL, '2022-01-18 19:03:55', NULL, NULL, NULL, NULL, '2022-01-18 19:03:55', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(217, 'joseidy', NULL, 'PAR', 'VEN', 78522, 48.24, 10.33, 7601.31, 4.67, NULL, NULL, '2022-01-19 11:32:42', NULL, 1, 'gperez', '2022-01-19 13:57:00', '2022-01-19 11:32:42', NULL, '2022-01-19 13:57:00', 'FIN', 'OK', 'OK', 1, 6, NULL, NULL, NULL, NULL),
(218, 'nailynsilva', NULL, 'PAR', 'VEN', 76000, 47.4, 10, 7600.22, 4.74, NULL, 'cliente traerá pago origen en efectivo', '2022-01-21 13:39:35', '2022-01-21 19:58:00', 1, 'gperez', '2022-01-23 23:00:00', '2022-01-21 13:39:35', '2022-01-22 22:00:00', '2022-01-23 23:00:00', 'FIN', 'OK', 'OK', 1, 8, 9, NULL, NULL, NULL),
(219, 'Michelle', NULL, 'PAR', 'VEN', 114050, 71.85, 15, 7603.14, 4.79, NULL, 'Cancelada por operador', '2022-01-22 12:40:14', NULL, NULL, NULL, NULL, '2022-01-22 12:40:14', '2022-01-22 16:01:48', '2022-01-22 16:01:48', 'CANC', '', '', 1, 2, NULL, NULL, NULL, NULL),
(220, 'Michelle', NULL, 'PAR', 'VEN', 114050, 71.4, 15, 7603.14, 4.76, NULL, 'Cancelada por operador', '2022-01-22 12:50:56', NULL, NULL, NULL, NULL, '2022-01-22 12:50:56', '2022-01-22 20:59:38', '2022-01-22 20:59:38', 'CANC', '', '', 1, 2, NULL, NULL, NULL, NULL),
(221, 'Michelle', NULL, 'PAR', 'VEN', 152050, 95.39, 20, 7603.14, 4.77, NULL, NULL, '2022-01-22 13:15:11', NULL, 1, 'gperez', '2022-01-22 22:46:00', '2022-01-22 13:15:11', NULL, '2022-01-22 23:00:00', 'FIN', 'OK', 'OK', 1, 2, NULL, NULL, NULL, NULL),
(222, 'williamvillasmil', NULL, 'PAR', 'VEN', 381558, 235.5, 50, 7631.15, 4.71, NULL, NULL, '2022-01-24 19:15:22', NULL, NULL, NULL, NULL, '2022-01-24 19:15:22', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(223, 'franrodriguez', NULL, 'PAR', 'VEN', 350000, 214.94, 45.73, 7653.29, 4.7, NULL, NULL, '2022-01-25 18:19:08', NULL, NULL, NULL, NULL, '2022-01-25 18:19:08', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(224, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 119.68, 26.02, 7687.09, 4.6, NULL, NULL, '2022-01-31 12:41:48', NULL, NULL, NULL, NULL, '2022-01-31 12:41:48', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(225, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 119.68, 26.02, 7687.09, 4.6, NULL, NULL, '2022-01-31 12:45:05', NULL, NULL, NULL, NULL, '2022-01-31 12:45:05', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(226, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 59.84, 13.01, 7687.09, 4.6, NULL, NULL, '2022-01-31 12:47:14', NULL, NULL, NULL, NULL, '2022-01-31 12:47:14', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(227, 'jesussoto', NULL, 'PAR', 'VEN', 76871, 46.1, 10, 7687.09, 4.61, NULL, NULL, '2022-01-31 13:11:45', NULL, NULL, NULL, NULL, '2022-01-31 13:11:45', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(228, 'gperez', NULL, 'PAR', 'VEN', 462722, 272.4, 60, 7712.03, 4.54, NULL, NULL, '2022-02-02 12:45:01', NULL, NULL, NULL, NULL, '2022-02-02 12:45:01', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(229, 'Acruzp', NULL, 'PAR', 'VEN', 691809, 410.4, 90, 7686.77, 4.56, NULL, NULL, '2022-02-03 11:28:42', NULL, NULL, NULL, NULL, '2022-02-03 11:28:42', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(230, 'yasmary', NULL, 'PAR', 'VEN', 120000, 70.2, 15.6, 7692.44, 4.5, NULL, NULL, '2022-02-07 13:15:12', NULL, NULL, NULL, NULL, '2022-02-07 13:15:12', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(231, 'yasmary', NULL, 'PAR', 'VEN', 120000, 70.2, 15.6, 7692.44, 4.5, NULL, NULL, '2022-02-07 13:19:04', NULL, NULL, NULL, NULL, '2022-02-07 13:19:04', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(232, 'nazareth', NULL, 'PAR', 'VEN', 153849, 90, 20, 7692.44, 4.5, NULL, NULL, '2022-02-07 19:13:05', NULL, NULL, NULL, NULL, '2022-02-07 19:13:05', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(233, 'nailynsilva', NULL, 'PAR', 'VEN', 114094, 66.9, 15, 7606.28, 4.46, NULL, NULL, '2022-02-08 16:13:05', NULL, NULL, NULL, NULL, '2022-02-08 16:13:05', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(234, 'nailynsilva', NULL, 'PAR', 'VEN', 380314, 223, 50, 7606.28, 4.46, NULL, NULL, '2022-02-08 16:17:54', NULL, NULL, NULL, NULL, '2022-02-08 16:17:54', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(235, 'zenaidaescalona', NULL, 'PAR', 'VEN', 152126, 89.6, 20, 7606.28, 4.48, NULL, NULL, '2022-02-08 17:46:54', NULL, NULL, NULL, NULL, '2022-02-08 17:46:54', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(236, 'zenaidaescalona', NULL, 'PAR', 'VEN', 152126, 89.6, 20, 7606.28, 4.48, NULL, NULL, '2022-02-08 17:47:12', NULL, NULL, NULL, NULL, '2022-02-08 17:47:12', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(237, 'zenaidaescalona', NULL, 'PAR', 'VEN', 141000, 82.86, 18.54, 7606.28, 4.47, NULL, NULL, '2022-02-08 18:19:37', NULL, NULL, NULL, NULL, '2022-02-08 18:19:37', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(238, 'williamvillasmil', NULL, 'PAR', 'VEN', 152174, 89.2, 20, 7608.69, 4.46, NULL, NULL, '2022-02-09 12:59:37', NULL, NULL, NULL, NULL, '2022-02-09 12:59:37', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(239, 'franrodriguez', NULL, 'PAR', 'VEN', 158845, 93.87, 21, 7564.07, 4.47, NULL, NULL, '2022-02-09 14:17:21', NULL, NULL, NULL, NULL, '2022-02-09 14:17:21', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(240, 'joseavilioquintero', NULL, 'PAR', 'VEN', 340383, 201.15, 45, 7564.07, 4.47, NULL, NULL, '2022-02-09 16:50:16', NULL, NULL, NULL, NULL, '2022-02-09 16:50:16', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(241, 'gperez', NULL, 'PAR', 'VEN', 77380, 45.73, 10.23, 7564.07, 4.47, NULL, NULL, '2022-02-09 19:28:19', NULL, NULL, NULL, NULL, '2022-02-09 19:28:19', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(242, 'gperez', NULL, 'PAR', 'VEN', 76284, 44.9, 10, 7628.43, 4.49, NULL, NULL, '2022-02-12 17:27:48', NULL, NULL, NULL, NULL, '2022-02-12 17:27:48', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(243, 'joseidy', NULL, 'PAR', 'VEN', 197570, 115.25, 26.08, 7576.89, 4.42, NULL, NULL, '2022-02-14 14:07:47', NULL, NULL, NULL, NULL, '2022-02-14 14:07:47', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(244, 'gperez', NULL, 'PAR', 'VEN', 151280, 90.2, 20, 7563.99, 4.51, NULL, NULL, '2022-02-17 14:36:39', NULL, NULL, NULL, NULL, '2022-02-17 14:36:39', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(245, 'cvillarroque', NULL, 'PAR', 'VEN', 600000, 357.89, 79.35, 7561.05, 4.51, NULL, NULL, '2022-02-19 11:41:26', NULL, NULL, NULL, NULL, '2022-02-19 11:41:26', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(246, 'joseidy', NULL, 'PAR', 'VEN', 100000, 59.52, 13.23, 7561.05, 4.5, NULL, NULL, '2022-02-19 13:58:11', NULL, NULL, NULL, NULL, '2022-02-19 13:58:11', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(247, 'kenyafonseca', NULL, 'PAR', 'VEN', 200000, 119.03, 26.45, 7561.05, 4.5, NULL, NULL, '2022-02-19 14:03:43', NULL, NULL, NULL, NULL, '2022-02-19 14:03:43', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(248, 'invitado', NULL, 'PAR', 'VEN', 7561, 5, 1, 7561.05, 4.51, NULL, NULL, '2022-02-19 18:39:19', NULL, NULL, NULL, NULL, '2022-02-19 18:39:19', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(249, 'zenaidaescalona', NULL, 'PAR', 'VEN', 75611, 45.4, 10, 7561.05, 4.54, NULL, NULL, '2022-02-20 12:43:43', NULL, NULL, NULL, NULL, '2022-02-20 12:43:43', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(250, 'Michelle', NULL, 'PAR', 'VEN', 100000, 59.33, 13.18, 7584.8, 4.5, NULL, NULL, '2022-02-22 20:38:01', NULL, NULL, NULL, NULL, '2022-02-22 20:38:01', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(251, 'joseavilioquintero', NULL, 'PAR', 'VEN', 250000, 149.91, 33.09, 7554.51, 4.53, NULL, NULL, '2022-02-23 21:53:39', NULL, NULL, NULL, NULL, '2022-02-23 21:53:39', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(252, 'oscar', NULL, 'PAR', 'VEN', 453244, 265.2, 60, 7554.06, 4.42, NULL, 'Cancelada por operador', '2022-02-25 05:29:05', NULL, NULL, NULL, NULL, '2022-02-25 05:29:05', '2022-02-28 16:34:13', '2022-02-28 16:34:13', 'CANC', '', '', 1, 8, NULL, NULL, NULL, NULL),
(253, 'Acruzp', NULL, 'PAR', 'VEN', 150944, 89, 20, 7547.2, 4.45, NULL, NULL, '2022-02-25 15:30:21', NULL, NULL, NULL, NULL, '2022-02-25 15:30:21', NULL, NULL, 'New', '', '', 1, 4, NULL, NULL, NULL, NULL),
(254, 'oscar', NULL, 'PAR', 'VEN', 377360, 223.5, 50, 7547.2, 4.47, NULL, NULL, '2022-02-25 16:56:56', NULL, NULL, NULL, NULL, '2022-02-25 16:56:56', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(255, 'hilder', NULL, 'PAR', 'VEN', 38379, 21.8, 5, 7675.7, 4.36, NULL, 'Cancelada por operador', '2022-02-28 21:05:35', NULL, NULL, NULL, NULL, '2022-02-28 21:05:35', '2022-02-28 21:06:41', '2022-02-28 21:06:41', 'CANC', '', '', 1, 2, NULL, NULL, NULL, NULL),
(256, 'hilder', NULL, 'PAR', 'VEN', 38379, 21.85, 5, 7675.7, 4.37, NULL, NULL, '2022-02-28 21:09:20', NULL, NULL, NULL, NULL, '2022-02-28 21:09:20', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(257, 'joseavilioquintero', NULL, 'PAR', 'VEN', 150000, 86.4, 19.68, 7621.17, 4.39, NULL, NULL, '2022-03-01 15:00:28', NULL, NULL, NULL, NULL, '2022-03-01 15:00:28', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(258, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 114.94, 26.24, 7621.17, 4.38, NULL, NULL, '2022-03-01 15:03:49', NULL, NULL, NULL, NULL, '2022-03-01 15:03:49', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(259, 'joseavilioquintero', NULL, 'PAR', 'VEN', 50000, 28.8, 6.56, 7621.17, 4.39, NULL, NULL, '2022-03-01 15:05:26', NULL, NULL, NULL, NULL, '2022-03-01 15:05:26', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(260, 'franrodriguez', NULL, 'PAR', 'VEN', 600000, 335.41, 78.73, 7620.56, 4.26, NULL, NULL, '2022-03-02 16:41:31', NULL, NULL, NULL, NULL, '2022-03-02 16:41:31', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(261, 'nailynsilva', NULL, 'PAR', 'VEN', 100000, 56.3, 13.06, 7654.85, 4.31, NULL, NULL, '2022-03-03 14:34:55', NULL, NULL, NULL, NULL, '2022-03-03 14:34:55', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(262, 'joseavilioquintero', NULL, 'PAR', 'VEN', 150000, 84.11, 19.47, 7703.96, 4.32, NULL, NULL, '2022-03-04 12:08:52', NULL, NULL, NULL, NULL, '2022-03-04 12:08:52', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(263, 'Acruzp', NULL, 'PAR', 'VEN', 843326, 484, 110, 7666.6, 4.4, NULL, NULL, '2022-03-04 18:43:51', NULL, NULL, NULL, NULL, '2022-03-04 18:43:51', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(264, 'gperez', NULL, 'PAR', 'VEN', 204000, 116.88, 26.5, 7697.01, 4.41, NULL, 'Cancelada por operador', '2022-03-05 16:45:27', NULL, NULL, NULL, NULL, '2022-03-05 16:45:27', '2022-03-05 16:48:53', '2022-03-05 16:48:53', 'CANC', '', '', 1, 2, NULL, NULL, NULL, NULL),
(265, 'gperez', NULL, 'PAR', 'VEN', 153940, 88, 20, 7697.01, 4.4, NULL, NULL, '2022-03-05 16:47:23', NULL, NULL, NULL, NULL, '2022-03-05 16:47:23', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(266, 'gperez', NULL, 'PAR', 'VEN', 87515, 50.03, 11.37, 7697.01, 4.4, NULL, NULL, '2022-03-05 16:48:27', NULL, NULL, NULL, NULL, '2022-03-05 16:48:27', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(267, 'oscar', NULL, 'PAR', 'VEN', 649590, 362.1, 85, 7642.24, 4.26, NULL, NULL, '2022-03-09 13:20:34', NULL, NULL, NULL, NULL, '2022-03-09 13:20:34', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(268, 'yasmary', NULL, 'PAR', 'VEN', 150000, 83.92, 19.61, 7650.17, 4.28, NULL, 'Cancelada por operador', '2022-03-09 21:51:59', NULL, NULL, NULL, NULL, '2022-03-09 21:51:59', '2022-03-09 21:55:25', '2022-03-09 21:55:25', 'CANC', '', '', 1, 3, NULL, NULL, NULL, NULL),
(269, 'yasmary', NULL, 'PAR', 'VEN', 150000, 83.92, 19.61, 7650.17, 4.28, NULL, NULL, '2022-03-09 22:08:12', NULL, NULL, NULL, NULL, '2022-03-09 22:08:12', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(270, 'nailynsilva', NULL, 'PAR', 'VEN', 400000, 229.17, 52.68, 7592.71, 4.35, NULL, 'Cancelada por operador', '2022-03-10 12:11:55', NULL, NULL, NULL, NULL, '2022-03-10 12:11:55', '2022-03-11 17:58:59', '2022-03-11 17:58:59', 'CANC', '', '', 1, 8, NULL, NULL, NULL, NULL),
(271, 'yamilethchirinos', NULL, 'PAR', 'VEN', 250000, 142.03, 32.65, 7657, 4.35, NULL, NULL, '2022-03-11 14:09:07', NULL, NULL, NULL, NULL, '2022-03-11 14:09:07', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(272, 'nailynsilva', NULL, 'PAR', 'VEN', 400000, 228.29, 52.24, 7657, 4.37, NULL, NULL, '2022-03-11 16:01:39', NULL, NULL, NULL, NULL, '2022-03-11 16:01:39', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(273, 'Michelle', NULL, 'PAR', 'VEN', 61500, 34.48, 8.04, 7652.58, 4.29, NULL, NULL, '2022-03-15 19:57:04', NULL, NULL, NULL, NULL, '2022-03-15 19:57:04', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(274, 'Acruzp', NULL, 'PAR', 'VEN', 38374, 21.7, 5, 7674.74, 4.34, NULL, NULL, '2022-03-16 19:13:18', NULL, NULL, NULL, NULL, '2022-03-16 19:13:18', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(275, 'matiasff', NULL, 'PAR', 'VEN', 450000, 254.26, 58.72, 7663.31, 4.33, NULL, NULL, '2022-03-18 20:00:14', NULL, NULL, NULL, NULL, '2022-03-18 20:00:14', NULL, NULL, 'New', '', '', 1, 2, NULL, NULL, NULL, NULL),
(276, 'Acruzp', NULL, 'PAR', 'VEN', 764901, 439, 100, 7649.01, 4.39, NULL, NULL, '2022-03-23 11:54:33', NULL, NULL, NULL, NULL, '2022-03-23 11:54:33', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(277, 'williamvillasmil', NULL, 'PAR', 'VEN', 382280, 221, 50, 7645.6, 4.42, NULL, NULL, '2022-03-24 12:52:21', NULL, NULL, NULL, NULL, '2022-03-24 12:52:21', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(278, 'gperez', NULL, 'PAR', 'VEN', 76456, 44.2, 10, 7645.6, 4.42, NULL, NULL, '2022-03-24 13:29:09', NULL, NULL, NULL, NULL, '2022-03-24 13:29:09', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(279, 'franklinurbina', NULL, 'PAR', 'VEN', 7681, 4, 1, 7681.03, 4.47, NULL, NULL, '2022-03-26 14:59:25', NULL, NULL, NULL, NULL, '2022-03-26 14:59:25', NULL, NULL, 'New', '', '', 1, 3, NULL, NULL, NULL, NULL),
(280, 'Acruzp', NULL, 'PAR', 'VEN', 153621, 89.8, 20, 7681.03, 4.49, NULL, 'Cancelada por operador', '2022-03-26 16:08:01', NULL, NULL, NULL, NULL, '2022-03-26 16:08:01', '2022-03-26 20:08:26', '2022-03-26 20:08:26', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(281, 'Acruzp', NULL, 'PAR', 'VEN', 230431, 133.8, 30, 7681.03, 4.46, NULL, 'Cancelada por operador', '2022-03-26 19:02:44', NULL, NULL, NULL, NULL, '2022-03-26 19:02:44', '2022-03-26 20:08:16', '2022-03-26 20:08:16', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(282, 'Acruzp', NULL, 'PAR', 'VEN', 230431, 133.8, 30, 7681.03, 4.46, NULL, NULL, '2022-03-26 19:03:45', NULL, NULL, NULL, NULL, '2022-03-26 19:03:45', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(283, 'Acruzp', NULL, 'PAR', 'VEN', 191681, 111.25, 25, 7667.23, 4.45, NULL, NULL, '2022-03-29 16:41:59', NULL, NULL, NULL, NULL, '2022-03-29 16:41:59', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(284, 'Acruzp', NULL, 'PAR', 'VEN', 841948, 489.5, 110, 7654.07, 4.45, NULL, NULL, '2022-04-01 19:52:25', NULL, NULL, NULL, NULL, '2022-04-01 19:52:25', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(285, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 58.69, 13.13, 7616.06, 4.47, NULL, NULL, '2022-04-04 18:49:02', NULL, NULL, NULL, NULL, '2022-04-04 18:49:02', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(286, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 117.38, 26.26, 7616.06, 4.47, NULL, NULL, '2022-04-04 18:50:33', NULL, NULL, NULL, NULL, '2022-04-04 18:50:33', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(287, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 58.56, 13.13, 7616.06, 4.46, NULL, NULL, '2022-04-04 18:51:37', NULL, NULL, NULL, NULL, '2022-04-04 18:51:37', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(288, 'gperez', NULL, 'PAR', 'VEN', 152106, 89.8, 20, 7605.31, 4.49, NULL, NULL, '2022-04-05 17:34:19', NULL, NULL, NULL, NULL, '2022-04-05 17:34:19', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(289, 'Acruzp', NULL, 'PAR', 'VEN', 113921, 67.35, 15, 7594.72, 4.49, NULL, NULL, '2022-04-06 13:12:37', NULL, NULL, NULL, NULL, '2022-04-06 13:12:37', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(290, 'invitado', NULL, 'PAR', 'VEN', 7601, 5, 1, 7600.53, 4.52, NULL, NULL, '2022-04-09 15:57:39', NULL, NULL, NULL, NULL, '2022-04-09 15:57:39', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(291, 'williamvillasmil', NULL, 'PAR', 'VEN', 380000, 230.41, 50.64, 7503.96, 4.55, NULL, NULL, '2022-04-12 14:08:55', NULL, NULL, NULL, NULL, '2022-04-12 14:08:55', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(292, 'Michelle', NULL, 'PAR', 'VEN', 200000, 121, 26.65, 7503.96, 4.54, NULL, NULL, '2022-04-12 15:55:27', NULL, NULL, NULL, NULL, '2022-04-12 15:55:27', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(293, 'yamilethchirinos', NULL, 'PAR', 'VEN', 303000, 184.66, 40.41, 7498.78, 4.57, NULL, NULL, '2022-04-13 18:21:59', NULL, NULL, NULL, NULL, '2022-04-13 18:21:59', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(294, 'hilder', NULL, 'PAR', 'VEN', 90000, 54.85, 12, 7498.78, 4.57, NULL, NULL, '2022-04-13 23:55:33', NULL, NULL, NULL, NULL, '2022-04-13 23:55:33', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(295, 'Michelle', NULL, 'PAR', 'VEN', 120000, 71.19, 15.75, 7619.01, 4.52, NULL, NULL, '2022-04-18 17:31:36', NULL, NULL, NULL, NULL, '2022-04-18 17:31:36', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(296, 'Michelle', NULL, 'PAR', 'VEN', 200000, 121.93, 26.56, 7528.82, 4.59, NULL, NULL, '2022-04-23 16:13:16', NULL, NULL, NULL, NULL, '2022-04-23 16:13:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(297, 'gperez', NULL, 'PAR', 'VEN', 7518, 5, 1, 7517.55, 4.69, NULL, NULL, '2022-04-28 19:25:58', NULL, NULL, NULL, NULL, '2022-04-28 19:25:58', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(298, 'Acruzp', NULL, 'PAR', 'VEN', 980000, 609.4, 130.21, 7526.1, 4.68, NULL, NULL, '2022-04-29 17:28:20', NULL, NULL, NULL, NULL, '2022-04-29 17:28:20', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(299, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 124.37, 26.57, 7526.1, 4.68, NULL, NULL, '2022-04-29 19:09:40', NULL, NULL, NULL, NULL, '2022-04-29 19:09:40', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(300, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 62.18, 13.29, 7526.1, 4.68, NULL, NULL, '2022-04-29 19:10:17', NULL, NULL, NULL, NULL, '2022-04-29 19:10:17', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(301, 'invitado', NULL, 'PAR', 'VEN', 37521, 23.75, 5, 7504.14, 4.75, NULL, NULL, '2022-05-02 22:33:37', NULL, NULL, NULL, NULL, '2022-05-02 22:33:37', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(302, 'gperez', NULL, 'PAR', 'VEN', 37521, 23.75, 5, 7504.14, 4.75, NULL, NULL, '2022-05-02 22:33:58', NULL, NULL, NULL, NULL, '2022-05-02 22:33:58', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(303, 'gperez', NULL, 'PAR', 'VEN', 37521, 23.75, 5, 7504.14, 4.75, NULL, NULL, '2022-05-02 22:35:32', NULL, NULL, NULL, NULL, '2022-05-02 22:35:32', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(304, 'invitado', NULL, 'PAR', 'VEN', 7504, 4.76, 1, 7504.14, 4.76, NULL, NULL, '2022-05-02 22:36:04', NULL, NULL, NULL, NULL, '2022-05-02 22:36:04', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(305, 'hilder', NULL, 'PAR', 'VEN', 7504, 5, 1, 7504.14, 4.76, NULL, NULL, '2022-05-02 22:38:42', NULL, NULL, NULL, NULL, '2022-05-02 22:38:42', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(306, 'gperez', NULL, 'PAR', 'VEN', 37521, 23.8, 5, 7504.14, 4.76, NULL, NULL, '2022-05-02 22:42:22', NULL, NULL, NULL, NULL, '2022-05-02 22:42:22', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(307, 'hilder', NULL, 'PAR', 'VEN', 7504, 5, 1, 7504.14, 4.76, NULL, NULL, '2022-05-02 22:43:16', NULL, NULL, NULL, NULL, '2022-05-02 22:43:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(308, 'hilder', NULL, 'PAR', 'VEN', 7504, 5, 1, 7504.14, 4.77, NULL, NULL, '2022-05-03 00:22:51', NULL, NULL, NULL, NULL, '2022-05-03 00:22:51', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(309, 'hilder', NULL, 'PAR', 'VEN', 7504, 5, 1, 7504.14, 4.76, NULL, NULL, '2022-05-03 00:25:10', NULL, NULL, NULL, NULL, '2022-05-03 00:25:10', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(310, 'ccolmenarez', NULL, 'PAR', 'VEN', 750414, 477, 100, 7504.14, 4.77, NULL, NULL, '2022-05-03 00:34:27', NULL, NULL, NULL, NULL, '2022-05-03 00:34:27', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(311, 'ccolmenarez', NULL, 'PAR', 'VEN', 7504, 5, 1, 7504.14, 4.77, NULL, NULL, '2022-05-03 00:35:57', NULL, NULL, NULL, NULL, '2022-05-03 00:35:57', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(312, 'gperez', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:20:56', NULL, NULL, NULL, NULL, '2022-05-03 15:20:56', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(313, 'invitado', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:53:40', NULL, NULL, NULL, NULL, '2022-05-03 15:53:40', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(314, 'gperez', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:55:08', NULL, NULL, NULL, NULL, '2022-05-03 15:55:08', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(315, 'gperez', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:55:32', NULL, NULL, NULL, NULL, '2022-05-03 15:55:32', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(316, 'gperez', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:56:52', NULL, NULL, NULL, NULL, '2022-05-03 15:56:52', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(317, 'gperez', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:58:50', NULL, NULL, NULL, NULL, '2022-05-03 15:58:50', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(318, 'invitado', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 15:59:59', NULL, NULL, NULL, NULL, '2022-05-03 15:59:59', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(319, 'invitado', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 16:01:29', NULL, NULL, NULL, NULL, '2022-05-03 16:01:29', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(320, 'hilder', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 16:01:52', NULL, NULL, NULL, NULL, '2022-05-03 16:01:52', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL);
INSERT INTO `transacciones` (`id`, `login`, `user_observ`, `origen_codpais`, `destino_codpais`, `origen_monto`, `destino_monto`, `monto_dolares`, `tasa_dolar_origen`, `tasa_dolar_destino`, `destino_observ`, `observ_admin`, `fechahora_origen`, `fechahora_destino`, `check_admin`, `user_admin`, `fechahora_check`, `date_created`, `date_updated`, `date_end`, `status`, `status_PO`, `status_PD`, `activo`, `id_formapago_origen`, `porc_comision`, `monto_comision_dolares`, `monto_comision_btc`, `monto_comision_usdt`) VALUES
(321, 'invitado', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 16:03:58', NULL, NULL, NULL, NULL, '2022-05-03 16:03:58', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(322, 'hilder', NULL, 'PAR', 'VEN', 7466, 5, 1, 7466, 4.77, NULL, NULL, '2022-05-03 16:04:18', NULL, NULL, NULL, NULL, '2022-05-03 16:04:18', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(323, 'oscar', NULL, 'PAR', 'VEN', 475800, 306.54, 63.73, 7466, 4.81, NULL, NULL, '2022-05-03 18:30:52', NULL, NULL, NULL, NULL, '2022-05-03 18:30:52', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(324, 'oscar', NULL, 'PAR', 'VEN', 394673, 254.8, 52.86, 7466, 4.82, NULL, NULL, '2022-05-03 18:35:53', NULL, NULL, NULL, NULL, '2022-05-03 18:35:53', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(325, 'invitado', NULL, 'PAR', 'VEN', 7509, 5, 1, 7508.68, 4.83, NULL, NULL, '2022-05-04 15:29:07', NULL, NULL, NULL, NULL, '2022-05-04 15:29:07', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(326, 'admin', NULL, 'PAR', 'VEN', 73722, 49, 10, 7372.15623396, 4.8941872737869, NULL, NULL, '2022-05-04 15:41:07', NULL, NULL, NULL, NULL, '2022-05-04 15:41:07', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(327, 'admin', NULL, 'PAR', 'VEN', 73722, 49, 10, 7372.15623396, 4.8904470439407, NULL, NULL, '2022-05-04 16:07:09', NULL, NULL, NULL, NULL, '2022-05-04 16:07:09', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(328, 'invitado', NULL, 'PAR', 'VEN', 7509, 5, 1, 7508.68, 4.82, NULL, NULL, '2022-05-04 16:10:28', NULL, NULL, NULL, NULL, '2022-05-04 16:10:28', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(329, 'invitado', NULL, 'PAR', 'VEN', 7509, 5, 1, 7508.68, 4.82, NULL, NULL, '2022-05-04 16:21:47', NULL, NULL, NULL, NULL, '2022-05-04 16:21:47', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(330, 'hilder', NULL, 'PAR', 'VEN', 7509, 5, 1, 7508.68, 4.81, NULL, NULL, '2022-05-04 17:07:48', NULL, NULL, NULL, NULL, '2022-05-04 17:07:48', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(331, 'hilder', NULL, 'PAR', 'VEN', 7515, 5, 1, 7515.28, 4.87, NULL, NULL, '2022-05-05 18:36:57', NULL, NULL, NULL, NULL, '2022-05-05 18:36:57', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(332, 'hilder', NULL, 'PAR', 'VEN', 7515, 5, 1, 7515.28, 4.87, NULL, NULL, '2022-05-05 18:38:10', NULL, NULL, NULL, NULL, '2022-05-05 18:38:10', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(333, 'oscar', NULL, 'PAR', 'VEN', 390795, 254.8, 52, 7515.28, 4.9, NULL, NULL, '2022-05-05 19:42:27', NULL, NULL, NULL, NULL, '2022-05-05 19:42:27', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(334, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.88, NULL, NULL, '2022-05-06 19:32:05', NULL, NULL, NULL, NULL, '2022-05-06 19:32:05', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(335, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.89, NULL, NULL, '2022-05-06 22:21:11', NULL, NULL, NULL, NULL, '2022-05-06 22:21:11', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(336, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.89, NULL, NULL, '2022-05-06 22:21:17', NULL, NULL, NULL, NULL, '2022-05-06 22:21:17', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(337, 'invitado', NULL, 'PAR', 'VEN', 22529, 14.67, 3, 7509.73, 4.89, NULL, NULL, '2022-05-06 22:22:24', NULL, NULL, NULL, NULL, '2022-05-06 22:22:24', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(338, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.83, NULL, NULL, '2022-05-07 04:25:35', NULL, NULL, NULL, NULL, '2022-05-07 04:25:35', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(339, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.83, NULL, NULL, '2022-05-07 04:25:54', NULL, NULL, NULL, NULL, '2022-05-07 04:25:54', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(340, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 19:18:39', NULL, NULL, NULL, NULL, '2022-05-07 19:18:39', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(341, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 19:19:14', NULL, NULL, NULL, NULL, '2022-05-07 19:19:14', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(342, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 20:14:00', NULL, NULL, NULL, NULL, '2022-05-07 20:14:00', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(343, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 20:18:39', NULL, NULL, NULL, NULL, '2022-05-07 20:18:39', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(344, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 20:22:07', NULL, NULL, NULL, NULL, '2022-05-07 20:22:07', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(434, 'invitado', NULL, 'PAR', 'VEN', 7510, 5, 1, 7509.73, 4.75, NULL, NULL, '2022-05-07 20:29:05', NULL, NULL, NULL, NULL, '2022-05-07 20:29:05', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(435, 'invitado', NULL, 'PAR', 'VEN', 49714, 31.78, 6.62, 7509.73, 4.8, NULL, NULL, '2022-05-08 21:50:21', NULL, NULL, NULL, NULL, '2022-05-08 21:50:21', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(436, 'zenaidaescalona', NULL, 'PAR', 'VEN', 76000, 49.68, 10.08, 7541.92, 4.93, NULL, NULL, '2022-05-10 12:27:26', NULL, NULL, NULL, NULL, '2022-05-10 12:27:26', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(437, 'yamilethchirinos', NULL, 'PAR', 'VEN', 500000, 343.81, 66.12, 7562.41, 5.2, NULL, NULL, '2022-05-12 14:45:25', NULL, NULL, NULL, NULL, '2022-05-12 14:45:25', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(438, 'oscar', NULL, 'PAR', 'VEN', 150000, 103.34, 19.83, 7562.41, 5.21, NULL, 'Cancelada por operador', '2022-05-12 16:59:08', NULL, NULL, NULL, NULL, '2022-05-12 16:59:08', '2022-05-12 17:05:07', '2022-05-12 17:05:07', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(439, 'franklinurbina', NULL, 'PAR', 'VEN', 150000, 102.55, 19.83, 7562.41, 5.17, NULL, 'Cancelada por operador', '2022-05-12 17:04:23', NULL, NULL, NULL, NULL, '2022-05-12 17:04:23', '2022-05-12 18:06:12', '2022-05-12 18:06:12', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(440, 'franklinurbina', NULL, 'PAR', 'VEN', 150000, 104.33, 19.83, 7562.41, 5.26, NULL, NULL, '2022-05-12 18:06:46', NULL, NULL, NULL, NULL, '2022-05-12 18:06:46', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(441, 'invitado', NULL, 'PAR', 'VEN', 7562, 5, 1, 7561.56, 5.23, NULL, NULL, '2022-05-13 14:09:23', NULL, NULL, NULL, NULL, '2022-05-13 14:09:23', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(442, 'invitado', NULL, 'PAR', 'VEN', 252027, 176.32, 33.33, 7561.56, 5.29, NULL, NULL, '2022-05-13 14:31:50', NULL, NULL, NULL, NULL, '2022-05-13 14:31:50', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(443, 'cvillarroque', NULL, 'PAR', 'VEN', 1000000, 681.62, 132.1, 7570.15, 5.16, NULL, NULL, '2022-05-16 17:18:14', NULL, NULL, NULL, NULL, '2022-05-16 17:18:14', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(444, 'zenaidaescalona', NULL, 'PAR', 'VEN', 76000, 51.56, 10.09, 7532.81, 5.11, NULL, 'Cancelada por operador', '2022-05-20 00:22:47', NULL, NULL, NULL, NULL, '2022-05-20 00:22:47', '2022-05-20 00:44:52', '2022-05-20 00:44:52', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(445, 'zenaidaescalona', NULL, 'PAR', 'VEN', 77500, 52.57, 10.29, 7532.81, 5.11, NULL, NULL, '2022-05-20 00:29:16', NULL, NULL, NULL, NULL, '2022-05-20 00:29:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(446, 'Michelle', NULL, 'PAR', 'VEN', 140000, 95.94, 18.59, 7529.96, 5.16, NULL, NULL, '2022-05-20 14:44:48', NULL, NULL, NULL, NULL, '2022-05-20 14:44:48', NULL, NULL, 'New', '', '', 1, 12, NULL, NULL, NULL, NULL),
(447, 'oscar', NULL, 'PAR', 'VEN', 375831, 259.88, 49.98, 7520.2, 5.2, NULL, NULL, '2022-05-24 19:33:37', NULL, NULL, NULL, NULL, '2022-05-24 19:33:37', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(448, 'Acruzp', NULL, 'PAR', 'VEN', 75467, 52, 10, 7546.68, 5.2, NULL, NULL, '2022-05-24 22:27:46', NULL, NULL, NULL, NULL, '2022-05-24 22:27:46', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(449, 'Acruzp', NULL, 'PAR', 'VEN', 75490, 52.8, 10, 7548.99, 5.28, NULL, NULL, '2022-05-29 02:13:12', NULL, NULL, NULL, NULL, '2022-05-29 02:13:12', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(450, 'Acruzp', NULL, 'PAR', 'VEN', 984599, 681.2, 130, 7573.84, 5.24, NULL, NULL, '2022-06-01 21:14:12', NULL, NULL, NULL, NULL, '2022-06-01 21:14:12', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(451, 'Michelle', NULL, 'PAR', 'VEN', 80000, 55.67, 10.56, 7573.84, 5.27, NULL, NULL, '2022-06-01 22:11:32', NULL, NULL, NULL, NULL, '2022-06-01 22:11:32', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(452, 'Michelle', NULL, 'PAR', 'VEN', 70000, 48.71, 9.24, 7573.84, 5.27, NULL, NULL, '2022-06-01 22:12:56', NULL, NULL, NULL, NULL, '2022-06-01 22:12:56', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(453, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 138.11, 26.41, 7573.84, 5.23, NULL, 'Cancelada por operador', '2022-06-02 01:17:39', NULL, NULL, NULL, NULL, '2022-06-02 01:17:39', '2022-06-02 01:18:44', '2022-06-02 01:18:44', 'CANC', '', '', 1, 15, NULL, NULL, NULL, NULL),
(454, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 138.11, 26.41, 7573.84, 5.23, NULL, NULL, '2022-06-02 01:19:41', NULL, NULL, NULL, NULL, '2022-06-02 01:19:41', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(455, 'joseavilioquintero', NULL, 'PAR', 'VEN', 100000, 69.05, 13.2, 7573.84, 5.23, NULL, NULL, '2022-06-02 01:20:09', NULL, NULL, NULL, NULL, '2022-06-02 01:20:09', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(456, 'leonardzambrano', NULL, 'PAR', 'VEN', 75000, 54.88, 10, 7502.95, 5.49, NULL, NULL, '2022-06-08 21:13:13', NULL, NULL, NULL, NULL, '2022-06-08 21:13:13', NULL, NULL, 'New', '', '', 1, 12, NULL, NULL, NULL, NULL),
(457, 'yamilethchirinos', NULL, 'PAR', 'VEN', 200000, 147.37, 26.65, 7504.98, 5.53, NULL, NULL, '2022-06-09 20:40:14', NULL, NULL, NULL, NULL, '2022-06-09 20:40:14', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(458, 'franklinurbina', NULL, 'PAR', 'VEN', 100000, 73.91, 13.25, 7549.83, 5.58, NULL, 'Cancelada por operador', '2022-06-11 19:14:53', NULL, NULL, NULL, NULL, '2022-06-11 19:14:53', '2022-06-11 19:18:10', '2022-06-11 19:18:10', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(459, 'franklinurbina', NULL, 'PAR', 'VEN', 100000, 73.78, 13.25, 7549.83, 5.57, NULL, 'Cancelada por operador', '2022-06-11 19:18:40', NULL, NULL, NULL, NULL, '2022-06-11 19:18:40', '2022-06-11 19:26:56', '2022-06-11 19:26:56', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(460, 'Michelle', NULL, 'PAR', 'VEN', 330000, 251.95, 43.74, 7544.42, 5.76, NULL, NULL, '2022-06-13 17:47:01', NULL, NULL, NULL, NULL, '2022-06-13 17:47:01', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(461, 'moisesbarrios', NULL, 'PAR', 'VEN', 680000, 517.36, 90.13, 7544.42, 5.74, NULL, NULL, '2022-06-13 18:23:16', NULL, NULL, NULL, NULL, '2022-06-13 18:23:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(462, 'moisesbarrios', NULL, 'PAR', 'VEN', 680000, 517.36, 90.13, 7544.42, 5.74, NULL, NULL, '2022-06-13 18:26:19', NULL, NULL, NULL, NULL, '2022-06-13 18:26:19', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(463, 'Michelle', NULL, 'PAR', 'VEN', 150000, 113.29, 19.84, 7560.34, 5.71, NULL, NULL, '2022-06-14 17:49:57', NULL, NULL, NULL, NULL, '2022-06-14 17:49:57', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(464, 'yamilethchirinos', NULL, 'PAR', 'VEN', 500000, 376.97, 66.13, 7560.34, 5.7, NULL, NULL, '2022-06-14 18:42:06', NULL, NULL, NULL, NULL, '2022-06-14 18:42:06', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(465, 'williamvillasmil', NULL, 'PAR', 'VEN', 378145, 285, 50, 7562.9, 5.7, NULL, NULL, '2022-06-15 11:47:16', NULL, NULL, NULL, NULL, '2022-06-15 11:47:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(466, 'oscar', NULL, 'PAR', 'VEN', 114000, 86.97, 15.07, 7562.9, 5.77, NULL, 'Cancelada por operador', '2022-06-16 15:48:37', NULL, NULL, NULL, NULL, '2022-06-16 15:48:37', '2022-06-16 16:12:34', '2022-06-16 16:12:34', 'CANC', '', '', 1, 15, NULL, NULL, NULL, NULL),
(467, 'williamvillasmil', NULL, 'PAR', 'VEN', 380000, 288.91, 50.25, 7562.9, 5.75, NULL, NULL, '2022-06-16 17:11:30', NULL, NULL, NULL, NULL, '2022-06-16 17:11:30', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(468, 'hilder', NULL, 'PAR', 'VEN', 100000, 75.83, 13.26, 7543.34, 5.72, NULL, NULL, '2022-06-17 19:54:20', NULL, NULL, NULL, NULL, '2022-06-17 19:54:20', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(469, 'oscar', NULL, 'PAR', 'VEN', 114000, 86.14, 15.11, 7543.34, 5.7, NULL, NULL, '2022-06-17 21:01:12', NULL, NULL, NULL, NULL, '2022-06-17 21:01:12', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(470, 'jcastro', NULL, 'PAR', 'VEN', 100000, 75.66, 13.23, 7560.3, 5.72, NULL, NULL, '2022-06-18 13:53:05', NULL, NULL, NULL, NULL, '2022-06-18 13:53:05', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(471, 'jcastro', NULL, 'PAR', 'VEN', 314000, 237.98, 41.53, 7560.3, 5.73, NULL, NULL, '2022-06-18 15:49:37', NULL, NULL, NULL, NULL, '2022-06-18 15:49:37', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(472, 'yamilethchirinos', NULL, 'PAR', 'VEN', 300000, 226.64, 39.76, 7545.12, 5.7, NULL, NULL, '2022-06-20 19:49:32', NULL, NULL, NULL, NULL, '2022-06-20 19:49:32', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(473, 'yohanaot', NULL, 'PAR', 'VEN', 350000, 263.48, 46.39, 7545.12, 5.68, NULL, NULL, '2022-06-20 20:37:01', NULL, NULL, NULL, NULL, '2022-06-20 20:37:01', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(474, 'Acruzp', NULL, 'PAR', 'VEN', 111000, 84.68, 14.68, 7563.59, 5.77, NULL, NULL, '2022-06-22 20:59:21', NULL, NULL, NULL, NULL, '2022-06-22 20:59:21', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(475, 'Michelle', NULL, 'PAR', 'VEN', 80000, 61.94, 10.57, 7568.78, 5.86, NULL, NULL, '2022-06-24 21:01:39', NULL, NULL, NULL, NULL, '2022-06-24 21:01:39', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(476, 'Michelle', NULL, 'PAR', 'VEN', 243000, 186.53, 32.11, 7568.78, 5.81, NULL, NULL, '2022-06-25 14:37:03', NULL, NULL, NULL, NULL, '2022-06-25 14:37:03', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(477, 'Acruzp', NULL, 'PAR', 'VEN', 978435, 748.8, 130, 7526.42, 5.76, NULL, NULL, '2022-07-01 17:09:00', NULL, NULL, NULL, NULL, '2022-07-01 17:09:00', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(478, 'Michelle', NULL, 'PAR', 'VEN', 250000, 191.66, 33.22, 7526.42, 5.77, NULL, NULL, '2022-07-02 15:49:25', NULL, NULL, NULL, NULL, '2022-07-02 15:49:25', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(479, 'zenaidaescalona', NULL, 'PAR', 'VEN', 112896, 85.8, 15, 7526.42, 5.72, NULL, NULL, '2022-07-02 23:06:16', NULL, NULL, NULL, NULL, '2022-07-02 23:06:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(480, 'jcastro', NULL, 'PAR', 'VEN', 90000, 68.4, 11.96, 7526.42, 5.72, NULL, NULL, '2022-07-02 23:07:11', NULL, NULL, NULL, NULL, '2022-07-02 23:07:11', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(481, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 151.14, 26.56, 7529.33, 5.69, NULL, NULL, '2022-07-05 01:13:26', NULL, NULL, NULL, NULL, '2022-07-05 01:13:26', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(482, 'zenaidaescalona', NULL, 'PAR', 'VEN', 300000, 228.04, 39.8, 7538.13, 5.73, NULL, NULL, '2022-07-05 16:39:17', NULL, NULL, NULL, NULL, '2022-07-05 16:39:17', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(483, 'Acruzp', NULL, 'PAR', 'VEN', 112000, 85.07, 14.85, 7544.1, 5.73, NULL, NULL, '2022-07-06 18:10:02', NULL, NULL, NULL, NULL, '2022-07-06 18:10:02', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(484, 'Michelle', NULL, 'PAR', 'VEN', 180000, 137.93, 23.86, 7542.75, 5.78, NULL, NULL, '2022-07-07 21:37:35', NULL, NULL, NULL, NULL, '2022-07-07 21:37:35', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(485, 'Michelle', NULL, 'PAR', 'VEN', 250000, 190.85, 33.19, 7532, 5.75, NULL, NULL, '2022-07-08 17:19:09', NULL, NULL, NULL, NULL, '2022-07-08 17:19:09', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(486, 'Acruzp', NULL, 'PAR', 'VEN', 380000, 289.12, 50.19, 7570.6, 5.76, NULL, NULL, '2022-07-11 14:34:58', NULL, NULL, NULL, NULL, '2022-07-11 14:34:58', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(487, 'franklinurbina', NULL, 'PAR', 'VEN', 100000, 76.81, 13.27, 7538.45, 5.79, NULL, NULL, '2022-07-13 15:54:13', NULL, NULL, NULL, NULL, '2022-07-13 15:54:13', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(488, 'jcastro', NULL, 'PAR', 'VEN', 90000, 68.08, 11.92, 7548.51, 5.71, NULL, NULL, '2022-07-15 13:30:41', NULL, NULL, NULL, NULL, '2022-07-15 13:30:41', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(489, 'zenaidaescalona', NULL, 'PAR', 'VEN', 100000, 76.17, 13.25, 7548.51, 5.75, NULL, NULL, '2022-07-15 15:14:15', NULL, NULL, NULL, NULL, '2022-07-15 15:14:15', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(490, 'Michelle', NULL, 'PAR', 'VEN', 250000, 192.8, 33.18, 7533.77, 5.81, NULL, NULL, '2022-07-16 19:59:24', NULL, NULL, NULL, NULL, '2022-07-16 19:59:24', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(491, 'Michelle', NULL, 'PAR', 'VEN', 150000, 114.47, 19.87, 7547.62, 5.76, NULL, NULL, '2022-07-18 23:36:12', NULL, NULL, NULL, NULL, '2022-07-18 23:36:12', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(492, 'gperez', NULL, 'PAR', 'VEN', 200000, 154.26, 26.46, 7558.83, 5.83, NULL, NULL, '2022-07-20 00:31:41', NULL, NULL, NULL, NULL, '2022-07-20 00:31:41', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(493, 'Acruzp', NULL, 'PAR', 'VEN', 100000, 77.02, 13.26, 7543.65, 5.81, NULL, 'Cancelada por operador', '2022-07-20 22:11:04', NULL, NULL, NULL, NULL, '2022-07-20 22:11:04', '2022-07-20 23:47:18', '2022-07-20 23:47:18', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(494, 'Acruzp', NULL, 'PAR', 'VEN', 100000, 77.02, 13.26, 7543.65, 5.81, NULL, 'Cancelada por operador', '2022-07-20 23:45:13', NULL, NULL, NULL, NULL, '2022-07-20 23:45:13', '2022-07-20 23:47:37', '2022-07-20 23:47:37', 'CANC', '', '', 1, 11, NULL, NULL, NULL, NULL),
(495, 'Acruzp', NULL, 'PAR', 'VEN', 100000, 77.02, 13.26, 7543.65, 5.81, NULL, NULL, '2022-07-20 23:46:16', NULL, NULL, NULL, NULL, '2022-07-20 23:46:16', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(496, 'zenaidaescalona', NULL, 'PAR', 'VEN', 75500, 58.35, 10.01, 7543.65, 5.83, NULL, NULL, '2022-07-21 01:54:47', NULL, NULL, NULL, NULL, '2022-07-21 01:54:47', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(497, 'yamilethchirinos', NULL, 'PAR', 'VEN', 500000, 387.01, 66.38, 7532.2, 5.83, NULL, NULL, '2022-07-22 00:52:51', NULL, NULL, NULL, NULL, '2022-07-22 00:52:51', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(498, 'Michelle', NULL, 'PAR', 'VEN', 240000, 186.94, 31.79, 7549, 5.88, NULL, NULL, '2022-07-22 21:52:00', NULL, NULL, NULL, NULL, '2022-07-22 21:52:00', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(499, 'germontilla', NULL, 'PAR', 'VEN', 377450, 295, 50, 7549, 5.9, NULL, NULL, '2022-07-23 17:08:33', NULL, NULL, NULL, NULL, '2022-07-23 17:08:33', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(500, 'yamilethchirinos', NULL, 'PAR', 'VEN', 150000, 120.02, 19.77, 7586.19, 6.07, NULL, NULL, '2022-07-26 14:44:47', NULL, NULL, NULL, NULL, '2022-07-26 14:44:47', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(501, 'joseidy', NULL, 'PAR', 'VEN', 379310, 303.5, 50, 7586.19, 6.07, NULL, NULL, '2022-07-26 23:10:28', NULL, NULL, NULL, NULL, '2022-07-26 23:10:28', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(502, 'invitado', NULL, 'PAR', 'VEN', 46000, 36.12, 6.08, 7565.69, 5.94, NULL, NULL, '2022-07-27 18:35:34', NULL, NULL, NULL, NULL, '2022-07-27 18:35:34', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(503, 'robertmartinez', NULL, 'PAR', 'VEN', 46000, 36.18, 6.08, 7565.69, 5.95, NULL, NULL, '2022-07-27 22:02:09', NULL, NULL, NULL, NULL, '2022-07-27 22:02:09', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(504, 'invitado', NULL, 'PAR', 'VEN', 756569, 594, 100, 7565.69, 5.94, NULL, NULL, '2022-07-28 00:42:33', NULL, NULL, NULL, NULL, '2022-07-28 00:42:33', NULL, NULL, 'New', '', '', 1, 8, NULL, NULL, NULL, NULL),
(505, 'Michelle', NULL, 'PAR', 'VEN', 361000, 275.48, 47.5, 7600.63, 5.8, NULL, NULL, '2022-07-28 13:02:20', NULL, NULL, NULL, NULL, '2022-07-28 13:02:20', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(506, 'invitado', NULL, 'PAR', 'VEN', 70000, 54.64, 9.21, 7596.43, 5.93, NULL, NULL, '2022-07-30 21:55:43', NULL, NULL, NULL, NULL, '2022-07-30 21:55:43', NULL, NULL, 'New', '', '', 1, 1, NULL, NULL, NULL, NULL),
(507, 'joseidy', NULL, 'PAR', 'VEN', 250000, 198.43, 33.02, 7571.84, 6.01, NULL, NULL, '2022-08-01 16:55:24', NULL, NULL, NULL, NULL, '2022-08-01 16:55:24', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(508, 'Acruzp', NULL, 'PAR', 'VEN', 979174, 777.4, 130, 7532.11, 5.98, NULL, NULL, '2022-08-02 13:40:34', NULL, NULL, NULL, NULL, '2022-08-02 13:40:34', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(509, 'Acruzp', NULL, 'PAR', 'VEN', 980000, 776.75, 130.11, 7532.11, 5.97, NULL, NULL, '2022-08-02 13:48:10', NULL, NULL, NULL, NULL, '2022-08-02 13:48:10', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(510, 'jesussoto', NULL, 'PAR', 'VEN', 160000, 126.6, 21.24, 7532.11, 5.96, NULL, NULL, '2022-08-02 16:56:57', NULL, NULL, NULL, NULL, '2022-08-02 16:56:57', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(511, 'Acruzp', NULL, 'PAR', 'VEN', 828532, 657.8, 110, 7532.11, 5.98, NULL, NULL, '2022-08-02 18:22:29', NULL, NULL, NULL, NULL, '2022-08-02 18:22:29', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(512, 'Acruzp', NULL, 'PAR', 'VEN', 828532, 658.9, 110, 7532.11, 5.99, NULL, NULL, '2022-08-02 22:41:30', NULL, NULL, NULL, NULL, '2022-08-02 22:41:30', NULL, NULL, 'New', '', '', 1, 6, NULL, NULL, NULL, NULL),
(513, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 161.13, 26.46, 7559.29, 6.09, NULL, NULL, '2022-08-04 14:33:25', NULL, NULL, NULL, NULL, '2022-08-04 14:33:25', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(514, 'joseavilioquintero', NULL, 'PAR', 'VEN', 200000, 160.86, 26.46, 7559.29, 6.08, NULL, NULL, '2022-08-04 16:59:04', NULL, NULL, NULL, NULL, '2022-08-04 16:59:04', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(515, 'gperez', NULL, 'PAR', 'VEN', 378991, 303, 50, 7579.82, 6.06, NULL, NULL, '2022-08-06 14:47:44', NULL, NULL, NULL, NULL, '2022-08-06 14:47:44', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(516, 'zenaidaescalona', NULL, 'PAR', 'VEN', 227395, 181.8, 30, 7579.82, 6.06, NULL, NULL, '2022-08-06 16:02:42', NULL, NULL, NULL, NULL, '2022-08-06 16:02:42', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(517, 'zenaidaescalona', NULL, 'PAR', 'VEN', 227395, 182.7, 30, 7579.82, 6.09, NULL, NULL, '2022-08-06 17:26:30', NULL, NULL, NULL, NULL, '2022-08-06 17:26:30', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(518, 'gperez', NULL, 'PAR', 'VEN', 150706, 120.4, 20, 7535.28, 6.02, NULL, NULL, '2022-08-08 13:55:41', NULL, NULL, NULL, NULL, '2022-08-08 13:55:41', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(519, 'cvillarroque', NULL, 'PAR', 'VEN', 750000, 607.68, 99.62, 7528.59, 6.1, NULL, NULL, '2022-08-11 12:25:27', NULL, NULL, NULL, NULL, '2022-08-11 12:25:27', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(520, 'franklinurbina', NULL, 'PAR', 'VEN', 100000, 81.09, 13.21, 7572.29, 6.14, NULL, NULL, '2022-08-13 02:57:45', NULL, NULL, NULL, NULL, '2022-08-13 02:57:45', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(521, 'Michelle', NULL, 'PAR', 'VEN', 378000, 348.67, 49.95, 7567.23, 6.98, NULL, NULL, '2022-08-22 20:21:07', NULL, NULL, NULL, NULL, '2022-08-22 20:21:07', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(522, 'matiasff', NULL, 'PAR', 'VEN', 150000, 153.51, 19.86, 7553.03, 7.73, NULL, NULL, '2022-08-24 03:04:56', NULL, NULL, NULL, NULL, '2022-08-24 03:04:56', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(523, 'Acruzp', NULL, 'PAR', 'VEN', 377884, 425, 50, 7557.67, 8.5, NULL, NULL, '2022-08-26 15:29:23', NULL, NULL, NULL, NULL, '2022-08-26 15:29:23', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(524, 'jesussoto', NULL, 'PAR', 'VEN', 120000, 128.39, 15.85, 7570.72, 8.1, NULL, NULL, '2022-08-31 17:09:25', NULL, NULL, NULL, NULL, '2022-08-31 17:09:25', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(525, 'Acruzp', NULL, 'PAR', 'VEN', 1000000, 1077.84, 132.09, 7570.72, 8.16, NULL, NULL, '2022-08-31 23:46:39', NULL, NULL, NULL, NULL, '2022-08-31 23:46:39', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(526, 'moisesbarrios', NULL, 'PAR', 'VEN', 761000, 826.92, 100.11, 7601.52, 8.26, NULL, NULL, '2022-09-06 20:58:43', NULL, NULL, NULL, NULL, '2022-09-06 20:58:43', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(527, 'joseidy', NULL, 'PAR', 'VEN', 153000, 165.62, 20.15, 7593.6, 8.22, NULL, NULL, '2022-09-07 14:04:42', NULL, NULL, NULL, NULL, '2022-09-07 14:04:42', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(528, 'gperez', NULL, 'PAR', 'VEN', 381350, 404.5, 50, 7627, 8.09, NULL, NULL, '2022-09-09 21:28:35', NULL, NULL, NULL, NULL, '2022-09-09 21:28:35', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL),
(529, 'Acruzp', NULL, 'PAR', 'VEN', 152328, 164.4, 20, 7616.41, 8.22, NULL, NULL, '2022-09-13 15:33:17', NULL, NULL, NULL, NULL, '2022-09-13 15:33:17', NULL, NULL, 'New', '', '', 1, 11, NULL, NULL, NULL, NULL),
(530, 'Acruzp', NULL, 'PAR', 'VEN', 152328, 165.2, 20, 7616.41, 8.26, NULL, NULL, '2022-09-13 15:53:40', NULL, NULL, NULL, NULL, '2022-09-13 15:53:40', NULL, NULL, 'New', '', '', 1, 15, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transacciones_btc`
--

CREATE TABLE `transacciones_btc` (
  `id` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL COMMENT 'relacion: id de tabla transaccion',
  `tasa_btc_origen` double NOT NULL COMMENT 'tasa del btc respecto a moneda origen, usada realmente para comprar',
  `tasa_btc_destino` double NOT NULL COMMENT 'tasa del btc respecto a moneda destino, usada realmente para vender. POSIBLEMENTE ESTE SOBRANDO ESTE CAMPO',
  `origen_codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAR' COMMENT 'codigo pais origen',
  `destino_codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VEN' COMMENT 'codigo pais destino',
  `origen_monto` double NOT NULL COMMENT 'monto en moneda origen',
  `destino_monto` double NOT NULL COMMENT 'monto en moneda destino',
  `btc_monto_buy` double DEFAULT 0 COMMENT 'monto de btc comprado, equivalente al monto en moneda origen',
  `btc_monto_sell` double DEFAULT 0 COMMENT 'monto de btc vendido, equivalente al monto en moneda destino',
  `btc_dif` double DEFAULT 0 COMMENT 'diferencia entre btc compra y venta.si es positivo fue ganancia, si es negativo seria perdida. es redudante. se puede CALCULAR',
  `monto_destino_dolares` double DEFAULT NULL COMMENT 'monto destino en dolares',
  `monto_origen_dolares` double DEFAULT NULL COMMENT 'monto origen en dolares',
  `dif_dolar` double DEFAULT NULL COMMENT 'monto diferencia en dolares. indica la ganancia por compra/venta. POSIBLEMENTE ESTA REDUDANTE',
  `fechahora_buy` timestamp NULL DEFAULT NULL COMMENT 'fecha y hora de compra de btc, segun servidor',
  `fechahora_sell` double DEFAULT NULL COMMENT 'fecha y hora de venta de btc, segun servidor',
  `tasa_dolar_origen` double DEFAULT NULL COMMENT 'tasa dolar respecto a moneda origen, usando el btc, al momento de la compra de btc',
  `tasa_dolar_destino` double DEFAULT NULL COMMENT 'tasa dolar respecto a moneda destino, , al momento de realizar la venta de btc',
  `observ_buy` tinytext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones sobre compra de btc',
  `observ_venta` tinytext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'observaciones sobre venta de btc',
  `check_admin` int(11) DEFAULT NULL COMMENT 'verificacion por parte de un usuario admin. verifica que los datos, montos, tasas, etc, registrados son correctos. Y que se puede proceder a realizar la operacion',
  `user_admin` int(20) DEFAULT NULL COMMENT 'login del usuario admin que hizo la verificacion',
  `date_created` timestamp NULL DEFAULT current_timestamp() COMMENT 'fecha y hora en que se hizo el registro en el sistema, segun hora del servidor',
  `date_updated` timestamp NULL DEFAULT NULL COMMENT 'ultima fecha en que se actualizo el registro',
  `activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: activo, 0: inactiva. indica si la transaccion esta activa o no',
  `tasa_btc_dolar` float NOT NULL COMMENT 'tasa btc en dolar al momento de la transaccion'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='transacciones, en terminos de btc. compras y ventas. data recopilada por trabajo de operadores';

--
-- Dumping data for table `transacciones_btc`
--

INSERT INTO `transacciones_btc` (`id`, `id_transaccion`, `tasa_btc_origen`, `tasa_btc_destino`, `origen_codpais`, `destino_codpais`, `origen_monto`, `destino_monto`, `btc_monto_buy`, `btc_monto_sell`, `btc_dif`, `monto_destino_dolares`, `monto_origen_dolares`, `dif_dolar`, `fechahora_buy`, `fechahora_sell`, `tasa_dolar_origen`, `tasa_dolar_destino`, `observ_buy`, `observ_venta`, `check_admin`, `user_admin`, `date_created`, `date_updated`, `activo`, `tasa_btc_dolar`) VALUES
(4, 0, 0, 0, 'PAR', 'VEN', 6000, 13000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6000, 13000, NULL, NULL, NULL, NULL, '2019-08-05 21:04:40', NULL, 1, 0),
(2, 0, 0, 0, 'PAR', 'VEN', 12000, 26000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6000, 13000, '', NULL, NULL, NULL, '2019-08-05 20:31:29', NULL, 1, 0),
(3, 0, 0, 0, 'PAR', 'VEN', 12000, 26000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6000, 13000, NULL, NULL, NULL, NULL, '2019-08-05 21:04:06', NULL, 1, 0),
(5, 0, 0, 0, 'PAR', 'VEN', 6000, 13000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6000, 13000, NULL, NULL, NULL, NULL, '2019-08-05 21:50:42', NULL, 1, 0),
(6, 0, 0, 0, 'PAR', 'VEN', 6000, 13000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6000, 13000, NULL, NULL, NULL, NULL, '2019-08-05 21:52:21', NULL, 1, 0),
(14, 0, 0, 0, 'PAR', 'VEN', 18000, 38983.17, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6007, 13009.55, NULL, NULL, NULL, NULL, '2019-08-12 14:17:08', NULL, 1, 0),
(13, 0, 0, 0, 'PAR', 'VEN', 18000, 38983.17, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6007, 13009.55, NULL, NULL, NULL, NULL, '2019-08-06 15:07:37', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `es_admin` tinyint(1) DEFAULT 0 COMMENT 'indica que el usuario es administrador',
  `login` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'nombre de usuario, por defecto sera igual al email. o un codigo de usuario cualquiera. puede formarse con sus datos',
  `nombre` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `nro_documento` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'doc identidad',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `telefono` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'telefono de usuario',
  `password` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'password codificado con MD5 o algun otro metodo',
  `cod_pais` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_ciudad` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'codigo de ciudad, localidad, provincia del usuario',
  `url_foto` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL que indica archivo de foto o avatar',
  `date_primeratransaccion` date DEFAULT NULL COMMENT 'fecha de primera transaccion',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fecha registro de cuenta',
  `date_updated` int(11) DEFAULT NULL COMMENT 'fecha ultima actualizacion de datos',
  `observ` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'notas, comentarios, ingresados por el admin ...',
  `activo` tinyint(1) DEFAULT 1 COMMENT '1:activo, 0:inactivo',
  `url_img_documento` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url de imagen que comprueba la documento, bien sea foto o imagen escaneada'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='usuarios de la aplicacion, clientes y operadores, etc.';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `es_admin`, `login`, `nombre`, `nro_documento`, `email`, `telefono`, `password`, `cod_pais`, `cod_ciudad`, `url_foto`, `date_primeratransaccion`, `date_created`, `date_updated`, `observ`, `activo`, `url_img_documento`) VALUES
(3, 0, 'dosma', 'Dina Osma', '', 'dosma@gmail.com', '+595 992 123456', '0', 'PAR', 'FM', '', NULL, '2019-07-12 18:28:10', 0, 'ssss\nFalta número de teléfono y cumpleaños.', 1, ''),
(4, 0, 'gabriel', 'Gabriel Perez Operador', '', 'gabriel@naguarabit.com', '+595992860184', '0', 'PAR', 'ASU', '', NULL, '2019-07-12 18:28:10', 0, 'Operador de la plataforma en Paraguay', 1, ''),
(46, 0, 'gperez', 'Gabriel Pérez', '', 'gab.perez.py@gmail.com', '+595992860184', '123', 'PAR', 'ASU', '', NULL, '2019-07-12 18:28:10', 0, 'Linea 1. Linea 2. Linea 3 acenos áéíóú pruebas. linea 3', 1, ''),
(85, 0, 'germontilla', 'Gerardo Montilla', '', 'Gerardomontilla777@gmail.com', '+5689898989', NULL, 'CHI', 'SANT', NULL, NULL, '2019-07-19 18:19:23', NULL, 'Falta número de teléfono y cumpleaños.', 1, ''),
(86, 0, 'cguti', 'Carlos Gutierrez', '', 'user7@mail.com', '+595-992-123456', NULL, 'PAR', 'SLRNZ', NULL, NULL, '2019-07-22 17:29:27', NULL, 'Falta número de teléfono, cumpleaños y correo.', 1, ''),
(74, 0, 'jdanielperez', 'Jose Daniel Perez', '', 'jdanielperez77@gmail.com', '+58 416 4542962', NULL, 'VEN', 'VAL', NULL, NULL, '2019-07-19 15:35:55', NULL, 'Falta cumpleaños.', 1, ''),
(87, 0, 'williamvillasmil', 'William Villasmil', '', 'Villasmilwilliam7@gmail.com', '+595 981 103161', NULL, 'PAR', 'FM', NULL, NULL, '2019-07-22 17:30:12', NULL, 'Usuario registrado por Gabriel, él mismo no se ha registrado en el sitio.\nFecha cumpleaños 5/Dic.', 1, ''),
(88, 0, 'moraimafonseca', 'Moraima Fonseca', '', 'moraimafonseca10@gmail.com', '+58 426 4391368', NULL, 'VEN', 'SF', NULL, NULL, '2019-07-22 17:31:43', NULL, 'Falta cumpleaños.', 1, ''),
(89, 0, 'alvaleromendoza', 'Alvaro Valero', '', 'alvaleromendoza@mail.com', '+58 426 123456', NULL, 'VEN', 'BQTO', NULL, NULL, '2019-07-22 18:30:31', NULL, 'probé acentos. que rollo con los acentos!!! Falta número de teléfono y cumpleaños.', 1, ''),
(90, 0, 'joseidy', 'Joseidy Aguilar', '', 'ja.aguilar.e@gmail.com', '+58 426 9570377', NULL, 'PAR', 'ASU', NULL, NULL, '2019-07-22 18:49:38', NULL, 'Cliente #5. Cumpleaños: 17 de Marzo.', 1, ''),
(91, 0, 'gladimaradjunta', 'Gladimar Adjunta', '', 'use123@mail.com', '+57898989898', NULL, 'COL', 'BOG', NULL, NULL, '2019-07-22 18:50:00', NULL, 'Falta número de teléfono y correo.', 1, ''),
(93, 0, 'msuarez', 'Mariangel Suarez', '', 'msuarez@mail.com', '+51 994 229 544', NULL, 'PER', 'LIM', NULL, NULL, '2019-07-24 13:25:35', NULL, 'Falta correo\nCumpleaños: 24.Marzo', 1, ''),
(111, 0, 'yasmary', 'Yasmary Carolina Rodriguez', NULL, 'yazmarycarolina@gmail.com', '+595 974-282803', NULL, 'PAR', 'SLRNZ', NULL, NULL, '2021-09-23 14:15:46', NULL, 'Cumpleaños: 12/Junio Negocio: https://www.instagram.com/celulares_caleb/  Servicio Tecnico celulares, se llama SOLUCIONES INFORMATICAS CALEB. Direccion: Av. 10 de Agosto, casi esquina con Av. General Caballero Cerca de, Envapar, San Lorenzo, Paraguay  https://soluciones-informaticas-caleb.negocio.site/?utm_source=gmb&utm_medium=referral', 1, NULL),
(99, 0, 'frodriguez', 'Francisco Rodriguez', '', 'abcuser@mail.com', '+', NULL, 'COL', 'SANT', NULL, NULL, '2019-07-24 17:08:19', NULL, 'Falta correo, cumpleaños, número de teléfono y ciudad.', 1, ''),
(98, 0, 'jrivera', 'Jairo Rivera', '', 'jrivera@gmail.com', '+57', NULL, 'COL', 'CAL', NULL, NULL, '2019-07-24 15:03:41', NULL, 'Falta número de teléfono. Cumpleaños: 19/Diciembre.\nNo es cliente.', 1, ''),
(101, 0, 'jmercado', 'Juan Mercado', '', 'jmercado@gmail.com', '+', NULL, 'PAR', '', NULL, NULL, '2019-07-30 19:59:35', NULL, 'Falta número de teléfono, ciudad y cumpleaños.', 1, ''),
(102, 0, 'venebit', 'Naguarabit operador en Vzla', NULL, 'Venebit@gmail.com', '+', NULL, 'VEN', 'SF', NULL, NULL, '2019-08-14 13:04:01', NULL, '', 1, NULL),
(103, 0, 'admin', 'Admin Naguarabit Operadores', NULL, 'naguarabit@gmail.com', '+595992860184', NULL, 'PAR', 'ASU', NULL, NULL, '2021-05-22 16:09:08', NULL, 'en el tlf colocar el nro exclusivo de nbit', 1, NULL),
(104, 0, 'cvillarroque', 'Carlos Villarroel', NULL, 'cvillarroque@gmail.com', '+595 991 806250', NULL, 'PAR', 'FM', NULL, NULL, '2021-07-28 01:17:53', NULL, 'Profesional del area de Administración Ocupacion actual: Taxista. Fecha cumple: 08/Nov Asesora con procesos.', 1, NULL),
(105, 0, 'ccolmenarez', 'Carlos Colmenarez', NULL, 'carlos.colmenarez.edu@mail.com', '+', NULL, 'VEN', 'CABUD', NULL, NULL, '2021-07-28 01:21:30', NULL, 'Falta número de teléfono y cumpleaños.', 1, NULL),
(106, 0, 'Acruzp', 'Alejandro Cruz', NULL, 'acruzpmi@gmail.com', '+595 992 293778', NULL, 'PAR', 'ASU', NULL, NULL, '2021-07-31 18:49:01', NULL, 'Cumpleaños: 8 de Enero. Dirección exacta: Indio Francisco, edificio donde esta la Bodega 100x100to', 1, NULL),
(107, 0, 'franrodriguez', 'Francisco Rodriguez', NULL, 'conseguir@mail.com', '+595 994 675414', NULL, 'PAR', 'LUQUE', NULL, NULL, '2021-08-20 03:38:35', NULL, 'Trabaja en rakiura\nFalta correo y cumpleaños.', 1, NULL),
(108, 0, 'mirlaychirinos', 'Mirlay Chirinos', NULL, 'mirlay0717@gmail.com', '+584149553707', NULL, 'VEN', 'BQTO', NULL, NULL, '2021-08-22 19:47:01', NULL, 'Operadora en Venezuela', 1, NULL),
(109, 0, 'invitado', 'Usuario sin login', NULL, 'invitado@mail.com', '999', NULL, '', '', NULL, NULL, '2021-08-23 12:05:33', NULL, 'ddd', 1, NULL),
(110, 0, 'yamilethchirinos', 'Yamileth Chirinos', NULL, 'yamilethchirinos@mail.com', '+595991231542', NULL, 'PAR', 'ASU', NULL, NULL, '2021-09-20 14:26:10', NULL, 'Vive en Edificio sobre calle Indio Francisco, con calle A Sanchez. Fecha cumpleaños: 8/Dic', 1, NULL),
(112, 0, 'nailynsilva', 'Nailyn Silva', NULL, 'silvanailyn293@gmail.com', '+595 975 441067', NULL, 'PAR', 'ASU', NULL, NULL, '2021-10-17 15:13:05', NULL, 'Fecha cumplea#os: 18/Diciembre. Vive cerca del SuperSeis, a 3 cuadras de Yaguarete Cartones.  El telefono anterior cuando hizo la primera remesa era +595993186014.   Direccion: Calle Ana Diaz, nro 1138 (queda por detras de Colegio La Amistad. Map: https://www.google.com/maps?q=-25.303236824714038,-57.619181871414185&z=17&hl=en', 1, NULL),
(113, 0, 'jesussoto', 'Jesus Soto', NULL, 'pedirmai202101018@mail.com', '+595 982 425061', NULL, 'PAR', 'LMB', NULL, NULL, '2021-10-18 12:36:45', NULL, 'Cumpleaños: 14/Mayo. Falta correo.', 1, NULL),
(114, 0, 'nazareth', 'Nazareth Aznoil Rivas', NULL, 'Aznoilrivasortiz9@gmail.com', '+595 994 818412', NULL, 'PAR', 'ASU', NULL, NULL, '2021-10-18 14:44:23', NULL, 'Direccion: ? Redes sociales. Agregado a fb de nbit. Added linkedin.\nCumpleaños: 19/Abril.', 1, NULL),
(115, 0, 'zuni', 'Zunilde Soler', NULL, 'zunisoler@gmail.com', '+59555555555', NULL, 'PAR', 'ASU', NULL, NULL, '2021-10-25 21:25:05', NULL, 'prueba con Fran\nFalta número de teléfono y cumpleaños.', 1, NULL),
(116, 0, 'zenaidaescalona', 'Zenaida Escalona', NULL, 'zenaidaescalonatramites@gmail', '+595 993 538742', NULL, 'PAR', 'ASU', NULL, NULL, '2021-11-02 16:46:06', NULL, 'su nro de whatsapp aun es el de Vzla\nCumpleaños: 10 de Julio.', 1, NULL),
(117, 0, 'juanperez', 'Juan Perez', NULL, 'juanperez@mail.com', '+595 991 123456', NULL, 'PAR', 'SLRNZ', NULL, NULL, '2021-11-30 22:02:25', NULL, 'Falta número de teléfono, correo y cumpleaños.', 1, NULL),
(118, 0, 'anderson', 'Anderson', NULL, 'anderson@matrix.com', '+1328432784324', NULL, 'USA', '', NULL, NULL, '2021-12-01 17:19:50', NULL, '', 1, NULL),
(119, 0, 'joseavilioquintero', 'Jose Avilio Quintero', NULL, 'javilioqz@gmail.com', '+595 991 231542', NULL, 'PAR', 'ASU', NULL, NULL, '2021-12-01 22:35:59', NULL, 'Fecha cumplea#os: 28/Dic. Lugar de Trabajo: colegio Cristo Rey Profesion: Docente math? Tiene 1 hija llamada Isabela. Llegó a Paraguay en 2.017', 1, NULL),
(120, 0, 'oswaldozambrano', 'Osvaldo Zambrano', NULL, 'zambraoswal17@mail.com', '+595981319531', NULL, 'PAR', 'ASU', NULL, NULL, '2021-12-06 15:04:21', NULL, 'Falta ciudad  y cumpleaños.', 1, NULL),
(121, 0, 'seidee', 'Seidee Carolina Chirinos', NULL, 'seidee@mail.com', '+1328432784324', NULL, 'VEN', 'BQTO', NULL, NULL, '2021-12-10 14:52:36', NULL, NULL, 1, NULL),
(122, 0, 'luisdominicano', 'Luis Cuevas Castro (Rep. Dom.)', NULL, 'luismanuelcc88@gmail.com', '+34 666 61992', NULL, 'PAR', 'MRA', NULL, NULL, '2021-12-20 12:21:15', NULL, 'Su nro es de España, pues vivia allá. Nacionalidad: Rep. Dominicana. Cumpleaños: 06/Ago', 1, NULL),
(123, 0, 'jenireevilla', 'Jeniree Villa', NULL, 'jenireevilla7@gmail.com', '+595 991 535291', NULL, 'PAR', 'ASU', NULL, NULL, '2021-12-21 18:21:17', NULL, 'Cumpleaños: 10/Noviembre.\nhttps://www.facebook.com/jeniree.villa.1/about_contact_and_basic_info', 1, NULL),
(124, 0, 'Yolanda', 'Yolanda', NULL, 'user11012021@mail.com', '+', NULL, 'PAR', '', NULL, NULL, '2022-01-11 11:39:36', NULL, 'Falta número de teléfono, ciudad, correo y cumpleaños.', 1, NULL),
(125, 0, 'hilder', 'Hilder Portal', NULL, 'h.portal.business@gmail.com', '+595-984-835868', NULL, 'PAR', 'CAPIA', NULL, NULL, '2022-01-11 13:47:50', NULL, 'Operador en entrenamiento. Cumpleaños: 19 de Diciembre', 1, NULL),
(127, 0, 'danielhernandez', 'Daniel Hernández', NULL, 'pedir12021022@mail.com', '+595 992 721510', NULL, 'PAR', 'MRA', NULL, NULL, '2022-01-12 18:00:26', NULL, 'Falta correo y cumpleaños.', 1, NULL),
(128, 0, 'Michelle', 'Michelle Erazo, novia-JesúsSot', NULL, 'user.pedir@mail.com', '+595 982 425227', NULL, 'PAR', 'LMB', NULL, NULL, '2022-01-21 21:55:02', NULL, 'Falta correo y cumpleaños.\ncambiar nombre a: Michelle Erazo novia JesúsSoto', 1, NULL),
(129, 0, 'oscar', 'Oscar amigo de Alejandro', NULL, 'user.oscar.pedir@mail.com', '+', NULL, 'PAR', 'ASU', NULL, NULL, '2022-02-11 19:51:40', NULL, NULL, 1, NULL),
(130, 0, 'kenyafonseca', 'Kenya Fonseca', NULL, 'kenya@mail.com', '+', NULL, 'PAR', 'Villa', NULL, NULL, '2022-02-19 14:03:23', NULL, NULL, 1, NULL),
(131, 0, 'aurimar', 'Aurimar Chávez', NULL, 'auri.pedir.mail@mail.com', '+', NULL, 'VEN', 'BQTO', NULL, NULL, '2022-03-02 15:29:42', NULL, NULL, 1, NULL),
(132, 0, 'ppregunton', 'Pepito Preguntón', NULL, 'sinregistro@mail.com', '+595 0000000', NULL, 'PAR', 'ASU', NULL, NULL, '2022-03-18 13:49:34', NULL, 'Barrio Pinozá, 1 de Noviembre casi 11 de Diciembre. Falta: Fecha de nacimiento', 1, NULL),
(133, 0, 'matiasff', 'Matias Fleitas Fernandez', NULL, 'user23@mail.com', '+595 971 333125', NULL, 'PAR', 'LMB', NULL, NULL, '2022-03-18 19:59:15', NULL, 'Cómo llegó a ser cliente?\nQuién Lo recomendó?', 1, NULL),
(134, 0, 'franklinurbina', 'Franklin Urbina', NULL, 'franjav3@gmail.com', '+595 992 855660', NULL, 'PAR', 'CAPIA', NULL, NULL, '2022-03-24 16:54:25', NULL, '', 1, NULL),
(135, 0, 'alejandravillanueva', 'Alejandra Villanueva', NULL, 'pedirrrr@mail.com', '+56935878817', NULL, 'PAR', 'SLRNZ', NULL, NULL, '2022-04-18 14:27:07', NULL, 'Agregada 18.04.2022', 1, NULL),
(136, 0, 'majo', 'Mariolys Graterol Majolandia', NULL, 'majolandia@gmail.com', '+', NULL, 'VEN', 'BQTO', NULL, NULL, '2022-05-02 22:39:40', NULL, NULL, 1, NULL),
(137, 0, 'migs', 'Migs Prueba', NULL, 'migs@example.org', '+', NULL, 'PAR', 'ASU', NULL, NULL, '2022-05-13 14:08:50', NULL, NULL, 1, NULL),
(138, 0, 'leonardzambrano', 'Leonard Zambrano', NULL, 'Later@mail.com', '+595 982 810267', NULL, 'PAR', '', NULL, NULL, '2022-06-08 21:11:31', NULL, 'primera remesa 8.junio.2022\ntarea: conseguir su email\nupdate su ciudad\nDONE. registrar en google contacts', 1, NULL),
(139, 0, 'moisesbarrios', 'Moisés Barrios', NULL, 'test@gmail.com', '+595 991 166248', NULL, 'PAR', 'ASU', NULL, NULL, '2022-06-13 18:18:54', NULL, '', 1, NULL),
(140, 0, 'jcastro', 'Jose Castro', NULL, 'jcastros58@gmail.com', '+58 424-8025022', NULL, 'VEN', 'BARC', NULL, NULL, '2022-06-18 13:51:57', NULL, '', 1, NULL),
(141, 0, 'yohanaot', 'Yohana Angélica Oyalba Terán', NULL, 'usereeee@mail.com', '+595 992 957246', NULL, 'PAR', 'LMB', NULL, NULL, '2022-06-20 20:33:26', NULL, NULL, 1, NULL),
(142, 0, 'robertmartinez', 'ROBERT JOSE MARTINEZ', NULL, 'user@mail.com', '+58 414-7852181', NULL, 'PAR', 'ASU', NULL, NULL, '2022-07-27 20:23:18', NULL, 'DATOS DEL ELECTOR\nCédula:	V-12016200\nNombre:	ROBER JOSE MARTINEZ\nEstado:	EDO. ANZOATEGUI\nMunicipio:	MP. ANACO\nParroquia:	PQ. ANACO\nCentro:	ESCUELA BÁSICA PEDRO ROLIGSON HERRERA\nDirección:	SECTOR LOS ALGARROBOS DERECHA CALLE TRUJILLO. FRENTE CALLE JUNIN. IZQUIERDA CALLEJÓN LAS FLORES FRENTE AL AUTOLAVADO LAS FLORES EDIFICIO', 1, NULL),
(143, 0, 'ezequiel', 'Ezequiel Zamora Benitez', NULL, 'pabloezebenitez@mail.com', '+', NULL, 'PAR', 'LUQUE', NULL, NULL, '2022-08-13 02:11:47', NULL, NULL, 1, NULL),
(144, 0, 'davidsuarez', 'DAVID SUAREZ', NULL, 'davis19@mail.com', '+', NULL, 'VEN', 'BQTO', NULL, NULL, '2022-09-01 17:06:16', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_avatar`
--

CREATE TABLE `user_avatar` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `url_image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='avatar de usuarios, o fotos de perfil';

-- --------------------------------------------------------

--
-- Table structure for table `user_bank`
--

CREATE TABLE `user_bank` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `codbank` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombank` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nro_cuenta` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombretitular` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `doctitular` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cuentas bancarias destino de usuarios';

--
-- Dumping data for table `user_bank`
--

INSERT INTO `user_bank` (`id`, `id_user`, `codbank`, `nombank`, `nro_cuenta`, `nombretitular`, `doctitular`) VALUES
(1, 0, 'PROV', 'BANCO PROVINCIAL', '0108241200000000001', 'GABRIEL PEREZ', '16594651');

-- --------------------------------------------------------

--
-- Table structure for table `user_bloqueados`
--

CREATE TABLE `user_bloqueados` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `motivo_bloqueo` text COLLATE utf8_unicode_ci NOT NULL,
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_admin` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'login de usuario admin que bloqueo al usario cliente',
  `activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'indica si el bloqueo sigue activo, o ya el usuario esta desbloqueado'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lista de usuarios bloqueados';

-- --------------------------------------------------------

--
-- Table structure for table `user_comentarios`
--

CREATE TABLE `user_comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fecha y hora del comentario',
  `tipo` int(11) NOT NULL COMMENT '1:positivo, 2:negativo, 3:neutral',
  `comentario` text COLLATE utf8_unicode_ci NOT NULL,
  `observaciones` int(11) NOT NULL COMMENT 'observaciones de la app, escritos por algun administrador'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='comentarios de los usuarios, dados por operadores y usuarios admin';

-- --------------------------------------------------------

--
-- Table structure for table `user_reputacion`
--

CREATE TABLE `user_reputacion` (
  `id` int(11) NOT NULL,
  `id_user` int(30) NOT NULL,
  `coment_posit` int(11) DEFAULT NULL,
  `coment_neg` int(11) DEFAULT NULL,
  `veces_bloqueado` int(11) DEFAULT NULL,
  `comentarios_neutrales` int(11) DEFAULT NULL,
  `reputacion_total` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_seguridad`
--

CREATE TABLE `user_seguridad` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nro_documento` text COLLATE utf8_unicode_ci NOT NULL,
  `doc_verificado` tinyint(1) NOT NULL,
  `login_user_admin` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `fechahora_check` int(11) NOT NULL,
  `url_img_documento` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url de imagen que comprueba la documento, bien sea foto o imagen escaneada	'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='datos de seguridad de usuarios, para verificar sus documentos';

-- --------------------------------------------------------

--
-- Table structure for table `x.formapago`
--

CREATE TABLE `x.formapago` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) NOT NULL COMMENT 'DEP, GIRO, WU, EFECT',
  `nombre` varchar(30) NOT NULL COMMENT 'deposito bancario, giro, wester union, efectivo, etc.',
  `numero` varchar(30) NOT NULL COMMENT 'nro de cuenta, nro de giro,etc.',
  `detalles` varchar(11) NOT NULL COMMENT 'detalle largo',
  `observ` text NOT NULL COMMENT 'observaciones sobre la forma de pago',
  `cod_pais` varchar(5) NOT NULL COMMENT 'codigo de pais'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Definicion de tipos de pago de origen. Depósito, Giro, WU...';

-- --------------------------------------------------------

--
-- Table structure for table `x.formapago_pais`
--

CREATE TABLE `x.formapago_pais` (
  `id` int(11) NOT NULL,
  `cod_pais` varchar(5) NOT NULL COMMENT 'codigo de pais',
  `cod_formapago` varchar(5) NOT NULL COMMENT 'codigo forma de pago',
  `activo` tinyint(1) NOT NULL COMMENT '0: inactivo, 1:activo'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='x.Tipos de pago de origen por pais';

-- --------------------------------------------------------

--
-- Table structure for table `x.tareas de tablas`
--

CREATE TABLE `x.tareas de tablas` (
  `id` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `detalles` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `x.tareas de tablas`
--

INSERT INTO `x.tareas de tablas` (`id`, `descripcion`, `detalles`) VALUES
(1, 'tabla: users.\r\ncampo: email\r\ndebe ser unico', ''),
(2, 'paridad de monedas.\r\ntabla: monedas_pares', 'hay que gestionar el hecho de que una paridad de monedas puede cambiar mientras un usuario realiza una operacion.\r\nCuando el usuario inicia la transaccion, esta se realiza con la paridad del momento.\r\nAun si esta cambia en el proceso?\r\nDebe haber un timeout bajo de la app, digamos de 10 minutos.'),
(3, 'table: user\r\ncampos posibles de user', 'campos posibles de user.\r\nfecha nac\r\nprofesion/ocupacion\r\nidioma preferido\r\nuso horario preferido'),
(4, 'tabla user', 'add field ultima fecha de conexion'),
(5, 'tabla x.formapago_pais.\r\n', 'tabla no usada.\r\nborrar luego de comprobar que no se usa en el codigo'),
(6, 'tabla x.formapago\r\n', 'borrar tabla luego de comprobar que no se usa en el codigo');

-- --------------------------------------------------------

--
-- Table structure for table `x_backup_20200815_banks_pais`
--

CREATE TABLE `x_backup_20200815_banks_pais` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `nombre_largo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `codpais` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'codigo del pais',
  `activo` tinyint(1) NOT NULL COMMENT 'Estatus. 1:activo, 0:inactivo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `x_backup_20200815_banks_pais`
--

INSERT INTO `x_backup_20200815_banks_pais` (`id`, `codigo`, `nombre`, `nombre_largo`, `codpais`, `activo`) VALUES
(1, 'BDV', 'Banco de Venezuela', NULL, 'VEN', 1),
(2, 'BPROV', 'Provincial', 'Banco Provincial', 'VEN', 1),
(3, 'BANSC', 'Banesco', NULL, 'VEN', 1),
(4, 'BMERC', 'Mercantil', 'Banco Mercantil', 'VEN', 1),
(5, 'BCARI', 'Bancaribe', NULL, 'VEN', 1),
(6, 'BTES', 'Banco del Tesoro', NULL, 'VEN', 1),
(7, 'BICNT', 'Bicentenario', 'Banco Bicentenario', 'VEN', 1),
(8, 'BCAR', 'Banco Caroní', NULL, 'VEN', 0),
(9, 'BCP', 'Banco Central de Peru', NULL, 'PER', 1),
(10, 'BITAU', 'Banco Itaú', 'Banco Itaú Paraguay', 'PAR', 1),
(11, 'GP', 'Giros Personal', 'Giros Personal Paraguay', 'PAR', 1),
(12, 'GT', 'Giros Tigo', 'Giros Tigo Paraguay', 'PAR', 1),
(13, 'GC', 'Giros Claro', 'Giros Claro Paraguay', 'PAR', 1),
(14, 'CE', 'Efectivo', NULL, 'PAR', 1),
(15, 'BFAM', 'Banco Familiar', 'Banco Familiar -Paraguay', 'PAR', 1),
(16, 'BEXT', 'Banco Exterior', 'Banco Exterior -Venezuela', 'VEN', 1),
(18, 'BVIS', 'Banco Visión', 'Banco Visión -Paraguay', 'PAR', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks_pais`
--
ALTER TABLE `banks_pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_banks_codpais` (`codpais`);

--
-- Indexes for table `bitacora_login`
--
ALTER TABLE `bitacora_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bitacora_tablas`
--
ALTER TABLE `bitacora_tablas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btc_paridad`
--
ALTER TABLE `btc_paridad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod` (`cod_moneda`);

--
-- Indexes for table `casos_atenciones`
--
ALTER TABLE `casos_atenciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casos_reclamos`
--
ALTER TABLE `casos_reclamos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD UNIQUE KEY `unicopar_ciudad_y_pais` (`nombre`,`cod_pais`);

--
-- Indexes for table `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estatus`
--
ALTER TABLE `estatus`
  ADD UNIQUE KEY `pk_estatus` (`id`);

--
-- Indexes for table `formapago_origen`
--
ALTER TABLE `formapago_origen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_banks_codpais` (`codpais`),
  ADD KEY `cod_banco` (`cod_banco`),
  ADD KEY `activo` (`activo`);

--
-- Indexes for table `huso_horario`
--
ALTER TABLE `huso_horario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod` (`codigo`);

--
-- Indexes for table `monedas_pares`
--
ALTER TABLE `monedas_pares`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod` (`cod_moneda`);

--
-- Indexes for table `monedas_paridad_tentativo`
--
ALTER TABLE `monedas_paridad_tentativo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod` (`cod_moneda`);

--
-- Indexes for table `pago_destino`
--
ALTER TABLE `pago_destino`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_transaccion` (`id_transaccion`);

--
-- Indexes for table `pago_origen`
--
ALTER TABLE `pago_origen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `prueba`
--
ALTER TABLE `prueba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t1`
--
ALTER TABLE `t1`
  ADD PRIMARY KEY (`ts`);

--
-- Indexes for table `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_formapago_origen` (`id_formapago_origen`);

--
-- Indexes for table `transacciones_btc`
--
ALTER TABLE `transacciones_btc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaccion` (`id_transaccion`) USING BTREE COMMENT 'relacion con id de tabla transacciones';

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `cod_ciudad` (`cod_ciudad`),
  ADD KEY `cod_pais` (`cod_pais`),
  ADD KEY `telefono` (`telefono`),
  ADD KEY `cod_pais_2` (`cod_pais`),
  ADD KEY `cod_ciudad_2` (`cod_ciudad`);

--
-- Indexes for table `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_comentarios`
--
ALTER TABLE `user_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x.formapago`
--
ALTER TABLE `x.formapago`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x.formapago_pais`
--
ALTER TABLE `x.formapago_pais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x.tareas de tablas`
--
ALTER TABLE `x.tareas de tablas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x_backup_20200815_banks_pais`
--
ALTER TABLE `x_backup_20200815_banks_pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_banks_codpais` (`codpais`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks_pais`
--
ALTER TABLE `banks_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bitacora_login`
--
ALTER TABLE `bitacora_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bitacora_tablas`
--
ALTER TABLE `bitacora_tablas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btc_paridad`
--
ALTER TABLE `btc_paridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `casos_atenciones`
--
ALTER TABLE `casos_atenciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casos_reclamos`
--
ALTER TABLE `casos_reclamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `formapago_origen`
--
ALTER TABLE `formapago_origen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `huso_horario`
--
ALTER TABLE `huso_horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `monedas_pares`
--
ALTER TABLE `monedas_pares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `monedas_paridad_tentativo`
--
ALTER TABLE `monedas_paridad_tentativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pago_destino`
--
ALTER TABLE `pago_destino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `pago_origen`
--
ALTER TABLE `pago_origen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `prueba`
--
ALTER TABLE `prueba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;

--
-- AUTO_INCREMENT for table `transacciones_btc`
--
ALTER TABLE `transacciones_btc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_comentarios`
--
ALTER TABLE `user_comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x.formapago`
--
ALTER TABLE `x.formapago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x.formapago_pais`
--
ALTER TABLE `x.formapago_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x.tareas de tablas`
--
ALTER TABLE `x.tareas de tablas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `x_backup_20200815_banks_pais`
--
ALTER TABLE `x_backup_20200815_banks_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
