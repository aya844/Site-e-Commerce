-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2025 at 11:10 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_shop_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `ajouterhistoriqueproduit`
--

CREATE TABLE `ajouterhistoriqueproduit` (
  `id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ajouterhistoriqueproduit`
--

INSERT INTO `ajouterhistoriqueproduit` (`id`, `produit_id`, `quantite`, `created_at`) VALUES
(1, 6, 100, '2025-05-30 11:28:09'),
(2, 2, 100, '2025-05-30 12:47:15'),
(3, 2, 100, '2025-05-30 13:01:13'),
(4, 2, 100, '2025-05-30 13:01:28'),
(5, 2, 100, '2025-05-30 13:02:33'),
(6, 2, 120, '2025-05-30 13:07:15'),
(7, 2, 100, '2025-05-30 13:11:26'),
(8, 6, 30, '2025-05-30 13:11:37'),
(9, 4, 30, '2025-05-30 13:42:16'),
(10, 5, 60, '2025-05-30 13:47:18'),
(11, 4, 500, '2025-05-30 14:42:40'),
(12, 7, 75, '2025-05-31 09:49:33'),
(13, 8, 0, '2025-05-31 09:50:50'),
(14, 9, 200, '2025-05-31 09:52:46'),
(15, 10, 5, '2025-05-31 09:54:38'),
(16, 11, 30, '2025-05-31 09:55:34'),
(17, 12, 19, '2025-05-31 09:57:46'),
(18, 13, 25, '2025-05-31 10:03:39'),
(19, 14, 6, '2025-05-31 10:05:41'),
(20, 15, 3, '2025-05-31 10:08:45'),
(22, 17, 2, '2025-05-31 10:47:40'),
(23, 18, 100, '2025-05-31 11:02:20'),
(24, 19, 82, '2025-05-31 11:06:43'),
(25, 20, 24, '2025-05-31 11:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(2, 'plante'),
(4, 'animaux'),
(5, 'matériel de jardinage');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250524221128', '2025-05-25 00:13:14', 80),
('DoctrineMigrations\\Version20250524230751', '2025-05-25 01:08:03', 17),
('DoctrineMigrations\\Version20250529085042', '2025-05-29 10:52:14', 54),
('DoctrineMigrations\\Version20250529125533', '2025-05-29 14:56:15', 136),
('DoctrineMigrations\\Version20250529142330', '2025-05-29 16:24:56', 7),
('DoctrineMigrations\\Version20250529145831', '2025-05-29 16:58:59', 74),
('DoctrineMigrations\\Version20250529185326', '2025-05-29 22:36:55', 36),
('DoctrineMigrations\\Version20250529203642', '2025-05-30 10:42:59', 8),
('DoctrineMigrations\\Version20250529220529', '2025-05-30 10:42:59', 11),
('DoctrineMigrations\\Version20250531004601', '2025-05-31 00:46:44', 316);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `prix` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`, `stock`) VALUES
(2, 'Calathea Orbifolia', 'Plante tropicale au feuillage vert zébré de rayures claires. Elle aime l’humidité et la lumière indirecte.', 40, 'calathea-orbifolia-growing-guide-5270824-hero-2a3b8667f05b40a49b27da573d2486fb.webp', 100),
(4, 'Cactus', 'Plante résistante au climat aride, dotée de réserves d’eau dans ses tissus. Idéal pour les intérieurs ensoleillés et faciles à entretenir.', 25, 'how-to-grow-cactus-1902954-04-d5f8940f124a4ac3abce5369f316830a.jpg', 530),
(5, 'Caladium', 'Plante décorative aux grandes feuilles colorées, souvent roses, rouges ou blanches. Elle préfère la chaleur et un sol bien drainé.', 12, 'grow-caladium-indoors-1902744-07-dbeef55837e84dfa8725971d7b3c7ea4.jpg', 60),
(6, 'Calathea Zebrina', 'Plante tropicale au feuillage vert zébré de rayures claires. Elle aime l’humidité et la lumière indirecte.', 20, 'SPR-calathea-zebrina-plant-profile-7374039-Hero-A-e81921d144714d6c9ccdf001cf4a2df8.jpg', 130),
(7, 'Acoma Crape Myrtle', 'Acoma Crape Myrtle — Petit arbre ornemental aux fleurs blanches retombantes, parfait pour les jardins ensoleillés.', 35, 'Acoma-Crape-Myrtle-External-683ab48da7b12.jpg', 75),
(8, 'Bergamot', 'Bergamot — Plante aromatique vivace aux fleurs colorées, cultivée en plein air pour ses usages médicinaux et culinaires.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBergamot — Plante aromatique vivace aux fleurs colorées, cultivée en plein air pour ses usages médicinaux et culinaires.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBergamot — Plante aromatique vivace aux fleurs colorées, cultivée en plein air pour ses usages médicinaux et culinaires.', 27, 'Bergamot-External-683ab4dac9f33.jpg', 0),
(9, 'Texas Pride', 'Texas Pride — Arbuste robuste à floraison vive, adapté aux climats chauds et aux aménagements paysagers extérieurs.', 13, 'Texas-Pride-External-683ab54e01426.jpg', 200),
(10, 'Kalanchoe', 'Plante succulente d’intérieur aux fleurs vives, facile à entretenir et idéale pour les espaces lumineux.', 9, 'Kalanchoe-Interior-683ab5be3d04b.jpg', 5),
(11, 'Snake Plant', 'Plante d’intérieur résistante, appréciée pour son feuillage vertical et sa capacité à purifier l’air.', 45, 'snake-plant-interior-683ab5f6b95b3.jpg', 30),
(12, 'China Rose (Hibiscus rosa-sinensis)', 'Arbuste tropical à grandes fleurs éclatantes, cultivé en extérieur ou en intérieur très lumineux.', 38, 'China-Rose-Hibiscus-rosa-sinensis-External-683ab67ae9350.jpg', 19),
(13, 'Maine Coon', 'Grand, sociable et doux, avec une longue fourrure et une allure de lynx.', 900, 'download-683ab7db8bee6.jpg', 25),
(14, 'Siamois', 'Élégant, vocal et affectueux, au pelage clair avec des extrémités foncées.', 600, 'OIP-683ab85525edd.jpg', 6),
(15, 'British Shorthair', 'Calme, robuste et au pelage dense, souvent bleu-gris.', 1000, 'OIP-1-683ab90d9d50b.jpg', 3),
(17, 'Labrador Retriever', 'Amical, obéissant et joueur, idéal pour les familles et les enfants.', 1500, 'OIP-2-683ac22bef876.jpg', 2),
(18, 'Arrosoir 12L avec pomme d’arrosage', 'Pratique et robuste, cet arrosoir de 12 litres signé Ribiland est idéal pour l’arrosage de vos plantes au jardin comme en intérieur. Équipé d\'une pomme d’arrosage amovible, il assure une répartition douce et uniforme de l’eau. Sa grande capacité limite les allers-retours, et sa poignée ergonomique facilite la prise en main.', 27, 'OIP-3-683ac59cb62bb.jpg', 100),
(19, 'Pulvérisateur plante', 'Conçu pour les plantes d’intérieur, ce pulvérisateur de grande taille diffuse une brume fine et homogène, comparable à celle d’un flacon de parfum. Parfait pour hydrater délicatement les feuilles sans les abîmer.', 35, 'OIP-4-683ac6a3e6195.jpg', 82),
(20, 'Sécateurs de jardin', 'Ce sécateur est conçu pour offrir une coupe nette et sans effort grâce à sa lame en acier trempé et son mécanisme de coupe fluide. Adapté à la taille des rosiers, arbustes ou jeunes pousses, il assure une prise en main confortable grâce à ses poignées ergonomiques antidérapantes. Verrouillage de sécurité pour un rangement sans risque', 17, 'OIP-5-683ac7543c109.jpg', 24);

-- --------------------------------------------------------

--
-- Table structure for table `produits_sous_categorie`
--

CREATE TABLE `produits_sous_categorie` (
  `produits_id` int NOT NULL,
  `sous_categorie_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produits_sous_categorie`
--

INSERT INTO `produits_sous_categorie` (`produits_id`, `sous_categorie_id`) VALUES
(2, 1),
(4, 6),
(5, 1),
(6, 1),
(7, 6),
(8, 6),
(9, 6),
(10, 1),
(11, 1),
(12, 6),
(13, 7),
(14, 7),
(15, 7),
(17, 3),
(18, 4),
(19, 4),
(20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int NOT NULL,
  `categorie_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `categorie_id`, `nom`) VALUES
(1, 2, 'Plantes d’intérieur'),
(3, 4, 'chien'),
(4, 5, 'Arrosoirs'),
(5, 5, 'Sécateurs'),
(6, 2, 'Plantes d’extérieur'),
(7, 4, 'chat');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_general_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`) VALUES
(4, 'aya@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$Y6JdmFylIBsxJeTWoc5HLe/nBfbYE81xZlUZGoia38OICWp82M00W', 'aya', 'aya'),
(5, 'meriemkaroui55@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$x4n7Bx09KFV8Q7SB1SRvee6NaXk4T7HGu2cbj8QtTotwebJ1ocIZC', 'mery', 'karoui'),
(6, 'yosr@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$MnPQncbNbdfhYnhl6BZJSe.GNzP.ZdFMrVOn7FXXBbplyO/a0AUwq', 'yosr', 'Bouslahi'),
(7, 'yassine@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$7fMiZogoGXMKr.zWKBbm/OPR4v8UAhFnV.5UmlipXhrjKFQ0hK7Aq', 'turki', 'yassine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E3E57862F347EFB` (`produit_id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BE2DDF8C6C6E55B5` (`nom`);

--
-- Indexes for table `produits_sous_categorie`
--
ALTER TABLE `produits_sous_categorie`
  ADD PRIMARY KEY (`produits_id`,`sous_categorie_id`),
  ADD KEY `IDX_1E1E0853CD11A2CF` (`produits_id`),
  ADD KEY `IDX_1E1E0853365BF48` (`sous_categorie_id`);

--
-- Indexes for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52743D7BBCF5E72D` (`categorie_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  ADD CONSTRAINT `FK_E3E57862F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Constraints for table `produits_sous_categorie`
--
ALTER TABLE `produits_sous_categorie`
  ADD CONSTRAINT `FK_1E1E0853365BF48` FOREIGN KEY (`sous_categorie_id`) REFERENCES `sous_categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1E1E0853CD11A2CF` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `FK_52743D7BBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
