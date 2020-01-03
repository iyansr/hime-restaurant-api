-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2020 pada 19.35
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hime_food`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
('094548ca-33bf-4c34-8e3b-294929dd792e', 'Other Food', '2019-12-30 07:10:28', '2019-12-30 07:10:28'),
('49267808-a055-480f-a82b-aa1036899c42', 'Drink', '2019-12-30 06:01:00', '2019-12-30 06:01:00'),
('4b081e9b-392a-45da-8494-27576017aad4', 'Ramen', '2019-12-30 06:00:49', '2019-12-30 06:00:49'),
('b2002274-0033-40db-b76d-82a17191b604', 'Sushi', '2019-12-28 16:31:10', '2019-12-28 16:31:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkouts`
--

CREATE TABLE `checkouts` (
  `id` int(255) NOT NULL,
  `checkout_id` varchar(255) NOT NULL,
  `food_id` varchar(255) NOT NULL,
  `quantity` int(32) NOT NULL,
  `price` int(32) NOT NULL,
  `total` int(32) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `checkouts`
--

INSERT INTO `checkouts` (`id`, `checkout_id`, `food_id`, `quantity`, `price`, `total`, `created_at`, `updated_at`) VALUES
(87, '#HMWAVOP30202021893KOU0T', '8974fe4c-956a-4487-b9d0-c75b33ba70b3', 3, 55000, 165000, '2020-01-01 14:04:46', '2020-01-01 14:04:46'),
(88, '#HMWAVOP30202021893KOU0T', '594e7a11-92fd-4047-8115-bda252d44364', 1, 16000, 16000, '2020-01-01 14:04:46', '2020-01-01 14:04:46'),
(89, '#HMX3FUX30202021893KKKTL', 'c803f2bd-7124-45eb-978b-122014fb0e99', 1, 22000, 22000, '2020-01-01 14:05:00', '2020-01-01 14:05:00'),
(90, '#HMX3FUX30202021893KKKTL', 'd3aace13-81a8-49ff-8f06-2df9dfa4c0a8', 3, 35500, 106500, '2020-01-01 14:05:00', '2020-01-01 14:05:00'),
(91, '#HMKH5ZN302020218931KKS4', '43249021-c523-44d7-a3ef-c3cd48a17930', 3, 50000, 150000, '2020-01-01 14:06:21', '2020-01-01 14:06:21'),
(92, '#HMKH5ZN302020218931KKS4', '9f7daca9-6526-4345-8621-ee60972beccd', 4, 10000, 40000, '2020-01-01 14:06:21', '2020-01-01 14:06:21'),
(93, '#HMG58953020202150GZSQW', 'd3aace13-81a8-49ff-8f06-2df9dfa4c0a8', 1, 35500, 35500, '2020-01-01 14:19:00', '2020-01-01 14:19:00'),
(95, '#HMG58953020202150GZSQW', 'c6577ccc-4165-4c7e-90d6-d4cb69d63fec', 13, 20000, 260000, '2020-01-01 14:19:00', '2020-01-01 14:19:00'),
(96, '#HMYTJUU302020219911794R', 'c803f2bd-7124-45eb-978b-122014fb0e99', 9, 22000, 198000, '2020-01-01 14:21:28', '2020-01-01 14:21:28'),
(97, '#HMYTJUU302020219911794R', '8974fe4c-956a-4487-b9d0-c75b33ba70b3', 14, 55000, 770000, '2020-01-01 14:21:28', '2020-01-01 14:21:28'),
(98, '#HMYODSS30202021886CUOQ7', '594e7a11-92fd-4047-8115-bda252d44364', 1, 16000, 16000, '2020-01-01 14:26:19', '2020-01-01 14:26:19'),
(99, '#HMYODSS30202021886CUOQ7', '8974fe4c-956a-4487-b9d0-c75b33ba70b3', 4, 55000, 220000, '2020-01-01 14:26:19', '2020-01-01 14:26:19'),
(100, '#HMZQ8DH30202021167FU7VL', '8974fe4c-956a-4487-b9d0-c75b33ba70b3', 1, 55000, 55000, '2020-01-01 14:27:30', '2020-01-01 14:27:30'),
(101, '#HMZQ8DH30202021167FU7VL', '594e7a11-92fd-4047-8115-bda252d44364', 4, 16000, 64000, '2020-01-01 14:27:30', '2020-01-01 14:27:30'),
(102, '#HMPD7ZQ30202021368XH1XU', '10cde88f-8aee-4276-81be-2b5bb055a92b', 2, 10000, 20000, '2020-01-01 14:30:35', '2020-01-01 14:30:35'),
(103, '#HMWUS3C30202021368BFX46', '594e7a11-92fd-4047-8115-bda252d44364', 1, 16000, 16000, '2020-01-01 14:33:09', '2020-01-01 14:33:09'),
(104, '#HMWUS3C30202021368BFX46', '1ffd3eda-90f1-403b-a2af-bce6d48984a1', 2, 11000, 22000, '2020-01-01 14:33:09', '2020-01-01 14:33:09'),
(105, '#HM2O0JV30202023525XVG9L', '2fb2c53d-d87a-41ff-ba35-7e46717e5c46', 2, 29000, 58000, '2020-01-01 17:03:27', '2020-01-01 17:03:27'),
(106, '#HMAG71C4020200144UKYU4', 'c803f2bd-7124-45eb-978b-122014fb0e99', 2, 22000, 44000, '2020-01-01 17:07:35', '2020-01-01 17:07:35'),
(107, '#HMMDP2Z40202017927Z5BY8', '1ffd3eda-90f1-403b-a2af-bce6d48984a1', 3, 11000, 33000, '2020-01-02 10:35:46', '2020-01-02 10:35:46'),
(108, '#HMMDP2Z40202017927Z5BY8', '2fb2c53d-d87a-41ff-ba35-7e46717e5c46', 1, 29000, 29000, '2020-01-02 10:35:46', '2020-01-02 10:35:46'),
(109, '#HMCGG7U40202023494RDXSC', '8f568715-de94-44ca-98cb-16fbfea68fa9', 2, 35000, 70000, '2020-01-02 16:25:08', '2020-01-02 16:25:08'),
(110, '#HMBXAY74020202321Q82MS', '10cde88f-8aee-4276-81be-2b5bb055a92b', 2, 10000, 20000, '2020-01-02 16:58:45', '2020-01-02 16:58:45'),
(111, '#HMA00MQ50202001793SMF1', '4913ba43-b0bd-43dc-a9a8-66971ffdb98e', 2, 10000, 20000, '2020-01-02 17:09:17', '2020-01-02 17:09:17'),
(112, '#HMA00MQ50202001793SMF1', '9f7daca9-6526-4345-8621-ee60972beccd', 2, 10000, 20000, '2020-01-02 17:09:17', '2020-01-02 17:09:17'),
(113, '#HMVC5ER50202002293J78R', '8f568715-de94-44ca-98cb-16fbfea68fa9', 3, 35000, 105000, '2020-01-02 17:10:25', '2020-01-02 17:10:25'),
(114, '#HMDS5RE5020201511VUO52', '9f7daca9-6526-4345-8621-ee60972beccd', 2, 10000, 20000, '2020-01-02 18:02:07', '2020-01-02 18:02:07'),
(115, '#HMXWSV95020201307799WJ', '10cde88f-8aee-4276-81be-2b5bb055a92b', 1, 10000, 10000, '2020-01-02 18:17:15', '2020-01-02 18:17:15'),
(116, '#HMXWSV95020201307799WJ', 'd3aace13-81a8-49ff-8f06-2df9dfa4c0a8', 2, 35500, 71000, '2020-01-02 18:17:15', '2020-01-02 18:17:15'),
(117, '#HM7DEZ05020201342F55N0', '8f568715-de94-44ca-98cb-16fbfea68fa9', 2, 35000, 70000, '2020-01-02 18:20:44', '2020-01-02 18:20:44'),
(118, '#HMU5ILZ5020201774LRU6Z', '594e7a11-92fd-4047-8115-bda252d44364', 1, 16000, 16000, '2020-01-02 18:21:10', '2020-01-02 18:21:10'),
(119, '#HMU5ILZ5020201774LRU6Z', 'c6577ccc-4165-4c7e-90d6-d4cb69d63fec', 1, 20000, 20000, '2020-01-02 18:21:10', '2020-01-02 18:21:10'),
(120, '#HM1WX4C5020201997AKMMY', '9f7daca9-6526-4345-8621-ee60972beccd', 2, 10000, 20000, '2020-01-02 18:22:36', '2020-01-02 18:22:36'),
(121, '#HM1WX4C5020201997AKMMY', '594e7a11-92fd-4047-8115-bda252d44364', 2, 16000, 32000, '2020-01-02 18:22:36', '2020-01-02 18:22:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `foods`
--

CREATE TABLE `foods` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(32) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `category` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `image`, `category`, `created_at`, `updated_at`) VALUES
('10cde88f-8aee-4276-81be-2b5bb055a92b', 'Ice Coffe Boba', 10000, 'https://images.unsplash.com/photo-1525803377221-4f6ccdaa5133?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', '49267808-a055-480f-a82b-aa1036899c42', '2019-12-30 16:14:22', '2019-12-30 16:14:22'),
('1ffd3eda-90f1-403b-a2af-bce6d48984a1', 'Ice Coffe Latte', 11000, 'https://sifu.unileversolutions.com/image/id-ID/recipe-topvisual/2/1260-709/ice-coffee-latte-bango-50464111.jpg', '49267808-a055-480f-a82b-aa1036899c42', '2019-12-30 17:41:25', '2019-12-30 17:41:25'),
('2fb2c53d-d87a-41ff-ba35-7e46717e5c46', 'Sushi Tuna', 29000, 'http://res.cloudinary.com/iyansrcloud/image/upload/v1577898184/upload/hime_food/image/d77yarwdljcvuqw4pizu.jpg', 'b2002274-0033-40db-b76d-82a17191b604', '2020-01-01 17:03:07', '2020-01-01 17:03:07'),
('43249021-c523-44d7-a3ef-c3cd48a17930', 'Miso Ramen Hime', 50000, 'https://images.unsplash.com/photo-1509680859026-7d8cfc6894f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80', '4b081e9b-392a-45da-8494-27576017aad4', '2019-12-30 07:14:39', '2019-12-30 07:14:39'),
('4913ba43-b0bd-43dc-a9a8-66971ffdb98e', 'Takoyaki', 10000, 'https://images.japancentre.com/recipes/pics/22/main/takoyaki.gif?1533121780', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-30 17:31:11', '2019-12-30 17:31:11'),
('594e7a11-92fd-4047-8115-bda252d44364', 'Okonomiyaki', 16000, 'https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/easy_okonomiyaki_78828_16x9.jpg', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-30 17:38:22', '2019-12-30 17:38:22'),
('675d8e13-5332-4c64-8c42-5c78ba9836af', 'Seafood Sushi', 30000, 'http://res.cloudinary.com/iyansrcloud/image/upload/v1577689636/upload/hime_food/image/k3ywbakafdldtjtofvnp.jpg', 'b2002274-0033-40db-b76d-82a17191b604', '2019-12-30 07:07:18', '2019-12-30 07:07:18'),
('8974fe4c-956a-4487-b9d0-c75b33ba70b3', 'Yakiniku', 55000, 'http://res.cloudinary.com/iyansrcloud/image/upload/v1577727807/upload/hime_food/image/spibs6tawmqkijb9kcr8.jpg', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-30 17:43:29', '2019-12-30 17:43:29'),
('8f568715-de94-44ca-98cb-16fbfea68fa9', 'Sushi Rolls Nori', 35000, 'http://res.cloudinary.com/iyansrcloud/image/upload/v1577689775/upload/hime_food/image/tx0grfsjupotaodgoupa.jpg', 'b2002274-0033-40db-b76d-82a17191b604', '2019-12-30 07:09:39', '2019-12-30 07:09:39'),
('9f7daca9-6526-4345-8621-ee60972beccd', 'Red Velvet Hot Chocolate', 10000, 'https://www.thespruceeats.com/thmb/NjvuguNh_3lh15DJlINlOtWEKS8=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/red-velvet-hot-chocolate-1-589d7b6d3df78c47582fef0a.jpg', '49267808-a055-480f-a82b-aa1036899c42', '2019-12-30 17:28:08', '2019-12-30 17:28:08'),
('b896252d-3ae7-474c-ae07-1ae7e47c3fd6', 'Soyu Ramen Hime', 45000, 'https://images.unsplash.com/photo-1501200040150-4d65c94e8f21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', '4b081e9b-392a-45da-8494-27576017aad4', '2019-12-30 07:16:28', '2019-12-30 07:16:28'),
('c088fe4c-bd39-429e-8394-fa1539e021ac', 'Omurice', 31000, 'https://dsimg.wowjpn.goo.ne.jp/rs/?src=https://uds.gnst.jp/rest/img/fa247mts0000/s_0nr2.jpg?t=1555026404&maxw=750&maxh=0&resize=1', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-31 02:44:53', '2019-12-31 02:44:53'),
('c6577ccc-4165-4c7e-90d6-d4cb69d63fec', 'Matcha Latte', 20000, 'https://images.unsplash.com/photo-1515823064-d6e0c04616a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', '49267808-a055-480f-a82b-aa1036899c42', '2019-12-30 08:23:07', '2019-12-30 08:23:07'),
('c803f2bd-7124-45eb-978b-122014fb0e99', 'Tempura', 22000, 'https://cdn2.tstatic.net/style/foto/bank/images/tempura-udang-enak.jpg', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-30 17:35:37', '2019-12-30 17:35:37'),
('d3aace13-81a8-49ff-8f06-2df9dfa4c0a8', 'Beef Bowl', 35500, 'https://i0.wp.com/apple-of-my-eye.com/wp-content/uploads/2019/02/Japanese-Gyudon-Bowls-2.jpg?fit=801%2C1200', '094548ca-33bf-4c34-8e3b-294929dd792e', '2019-12-31 05:41:57', '2019-12-31 05:41:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(225) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
('e7d8d2d4-465c-4289-be6a-1d64f2b623d5', 'admin@himefood.co', '$2a$10$uGiaCgMwHucYInYakSXCTeQMwG7WX1qWqOjzRfEoAYPAhElPhCgeW', '2019-12-31 08:11:07', '2019-12-31 08:11:07'),
('f38822db-42db-4ea9-8d3e-f0d2f44685ce', 'admin@himefood.com', '$2a$10$6MLZ8O6a/NMURIM1sU43mOQOns1MxaHBmzOtJbIXvO2yFvP6U5rsW', '2019-12-31 08:10:26', '2019-12-31 08:10:26');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indeks untuk tabel `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `food_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`);

--
-- Ketidakleluasaan untuk tabel `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
