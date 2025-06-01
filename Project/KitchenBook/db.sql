-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 12:17 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` smallint(10) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `role`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'mhnZQmZZF6BbKWTNv6_Y58mZNHl_p5Ba', '$2y$13$dspdxDGwnBmOAm74KF5cqeAStF7ImuQHczqPQGSMwZorsc8QiS..a', '', 'admin@admin.com', 10, 0, 1552942527, 1552942527),
(4, 'admintie', 'rp-FiKtfrZ314DTelhSdus0jgDu2tBMv', '$2y$13$dH5wfhoiBRVLULzceRe4FObl1z8TfbtE47kN/BNCYRS7sDA8boGxe', '', 'admintie@admintak.com', 10, 0, 1553211545, 1553211545),
(5, 'Samer Allahham', 'UYqG1_9yJ0thpWXwcIRA6H40Yn7mOVu7', '$2y$13$jTIgJ3kwAac2uV5S7uqqTOHe.GmxVCr/OJM49Yfy.LhvOl0bAamSq', '', 'Samer@gmail.com', 10, 0, 1553211730, 1553211730),
(6, 'Samer Allahham', 'kS9CGbfFqEnYBSFdyc3a1aHNzIfeb67s', '$2y$13$S44RX9spjN3LavZzhrGb/OomOij4nMUIGhPzY/.TB.SBEjtV8m6Wi', '', 'Samer@gmail.com', 10, 0, 1553211829, 1553211829),
(7, 'New Admin', 'oNsizvgPRUdIpMvbY1qkMKTlt094bg-c', '$2y$13$lus.kekYJ1Brgl..y3a2leU25iNMq3C8UuKYoKZkxCOazUlZNC6EG', '', 'admin@new.com', 10, 0, 1553254500, 1553254500);

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `album_recipe` int(11) DEFAULT NULL,
  `album_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `album_recipe`, `album_name`) VALUES
(1, NULL, 'OnionRings'),
(2, NULL, 'New Album'),
(3, NULL, 'this'),
(4, NULL, 'Onion Album'),
(5, NULL, 'Rings Album'),
(6, NULL, 'Great'),
(7, NULL, 'fasldkfj;'),
(8, NULL, 'Really long'),
(9, NULL, 'burger'),
(10, NULL, 'bread'),
(11, NULL, 'broa');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(15) NOT NULL,
  `category_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'Japanese', 'Japanese food'),
(2, 'Fast food', 'Fast food, quick snacks for daily use'),
(3, 'Chinese', 'chinese'),
(5, 'Bread', 'Bread recipes'),
(6, 'Chicken', 'Chicken recipes'),
(7, 'Cookies', 'Cookies recipes'),
(8, 'Shrimp', 'Shrimp recipes');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_owner` int(11) NOT NULL,
  `comment_recipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment`, `comment_owner`, `comment_recipe`) VALUES
