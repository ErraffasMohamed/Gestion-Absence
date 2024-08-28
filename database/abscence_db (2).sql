-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 28, 2024 at 06:37 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abscence_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
CREATE TABLE IF NOT EXISTS `absences` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `etat` tinyint(1) NOT NULL,
  `justification` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_sea` bigint UNSIGNED NOT NULL,
  `id_etu` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `absences_id_sea_foreign` (`id_sea`),
  KEY `absences_id_etu_foreign` (`id_etu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_dep` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departements`
--

INSERT INTO `departements` (`id`, `nom_dep`, `created_at`, `updated_at`) VALUES
(1, 'Informatique', '2023-12-10 09:42:05', '2023-12-10 09:42:05'),
(2, 'Mecanique', '2023-12-10 09:42:06', '2023-12-10 09:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
CREATE TABLE IF NOT EXISTS `enseignants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_ens` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_ens` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_ens` int NOT NULL,
  `adresse_ens` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enseignants_id_user_foreign` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enseignants`
--

INSERT INTO `enseignants` (`id`, `nom_ens`, `prenom_ens`, `phone_ens`, `adresse_ens`, `created_at`, `updated_at`, `id_user`) VALUES
(2, 'elqadi', 'elqadi', 102030405, 'rabat', '2023-12-10 09:46:36', '2023-12-10 09:46:36', 6),
(3, 'zeriab', 'essadek', 601020304, 'rabat', '2024-05-18 01:07:48', '2024-05-18 01:07:48', 7);

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cne` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_etu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_etu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_etu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_filiere` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etudiants_id_filiere_foreign` (`id_filiere`),
  KEY `etudiants_id_user_foreign` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id`, `cne`, `nom_etu`, `prenom_etu`, `phone_etu`, `created_at`, `updated_at`, `id_filiere`, `id_user`) VALUES
