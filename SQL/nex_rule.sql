CREATE TABLE `nex_rule` (
	`idx` INT(11) NOT NULL AUTO_INCREMENT,
	`target_system` VARCHAR(64) NULL DEFAULT NULL COMMENT '��� �ý��� ( H: Host, M:Master, D:Docker, P:Process, A: Agent, T : Task )' COLLATE 'utf8_general_ci',
	`target` VARCHAR(64) NULL DEFAULT NULL COMMENT '���' COLLATE 'utf8_general_ci',
	`type` VARCHAR(64) NULL DEFAULT NULL COMMENT '����(Metric, Log )' COLLATE 'utf8_general_ci',
	`scale_type` CHAR(1) NULL DEFAULT 'U' COMMENT 'Scale���ǰ���( U: Scale UP, D :Scale Down )' COLLATE 'utf8_general_ci',
	`data_source` VARCHAR(128) NULL DEFAULT NULL COMMENT 'influxdb data source ( DCOS, Telegraf, Mesos...)' COLLATE 'utf8_general_ci',
	`table` VARCHAR(128) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`metric` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Type�� Metric�ϰ�� Metric �̸�. Log�ϰ�� Log file full path ' COLLATE 'utf8_general_ci',
	`math` VARCHAR(512) NULL DEFAULT NULL COMMENT '����( divid ( / ), sum, avg.. )' COLLATE 'utf8_general_ci',
	`group_by` VARCHAR(512) NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`condition` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Metric����' COLLATE 'utf8_general_ci',
	`message` VARCHAR(1024) NULL DEFAULT NULL COMMENT '�⺻ Output Text' COLLATE 'utf8_general_ci',
	`status` ENUM('Y','N') NULL DEFAULT 'N' COMMENT 'Rule��� ����' COLLATE 'utf8_general_ci',
	`new_engine` ENUM('Y','N') NULL DEFAULT 'N' COMMENT '���ο� ���� ��뿩��' COLLATE 'utf8_general_ci',
	`regdt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`idx`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;



INSERT INTO `nex_rule` (`target_system`, `target`, `type`, `scale_type`, `data_source`, `table`, `metric`, `math`, `group_by`, `condition`, `message`, `status`, `new_engine`, `regdt`) VALUES
('Agent', 'CPU', 'metric', 'U', 'nexclipper', 'node', 'cpu_used_percent', NULL, 'node_ip', '>95 and >5m', '[%s] 5�е��� CPU ������� 95%% �̻� �Դϴ�. ', 'Y', 'N', '2018-01-29 01:12:05'),
('Agent', 'Memory', 'metric', 'U', 'nexclipper', 'node', 'mem_used_percent', NULL, 'node_ip', '>95 and >10m', '[%s] 10�е��� Memory ������� 95%% �̻��Դϴ�. ', 'Y', 'N', '2018-01-29 01:12:05'),
('Task', 'CPU', 'metric', 'U', 'nexclipper', 'task', 'cpu_used_percent', NULL, 'executor_id', '>95 and >5m', '[%s] 5�е��� CPU ������� 95%% �̻� �Դϴ�. ', 'Y', 'N', '2018-01-29 01:13:15'),
('Task', 'Memory', 'metric', 'U', 'nexclipper', 'task', 'mem_used_percent', NULL, 'executor_id', '>95 and >10m', '[%s] 10�е��� Memory ������� 95%% �̻��Դϴ�. ', 'Y', 'N', '2018-01-29 01:14:07');

