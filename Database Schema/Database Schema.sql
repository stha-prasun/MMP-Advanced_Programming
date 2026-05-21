-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 10:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mmp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `name`, `email`, `password`) VALUES
(1, 'MMP Admin', 'adminmmp@gmail.com', '$2a$12$PiqSYEzMGaPl2hAUtaZzDODuJpUqJZZ5JZIbcofkglJPxkuzNJzLC');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` bigint(20) NOT NULL,
  `cartTotalItems` int(11) NOT NULL DEFAULT 0,
  `cartTotalPrice` int(11) NOT NULL,
  `customerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `cartTotalItems`, `cartTotalPrice`, `customerId`) VALUES
(1, 2, 210000, 1),
(2, 0, 0, 4),
(3, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `cartItemId` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cartId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`cartItemId`, `quantity`, `cartId`, `productId`) VALUES
(1, 1, 1, 2),
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `type`) VALUES
(1, 'Electronics'),
(2, 'Furnitures'),
(3, 'Vehicles');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` bigint(20) NOT NULL,
  `custName` varchar(100) NOT NULL,
  `custEmail` varchar(255) NOT NULL,
  `custPassword` varchar(255) NOT NULL,
  `custIsActive` tinyint(1) NOT NULL DEFAULT 1,
  `custCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `custProfileImg` varchar(255) NOT NULL,
  `adminId` bigint(20) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `custName`, `custEmail`, `custPassword`, `custIsActive`, `custCreatedAt`, `custProfileImg`, `adminId`) VALUES
