-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2023 a las 01:58:41
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bank`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account`
--

CREATE TABLE `account` (
  `accountId` int(15) NOT NULL,
  `noAccount` bigint(50) DEFAULT NULL,
  `transactionType` varchar(255) DEFAULT NULL,
  `transactionDate` date DEFAULT NULL,
  `balance` int(50) DEFAULT NULL,
  `branchId` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `account`
--

INSERT INTO `account` (`accountId`, `noAccount`, `transactionType`, `transactionDate`, `balance`, `branchId`) VALUES
(1, 3421962129591190, 'Investment', '2023-11-02', 100000, 3),
(2, 3477118545294710, 'Investment', '2023-11-01', 256000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch`
--

CREATE TABLE `branch` (
  `branchId` int(15) NOT NULL,
  `RFC` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `managerName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `branch`
--

INSERT INTO `branch` (`branchId`, `RFC`, `name`, `location`, `phone`, `managerName`) VALUES
(1, 'YSN290107QD7', 'MAEK Bank - Sucursal Central', 'Avenida Bancaria 123, Ciudad Principal', 4496354895, 'Marco García'),
(2, 'OXA160303OK8', 'MAEK Bank - Sucursal Financiera Plaza', 'Plaza Financiera 456, Centro Urbano', 4493654857, 'Kevin Macias'),
(3, 'BEZ240904UH2', 'MAEK Bank - Sucursal Elite', 'Calle de la Excelencia 789, Distrito Ejecutivo', 4495874231, 'Edgar Diaz'),
(4, 'ZWT370205EJ2', 'MAEK Bank - Sucursal Vanguardia', 'Avenida Vanguardista 222, Barrio Moderno', 4498571245, 'Vanessa García');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `clientId` int(15) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `accountId` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`clientId`, `name`, `phone`, `accountId`) VALUES
(1, 'Dulce Madrigal', 4493633549, 1),
(2, 'Ricardo Acosta', 4497856312, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `userId` int(15) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` int(15) DEFAULT NULL,
  `clientId` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`userId`, `email`, `password`, `rol`, `clientId`) VALUES
(1, 'admin@gmail.com', 'admin123', 1, NULL),
(2, 'dulcemadrigal@gmail.com', 'dulce1234', 2, 1),
(3, 'ricardoacosta@gmail.com', 'acosta123', 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountId`),
  ADD KEY `branchId` (`branchId`);

--
-- Indices de la tabla `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientId`),
  ADD KEY `accountId` (`accountId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `clientId` (`clientId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account`
--
ALTER TABLE `account`
  MODIFY `accountId` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `branch`
--
ALTER TABLE `branch`
  MODIFY `branchId` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `clientId` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
