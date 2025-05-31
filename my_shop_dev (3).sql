-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 31 mai 2025 à 17:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `my_shop_dev`
--

-- --------------------------------------------------------

--
-- Structure de la table `ajouterhistoriqueproduit`
--

CREATE TABLE `ajouterhistoriqueproduit` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ajouterhistoriqueproduit`
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
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(2, 'plante'),
(4, 'animaux'),
(5, 'matériel de jardinage');

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shipping_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `name`, `shipping_cost`) VALUES
(1, 'Tunis', 4),
(2, 'Mahdia', 7),
(3, 'Jerba', 10),
(4, 'Monastir', 6),
(5, 'Sousse', 6),
(6, 'Kef', 8),
(7, 'Bizerte', 4),
(8, 'Siliana', 7),
(9, 'kairaouan', 8),
(10, 'Tozeur', 10),
(11, 'Gabes', 9);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
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
('DoctrineMigrations\\Version20250531004601', '2025-05-31 00:46:44', 316),
('DoctrineMigrations\\Version20250531091113', '2025-05-31 12:10:08', 51),
('DoctrineMigrations\\Version20250531120405', '2025-05-31 14:04:31', 39),
('DoctrineMigrations\\Version20250531122403', '2025-05-31 14:24:28', 289);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `addresse` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `pay_on_delivery` tinyint(1) NOT NULL,
  `prix_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `ville_id`, `first_name`, `last_name`, `telephone`, `addresse`, `created_at`, `pay_on_delivery`, `prix_total`) VALUES
(13, 2, 'aya', 'br', '22222', 'rue xyz', '2025-05-31 16:55:01', 1, 17);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
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
-- Structure de la table `produits_commande`
--

CREATE TABLE `produits_commande` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits_commande`
--

INSERT INTO `produits_commande` (`id`, `commande_id`, `produit_id`, `quantite`) VALUES
(9, 13, 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produits_sous_categorie`
--

CREATE TABLE `produits_sous_categorie` (
  `produits_id` int(11) NOT NULL,
  `sous_categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits_sous_categorie`
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
-- Structure de la table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_categorie`
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
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`) VALUES
(4, 'aya@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$Y6JdmFylIBsxJeTWoc5HLe/nBfbYE81xZlUZGoia38OICWp82M00W', 'aya', 'aya'),
(5, 'meriemkaroui55@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$x4n7Bx09KFV8Q7SB1SRvee6NaXk4T7HGu2cbj8QtTotwebJ1ocIZC', 'mery', 'karoui'),
(6, 'yosr@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$MnPQncbNbdfhYnhl6BZJSe.GNzP.ZdFMrVOn7FXXBbplyO/a0AUwq', 'yosr', 'Bouslahi'),
(7, 'yassine@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_USER\"]', '$2y$13$7fMiZogoGXMKr.zWKBbm/OPR4v8UAhFnV.5UmlipXhrjKFQ0hK7Aq', 'turki', 'yassine'),
(8, 'eya@gmail.com', '[]', '$2y$13$8oWNzLe6Ouui8AjKDR2teup/zUYDlRbjYKXFdbfpiccr6INJb2bK.', 'eya2', 'eya');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E3E57862F347EFB` (`produit_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A73F0036` (`ville_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BE2DDF8C6C6E55B5` (`nom`);

--
-- Index pour la table `produits_commande`
--
ALTER TABLE `produits_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_91DC5EAF82EA2E54` (`commande_id`),
  ADD KEY `IDX_91DC5EAFF347EFB` (`produit_id`);

--
-- Index pour la table `produits_sous_categorie`
--
ALTER TABLE `produits_sous_categorie`
  ADD PRIMARY KEY (`produits_id`,`sous_categorie_id`),
  ADD KEY `IDX_1E1E0853CD11A2CF` (`produits_id`),
  ADD KEY `IDX_1E1E0853365BF48` (`sous_categorie_id`);

--
-- Index pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52743D7BBCF5E72D` (`categorie_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `produits_commande`
--
ALTER TABLE `produits_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ajouterhistoriqueproduit`
--
ALTER TABLE `ajouterhistoriqueproduit`
  ADD CONSTRAINT `FK_E3E57862F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `produits_commande`
--
ALTER TABLE `produits_commande`
  ADD CONSTRAINT `FK_91DC5EAF82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `FK_91DC5EAFF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `produits_sous_categorie`
--
ALTER TABLE `produits_sous_categorie`
  ADD CONSTRAINT `FK_1E1E0853365BF48` FOREIGN KEY (`sous_categorie_id`) REFERENCES `sous_categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1E1E0853CD11A2CF` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `FK_52743D7BBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
