DROP TABLE IF EXISTS `users`;

DROP TABLE IF EXISTS `blogposts`;

DROP TABLE IF EXISTS `followers`;

DROP TABLE IF EXISTS `comments`;

DROP TABLE IF EXISTS `postpics`;

CREATE TABLE IF NOT EXISTS `users` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `name` varchar(255) NOT NULL,
        `password` varchar(255) NOT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `blogposts` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `name` varchar(255) NOT NULL,
        `content` text NOT NULL,
        `owner` bigint NOT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `followers` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `follow` bigint NOT NULL,
        `follower` bigint NOT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `comments` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `content` text NOT NULL,
        `owner_name` varchar(255) NOT NULL,
        `owner` bigint NOT NULL,
        `post` bigint NOT NULL
    ) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `postpics` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `link` varchar(255) NOT NULL,
        `post` bigint NOT NULL
    ) ENGINE=InnoDB;
