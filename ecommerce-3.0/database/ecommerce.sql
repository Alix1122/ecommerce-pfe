-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2026 at 01:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp(),
  `icone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`, `description`, `date_creation`, `icone`) VALUES
(1, 'Hoodies', 'Hoodie oversize Montone.\r\nLe hoodie que ton dressing attend.\r\n\r\n✔ Tissu épais & premium\r\n✔ Coupe oversize parfaite\r\n✔ Confort maximal, style minimal', '2026-04-10 17:14:49', 'fa-solid fa-shirt'),
(2, 'Sabot', 'Sabot Boston.\r\nConfort exceptionnel, semelle médicale et style intemporel inspiré du Birkenstock Boston.\r\nParfait pour un look casual moderne.', '2026-04-10 18:46:12', 'fa-solid fa-shoe-prints'),
(3, 'T-Shirt', 'Tissu premium\r\nCouture de précision\r\nPensé pour tous les jours\r\n• Conçu pour le confort\r\nFinition haut de gamme\r\n• Coton de qualité supérieure\r\nFait pour durer', '2026-04-10 18:50:15', 'fa-solid fa-shirt'),
(4, 'Chemise', 'The perfect choice for warm days. Premium linen, lightweight and comfortable to wear, a modern, simple, yet striking half-sleeve cut.\r\n', '2026-04-13 22:23:40', 'fa-solid fa-shirt');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `valide` int(11) NOT NULL DEFAULT 0,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id`, `id_client`, `total`, `valide`, `date_creation`) VALUES
(23, 3, 897, 0, '2026-04-10 19:02:59'),
(24, 3, 807, 0, '2026-04-10 19:36:05'),
(25, 3, 538, 0, '2026-04-10 22:06:16'),
(26, 3, 199, 0, '2026-04-10 22:08:10'),
(27, 6, 299, 0, '2026-04-13 21:42:12'),
(28, 6, 806, 0, '2026-04-13 21:42:53'),
(29, 3, 598, 0, '2026-04-13 22:12:12'),
(30, 3, 299, 0, '2026-04-13 22:18:26'),
(31, 3, 1005, 0, '2026-04-13 22:18:59'),
(32, 3, 299, 0, '2026-04-13 22:36:33'),
(33, 3, 568, 0, '2026-04-13 22:37:27'),
(34, 3, 299, 0, '2026-04-13 22:38:53'),
(35, 3, 299, 0, '2026-04-13 22:50:47'),
(36, 3, 498, 0, '2026-04-13 23:05:51'),
(37, 3, 199, 0, '2026-04-13 23:21:11'),
(38, 3, 299, 0, '2026-04-13 23:36:32'),
(39, 3, 269, 0, '2026-04-13 23:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `quantite` int(11) NOT NULL,
  `taille` varchar(10) DEFAULT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `id_produit`, `id_commande`, `prix`, `quantite`, `taille`, `total`) VALUES
(1, 1, 23, 299, 3, NULL, 897),
(2, 1, 24, 269, 3, NULL, 807),
(3, 1, 25, 269, 2, NULL, 538),
(4, 2, 26, 199, 1, NULL, 199),
(5, 4, 27, 299, 1, NULL, 299),
(6, 1, 28, 269, 1, NULL, 269),
(7, 3, 28, 238, 1, NULL, 238),
(8, 4, 28, 299, 1, NULL, 299),
(9, 4, 29, 299, 2, NULL, 598),
(10, 4, 30, 299, 1, NULL, 299),
(11, 1, 31, 269, 1, NULL, 269),
(12, 2, 31, 199, 1, NULL, 199),
(13, 3, 31, 238, 1, NULL, 238),
(14, 4, 31, 299, 1, NULL, 299),
(15, 4, 32, 299, 1, NULL, 299),
(16, 1, 33, 269, 1, NULL, 269),
(17, 4, 33, 299, 1, NULL, 299),
(18, 4, 34, 299, 1, NULL, 299),
(19, 4, 35, 299, 1, NULL, 299),
(20, 6, 36, 249, 2, NULL, 498),
(21, 2, 37, 199, 1, NULL, 199),
(22, 4, 38, 299, 1, NULL, 299),
(23, 1, 39, 269, 1, NULL, 269);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `discount` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `prix`, `discount`, `id_categorie`, `date_creation`, `description`, `image`) VALUES
(1, 'Hoodie oversize Montone noi', 299, 10, 1, '2026-04-10 00:00:00', 'Black isn’t basic. It’s a statement.\r\nHoodie oversize Montone — lourd, doux, puissant.\r\nOversize. Montone.\r\nLe hoodie que ton dressing attend.', '69d9390540eabhoodie.jpg'),
(2, 'Sabot Boston beige', 199, 0, 2, '2026-04-10 00:00:00', 'Sabot Boston beige 👣\r\nInspiré du modèle iconique, ce sabot allie style intemporel et confort quotidien.\r\nSemelle épaisse et résistante, maintien optimal et sensation agréable à chaque pas.\r\nFinition propre, look minimal — presque comme l’original, mais à ', '69d93bd7ddc73Sabot.jpg'),
(3, 'T-Shirt', 250, 5, 3, '2026-04-10 00:00:00', '• Tissu premium\r\nCouture de précision\r\nPensé pour tous les jours\r\n• Conçu pour le confort\r\nFinition haut de gamme\r\n• Coton de qualité supérieure\r\nFait pour durer', '69d96a1c29d38t-shirt.jpg'),
(4, 'Blue Hoodie', 299, 0, 1, '2026-04-13 00:00:00', 'detail counts.\r\nFrom the weight of the fabric to the perfectly balanced oversized cut.\r\nUNICO hoodie, designed for those who demand more.', '69dd348e32e5bhoodie-blue.jpg'),
(5, 'Chemise Maron', 249, 0, 4, '2026-04-13 00:00:00', 'The perfect choice for warm days. Premium linen, lightweight and comfortable to wear, a modern, simple, yet striking half-sleeve cut.', '69dd5f4199fc8chemis-maron.jpg'),
(6, 'Chemise Beige', 249, 0, 4, '2026-04-13 00:00:00', 'The perfect choice for warm days. Premium linen, lightweight and comfortable to wear, a modern, simple, yet striking half-sleeve cut.', '69dd5fd41c022chemis-baige.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `date_creation`) VALUES
(3, 'ali', '123456', '2026-02-15'),
(4, 'admin', '1234', '2026-02-15'),
(6, 'simo', '123456', '2026-04-09'),
(7, 'Aya', '123456', '2026-04-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_commade` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