(1, 'Sanrose Bhetuwal', 'sanrose@gmail.com', '$2a$10$B/W.2/yBrRxx4RHTJkKUFenM0N6jBvet78RCbPazgCeIZdZzq5ws.', 0, '2026-05-07 14:20:45', '/Images/Customer/ganesh.png', 1),
(2, 'Soina', 'soina@gmail.com', '$2a$10$HCmM2tYi0KrirAmHE5LSoegjXzUutNd73ZvZvIfM4rVlWtwTHs7US', 1, '2026-05-15 09:37:41', '/Images/Customer/carvrom.jpg', 1),
(4, 'Meetej Saru Magar', 'meetej@gmail.com', '$2a$10$NehCJjm3K155dUf.31aU.esukVi4QSFS3Qhj9vvaJKdL.a1mPkVN2', 1, '2026-05-17 12:00:36', '/Images/Customer/Seller2.png', 1),
(5, 'Pramish Devkota', 'pramish1@gmail.com', '$2a$10$p96S2hjGnU4AVAJ7K4oo2O1cVeV7VEH1/cVqtwPSyUeckVtl2mGzG', 1, '2026-05-17 12:05:37', '/Images/Customer/mainpic.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favouriteitem`
--

CREATE TABLE `favouriteitem` (
  `favouriteItemId` bigint(20) NOT NULL,
  `favouriteId` bigint(20) DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favouriteitem`
--

INSERT INTO `favouriteitem` (`favouriteItemId`, `favouriteId`, `customerId`, `productId`) VALUES
(3, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `favouriteId` bigint(20) NOT NULL,
  `totalFavourites` int(11) NOT NULL,
  `customerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`favouriteId`, `totalFavourites`, `customerId`) VALUES
(2, 1, 1),
(3, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderItemId` bigint(20) NOT NULL,
  `orderTotalPrice` int(11) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`orderItemId`, `orderTotalPrice`, `orderId`, `productId`) VALUES
(1, 200000, 1, 2),
(2, 10000, 1, 1),
(3, 123456, 2, 3),
(4, 20000, 2, 6),
(5, 10000, 3, 1),
(6, 200000, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` bigint(20) NOT NULL,
  `orderedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `orderStatus` varchar(11) NOT NULL DEFAULT 'Pending',
  `deliveryLocation` varchar(255) DEFAULT 'Kamal Pokhari, Kathmandu',
  `cartId` bigint(20) DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `orderedAt`, `orderStatus`, `deliveryLocation`, `cartId`, `customerId`) VALUES
(1, '2026-05-14 06:10:55', 'Pending', 'Kalanki Thinthana, Kathmandu', 1, 1),
(2, '2026-05-20 07:58:21', 'paid', 'Kamal Pokhari, Kathmandu', 2, 4),
(3, '2026-05-20 08:02:47', 'pending', 'Kamal Pokhari, Kathmandu', 3, 5),
(4, '2026-05-20 08:03:34', 'pending', 'Kamal Pokhari, Kathmandu', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` bigint(20) NOT NULL,
  `payedAmount` int(11) NOT NULL,
  `Type` varchar(100) NOT NULL DEFAULT 'CASH',
  `orderitemId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `payedAmount`, `Type`, `orderitemId`) VALUES
(1, 123456, 'ONLINE', 3),
(2, 20000, 'ONLINE', 4),
(3, 10000, 'CASH_ON_DELIVERY', 5),
(4, 200000, 'CASH_ON_DELIVERY', 6);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` bigint(20) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productImageUrl` varchar(255) NOT NULL,
  `productIsSold` tinyint(1) NOT NULL DEFAULT 0,
  `isApproved` tinyint(1) NOT NULL DEFAULT 0,
  `productDescription` varchar(255) NOT NULL,
  `postedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoryId` bigint(20) DEFAULT NULL,
  `sellerId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productName`, `productPrice`, `productImageUrl`, `productIsSold`, `isApproved`, `productDescription`, `postedAt`, `categoryId`, `sellerId`) VALUES
(1, 'Phone', 10000, '', 1, 1, 'tis a phone', '2026-05-14 06:05:15', 1, 2),
(2, 'Laptop LOQ', 200000, '', 1, 1, 'tis a laptop who is cool', '2026-05-14 06:07:39', 1, 2),
(3, 'Car', 123456, '/Images/Product/car.jpg', 1, 1, 'This is a cool car', '2026-05-18 15:30:53', 3, 6),
(4, 'Nitrov15', 9999, '/Images/Product/nitrov15.jpg', 0, 1, 'Its a good conditioned laptop', '2026-05-18 17:13:01', 1, 6),
(5, 'Iphone 16', 100000, '/Images/Product/iphone 16.jpg', 0, 1, 'phone for sale', '2026-05-18 17:15:07', 1, 5),
(6, 'Oak Table', 20000, '/Images/Product/Table.jpg', 1, 1, 'a oak wood table which i no longer need', '2026-05-19 07:30:25', 2, 4),
(9, 'Door', 10000, '/Images/Product/Door woord.jpg', 1, 1, 'This is a door', '2026-05-20 06:08:24', 2, 4),
(11, 'Car', 12312413, '/Images/Product/car.jpg', 0, 1, 'tis  acr', '2026-05-20 08:04:39', 3, 4),
(12, 'Nitrov15', 10000, '/Images/Product/download.png', 0, 1, 'Its a laptop', '2026-05-20 18:57:53', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `sellerId` bigint(20) NOT NULL,
  `sellerName` varchar(100) NOT NULL,
  `sellerEmail` varchar(255) NOT NULL,
  `sellerPassword` varchar(255) NOT NULL,
  `sellerCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `sellerLocation` varchar(255) NOT NULL,
  `sellerIsActive` tinyint(1) NOT NULL DEFAULT 1,
  `sellerVerificationId` varchar(255) NOT NULL,
  `adminId` bigint(20) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`sellerId`, `sellerName`, `sellerEmail`, `sellerPassword`, `sellerCreatedAt`, `sellerLocation`, `sellerIsActive`, `sellerVerificationId`, `adminId`) VALUES
(2, 'Sanrose', 'sanrose12@gmail.com', '$2a$12$Idbv586bqt4cfMi5y6rz8.WkWJwIAn4qrg2lK0ITaW37JGrGWY1pO', '2026-05-14 11:49:36', 'kathmandu', 1, '$2a$12$nGLXtP6um65d3qzUDJDYcOVwITI4OJevurLfWL6JgpC5iz9KgytDa', 1),
(3, 'Soina', 'soina1@gmail.com', '$2a$10$Pq0NFw81gJkXVmcdKPH5R.2z7K5Zz9199ApEQM.Qk2pwYObi1Hp1a', '2026-05-15 09:41:29', 'Kaathmandu', 0, '$2a$10$yJ7gEpT2cVzhTd4Wcr6n5eU/gQu8de2FX//rIsSYInHM5KUG7aZei', 1),
(4, 'Pramish Devkota', 'pramish1@gmail.com', '$2a$10$i0un..7wipGxgw5hVboevOXk0.fc8MxLFyfhc5pZGCevZvboXi7OO', '2026-05-17 12:12:55', 'Kathmandu', 1, '$2a$12$uTCrg37WUTiN0oaETKQf1eJo6KNdzcvYIoWsXULiJUs3xnNsHiw1W', 1),
(5, 'Umang K Kansakar', 'umang@gmail.com', '$2a$10$bMObsr3eGpl09RqMbw1y1OBTTw4WIqCNp.kvMsSy/0TdZuQ87G9X2', '2026-05-18 13:51:03', 'Kathmandu', 1, '$2a$10$PAP1KFfFK3sTE6/Ul6aBsOJfSjz3tW4DOgyAc.nuiqwbKtdBm2cGW', 1),
(6, 'Prasun Shrestha', 'prasun@gmail.com', '$2a$10$P.jY4USK17crC8/0qtHTdOE3wxjsiil68yoRrCaI/0FDBP1dHWE7y', '2026-05-18 13:51:32', 'Kathmandu', 1, '$2a$10$XSRb2LWSVC1LyK5lw9TZTesy15M10qiVpoDQkSloQ1CS/zMtFLJaW', 1),
(7, 'Rohan', 'rohan@gmail.com', '$2a$10$JsvAa8Z4UEVKfhvMLkOyE.7PYHRaTKlWuWtwEccllJzOKHrU6OM5W', '2026-05-18 13:51:52', 'Kathmandu', 1, '$2a$10$u4s8q3qdnH/TIN2VXQuQ5eFN7zMRZqiKIsn5MMSuB.HU3Yv8Ep526', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cartItemId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `custEmail` (`custEmail`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `favouriteitem`
--
ALTER TABLE `favouriteitem`
  ADD PRIMARY KEY (`favouriteItemId`),
  ADD KEY `favouriteId` (`favouriteId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `product_item_fav` (`productId`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`favouriteId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderItemId`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `orderitemId` (`orderitemId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `sellerId` (`sellerId`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`sellerId`),
  ADD UNIQUE KEY `sellerEmail` (`sellerEmail`),
  ADD UNIQUE KEY `sellerVerificationId` (`sellerVerificationId`),
  ADD KEY `adminId` (`adminId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `cartItemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favouriteitem`
--
ALTER TABLE `favouriteitem`
  MODIFY `favouriteItemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `favouriteId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `orderItemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `sellerId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`);

--
-- Constraints for table `favouriteitem`
--
ALTER TABLE `favouriteitem`
  ADD CONSTRAINT `favouriteitem_ibfk_1` FOREIGN KEY (`favouriteId`) REFERENCES `favourites` (`favouriteId`),
  ADD CONSTRAINT `favouriteitem_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `product_item_fav` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderitemId`) REFERENCES `orderitem` (`orderItemId`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
