-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2025 at 10:22 AM
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
-- Database: `movie_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `imdb_id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` varchar(10) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `plot` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `imdb_id`, `title`, `year`, `genre`, `director`, `plot`, `poster`, `date_time`) VALUES
(5, 'tt0182576', 'Family Guy', '1999–', 'Animation, Comedy', 'N/A', 'In a wacky Rhode Island town, a dysfunctional family strives to cope with everyday life as they are thrown from one crazy scenario to another.', 'https://m.media-amazon.com/images/M/MV5BNTZlMGQ1YjEtMzVlNC00ZmMxLTk0MzgtZjdkYTU1NmUxNTQ0XkEyXkFqcGc@._V1_SX300.jpg', '2025-01-26 12:38:56'),
(6, 'tt4556714', 'Kathmandu', '2012', 'Drama', 'N/A', 'A young ultra-orthodox couple volunteer to establish a \"Chabad House\" in Kathmandu for Israeli backpackers.', 'https://m.media-amazon.com/images/M/MV5BYzNjMDgyMGItMDAzMy00YzRkLTk0MmYtZjQyODkzYTk2ODJmXkEyXkFqcGc@._V1_SX300.jpg', '2025-01-26 12:41:09'),
(7, 'tt1082587', 'Family Man', '2008', 'Comedy, Crime, Drama', 'Steven Schachter', 'A comedy series centered around community pillar Todd Becker, who at night heads up a bickering gang of burglars.', '', '2025-01-26 12:43:34'),
(8, 'tt1022603', '500 Days of Summer', '2009', 'Comedy, Drama, Romance', 'Marc Webb', 'After being dumped by the girl he believes to be his soulmate, hopeless romantic Tom Hansen reflects on their relationship to try and figure out where things went wrong and how he can win her back.', 'https://m.media-amazon.com/images/M/MV5BMTk5MjM4OTU1OV5BMl5BanBnXkFtZTcwODkzNDIzMw@@._V1_SX300.jpg', '2025-01-26 12:44:12'),
(9, 'tt18351128', 'The Amazing Spiderman 2 Webb Cut', '2021', 'Sci-Fi', 'Vicente Canales', 'The extended version of 2014\'s The Amazing Spider-Man 2. Includes never before seen footage and alternate takes of the movie.', 'https://m.media-amazon.com/images/M/MV5BNzI0MmQyMzYtZDAzNi00ZWZiLWFjMTgtNzQwOTRjYTFlM2Y3XkEyXkFqcGc@._V1_SX300.jpg', '2025-01-26 12:45:20'),
(10, 'tt0195714', 'Final Destination', '2000', 'Horror, Thriller', 'James Wong', 'After getting a premonition about a plane crash on his school trip, Alex, a student, saves a few of his classmates. However, their situation gets complicated when death starts chasing them.', 'https://m.media-amazon.com/images/M/MV5BODNhM2E4NDItMjFjZS00ODBlLWJlOTctZDgzZTY4YmZmY2YzXkEyXkFqcGc@._V1_SX300.jpg', '2025-01-26 12:46:49'),
(11, 'tt0367594', 'Charlie and the Chocolate Factory', '2005', 'Adventure, Comedy, Family', 'Tim Burton', 'Charlie, a young boy from an impoverished family, and four other kids win a tour of an amazing chocolate factory run by an imaginative chocolatier, Willy Wonka, and his staff of Oompa-Loompas.', 'https://m.media-amazon.com/images/M/MV5BNjcxMjg1Njg2NF5BMl5BanBnXkFtZTcwMjQ4NzMzMw@@._V1_SX300.jpg', '2025-01-26 12:48:37'),
(12, 'tt0078346', 'Superman', '1978', 'Action, Adventure, Sci-Fi', 'Richard Donner', 'An alien orphan is sent from his dying planet to Earth, where he grows up to become his adoptive home\'s first and greatest superhero.', 'https://m.media-amazon.com/images/M/MV5BMzFlZDJjMDAtZDYxZS00NzZhLTk2ODMtZWRlODA3Njk3ZTdmXkEyXkFqcGc@._V1_SX300.jpg', '2025-01-26 14:20:18'),
(13, 'tt1300854', 'Iron Man 3', '2013', 'Action, Adventure, Sci-Fi', 'Shane Black', 'When Tony Stark\'s world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.', 'https://m.media-amazon.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX300.jpg', '2025-01-27 04:09:11'),
(14, 'tt1375666', 'Inception', '2010', 'Action, Adventure, Sci-Fi', 'Christopher Nolan', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg', '2025-01-27 09:17:02'),
(15, 'tt0106062', 'Matrix', '1993', 'Action, Drama, Fantasy', 'N/A', 'Hitman Steven Matrix is shot, experiences afterlife, gets second chance by helping others. Wakes up, meets guides assigning cases where he aids people using unorthodox methods from past profession.', 'https://m.media-amazon.com/images/M/MV5BM2JiZjU1NmQtNjg1Ni00NjA3LTk2MjMtNjYxMTgxODY0NjRhXkEyXkFqcGc@._V1_SX300.jpg', '2025-01-27 09:18:15'),
(16, 'tt0448011', 'Knowing', '2009', 'Mystery, Sci-Fi, Thriller', 'Alex Proyas', 'M.I.T. professor John Koestler links a mysterious list of numbers from a time capsule to past and future disasters and sets out to prevent the ultimate catastrophe.', 'https://m.media-amazon.com/images/M/MV5BMTMyMjgyMDIyM15BMl5BanBnXkFtZTcwNjg3MjAyMg@@._V1_SX300.jpg', '2025-01-27 09:18:51'),
(17, 'tt15398776', 'Oppenheimer', '2023', 'Biography, Drama, History', 'Christopher Nolan', 'A dramatization of the life story of J. Robert Oppenheimer, the physicist who had a large hand in the development of the atomic bombs that brought an end to World War II.', 'https://m.media-amazon.com/images/M/MV5BN2JkMDc5MGQtZjg3YS00NmFiLWIyZmQtZTJmNTM5MjVmYTQ4XkEyXkFqcGc@._V1_SX300.jpg', '2025-01-27 09:19:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
