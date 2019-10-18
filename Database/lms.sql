-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 15, 2019 lúc 05:38 PM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` datetime NOT NULL,
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `released` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `content`, `publisher`, `author`, `released`) VALUES
(1, 'CR7 Messi', 'Description CR7 Messi', '<p>Content CR7 M10</p>', '2019-10-12 00:00:00', 'CR7 M10', 0),
(3, 'title', 'desc', 'content ', '2019-10-11 00:00:00', 'author ', 0),
(11, 'giáp tuấn', 'giáp tuấn', '<p>gi&aacute;p tuấn</p>', '2019-10-11 00:00:00', 'giáp tuấn', 0),
(15, 'giap 12', 'giap 12', '<p>gi&aacute;p 12</p>', '2019-10-12 00:00:00', 'giáp 12', 0),
(16, 'an trần ', 'an trần', '<p>an trần</p>', '2019-10-12 00:00:00', 'an trần', 0),
(17, 'title ', 'desc', '<p>content Linh Trần</p>', '2019-10-12 00:00:00', 'Linh Trần', 0),
(18, 'quan 1', 'quan 1', '<p>quan 1</p>', '2019-10-12 00:00:00', 'quan 1', 0),
(19, 'bong da', 'chuyên mục bóng đá', '<p>chuy&ecirc;n mục b&oacute;ng đ&aacute;</p>', '2019-10-12 00:00:00', 'chuyên mục bóng đá', 0),
(21, 'linh tran 2', 'linh tran 2', '<p>linh tran 2</p>', '2019-10-12 00:00:00', 'linh tran 2', 0),
(22, 'linh tran 3', 'linh tran 3', '<p>linh tran 3</p>', '2019-10-12 00:00:00', 'linh tran 3', 0),
(23, 'linh tran 4', 'linh tran 5', '<p>sss</p>', '2019-10-12 00:00:00', 'bbb', 0),
(24, 'linh', 'linh', '<p>linh 12</p>', '2019-10-12 00:00:00', 'linh 12', 0),
(34, 'van anh dao', 'van anh dao', '<p>van anh dao</p>', '2019-10-12 00:00:00', 'van anh dao', 1),
(43, 'admin1', 'admin12', '<p>admin12</p>', '2019-10-14 00:00:00', 'admin12', 1),
(45, 'giáp trần 356789', 'giáp trần 35', '<p>gi&aacute;p trần đẹp trai đẹp trai 456</p>', '2019-10-15 00:00:00', 'giáp trần 456', 1),
(46, 'an trần 123', 'an trần 123', '<h2>The world\'s first rich text editor in the cloud</h2>\r\n\r\n  <p>\r\n    Have you heard about Tiny Cloud? It\'s the first step in our journey to help you deliver great content creation experiences, no matter your level of expertise. 50,000 developers already agree. They get free access to our global Content Delivery Network, image proxy services and auto updates to the TinyMCE editor. They\'re also ready for some exciting updates coming soon.\r\n  </p>\r\n\r\n  <p>\r\n    One of these enhancements is <strong>Tiny Drive</strong>: imagine file management for TinyMCE, in the cloud, made super easy. Learn more at <a href=\"https://www.tiny.cloud/docs/plugins/drive/#liveexample\">our working demo</a>, where you\'ll find an opportunity to provide feedback to the product team.\r\n  </p>', '2019-10-15 00:00:00', 'An trần ', 1),
(47, 'tuấn', 'tuấn ', '<p>tuấn</p>', '2019-10-15 00:00:00', 'tuấn', 1),
(48, 'Công Phượng', 'Tuấn Anh', '<p>C&ocirc;ng Phượng</p>', '2019-10-15 00:00:00', 'giáp trần ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PHONE` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `USER_NAME`, `PASSWORD`, `EMAIL`, `PHONE`, `CITY`) VALUES
(58, 'admin', 'admin', 'admin@gmail.com', '0914862929', 'Hà Nội');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
