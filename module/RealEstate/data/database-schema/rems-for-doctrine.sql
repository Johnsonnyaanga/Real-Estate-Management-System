DROP DATABASE rems;
CREATE DATABASE rems
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
USE rems;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',

  `group` int(11) unsigned NOT NULL DEFAULT '0',

--  FOREIGN KEY (`group`) REFERENCES `group`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `title` varchar(64) NOT NULL DEFAULT '',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

ALTER TABLE `user`
  ADD CONSTRAINT `user_fk_1` FOREIGN KEY (`group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `title` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `group_permission` (
  `group` int(11) unsigned NOT NULL DEFAULT '0',
  `permission` int(11) unsigned NOT NULL DEFAULT '0',
  
  FOREIGN KEY (`group`) REFERENCES `group`(`id`) ,
  FOREIGN KEY (`permission`) REFERENCES `permission`(`id`) ,
  PRIMARY KEY(`group`, `permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `original_file_name` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',



  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `house` varchar(64) NOT NULL DEFAULT '',
  `street` varchar(64) NOT NULL DEFAULT '',
  `vilege` varchar(70) NOT NULL DEFAULT '',
  `district` varchar(70) NOT NULL DEFAULT '',
  `quarter` varchar(70) NOT NULL DEFAULT '',
  `city` varchar(70) NOT NULL DEFAULT '',

  `longitude` int(11) unsigned NOT NULL DEFAULT '0',
  `latitude` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `house_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `title` varchar(50) NOT NULL DEFAULT '',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `size` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `width` int(11) unsigned NOT NULL DEFAULT '0',
  `height` int(11) unsigned NOT NULL DEFAULT '0',
  `length` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `house` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `is_room_rent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cost` int(11) unsigned NOT NULL DEFAULT '0',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `image_path_as_json_string_list` text NOT NULL,
  `otherInfo` text NOT NULL,

  `user` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `address` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`type`) REFERENCES `house_type`(`id`) ,
  FOREIGN KEY (`size`) REFERENCES `size`(`id`) ,
  FOREIGN KEY (`address`) REFERENCES `address`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `personal_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `personal_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `gender` char(1) NOT NULL DEFAULT '',
  `job` varchar(50) NOT NULL DEFAULT '',
  `age` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `phone_number_1` varchar(50) NOT NULL DEFAULT '',
  `phone_number_2` varchar(50) NOT NULL DEFAULT '',
  `others` text NOT NULL,

  `user` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`type`) REFERENCES `personal_type`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `room_number` int(11) unsigned NOT NULL DEFAULT '0',
  `cost` int(11) unsigned NOT NULL DEFAULT '0',
  `toilet` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `image_path_as_json_string_list` text NOT NULL,

  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `house` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`size`) REFERENCES `size`(`id`) ,
  FOREIGN KEY (`house`) REFERENCES `house`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `content` text NOT NULL,

  `user` int(11) unsigned NOT NULL DEFAULT '0',
  `house` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`house`) REFERENCES `house`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `value` tinyint(1) unsigned NOT NULL DEFAULT '0',

  `user` int(11) unsigned NOT NULL DEFAULT '0',
  `house` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`house`) REFERENCES `house`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `created_user` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_modified_user` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_start` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_time_end` int(11) unsigned NOT NULL DEFAULT '0',
  FOREIGN KEY (`created_user`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`last_modified_user`) REFERENCES `user`(`id`) ,

  `content` tinyint(1) unsigned NOT NULL DEFAULT '0',

  `fromUser` int(11) unsigned NOT NULL DEFAULT '0',
  `toUser` int(11) unsigned NOT NULL DEFAULT '0',

  FOREIGN KEY (`fromUser`) REFERENCES `user`(`id`) ,
  FOREIGN KEY (`toUser`) REFERENCES `user`(`id`) ,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;