CREATE TABLE `nex_notification` (
	`idx` INT(11) NOT NULL AUTO_INCREMENT,
	`severity` ENUM('Critical','Warning') NOT NULL DEFAULT 'Critical' COMMENT 'Notification���( Critical, Warning)' COLLATE 'utf8_general_ci',
	`target_system` VARCHAR(32) NULL DEFAULT NULL COMMENT 'Notification ��� ( \'Host\',\'Agent\',\'Task\',\'Framework\',\'Docker\' )' COLLATE 'utf8_general_ci',
	`target_ip` VARCHAR(32) NULL DEFAULT NULL COMMENT '�߻���� IP' COLLATE 'utf8_general_ci',
	`target` VARCHAR(124) NULL DEFAULT NULL COMMENT '�߻� ���( CPU, Memory, Disk, Netowrk, System Error..... )' COLLATE 'utf8_general_ci',
	`metric` VARCHAR(512) NULL DEFAULT NULL COMMENT '���� Metric' COLLATE 'utf8_general_ci',
	`condition` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Condition' COLLATE 'utf8_general_ci',
	`id` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Service/Task/Node/Framework�� Service ID or IP' COLLATE 'utf8_general_ci',
	`status` ENUM('S','F') NULL DEFAULT 'S' COMMENT '���� (\'S\':�߻�, \'F\':����)' COLLATE 'utf8_general_ci',
	`start_time` TIMESTAMP NULL DEFAULT NULL COMMENT '���۽ð�',
	`finish_time` TIMESTAMP NULL DEFAULT NULL COMMENT '����ð�',
	`contents` TEXT NOT NULL COMMENT 'notification ����' COLLATE 'utf8_general_ci',
	`memo` TEXT NULL COLLATE 'utf8_general_ci',
	`check_yn` CHAR(1) NOT NULL DEFAULT 'N' COLLATE 'utf8_general_ci',
	`regdt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`idx`),
	INDEX `severity` (`severity`),
	INDEX `target_system` (`target_system`),
	INDEX `target_ip` (`target_ip`),
	INDEX `id` (`id`),
	INDEX `status` (`status`),
	INDEX `start_time` (`start_time`),
	INDEX `finish_time` (`finish_time`),
	INDEX `regdt` (`regdt`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB