-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2024 lúc 05:57 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `content` text DEFAULT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `discountAmount` decimal(10,2) DEFAULT 0.00,
  `finalAmount` decimal(10,2) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idVoucher` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `active`) VALUES
(1, 'pizza', 'assest/img/pizza_model', 1),
(2, 'drinks', 'assest/img/drink_model', 1),
(3, 'fried', 'assest/img/fried_model', 1),
(4, 'burger', 'assest/img/burger_model', 1),
(5, 'chicken', 'assest/img/chicken_model', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idUser` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `voucher` decimal(10,2) DEFAULT 0.00,
  `hot` tinyint(1) DEFAULT 0,
  `description` text DEFAULT NULL,
  `idCategory` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `voucher`, `hot`, `description`, `idCategory`, `active`) VALUES
(1, 'chicken wings', 'assets/img/product/chicken/chicken_wings.png', 25000.00, 0.05, 5, 'A delicious and crispy fried chicken served with special dipping sauces, perfect for a quick meal.', 5, 1),
(2, 'pizza cheese', 'assets/img/product/pizza/pizza_cheese.png', 120000.00, 0.07, 3, 'A cheesy and delightful Italian pizza topped with fresh ingredients and baked to perfection.', 1, 1),
(3, 'craft beer', 'assets/img/product/drinks/craft_beer.png', 20000.00, 0.08, 4, 'A refreshing and cool drink to quench your thirst on a hot day.', 2, 1),
(4, 'classic burger', 'assets/img/product/burger/classic_burger.png', 45000.00, 0.10, 3, 'A juicy and flavorful burger packed with fresh vegetables and a tangy sauce.', 4, 1),
(5, 'fried calamari', 'assets/img/product/fried/fried_calamari.png', 30000.00, 0.12, 5, 'Golden crispy fried snacks that are perfect for sharing with friends.', 3, 1),
(6, 'spicy chicken', 'assets/img/product/chicken/spicy_chicken.png', 26000.00, 0.09, 2, 'Succulent chicken wings marinated with spices and grilled to perfection.', 5, 1),
(7, 'pizza seafood', 'assets/img/product/pizza/pizza_seafood.png', 125000.00, 0.11, 5, 'Pizza topped with fresh vegetables and a variety of cheeses for a gourmet experience.', 1, 1),
(8, 'draft beer', 'assets/img/product/drinks/draft_beer.png', 18000.00, 0.06, 3, 'A fizzy soft drink with a sweet and tangy flavor to complement your meal.', 2, 1),
(9, 'double burger', 'assets/img/product/burger/double_burger.png', 47000.00, 0.15, 4, 'Classic burger with melted cheese, fresh lettuce, and a juicy beef patty.', 4, 1),
(10, 'French fries', 'assets/img/product/fried/french_fries.png', 32000.00, 0.07, 3, 'Hot and crispy French fries seasoned to perfection.', 3, 1),
(11, 'herb chicken', 'assets/img/product/chicken/herb_chicken.png', 27000.00, 0.08, 4, 'Grilled chicken with herbs and spices, served with a side of creamy sauce.', 5, 1),
(12, 'pepperoni pizza', 'assets/img/product/pizza/pepperoni_pizza.png', 110000.00, 0.10, 3, 'Pepperoni pizza with extra cheese and a crispy crust.', 1, 1),
(13, 'fruit soda', 'assets/img/product/drinks/fruit_soda.png', 22000.00, 0.09, 5, 'A sweet fruit-flavored soda that brings a burst of freshness to your day.', 2, 1),
(14, 'spicy chicken burger', 'assets/img/product/burger/spicy_chicken_burger.png', 49000.00, 0.11, 2, 'Spicy chicken burger with mayo, lettuce, and a perfectly toasted bun.', 4, 1),
(15, 'onion rings', 'assets/img/product/fried/onion_rings.png', 28000.00, 0.12, 4, 'Crunchy fried onion rings with a side of tangy dipping sauce.', 3, 1),
(16, 'chicken nuggets', 'assets/img/product/chicken/chicken_nuggets.png', 29000.00, 0.13, 3, 'Spicy chicken nuggets made with premium ingredients and fried to a golden brown.', 5, 1),
(17, 'vegetarian pizza', 'assets/img/product/pizza/vegetarian_pizza.png', 115000.00, 0.06, 4, 'Vegetarian pizza with olives, bell peppers, and a tangy tomato base.', 1, 1),
(18, 'lemonade', 'assets/img/product/drinks/lemonade.png', 19000.00, 0.05, 3, 'A chilled glass of lemonade with a hint of mint for a refreshing touch.', 2, 1),
(19, 'beef burger', 'assets/img/product/burger/beef_burger.png', 52000.00, 0.07, 2, 'Double patty beef burger with cheese, lettuce, and a tangy sauce.', 4, 1),
(20, 'potato wedges', 'assets/img/product/fried/potato_wedges.png', 35000.00, 0.14, 3, 'Spicy fried potato wedges with a crispy outer layer and soft center.', 3, 1),
(21, 'honey chicken', 'assets/img/product/chicken/honey_chicken.png', 31000.00, 0.15, 4, 'Honey glazed chicken strips with a sweet and savory flavor.', 5, 1),
(22, 'thin crust pizza', 'assets/img/product/pizza/thin_crust_pizza.png', 130000.00, 0.08, 3, 'Pizza with a crispy thin crust and an assortment of fresh toppings.', 1, 1),
(23, 'milkshake', 'assets/img/product/drinks/milkshake.png', 21000.00, 0.09, 5, 'Smooth and creamy milkshake made with premium ingredients.', 2, 1),
(24, 'veggie burger', 'assets/img/product/burger/veggie_burger.png', 48000.00, 0.13, 3, 'Grilled veggie burger with fresh vegetables and a tangy sauce.', 4, 1),
(25, 'cheese sticks', 'assets/img/product/fried/cheese_sticks.png', 33000.00, 0.10, 4, 'Deep-fried cheese sticks with a gooey center and a crispy coating.', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `fullname`, `phone`, `birthday`, `address`, `role`, `status`) VALUES
(1005, 'zxc', '657f18518eaa2f41307895e18c3ba0d12d97b8a23c6de3966f52c6ba39a07ee4', 'zxc', '', '0000-00-00', '', 'user', 'active'),
(1006, 'connguathanhtroia@gmail.com', '657f18518eaa2f41307895e18c3ba0d12d97b8a23c6de3966f52c6ba39a07ee4', 'zxc', '', '0000-00-00', '', 'user', 'active'),
(1011, 'vuld.23ceb@vku.udn.vn', '657f18518eaa2f41307895e18c3ba0d12d97b8a23c6de3966f52c6ba39a07ee4', 'zxc', 'zxc', '0000-00-00', 'zxc', 'user', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discountValue` decimal(10,2) NOT NULL,
  `type` enum('percent','fixed') DEFAULT 'percent',
  `validFrom` datetime DEFAULT NULL,
  `validTo` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`id`, `code`, `description`, `discountValue`, `type`, `validFrom`, `validTo`, `active`) VALUES
(1, '1132005', 'voucher for birthday', 0.15, 'percent', '2024-12-17 11:10:40', '2034-12-13 11:10:40', 1),
(2, '0', 'Voucher everyday', 0.10, 'percent', '2024-12-17 11:15:17', '2124-12-31 11:15:17', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher_usage`
--

DROP TABLE IF EXISTS `voucher_usage`;
CREATE TABLE `voucher_usage` (
  `id` int(11) NOT NULL,
  `idVoucher` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idBill` int(11) NOT NULL,
  `usedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idVoucher` (`idVoucher`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `voucher_usage`
--
ALTER TABLE `voucher_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVoucher` (`idVoucher`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idBill` (`idBill`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1028;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `voucher_usage`
--
ALTER TABLE `voucher_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`idVoucher`) REFERENCES `voucher` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `voucher_usage`
--
ALTER TABLE `voucher_usage`
  ADD CONSTRAINT `voucher_usage_ibfk_1` FOREIGN KEY (`idVoucher`) REFERENCES `voucher` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `voucher_usage_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `voucher_usage_ibfk_3` FOREIGN KEY (`idBill`) REFERENCES `bill` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