(109, 'How to beef the beef??', 4, 101),
(110, 'Greate Recipe', 4, 101),
(111, 'serialize\r\n', 4, 101),
(112, 'serialize\r\n', 4, 101),
(113, 'testing123', 4, 101),
(114, 'fasdfasdfasd', 4, 101),
(115, 'Why?', 4, 101),
(116, 'DF;LASDJF;ASDIDJFJ', 4, 101),
(117, 'dfgsafdsadfsa', 4, 101),
(118, 'sdsad', 4, 101),
(119, 'Oh yeah', 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `like_id` int(11) NOT NULL,
  `like_owner` int(11) NOT NULL,
  `like_recipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` smallint(10) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Guest', '6oYCtjdPS6j_YAATAxoc7RlyfQehW6fj', '$2y$13$A0Q0lBmwrMWraVYXy9K1we7bWTkWeTiGQUiutPLIs7Ls.DimAxE7.', '', 'guest@onionrings.com', 10, 0, 1552494012, 1552494012),
(3, 'admin', 'mhnZQmZZF6BbKWTNv6_Y58mZNHl_p5Ba', '$2y$13$6NjBW8khId9jZAqMiklfrulimlBAcPjlmng16dsJrgDr.PGXO6QCm', '', 'admin@admin.com', 10, 0, 1552942527, 1552942527),
(4, 'Sam', 'NED0jaFoX-C6X-syyJWOY7etIiVZingU', '$2y$13$dspdxDGwnBmOAm74KF5cqeAStF7ImuQHczqPQGSMwZorsc8QiS..a', '', 'sr.allahham@gmail.com', 10, 0, 1552948175, 1552948175),
(5, 'Jhonny', 'oOgK9irZ1SEw2BgN0dCHQUrm63tpGuIF', '$2y$13$0pNAYBpby8C4.k7wGo64QuinDiVxja1Z0AUUxt8/HHLsUc3rWOOLK', '', 'j@j.com', 10, 0, 1554228992, 1554228992),
(6, 'Samer', 'AxsyookaZhri-Vq0ugvJNvixTZD_ylB0', '$2y$13$iNjrm4vMgmIC/AqibpDUxOYfBp9tF2L92FVSeIXoJX8r8qKMfgJ.y', '', 'sr.sr@sr.sr', 10, 0, 1554291964, 1554291964),
(7, 'jerry', 'HdlkKE29x81aWCbEbQLfovefvohpNmla', '$2y$13$cnAjz3mKaCd8WFGnqkFM4uIIfkmVaa5ZjLbOCs.C1FSJUu7QNjTse', '', 'jerry@j.com', 10, 0, 1554552012, 1554552012);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1552493108),
('m130524_201442_init', 1552493116);

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `picture_id` int(11) NOT NULL,
  `picture_title` varchar(255) DEFAULT NULL,
  `picture_path` varchar(255) NOT NULL,
  `picture_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`picture_id`, `picture_title`, `picture_path`, `picture_album`) VALUES
(32, '15534350635c9789b7bdc621.17058424.jpg', 'uploads/15534350635c9789b7bdc621.17058424.jpg', 6),
(33, '15535180475c98cddf3fbdb5.22255191.jpg', 'uploads/15535180475c98cddf3fbdb5.22255191.jpg', 9),
(34, '1073329.jpg', 'uploads/1073329.jpg.jpg', 10),
(35, '5440065.jpg', 'uploads/5440065.jpg.jpg', 10),
(36, '6126397.jpg', 'uploads/6126397.jpg.jpg', 10),
(37, '6254255.jpg', 'uploads/6254255.jpg.jpg', 10),
(38, '15542066985ca34fea6490f7.20638982.jpg', 'uploads/15542066985ca34fea6490f7.20638982.jpg', 10),
(39, '6250174.jpg', 'uploads/6250174.jpg.jpg', 11),
(40, '6429133.jpg', 'uploads/6429133.jpg.jpg', 11),
(41, '15542094135ca35a85528922.18252148.jpg', 'uploads/15542094135ca35a85528922.18252148.jpg', 11);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rate_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `rate_owner` int(11) NOT NULL,
  `rate_recipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`rate_id`, `rate`, `rate_owner`, `rate_recipe`) VALUES
(42, 3, 4, 101),
(43, 4, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `recipe_id` int(11) NOT NULL,
  `recipe_title` varchar(45) NOT NULL,
  `recipe_picture` varchar(255) NOT NULL,
  `recipe_date` date NOT NULL,
  `recipe_owner` int(11) NOT NULL,
  `recipe_preparation` text,
  `recipe_category` int(11) NOT NULL,
  `recipe_album` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `recipe_title`, `recipe_picture`, `recipe_date`, `recipe_owner`, `recipe_preparation`, `recipe_category`, `recipe_album`) VALUES
