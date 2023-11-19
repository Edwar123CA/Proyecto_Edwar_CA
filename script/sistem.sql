-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2023 a las 18:56:14
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
-- Base de datos: `sistem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `state` enum('activo','eliminado') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `company_name`, `contact_name`, `contact_title`, `address`, `city`, `region`, `postal_code`, `country`, `phone`, `fax`, `state`) VALUES
(1, 'ABC Electronics', 'John Smith', 'CEO', '123 Tech Blvd', 'New York', 'NY', '10001', 'USA', '555-123-4567', '555-987-6543', 'activo'),
(2, 'XYZ Manufacturing', 'Emily Johnson', 'Sales Manager', '456 Factory Rd', 'Los Angeles', 'CA', '90002', 'USA', '555-222-3333', '555-444-5555', 'activo'),
(3, 'Global Tech Solutions', 'Carlos Garcia', 'CTO', '789 Innovation Ave', 'Chicago', 'IL', '60603', 'USA', '555-555-5555', '555-666-6666', 'activo'),
(4, 'Swift Logistics', 'Lisa Brown', 'Operations Manager', '101 Shipping Ln', 'Houston', 'TX', '77001', 'USA', '555-777-7777', '555-888-8888', 'activo'),
(5, 'Web Development Inc.', 'David Wilson', 'Development Director', '567 Code St', 'San Francisco', 'CA', '94101', 'USA', '555-999-9999', NULL, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_of_courtesy` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reports_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`employee_id`, `last_name`, `first_name`, `title`, `title_of_courtesy`, `birth_date`, `hire_date`, `address`, `city`, `region`, `postal_code`, `country`, `home_phone`, `extension`, `photo`, `notes`, `reports_to`) VALUES
(1, 'Smith', 'John', 'Manager', 'Mr.', '1980-05-15', '2005-08-10', '123 Main St', 'New York', 'NY', '10001', 'USA', '555-123-4567', '12345', 'john.jpg', 'Manages the team', NULL),
(2, 'Johnson', 'Emily', 'Sales Representative', 'Miss', '1990-03-20', '2010-11-22', '456 Elm St', 'Los Angeles', 'CA', '90002', 'USA', '555-987-6543', '54321', 'emily.jpg', 'Handles sales in the west coast', 1),
(3, 'Garcia', 'Carlos', 'Accountant', 'Mr.', '1985-08-30', '2008-06-14', '789 Oak St', 'Chicago', 'IL', '60603', 'USA', '555-222-3333', '98765', 'carlos.jpg', 'Manages financial records', 1),
(4, 'Brown', 'Lisa', 'HR Manager', 'Ms.', '1975-11-25', '2012-04-05', '101 Pine St', 'Houston', 'TX', '77001', 'USA', '555-444-5555', '13579', 'lisa.jpg', 'Oversees HR operations', 1),
(5, 'Wilson', 'David', 'Software Developer', 'Mr.', '1992-04-10', '2019-09-30', '567 Cedar St', 'San Francisco', 'CA', '94101', 'USA', '555-777-8888', '24680', 'david.jpg', 'Develops software applications', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `shipper_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `ship_via` varchar(50) DEFAULT NULL,
  `freight` decimal(10,2) DEFAULT NULL,
  `ship_name` varchar(255) DEFAULT NULL,
  `ship_address` varchar(255) DEFAULT NULL,
  `ship_city` varchar(255) DEFAULT NULL,
  `ship_region` varchar(255) DEFAULT NULL,
  `ship_postal_code` varchar(10) DEFAULT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `state` enum('activo','eliminado') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `customer_id`, `employee_id`, `shipper_id`, `order_date`, `required_date`, `shipped_date`, `ship_via`, `freight`, `ship_name`, `ship_address`, `ship_city`, `ship_region`, `ship_postal_code`, `ship_country`, `state`) VALUES
(1, NULL, 5, 2, 3, '2023-10-02', '2023-11-09', '2023-11-13', 'mar', 15.00, 'dedededed', 'fdbfkbnfjf  b', 'huanhvf', 'njggfbfs', '8888888888', 'dinamarca', 'activo'),
(2, NULL, 5, 3, 3, '2020-10-10', '2023-11-09', '2023-11-13', 'mar', 1.00, 'refrigerador', 'fdbfkbnfjf  b', 'chinoss', 'weeee', '33333', 'luis', 'activo'),
(4, NULL, 1, 1, 1, '2023-10-07', '2023-11-08', '2023-11-09', 'tierra', 1.00, 'papa', 'av. brasil', 'huancavelica', 'huanuco', '10001', 'chinobamba', 'activo'),
(5, NULL, 5, 2, 3, '2023-10-02', '2023-11-09', '2023-11-13', 'mar', 50.00, 'refrigerador', 'fdbfkbnfjf  b', 'huanhvf', 'njggfbfs', '20002', 'asasas', 'activo'),
(7, NULL, 2, 4, 2, '2023-11-01', '2023-11-11', '2023-11-25', 'tierra', 2528.00, 'hgdsxfhg', 'zgxfhdgh', 'shdhf', 'zgfxbhdg', '30003', 'zambo', 'activo'),
(8, NULL, 1, 1, 1, '2023-11-02', '2023-11-09', '2023-11-08', 'tierra', 1234.00, 'eddedede', 'dedede', 'hhhhhhhhhhhh', 'zgfxbhdg', '30003', 'wswsws', 'activo'),
(9, NULL, 5, 4, 4, '2023-10-29', '2023-10-30', '2023-10-31', 'mar', 0.55, 'eddedede', 'jjjjj', 'chinoss', 'KKKK', '30003', 'caracas', 'activo'),
(10, NULL, 5, 1, 3, '2023-10-31', '2023-11-03', '2023-11-07', 'tierra', 23.00, 'hgdsxfhg', 'dedede', 'shdhf', 'zgfxbhdg', '200002', 'gordo', 'activo'),
(11, NULL, 1, 1, 1, '2023-11-05', '2023-11-09', '2023-11-17', 'tierra', 0.18, 'eddedede', 'dedede', 'chinoss', 'KKKK', '30003', 'kkkk', 'activo'),
(12, NULL, 2, 1, 2, '2023-11-01', '2023-11-09', '2023-11-11', 'tierra', 252.00, 'shohguan', 'asa', 'asa', 'asa', '1234', 'turu', 'activo'),
(13, NULL, 5, 5, 5, '2023-11-08', '2023-11-09', '2023-11-10', 'tierra', 100.00, 'carritos', 'jerusalen', 'huayopampa', 'huayucro', '100011', 'peru', 'eliminado'),
(14, NULL, 4, 4, 4, '2023-11-05', '2023-11-06', '2023-11-07', 'mar', 123.00, 'chicles', 'arg', 'paz', 'paz', '50005', 'bolivia', 'activo'),
(15, NULL, 3, 2, 2, '2023-11-06', '2023-11-07', '2023-11-08', 'area', 147.00, 'pipilolo', 'chivos', 'chivos', 'chivos', '60006', 'perrin', 'activo'),
(19, NULL, 1, 1, 1, '2023-10-29', '2023-10-30', '2023-10-31', 'tierra', 800.00, 'llullin', 'chincho', 'chincho', 'chincho', '60006', 'peru', 'activo'),
(20, NULL, 3, 2, 3, '2023-11-02', '2023-11-03', '2023-11-04', 'tierra', 4587.00, 'gerefd', 'av. sol', 'chinoss', 'huanuco', '80008', 'peru', 'activo'),
(21, NULL, 1, 2, 3, '2023-10-29', '2023-11-25', '2023-11-29', 'mar', 455.00, 'pipe', 'pepito', 'peping', 'pepong', '70007', 'peg', 'eliminado'),
(22, NULL, 1, 2, 3, '2023-10-29', '2023-11-25', '2023-11-29', 'mar', 455.00, 'pipe', 'pepito', 'peping', 'pepong', '70007', 'peg', 'eliminado'),
(23, NULL, 1, 2, 3, '2023-10-29', '2023-11-25', '2023-11-29', 'mar', 455.00, 'pipe', 'pepito', 'peping', 'pepong', '70007', 'peg', 'eliminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `units_in_stock` int(11) DEFAULT NULL,
  `units_on_order` int(11) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `discontinued` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shippers`
--

CREATE TABLE `shippers` (
  `shipper_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shippers`
--

INSERT INTO `shippers` (`shipper_id`, `company_name`, `phone`) VALUES
(1, 'Fast Shipping Co.', '555-123-4567'),
(2, 'Quick Logistics', '555-987-6543'),
(3, 'Speedy Freight Services', '555-222-3333'),
(4, 'Express Shippers Inc.', '555-555-5555'),
(5, 'Swift Delivery Solutions', '555-777-7777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `home_page` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'weeeeeeeeeeee', 'weeeeeeeeeee', 'nilorosales76@gmail.com'),
(2, 'weeeeeeeeeeee', 'weeeeeeeeeee', 'nilorosales76@gmail.com'),
(3, 'asa', 'asa', 'nilorosales76@gmail.com'),
(4, 'wwww', 'wwww', 'nilorosales76@gmail.com'),
(5, 'cece', 'cece', 'ed@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `shipper_id` (`shipper_id`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`shipper_id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shippers`
--
ALTER TABLE `shippers`
  MODIFY `shipper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`);

--
-- Filtros para la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
