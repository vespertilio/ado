CREATE TABLE `agents` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `cell` varchar(255) collate utf8_unicode_ci default NULL,
  `position` varchar(255) collate utf8_unicode_ci default NULL,
  `org_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2053932786 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cards` (
  `id` int(11) NOT NULL auto_increment,
  `message_id` int(11) default NULL,
  `farwarded_id` int(11) default NULL,
  `status` varchar(255) collate utf8_unicode_ci default NULL,
  `file_id` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2053932786 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `claims` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `destination` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2053932786 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `commendants` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `cell` varchar(255) collate utf8_unicode_ci default NULL,
  `org_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2053932786 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `scode` int(11) default NULL,
  `number` int(11) default NULL,
  `date` date default NULL,
  `doc` varchar(255) collate utf8_unicode_ci default NULL,
  `desc` varchar(255) collate utf8_unicode_ci default NULL,
  `summ` int(11) default NULL,
  `avans` int(11) default NULL,
  `gk_date1` date default NULL,
  `gk_date2` date default NULL,
  `employee_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `data_files` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `unit` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `agent_id` int(11) default NULL,
  `obtain_at` date default NULL,
  `redirected_at` date default NULL,
  `executor_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `int_number` int(11) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `number` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `number` varchar(255) collate utf8_unicode_ci default NULL,
  `date` varchar(255) collate utf8_unicode_ci default NULL,
  `intnumber` varchar(255) collate utf8_unicode_ci default NULL,
  `desc` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `orgs` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `commendant_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `people` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `cel` varchar(255) collate utf8_unicode_ci default NULL,
  `org_id` int(11) default NULL,
  `comitet_id` int(11) default NULL,
  `other` text collate utf8_unicode_ci,
  `description` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `state` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `prices` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `item_id` int(11) default NULL,
  `price` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20091030063742');

INSERT INTO schema_migrations (version) VALUES ('20091030080908');

INSERT INTO schema_migrations (version) VALUES ('20091109124912');

INSERT INTO schema_migrations (version) VALUES ('20091109125039');

INSERT INTO schema_migrations (version) VALUES ('20091116043205');

INSERT INTO schema_migrations (version) VALUES ('20091116053023');

INSERT INTO schema_migrations (version) VALUES ('20091116053053');

INSERT INTO schema_migrations (version) VALUES ('20091116055339');

INSERT INTO schema_migrations (version) VALUES ('20091116085645');

INSERT INTO schema_migrations (version) VALUES ('20091116090104');

INSERT INTO schema_migrations (version) VALUES ('20091116095511');

INSERT INTO schema_migrations (version) VALUES ('20091116095912');

INSERT INTO schema_migrations (version) VALUES ('20091116100233');

INSERT INTO schema_migrations (version) VALUES ('20091116100530');

INSERT INTO schema_migrations (version) VALUES ('20100108103012');

INSERT INTO schema_migrations (version) VALUES ('20100209051518');

INSERT INTO schema_migrations (version) VALUES ('20100709080615');

INSERT INTO schema_migrations (version) VALUES ('20100709095307');

INSERT INTO schema_migrations (version) VALUES ('20100709102148');