(100, 'My first recipe', '15530183555c912df3c86429.51204383.jpg', '2019-03-24', 4, 'this is going good', 1, 6),
(101, 'Cheese burger', '15530179445c912c58d73fa1.22189712.jpg', '2019-03-25', 4, 'You take the beef and beef it then take the cheese and cheese it ... you are all set :)', 2, 9),
(102, 'Cheese burger', '15530179445c912c58d73fa1.22189712.jpg', '2019-03-25', 4, 'You take the beef and beef it then take the cheese and cheese it ... you are all set :)', 2, 9),
(103, 'Hamburger Buns', '15542066985ca34fea6490f7.20638982.jpg', '2019-04-02', 4, 'Combine the milk, 1 cup of water, butter, sugar and salt in a saucepan. Bring to a boil then remove from the heat and let stand until lukewarm. If the mixture is too hot, it will kill the yeast.\nIn a large bowl, stir together the flour and yeast. Pour in wet ingredients and stir until the dough starts to pull together. If you have a stand mixer, use the dough hook to mix for about 8 minutes. If not, knead the dough on a floured surface for about 10 minutes. Place the dough in a greased bowl, turning to coat. Cover and let stand until doubled in size, about 1 hour.\nPunch down the dough and divide into 12 portions They should be a little larger than a golf ball. Make tight balls out of the dough by pulling the dough tightly around and pinching it at the bottom. Place on a baking sheet lined with parchment paper or aluminum foil. After the rolls sit for a minute and relax, flatten each ball with the palm of your hand until it is 3 to 4 inches wide. You may want to oil your hand first. Set rolls aside until they double in size, about 20 minutes.\nPreheat the oven to 400 degrees F (200 degrees C). Mix together the egg yolk and 1 tablespoon of water in a cup or small bowl. Brush onto the tops of the rolls. Position 2 oven racks so they are not too close to the top or bottom of the oven.\nBake for 10 minutes in the preheated oven. Remove the rolls from the oven and return them to different shelves so each one spends a little time on the top. Continue to bake for another 5 to 10 minutes, or until nicely browned on the top and bottom.', 5, 10),
(104, 'Broa', '15542094135ca35a85528922.18252148.jpg', '2019-04-02', 4, 'Heat milk in a small saucepan over medium heat until it begins to bubble. Whisk in butter and 2 teaspoons sugar. Add cornmeal and whisk until mixture reaches a thick, sauce-like consistency. Remove from heat and let cool to room temperature.\r\n\r\nIn the meantime, sprinkle yeast and a pinch of sugar over warm water. Stir and let stand until yeast softens and begins to form a creamy foam, about 5 minutes.\r\nCombine flour and salt in the bowl of a stand mixture fitted with the dough hook. Add the yeast mixture and mix on low speed. Slowly pour in the milk mixture. Knead into a slightly dense dough. Remove from the bowl and roll into a ball.\r\n\r\nGrease the sides of a bowl or pot with olive oil and add the dough. Cover with plastic wrap and let rise in a warm place until doubled in volume, about 2 hours.\r\nPunch dough down and roll into 2 boules, or flat-bottomed balls. Place boules on a baking sheet lined with a silicone mat. Sprinkle tops with flour and cover with plastic wrap again. Let rise until puffy, about 1 hour.\r\n\r\nPreheat the oven to 500 degrees F (260 degrees C). Fill an oven-proof pot with 4 to 5 cups water and place on the bottom rack of the preheating oven.\r\nCut 4 shallow slits into the tops of the puffed bread boules in a cross pattern, 2 parallel lines up and 2 across.\r\nBake in the preheated oven for 10 minutes. Spritz tops with water from a spray bottle. Reduce oven temperature to 400 degrees F (200 degrees C) and continue baking until crusts are a deep brown, about 20 minutes. Remove breads from the pan and let cool for 20 minutes.', 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_name` varchar(15) NOT NULL,
  `ingredient_unit` varchar(11) NOT NULL,
  `ingredient_quantity` int(11) DEFAULT NULL,
  `ingredient_desc` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_ingredient_id`, `recipe_id`, `ingredient_name`, `ingredient_unit`, `ingredient_quantity`, `ingredient_desc`) VALUES
