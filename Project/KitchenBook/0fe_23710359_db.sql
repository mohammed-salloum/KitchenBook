-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql109.0fees.us
-- Generation Time: Apr 14, 2019 at 04:20 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `0fe_23710359_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` smallint(10) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

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

CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_recipe` int(11) DEFAULT NULL,
  `album_name` varchar(15) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_album_recipe_idx` (`album_recipe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

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
(11, NULL, 'broa'),
(12, NULL, 'cloud'),
(13, NULL, 'cracked wheat'),
(14, NULL, 'Kung pau'),
(15, NULL, 'Tsao'),
(16, NULL, 'katso'),
(17, NULL, 'cake');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `fk_auth_assignment_idx` (`item_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_auth_item_auth_rule1_idx` (`rule_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_auth_item_child_auth_item1_idx` (`parent`),
  KEY `fk_auth_item_child_auth_item2_idx` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(15) NOT NULL,
  `category_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `comment_owner` int(11) NOT NULL,
  `comment_recipe` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_Comment_User1_idx` (`comment_owner`),
  KEY `fk_Comment_Recipe1_idx` (`comment_recipe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

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
(119, 'Oh yeah', 5, 100),
(120, 'Wow', 10, 103);

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `like_owner` int(11) NOT NULL,
  `like_recipe` int(11) NOT NULL,
  PRIMARY KEY (`like_id`),
  UNIQUE KEY `like_owner` (`like_owner`,`like_recipe`),
  KEY `fk_Like_User1_idx` (`like_owner`),
  KEY `fk_Like_Recipe1_idx` (`like_recipe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`like_id`, `like_owner`, `like_recipe`) VALUES
(1, 8, 104),
(2, 8, 103),
(3, 10, 103);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` smallint(10) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Guest', '6oYCtjdPS6j_YAATAxoc7RlyfQehW6fj', '$2y$13$A0Q0lBmwrMWraVYXy9K1we7bWTkWeTiGQUiutPLIs7Ls.DimAxE7.', '', 'guest@onionrings.com', 10, 0, 1552494012, 1552494012),
(3, 'admin', 'mhnZQmZZF6BbKWTNv6_Y58mZNHl_p5Ba', '$2y$13$6NjBW8khId9jZAqMiklfrulimlBAcPjlmng16dsJrgDr.PGXO6QCm', '', 'admin@admin.com', 10, 0, 1552942527, 1552942527),
(4, 'Sam', 'NED0jaFoX-C6X-syyJWOY7etIiVZingU', '$2y$13$dspdxDGwnBmOAm74KF5cqeAStF7ImuQHczqPQGSMwZorsc8QiS..a', '', 'sr.allahham@gmail.com', 10, 0, 1552948175, 1552948175),
(5, 'Jhonny', 'oOgK9irZ1SEw2BgN0dCHQUrm63tpGuIF', '$2y$13$0pNAYBpby8C4.k7wGo64QuinDiVxja1Z0AUUxt8/HHLsUc3rWOOLK', '', 'j@j.com', 10, 0, 1554228992, 1554228992),
(6, 'Samer', 'AxsyookaZhri-Vq0ugvJNvixTZD_ylB0', '$2y$13$iNjrm4vMgmIC/AqibpDUxOYfBp9tF2L92FVSeIXoJX8r8qKMfgJ.y', '', 'sr.sr@sr.sr', 10, 0, 1554291964, 1554291964),
(7, 'jerry', 'HdlkKE29x81aWCbEbQLfovefvohpNmla', '$2y$13$cnAjz3mKaCd8WFGnqkFM4uIIfkmVaa5ZjLbOCs.C1FSJUu7QNjTse', '', 'jerry@j.com', 10, 0, 1554552012, 1554552012),
(8, 'Mohamad Salloum', '7Bju9KHgSPUhqBvWtxGpbC2HG1PMIJoX', '$2y$13$V9ZsRfw4LYm9GyTWcofZlOgh0mCiRY0JfYyg3GwH49JDlXGTxRrhS', '', 'mohamad.e.salloum.sy@gmail.com', 10, 0, 1554815517, 1554815517),
(9, 'viewer', 'pgm7Gmt8DM_iPohACpcfSS0LVGf_h6Vp', '$2y$13$Ep/0qLga7zj.MD/XS4K5hOcdjHsXRAvwdRyBptTg1UUwGX5TnMNLO', '', 'viewer@this.com', 10, 0, 1554815726, 1554815726),
(10, 'Yara', 'eSsT2q5vda0uG_-r88Ujc45Ywl_zsREz', '$2y$13$sRpusDTjYFmd.81c1yvFaejq0lSlIi9NWzfPpemth3/fCjsRsRYga', '', 'Yara@sam.com', 10, 0, 1555003413, 1555003413);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_title` varchar(255) DEFAULT NULL,
  `picture_path` varchar(255) NOT NULL,
  `picture_album` int(11) NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `fk_picture_album1_idx` (`picture_album`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`picture_id`, `picture_title`, `picture_path`, `picture_album`) VALUES
(44, '15552467765cb32eb8a23b50.22021267.jpg', 'uploads/15552467765cb32eb8a23b50.22021267.jpg', 12),
(42, '5861700.jpg', 'uploads/5861700.jpg.jpg', 12),
(43, 'main.jpg', 'uploads/main.jpg.jpg', 12),
(34, '1073329.jpg', 'uploads/1073329.jpg.jpg', 10),
(35, '5440065.jpg', 'uploads/5440065.jpg.jpg', 10),
(36, '6126397.jpg', 'uploads/6126397.jpg.jpg', 10),
(37, '6254255.jpg', 'uploads/6254255.jpg.jpg', 10),
(38, '15542066985ca34fea6490f7.20638982.jpg', 'uploads/15542066985ca34fea6490f7.20638982.jpg', 10),
(39, '6250174.jpg', 'uploads/6250174.jpg.jpg', 11),
(40, '6429133.jpg', 'uploads/6429133.jpg.jpg', 11),
(41, '15542094135ca35a85528922.18252148.jpg', 'uploads/15542094135ca35a85528922.18252148.jpg', 11),
(45, 'main.jpg', 'uploads/main.jpg.jpg', 13),
(46, '15552475875cb331e3e30f32.58724918.jpg', 'uploads/15552475875cb331e3e30f32.58724918.jpg', 13),
(47, '5523066.jpg', 'uploads/5523066.jpg.jpg', 14),
(48, '5552032.jpg', 'uploads/5552032.jpg.jpg', 14),
(49, '5553742.jpg', 'uploads/5553742.jpg.jpg', 14),
(50, '5594983.jpg', 'uploads/5594983.jpg.jpg', 14),
(51, '6206214.jpg', 'uploads/6206214.jpg.jpg', 14),
(52, '6206224.jpg', 'uploads/6206224.jpg.jpg', 14),
(53, '6220241.jpg', 'uploads/6220241.jpg.jpg', 14),
(54, '6531445.jpg', 'uploads/6531445.jpg.jpg', 14),
(55, 'main.jpg', 'uploads/main.jpg.jpg', 14),
(56, '15552489105cb3370e9c5197.85452141.jpg', 'uploads/15552489105cb3370e9c5197.85452141.jpg', 14),
(57, '2934546.jpg', 'uploads/2934546.jpg.jpg', 15),
(58, '4462523.jpg', 'uploads/4462523.jpg.jpg', 15),
(59, '4533669.jpg', 'uploads/4533669.jpg.jpg', 15),
(60, '5360541.jpg', 'uploads/5360541.jpg.jpg', 15),
(61, '6478866.jpg', 'uploads/6478866.jpg.jpg', 15),
(62, 'main.jpg', 'uploads/main.jpg.jpg', 15),
(63, '15552496715cb33a071af822.71792216.jpg', 'uploads/15552496715cb33a071af822.71792216.jpg', 15),
(64, 'main.jpg', 'uploads/main.jpg.jpg', 16),
(65, '15552503865cb33cd2e802c3.15696629.jpg', 'uploads/15552503865cb33cd2e802c3.15696629.jpg', 16),
(66, '15552541405cb34b7c524819.19591492.jpg', 'uploads/15552541405cb34b7c524819.19591492.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` int(11) NOT NULL,
  `rate_owner` int(11) NOT NULL,
  `rate_recipe` int(11) NOT NULL,
  PRIMARY KEY (`rate_id`),
  UNIQUE KEY `rate_owner` (`rate_owner`,`rate_recipe`),
  KEY `fk_Rates_User1_idx` (`rate_owner`),
  KEY `fk_Rates_Recipe1_idx` (`rate_recipe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`rate_id`, `rate`, `rate_owner`, `rate_recipe`) VALUES
(42, 3, 4, 101),
(43, 4, 5, 100),
(44, 5, 8, 104),
(45, 5, 10, 103);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_title` varchar(45) NOT NULL,
  `recipe_picture` varchar(255) NOT NULL,
  `recipe_date` date NOT NULL,
  `recipe_owner` int(11) NOT NULL,
  `recipe_preparation` text,
  `recipe_category` int(11) NOT NULL,
  `recipe_album` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `fk_Recipe_User1_idx` (`recipe_owner`),
  KEY `fk_Recipe_Category1_idx` (`recipe_category`),
  KEY `recipe_album` (`recipe_album`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `recipe_title`, `recipe_picture`, `recipe_date`, `recipe_owner`, `recipe_preparation`, `recipe_category`, `recipe_album`) VALUES
(105, 'Cloud bread', '15552467765cb32eb8a23b50.22021267.jpg', '2019-04-14', 4, 'Preheat the oven to 300 degrees F (150 degrees C). Line a baking sheet with parchment paper.\r\nBeat egg whites in a glass, metal, or ceramic bowl until foamy. Add baking powder and continue to beat until stiff peaks form.\r\n\r\nWhisk egg yolks, cream cheese, Italian herbs, and salt in a separate bowl until well blended.\r\nGently fold cream cheese mixture into the beaten egg whites with a spatula until just mixed and yellow. Spoon mixture into about 6 rounds of about 3 inches diameter on the baking sheet. \r\nSmooth the tops with the back of a spoon.\r\nBake in the preheated oven until golden brown, about 25 minutes. Remove from the oven and serve warm, or allow to cool.', 1, 12),
(103, 'Hamburger Buns', '15542066985ca34fea6490f7.20638982.jpg', '2019-04-02', 4, 'Combine the milk, 1 cup of water, butter, sugar and salt in a saucepan. Bring to a boil then remove from the heat and let stand until lukewarm. If the mixture is too hot, it will kill the yeast.\nIn a large bowl, stir together the flour and yeast. Pour in wet ingredients and stir until the dough starts to pull together. If you have a stand mixer, use the dough hook to mix for about 8 minutes. If not, knead the dough on a floured surface for about 10 minutes. Place the dough in a greased bowl, turning to coat. Cover and let stand until doubled in size, about 1 hour.\nPunch down the dough and divide into 12 portions They should be a little larger than a golf ball. Make tight balls out of the dough by pulling the dough tightly around and pinching it at the bottom. Place on a baking sheet lined with parchment paper or aluminum foil. After the rolls sit for a minute and relax, flatten each ball with the palm of your hand until it is 3 to 4 inches wide. You may want to oil your hand first. Set rolls aside until they double in size, about 20 minutes.\nPreheat the oven to 400 degrees F (200 degrees C). Mix together the egg yolk and 1 tablespoon of water in a cup or small bowl. Brush onto the tops of the rolls. Position 2 oven racks so they are not too close to the top or bottom of the oven.\nBake for 10 minutes in the preheated oven. Remove the rolls from the oven and return them to different shelves so each one spends a little time on the top. Continue to bake for another 5 to 10 minutes, or until nicely browned on the top and bottom.', 2, 10),
(104, 'Broa', '15542094135ca35a85528922.18252148.jpg', '2019-04-02', 3, 'Heat milk in a small saucepan over medium heat until it begins to bubble. Whisk in butter and 2 teaspoons sugar. Add cornmeal and whisk until mixture reaches a thick, sauce-like consistency. Remove from heat and let cool to room temperature.\r\n\r\nIn the meantime, sprinkle yeast and a pinch of sugar over warm water. Stir and let stand until yeast softens and begins to form a creamy foam, about 5 minutes.\r\nCombine flour and salt in the bowl of a stand mixture fitted with the dough hook. Add the yeast mixture and mix on low speed. Slowly pour in the milk mixture. Knead into a slightly dense dough. Remove from the bowl and roll into a ball.\r\n\r\nGrease the sides of a bowl or pot with olive oil and add the dough. Cover with plastic wrap and let rise in a warm place until doubled in volume, about 2 hours.\r\nPunch dough down and roll into 2 boules, or flat-bottomed balls. Place boules on a baking sheet lined with a silicone mat. Sprinkle tops with flour and cover with plastic wrap again. Let rise until puffy, about 1 hour.\r\n\r\nPreheat the oven to 500 degrees F (260 degrees C). Fill an oven-proof pot with 4 to 5 cups water and place on the bottom rack of the preheating oven.\r\nCut 4 shallow slits into the tops of the puffed bread boules in a cross pattern, 2 parallel lines up and 2 across.\r\nBake in the preheated oven for 10 minutes. Spritz tops with water from a spray bottle. Reduce oven temperature to 400 degrees F (200 degrees C) and continue baking until crusts are a deep brown, about 20 minutes. Remove breads from the pan and let cool for 20 minutes.', 5, 11),
(106, 'Cracked wheat bread', '15552475875cb331e3e30f32.58724918.jpg', '2019-04-14', 4, 'In a small saucepan, bring water to a boil. Stir in cracked wheat and simmer for 10 minutes; let cool to lukewarm. In a small bowl, dissolve yeast in warm water. Let stand until creamy, about 10 minutes.\r\n\r\nPour the cracked wheat mixture into a large bowl. Stir in the butter, salt, molasses, honey, milk, yeast mixture, whole wheat flour and 2 cups of the bread flour; stir well to combine. Stir in the remaining flour, 1/2 cup at a time, beating well after each addition.\r\n\r\nWhen the dough has pulled together, turn it out onto a lightly floured surface and knead until smooth and elastic, about 10 minutes. Lightly oil a large bowl, place the dough in the bowl and turn to coat with oil. Cover with a damp cloth and let rise in a warm place until doubled in volume, about 1 hour.\r\n\r\nDeflate the dough and turn it out onto a lightly floured surface. Divide the dough into two equal pieces and form into loaves. Place the loaves into two lightly greased 9x5 inch loaf pans. Cover the loaves with a damp cloth and let rise until doubled in volume, about 40 minutes. Meanwhile, preheat oven to 375 degrees F (190 degrees C).\r\n\r\nBake in a preheated 375 degree oven 30 to 35 minutes, or until the loaves sound hollow when tapped on top and bottom. Cool on racks.', 6, 13),
(107, 'Kung Pao chicken', '15552489105cb3370e9c5197.85452141.jpg', '2019-04-14', 4, 'To Make Marinade: Combine 1 tablespoon wine, 1 tablespoon soy sauce, 1 tablespoon oil and 1 tablespoon cornstarch/water mixture and mix together. Place chicken pieces in a glass dish or bowl and add marinade. Toss to coat. Cover dish and place in refrigerator for about 30 minutes.\r\n\r\nTo Make Sauce: In a small bowl combine 1 tablespoon wine, 1 tablespoon soy sauce, 1 tablespoon oil, 1 tablespoon cornstarch/water mixture, chili paste, vinegar and sugar. Mix together and add green onion, garlic, water chestnuts and peanuts. In a medium skillet, heat sauce slowly until aromatic.\r\n\r\nMeanwhile, remove chicken from marinade and saute in a large skillet until meat is white and juices run clear. When sauce is aromatic, add sauteed chicken to it and let simmer together until sauce thickens.', 7, 14),
(108, 'Tsao Mi Fun', '15552496715cb33a071af822.71792216.jpg', '2019-04-14', 4, 'Place the pork into a mixing bowl and pour in the soy sauce and rice wine. Sprinkle with the white pepper, five-spice powder, and cornstarch. Mix well, then set aside to marinate. Soak the mushrooms in a bowl of cold water for 20 minutes, then pour off the water, cut off and discard the stems of the mushrooms. Slice the mushrooms thinly and reserve. Soak the rice vermicelli in a separate bowl of cold water for 10 minutes, then pour off the water and set the noodles aside.\r\nHeat 1 tablespoon of the vegetable oil in a wok or large skillet over medium heat. Pour in the eggs, and cook until firm, flipping once, to make a pancake. Remove the egg pancake, and allow to cool, then thinly slice and place into a large bowl. Heat 2 more tablespoons of the vegetable oil in the wok over high heat. Stir in the garlic and dried shrimp, and cook until the shrimp become aromatic, about 20 seconds. Next, add the pork along with the marinade, and cook until the pork is no longer pink, about 4 minutes. Stir in the carrots and onion, and cook until the carrots begin to soften, about 3 minutes. Finally, add the bean sprouts, napa cabbage, and sliced mushrooms; cook and stir until the vegetables are tender, about 3 minutes more. Scrape the pork mixture into the bowl along with the eggs, then wipe out the wok and return it to the stove over medium-high heat.\r\nHeat the remaining vegetable oil in the wok, then stir in the drained rice vermicelli noodles. Cook and stir for a few minutes until the noodles soften, then stir in the reserved pork mixture. Scrape the mixture in to a serving bowl and garnish with cilantro to serve.', 8, 15),
(109, 'Chicken Katsu', '15552503865cb33cd2e802c3.15696629.jpg', '2019-04-14', 4, 'For the sauce, stir together the Worcestershire sauce, ketchup, and soy sauce, and a pinch of pepper to taste. Set aside.\r\nHeat oil in deep-fryer to 350 degrees F (175 degrees C).\r\nPlace flour and panko bread crumbs onto separate plates and season with salt and pepper. Place the beaten egg in a medium bowl. Dip flattened chicken pieces first into flour, then egg, and lastly bread crumbs.\r\nFry breaded chicken breasts in preheated oil until golden brown and no longer pink in center, about 8 minutes. Transfer to a paper towel-lined plate to absorb excess oil. Slice chicken into thin strips and top with a drizzle of sauce and a sprinkling of sliced green onions. Serve remaining sauce on the side for dipping.', 3, 16),
(110, 'Cheese cake', '15552541405cb34b7c524819.19591492.jpg', '2019-04-14', 4, 'Preheat oven to 325 degrees F (165 degrees C). Lightly grease an 8-inch round cake pan and line with parchment paper.\r\nPlace cream cheese in a bowl with milk; soak for 20 minutes.\r\nHeat cream cheese with milk and butter in the top of a double boiler over simmering water, stirring frequently, until melted and smooth, about 5 minutes. Remove from heat and cool completely, at least 15 minutes.\r\nSift cake flour and cornstarch together into a bowl. Sift again into the cream cheese mixture; mix well. Add egg yolks and lemon juice and mix well.\r\nBeat egg whites, cream of tartar, and salt together in a separate bowl using an electric mixer until foamy; add sugar, 2 tablespoons at a time, beating well after each addition. Continue beating on high speed until soft peaks form.\r\nFold cream cheese mixture into egg white mixture until well mixed; pour into the prepared pan. Place pan inside a larger baking dish and fill the baking dish with water until it reaches halfway up the sides of the cake pan.\r\nBake in the preheated oven until cheesecake is set and golden brown on top, about 1 hour 10 minutes. Turn off oven and leave cake in oven with door ajar for 1 hour. Transfer to a wire rack to cool completely.', 5, 17);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredient`
--

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `recipe_ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `ingredient_name` varchar(15) NOT NULL,
  `ingredient_unit` varchar(11) NOT NULL,
  `ingredient_quantity` int(11) DEFAULT NULL,
  `ingredient_desc` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`recipe_ingredient_id`),
  KEY `fk_Recipe_Ingredient_Recipe1_idx` (`recipe_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

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
(50, 104, 'olive oil', 'teaspoon', 1, 'or to taste'),
(51, 105, 'Egg', 'PCs', 2, 'Seperated'),
(52, 105, 'baking powder', 'spoon', 1, ''),
(53, 105, 'Cream cheese', 'spoon', 2, 'softened'),
(54, 105, 'Salt', 'pinch', 1, ''),
(55, 105, 'Italian herb', 'spoon', 2, 'Blend'),
(56, 106, 'water', 'cups', 1, 'warm'),
(57, 106, 'wheat', 'cups', 1, 'cracked'),
(58, 106, 'dry yeast', 'package', 1, 'active yeast'),
(59, 106, 'Butter', 'spoon', 2, 'softened'),
(60, 106, 'Salt', 'spoon', 1, ''),
(61, 106, 'molasses', 'spoon', 1, ''),
(62, 106, 'honey', 'spoon', 1, ''),
(63, 106, 'Milk', 'cups', 1, ''),
(64, 106, 'Flour', 'cups', 1, 'All-purpose'),
(65, 106, 'Wheat flour', 'cups', 1, ''),
(66, 107, 'Chicken', 'pound', 1, 'skinless'),
(67, 107, 'Wine', 'spoon', 2, 'white wine'),
(68, 107, 'Soy souce', 'spoon', 2, ''),
(69, 107, 'Sesame oil', 'spoon', 2, ''),
(70, 107, 'Hot chile paste', 'spoon', 2, ''),
(71, 107, 'Green onion', 'PCs', 2, 'chopped'),
(72, 108, 'Beef', 'pound', 1, 'thinly sliced'),
(73, 108, 'Soy souce', 'cups', 1, ''),
(74, 108, 'White pepper', 'spoon', 1, ''),
(75, 108, 'Cornstarch', 'spoon', 1, ''),
(76, 108, 'Mashrooms', 'PCs', 4, 'Chinese black'),
(77, 108, 'Rice', 'package', 1, 'Dried'),
(78, 108, 'Bean', 'cups', 3, ''),
(79, 108, 'Salt', 'pinch', 1, ''),
(80, 108, 'cilantro', 'springs', 3, ''),
(81, 109, 'Worcestershire ', 'cups', 1, ''),
(82, 109, 'ketchup', 'spoon', 5, ''),
(83, 109, 'Pepper', 'pinch', 1, ''),
(84, 109, 'Vegetable oil', 'cups', 2, 'for frying'),
(85, 109, 'Flour', 'cups', 1, 'all-purpose'),
(86, 110, 'Cream cheese', 'package', 1, 'cubed'),
(87, 110, 'Milk', 'cup', 1, ''),
(88, 110, 'Butter', 'spoons', 3, 'unsalted'),
(89, 110, 'Flour', 'spoon', 10, ''),
(90, 110, 'Cornstarch', 'spoon', 2, ''),
(91, 110, 'Egg', 'PCs', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(5) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit_name`) VALUES
(1, 'Kg'),
(2, 'G'),
(3, 'Li'),
(4, 'Ml'),
(5, 'pcs');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
