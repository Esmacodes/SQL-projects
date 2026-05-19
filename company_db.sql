-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Nis 2026, 14:10:56
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `company_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE `department` (
  `Dnumber` int(11) NOT NULL,
  `Dname` varchar(50) NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `department`
--

INSERT INTO `department` (`Dnumber`, `Dname`, `Mgr_ssn`, `Mgr_start_date`) VALUES
(1, 'IT', '111111111', '2020-01-01'),
(2, 'HR', '222222222', '2020-01-01'),
(3, 'Finance', '333333333', '2020-01-01'),
(4, 'Marketing', '444444444', '2020-01-01'),
(5, 'Sales', '555555555', '2020-01-01'),
(6, 'Logistics', '666666666', '2019-03-15'),
(7, 'Support', '777777777', '2019-03-15'),
(8, 'Security', '888888888', '2019-03-15'),
(9, 'R&D', '999999999', '2020-06-20'),
(10, 'Legal', '101010101', '2020-06-20'),
(11, 'Admin', '111111111', '2020-06-20'),
(12, 'QA', '121212121', '2020-06-20'),
(13, 'Design', '131313131', '2021-09-10'),
(14, 'DevOps', '141414141', '2021-09-10'),
(15, 'Data', '151515151', '2021-09-10'),
(16, 'AI', '161616161', '2021-09-10'),
(17, 'Cloud', '171717171', '2022-12-01'),
(18, 'Mobile', '181818181', '2022-12-01'),
(19, 'Web', '191919191', '2022-12-01'),
(20, 'Game', '202020202', '2022-12-01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dependent`
--

CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(50) NOT NULL CHECK (trim(`Dependent_name`) <> ''),
  `Sex` char(1) DEFAULT NULL CHECK (`Sex` in ('M','F')),
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `dependent`
--

INSERT INTO `dependent` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES
('101010101', 'D10', 'M', '1999-01-01', 'Child'),
('111111111', 'D1', 'F', '1990-01-01', 'Child'),
('121212121', 'D11', 'F', '1999-01-01', 'Child'),
('131313131', 'D12', 'M', '1999-01-08', 'Child'),
('141414141', 'D13', 'F', '1998-01-07', 'Child'),
('151515151', 'D14', 'M', '1998-01-07', 'Child'),
('161616161', 'D15', 'F', '1998-01-09', 'Child'),
('171717171', 'D16', 'M', '1998-05-01', 'Child'),
('181818181', 'D17', 'F', '1985-03-05', 'Child'),
('191919191', 'D18', 'M', '1985-03-05', 'Child'),
('202020202', 'D19', 'F', '1985-03-09', 'Child'),
('212121212', 'D20', 'M', '1985-03-09', 'Child'),
('222222222', 'D2', 'M', '1990-01-01', 'Child'),
('333333333', 'D3', 'F', '1990-03-02', 'Child'),
('444444444', 'D4', 'M', '1980-05-05', 'Child'),
('555555555', 'D5', 'F', '1980-05-05', 'Child'),
('666666666', 'D6', 'M', '2000-02-01', 'Child'),
('777777777', 'D7', 'F', '2000-02-01', 'Child'),
('888888888', 'D8', 'M', '2002-01-04', 'Child'),
('999999999', 'D9', 'F', '2002-01-07', 'Child');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dept_locations`
--

CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `dept_locations`
--

INSERT INTO `dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'Ankara'),
(1, 'Antalya'),
(1, 'Bursa'),
(1, 'İstanbul'),
(2, 'Ankara'),
(2, 'Bursa'),
(2, 'İstanbul'),
(2, 'İzmir'),
(3, 'Ankara'),
(3, 'Antalya'),
(3, 'Bursa'),
(3, 'İzmir'),
(4, 'Ankara'),
(4, 'Bursa'),
(4, 'İstanbul'),
(4, 'İzmir'),
(5, 'Ankara'),
(5, 'Antalya'),
(5, 'İstanbul'),
(5, 'İzmir');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employee`
--

CREATE TABLE `employee` (
  `Ssn` char(9) NOT NULL,
  `Fname` varchar(30) NOT NULL CHECK (trim(`Fname`) <> ''),
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(30) NOT NULL CHECK (trim(`Lname`) <> ''),
  `Bdate` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL CHECK (`Sex` in ('M','F')),
  `Salary` decimal(10,2) DEFAULT 10000.00 CHECK (`Salary` > 0),
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `employee`
--

INSERT INTO `employee` (`Ssn`, `Fname`, `Minit`, `Lname`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('101010101', 'Burcu', 'J', 'Kurt', '1999-01-01', 'Adana', 'F', 14000.00, '555555555', 5),
('111111111', 'Ali', 'A', 'Yılmaz', '1990-01-01', 'Ankara', 'M', 15000.00, NULL, 1),
('121212121', 'Okan', 'K', 'Öztürk', '1990-01-01', 'Ankara', 'M', 15000.00, '111111111', 1),
('131313131', 'Derya', 'L', 'Aksoy', '1991-01-01', 'İstanbul', 'F', 13000.00, '222222222', 2),
('141414141', 'Serkan', 'M', 'Polat', '1992-01-01', 'İzmir', 'M', 15500.00, '333333333', 3),
('151515151', 'Melis', 'N', 'Yıldız', '1993-01-01', 'Bursa', 'F', 12500.00, '444444444', 4),
('161616161', 'Hakan', 'O', 'Er', '1994-01-01', 'Antalya', 'M', 16500.00, '555555555', 5),
('171717171', 'Ceren', 'P', 'Güneş', '1995-01-01', 'Ankara', 'F', 12000.00, '111111111', 1),
('181818181', 'Tolga', 'R', 'Uçar', '1996-01-01', 'İstanbul', 'M', 14500.00, '222222222', 2),
('191919191', 'Seda', 'S', 'Kılıç', '1997-01-01', 'İzmir', 'F', 13500.00, '333333333', 3),
('202020202', 'Furkan', 'T', 'Eren', '1998-01-01', 'Bursa', 'M', 14000.00, '444444444', 4),
('212121212', 'Aslı', 'U', 'Tekin', '1999-01-01', 'Adana', 'F', 15000.00, '555555555', 5),
('222222222', 'Ayşe', 'B', 'Demir', '1991-01-01', 'İstanbul', 'F', 14000.00, '111111111', 2),
('333333333', 'Mehmet', 'C', 'Kaya', '1992-01-01', 'İzmir', 'M', 16000.00, '111111111', 3),
('444444444', 'Zeynep', 'D', 'Şahin', '1993-01-01', 'Bursa', 'F', 13000.00, '222222222', 4),
('555555555', 'Can', 'E', 'Çelik', '1994-01-01', 'Antalya', 'M', 14500.00, '222222222', 5),
('666666666', 'Elif', 'F', 'Koç', '1995-01-01', 'Ankara', 'F', 12500.00, '333333333', 1),
('777777777', 'Murat', 'G', 'Aydın', '1996-01-01', 'İstanbul', 'M', 17000.00, '333333333', 2),
('888888888', 'Selin', 'H', 'Arslan', '1997-01-01', 'İzmir', 'F', 12000.00, '444444444', 3),
('999999999', 'Emre', 'I', 'Doğan', '1998-01-01', 'Bursa', 'M', 13500.00, '444444444', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project`
--