(33, 101, 'cheese', 'kg', 1, 'beef'),
(34, 101, 'beef', 'pc', 2, 'beef'),
(35, 103, 'milk', 'cup', 1, ''),
(36, 103, 'water', 'cup', 1, ''),
(37, 103, 'butter', 'spoon', 2, ''),
(38, 103, 'sugar', 'spoon', 1, ''),
(39, 103, 'salt', 'spoon', 1, ''),
(40, 103, 'flour', 'cup', 5, 'all-purpose'),
(41, 103, 'egg', 'piece', 1, ''),
(42, 104, 'milk', 'cup', 1, ''),
(43, 104, 'butter', 'pat', 4, 'unsalted'),
(44, 104, 'sugar', 'tesspoon', 2, 'white sugar'),
(45, 104, 'cornmeal', 'cup', 2, ''),
(46, 104, 'dry yeast', 'pack', 1, 'active yeast'),
(47, 104, 'water', 'cup', 1, 'warm water'),
(48, 104, 'flour', 'cup', 3, 'all-purpose'),
(49, 104, 'salt', 'teaspoon', 1, ''),
(50, 104, 'olive oil', 'teaspoon', 1, 'or to taste');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit_name`) VALUES
(1, 'Kg'),
(2, 'G'),
(3, 'Li'),
(4, 'Ml'),
(5, 'pcs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `fk_album_recipe_idx` (`album_recipe`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `fk_auth_assignment_idx` (`item_name`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `fk_auth_item_auth_rule1_idx` (`rule_name`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `fk_auth_item_child_auth_item1_idx` (`parent`),
  ADD KEY `fk_auth_item_child_auth_item2_idx` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_Comment_User1_idx` (`comment_owner`),
  ADD KEY `fk_Comment_Recipe1_idx` (`comment_recipe`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `like_owner` (`like_owner`,`like_recipe`),
  ADD KEY `fk_Like_User1_idx` (`like_owner`),
  ADD KEY `fk_Like_Recipe1_idx` (`like_recipe`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`picture_id`),
  ADD KEY `fk_picture_album1_idx` (`picture_album`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`rate_id`),
  ADD UNIQUE KEY `rate_owner` (`rate_owner`,`rate_recipe`),
  ADD KEY `fk_Rates_User1_idx` (`rate_owner`),
  ADD KEY `fk_Rates_Recipe1_idx` (`rate_recipe`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `fk_Recipe_User1_idx` (`recipe_owner`),
  ADD KEY `fk_Recipe_Category1_idx` (`recipe_category`),
  ADD KEY `recipe_album` (`recipe_album`);

--
-- Indexes for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_ingredient_id`),
  ADD KEY `fk_Recipe_Ingredient_Recipe1_idx` (`recipe_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `picture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  MODIFY `recipe_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_album_recipe` FOREIGN KEY (`album_recipe`) REFERENCES `recipe` (`recipe_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `fk_auth_assignment` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `fk_auth_item_auth_rule1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `fk_auth_item_child_auth_item1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auth_item_child_auth_item2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_Comment_Recipe1` FOREIGN KEY (`comment_recipe`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Comment_User1` FOREIGN KEY (`comment_owner`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `fk_Like_Recipe1` FOREIGN KEY (`like_recipe`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Like_User1` FOREIGN KEY (`like_owner`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `fk_picture_album1` FOREIGN KEY (`picture_album`) REFERENCES `album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `fk_Rates_Recipe1` FOREIGN KEY (`rate_recipe`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rates_User1` FOREIGN KEY (`rate_owner`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `fk_Recipe_Category1` FOREIGN KEY (`recipe_category`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recipe_User1` FOREIGN KEY (`recipe_owner`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`recipe_album`) REFERENCES `album` (`album_id`);

--
-- Constraints for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `fk_Recipe_Ingredient_Recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