(4, 'D8888888', 'Abbassi', 'Imane', 612222222, '2024-05-19 22:38:05', '2024-05-19 22:38:05', 2, 4),
(5, 'H14777777', 'benlfkih', 'laila', 64444444, '2024-05-19 22:39:00', '2024-05-19 22:39:00', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filieres`
--

DROP TABLE IF EXISTS `filieres`;
CREATE TABLE IF NOT EXISTS `filieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_filiere` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_dep` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filieres_id_dep_foreign` (`id_dep`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filieres`
--

INSERT INTO `filieres` (`id`, `nom_filiere`, `created_at`, `updated_at`, `id_dep`) VALUES
(1, 'EEIN', '2023-12-10 09:42:06', '2023-12-10 09:42:06', 1),
(2, 'INDIA', '2023-12-10 09:42:06', '2023-12-10 09:42:06', 1),
(3, 'GM', '2023-12-10 09:42:06', '2023-12-10 09:42:06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_mat` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_filiere` bigint UNSIGNED NOT NULL,
  `id_sem` bigint UNSIGNED NOT NULL,
  `id_ens` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matieres_id_filiere_foreign` (`id_filiere`),
  KEY `matieres_id_sem_foreign` (`id_sem`),
  KEY `matieres_id_ens_foreign` (`id_ens`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matieres`
--

INSERT INTO `matieres` (`id`, `nom_mat`, `created_at`, `updated_at`, `id_filiere`, `id_sem`, `id_ens`) VALUES
(2, 'genie logiciel', '2023-12-10 09:46:59', '2023-12-10 09:46:59', 2, 3, 2),
(4, 'crypto', '2023-12-10 10:04:30', '2023-12-10 10:04:30', 2, 3, 2),
(5, 'Genie Logiciel', '2023-12-10 12:12:14', '2023-12-10 12:12:14', 1, 1, 2),
(6, 'math', '2024-05-18 01:09:07', '2024-05-18 01:09:07', 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_000000_create_users_table', 1),
(21, '2014_10_12_100000_create_password_resets_table', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2020_10_02_113123_create_roles_table', 1),
(24, '2020_10_02_114126_add_user_role', 1),
(25, '2020_10_03_204911_create_departements_table', 1),
(26, '2020_10_03_205054_create_etudiants_table', 1),
(27, '2020_10_03_205700_create_filieres_table', 1),
(28, '2020_10_03_210349_create_enseignants_table', 1),
(29, '2020_10_03_211051_create_semestres_table', 1),
(30, '2020_10_03_211253_create_matieres_table', 1),
(31, '2020_10_03_212321_create_seances_table', 1),
(32, '2020_10_03_222421_create_absences_table', 1),
(33, '2020_10_04_111121_add_idfil_iduser__etudiant', 1),
(34, '2020_10_04_111322_add_iddep__filiere', 1),
(35, '2020_10_04_111426_add_iduser__enseignant', 1),
(36, '2020_10_04_111556_add_idfil_idsem_id_ens__matiere', 1),
(37, '2020_10_04_111724_add_idmat_idens__seance', 1),
(38, '2020_10_04_111929_add_idsea_idetu__absence', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '2023-12-10 09:42:05', '2023-12-10 09:42:05'),
(2, 'admin', '2023-12-10 09:42:05', '2023-12-10 09:42:05'),
(3, 'prof', '2023-12-10 09:42:05', '2023-12-10 09:42:05'),
(4, 'etudiant', '2023-12-10 09:42:05', '2023-12-10 09:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
CREATE TABLE IF NOT EXISTS `seances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_ens` bigint UNSIGNED NOT NULL,
  `id_mat` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seances_id_ens_foreign` (`id_ens`),
  KEY `seances_id_mat_foreign` (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seances`
--

INSERT INTO `seances` (`id`, `date`, `type`, `active`, `heure_debut`, `heure_fin`, `created_at`, `updated_at`, `id_ens`, `id_mat`) VALUES
(4, '2024-05-21', 'cour', 1, '08:30:00', '00:00:00', '2024-05-18 01:09:52', '2024-05-18 01:10:06', 3, 6),
(5, '2024-05-19', 'cour', 1, '08:30:00', '10:01:00', '2024-05-18 01:46:18', '2024-05-18 01:46:57', 3, 6),
(6, '2024-05-20', 'cour', 0, '08:30:00', '10:30:00', '2024-05-19 22:35:48', '2024-05-19 22:35:48', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `semestres`
--

DROP TABLE IF EXISTS `semestres`;
CREATE TABLE IF NOT EXISTS `semestres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_sem` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semestres`
--

INSERT INTO `semestres` (`id`, `nom_sem`, `created_at`, `updated_at`) VALUES
(1, 'S1', '2023-12-10 09:42:06', '2023-12-10 09:42:06'),
(2, 'S2', '2023-12-10 09:42:06', '2023-12-10 09:42:06'),
(3, 'S3', '2023-12-10 09:42:06', '2023-12-10 09:42:06'),
(4, 'S4', '2023-12-10 09:42:06', '2023-12-10 09:42:06'),
(5, 'S5', '2023-12-10 09:42:06', '2023-12-10 09:42:06'),
(6, 'S6', '2023-12-10 09:42:06', '2023-12-10 09:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_role` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_role_foreign` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `id_role`) VALUES
(1, 'superadmin', 'superadmin@app.com', NULL, '$2y$10$gERcB16MZ16gv5TK9Kh69upvSPn4trPOf./hj8VGz9Jx2YipyFHd.', NULL, '2023-12-10 09:42:05', '2023-12-10 09:42:05', 1),
(2, 'admin', 'admin@admin.com', NULL, '$2y$10$E.gxQuIp2LPlrThLpAsYe.DEE5GRGBy2.SE7QXxwSbx/plfRmEaVO', NULL, '2023-12-10 09:42:05', '2023-12-10 09:42:05', 2),
(3, 'prof', 'prof@prof.com', NULL, '$2y$10$3QNEtVsoF0mH5bsAbGSWSuhsvQOW4ASreSlOYx8MfV0IwR89mvQyG', NULL, '2023-12-10 09:42:05', '2023-12-10 09:42:05', 3),
(4, 'etudiant', 'etu@etudiant.com', NULL, '$2y$10$cQ0mMG5rgNLAUCbFPYeanuwO3ZS.Df2CM8UMirscFXKTB1PDIzNfW', NULL, '2023-12-10 09:42:05', '2023-12-10 09:42:05', 4),
(6, 'elqadi', 'elqadi@gmail.com', NULL, '$2y$10$9roNnJs7f8oCLYXa0rlUAeYbjUjLvVlr2bkrabiILrxDgwzH33xni', NULL, '2023-12-10 09:46:36', '2023-12-10 09:46:36', 3),
(7, 'zeriab', 'zeriab@prof.com', NULL, '$2y$10$M0Sizh.3O5rTWmN5WKybt.z1PoNWL.PzUoM6uHK7niTY6YZTGkA92', NULL, '2024-05-18 01:07:48', '2024-05-18 01:07:48', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_id_etu_foreign` FOREIGN KEY (`id_etu`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absences_id_sea_foreign` FOREIGN KEY (`id_sea`) REFERENCES `seances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_id_filiere_foreign` FOREIGN KEY (`id_filiere`) REFERENCES `filieres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiants_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filieres`
--
ALTER TABLE `filieres`
  ADD CONSTRAINT `filieres_id_dep_foreign` FOREIGN KEY (`id_dep`) REFERENCES `departements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `matieres_id_ens_foreign` FOREIGN KEY (`id_ens`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matieres_id_filiere_foreign` FOREIGN KEY (`id_filiere`) REFERENCES `filieres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matieres_id_sem_foreign` FOREIGN KEY (`id_sem`) REFERENCES `semestres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_id_ens_foreign` FOREIGN KEY (`id_ens`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_id_mat_foreign` FOREIGN KEY (`id_mat`) REFERENCES `matieres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