CREATE TABLE `project` (
  `Pnumber` int(11) NOT NULL,
  `Pname` varchar(50) NOT NULL CHECK (trim(`Pname`) <> ''),
  `Plocation` varchar(50) DEFAULT NULL,
  `Dnum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `project`
--

INSERT INTO `project` (`Pnumber`, `Pname`, `Plocation`, `Dnum`) VALUES
(1, 'P1', 'Ankara', 1),
(2, 'P2', 'İstanbul', 2),
(3, 'P3', 'İzmir', 3),
(4, 'P4', 'Bursa', 4),
(5, 'P5', 'Antalya', 5),
(6, 'P6', 'Ankara', 1),
(7, 'P7', 'İstanbul', 2),
(8, 'P8', 'İzmir', 3),
(9, 'P9', 'Bursa', 4),
(10, 'P10', 'Antalya', 5),
(11, 'P11', 'Ankara', 1),
(12, 'P12', 'İstanbul', 2),
(13, 'P13', 'İzmir', 3),
(14, 'P14', 'Bursa', 4),
(15, 'P15', 'Antalya', 5),
(16, 'P16', 'Ankara', 1),
(17, 'P17', 'İstanbul', 2),
(18, 'P18', 'İzmir', 3),
(19, 'P19', 'Bursa', 4),
(20, 'P20', 'Antalya', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `works_on`
--

CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(4,1) DEFAULT NULL CHECK (`Hours` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `works_on`
--

INSERT INTO `works_on` (`Essn`, `Pno`, `Hours`) VALUES
('101010101', 10, 22.0),
('111111111', 1, 10.0),
('121212121', 11, 8.0),
('131313131', 12, 9.0),
('141414141', 13, 11.0),
('151515151', 14, 13.0),
('161616161', 15, 17.0),
('171717171', 16, 19.0),
('181818181', 17, 21.0),
('191919191', 18, 23.0),
('202020202', 19, 25.0),
('212121212', 20, 27.0),
('222222222', 2, 15.0),
('333333333', 3, 20.0),
('444444444', 4, 12.0),
('555555555', 5, 18.0),
('666666666', 6, 10.0),
('777777777', 7, 14.0),
('888888888', 8, 16.0),
('999999999', 9, 12.0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dnumber`),
  ADD UNIQUE KEY `Dname` (`Dname`),
  ADD KEY `fk_mgr` (`Mgr_ssn`);

--
-- Tablo için indeksler `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`Essn`,`Dependent_name`);

--
-- Tablo için indeksler `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`Dnumber`,`Dlocation`);

--
-- Tablo için indeksler `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Ssn`),
  ADD KEY `Super_ssn` (`Super_ssn`),
  ADD KEY `Dno` (`Dno`);

--
-- Tablo için indeksler `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD UNIQUE KEY `Pname` (`Pname`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Tablo için indeksler `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`Essn`,`Pno`),
  ADD KEY `Pno` (`Pno`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_mgr` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dnumber`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
