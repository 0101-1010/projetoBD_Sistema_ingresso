DROP TABLE IF EXISTS `app_Organizadora`;
select * from `app_Organizadora`;
insert into `app_Organizadora` values(1111111,'vilamix ltda','vilamix'); 
insert into `app_Organizadora` values(2222222,'festaja ltda','festeja');
insert into `app_Organizadora` values(3333333,'na praia ltda','na praia');
CREATE TABLE IF NOT EXISTS `app_Organizadora` (
  `cnpj` bigint(20) NOT NULL,
  `nome_real` varchar(45) NOT NULL,
  `nome_fantasia` varchar(45) NOT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Telefone`;
select * from `app_Telefone`;
insert into `app_Telefone` values(1111111,'99999-9999'); 
insert into `app_Telefone` values(1111111,'6666-66666');
insert into `app_Telefone` values(2222222,'88888-8888');
insert into `app_Telefone` values(3333333,'77777-7777');
CREATE TABLE IF NOT EXISTS `app_Telefone` (
  `organizadora_cnpj` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(45) NOT NULL,
   constraint fk_organizadora foreign key (`organizadora_cnpj`) references `app_Organizadora`(`cnpj`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Atração`;
select * from `app_Atração`;
insert into `app_Atração` values(1,'jorge e matheus'); 
insert into `app_Atração` values(2,'seu jorge');
insert into `app_Atração` values(3,'djavan');
CREATE TABLE IF NOT EXISTS `app_Atração` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Local`;
select * from `app_Local`;
insert into `app_Local` values(070,'08.98.85'); 
insert into `app_Local` values(069,'75.82.59');
insert into `app_Local` values(068,'72.65.32');
CREATE TABLE IF NOT EXISTS `app_Local` (
  `codigo` bigint(20) NOT NULL,
  `posição` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Tipo`;
select * from `app_Tipo`;
insert into `app_Tipo` values(01,'música'); 
insert into `app_Tipo` values(02,'teatro');
insert into `app_Tipo` values(03,'cinema');
 CREATE TABLE IF NOT EXISTS `app_Tipo` (
  `codigo` bigint(20) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Cliente`;
select * from `app_Cliente`;
insert into `app_Cliente` values(070707,'fernando'); 
insert into `app_Cliente` values(060606,'rafaela');
insert into `app_Cliente` values(050505,'thais');
 CREATE TABLE IF NOT EXISTS `app_Cliente` (
  `cpf` bigint(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Tel_email`;
select * from `app_Tel_email`;
insert into `app_Tel_email` values(070707,'70707-7070','fernando@gmail');
insert into `app_Tel_email` values(070707,'40404-4040','fernando@yahoo'); 
insert into `app_Tel_email` values(060606,'60606-6060','rafela@gmail');
insert into `app_Tel_email` values(050505,'50505-5050','thais@gmail');
 CREATE TABLE IF NOT EXISTS `app_Tel_email` (
  `cliente_cpf` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  constraint fk_cliente foreign key (`cliente_cpf`) references `app_Cliente`(`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Evento`;
select * from `app_Evento`;
insert into `app_Evento` values(10,'90,00','21-05-12',1000,'070','01','1111111');
insert into `app_Evento` values(11,'80,00','21-06-12',2000,'069','01','2222222'); 
insert into `app_Evento` values(12,'110,00','21-07-12',3000,'068','01','3333333');
 CREATE TABLE IF NOT EXISTS `app_Evento` (
  `codigo` bigint(20) NOT NULL,
  `preço` varchar(45) NOT NULL,
  `horário` datetime NOT NULL,
  `qnt_ingresso`  bigint(20) NOT NULL,
  `local_codigo` bigint(20) NOT NULL,
  `tipo_codigo` bigint(20) NOT NULL,
  `organizadora_evento_cnpj` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  constraint fk_local foreign key (`local_codigo`) references `app_Local`(`codigo`),
  constraint fk_tipo foreign key (`tipo_codigo`) references `app_Tipo`(`codigo`),
  constraint fk_organizadora foreign key (`organizadora_evento_cnpj`) references `app_Organizadora`(`cnpj`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Evento_has_atração`;
select * from `app_Evento_has_atração`;
insert into `app_Evento_has_atração` values(10,'01','1111111',1);
insert into `app_Evento_has_atração` values(11,'01','2222222',1);
insert into `app_Evento_has_atração` values(10,'01','2222222',2); 
insert into `app_Evento_has_atração` values(12,'01','3333333',1);
insert into `app_Evento_has_atração` values(12,'01','3333333',2);
insert into `app_Evento_has_atração` values(12,'01','3333333',3);
 CREATE TABLE IF NOT EXISTS `app_Evento_has_atração` (
  `evento_codigo` bigint(20) NOT NULL,
  `evento_tipo_codigo` bigint(20) NOT NULL,
  `evento_organizadora_evento_cnpj` bigint(20) NOT NULL,
  `evento_atração_codigo` bigint(20) NOT NULL,
  constraint fk_evento_codigo foreign key (`evento_codigo`) references `app_Evento`(`codigo`),
  constraint fk_tipo_codigo foreign key (`evento_tipo_codigo`) references `app_Evento`(`codigo`),
  constraint fk_organizadora_evento_cnpj foreign key (`evento_organizadora_evento_cnpj`) references `app_Evento`(`cnpj`),
  constraint fk_atração_codigo foreign key (`evento_atração_codigo`) references `app_Atração`(`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Evento_atração_cliente`;
select * from `app_Evento_atração_cliente`;
insert into `app_Evento_atração_cliente` values(10,'01','1111111',1,070707);
insert into `app_Evento_atração_cliente` values(11,'01','2222222',1,070707);
insert into `app_Evento_atração_cliente` values(10,'01','2222222',2,060606); 
insert into `app_Evento_atração_cliente` values(12,'01','3333333',1,060606);
insert into `app_Evento_atração_cliente` values(12,'01','3333333',2,060606);
insert into `app_Evento_atração_cliente` values(12,'01','3333333',3,060606);
 CREATE TABLE IF NOT EXISTS `app_Evento_atração_cliente` (
  `atração_evento_codigo` bigint(20) NOT NULL ,
  `atração_evento_tipo_codigo` bigint(20) NOT NULL ,
  `atração_evento_organizadora_evento_cnpj` bigint(20) NOT NULL ,
  `atração_evento_atração_codigo` bigint(20) NOT NULL ,
  `atração_evento_cliente_cpf` bigint(20) NOT NULL ,
  constraint fk_atração_evento_codigo foreign key (`atração_evento_codigo`) references `app_Evento_has_atração`(`evento_codigo`),
  constraint fk_evento_tipo_codigo foreign key (`atração_evento_tipo_codigo`) references `app_Evento_has_atração`(`evento_tipo_codigo`),
  constraint fk_evento_organizadora_evento_cnpj foreign key (`atração_evento_organizadora_evento_cnpj`) references `app_Evento_has_atração`(`evento_organizadora_evento_cnpj`),
  constraint fk_evento_atração_codigo foreign key (`atração_evento_atração_codigo`) references `app_Evento_has_atração`(`evento_atração_codigo`),
  constraint fk_cliente_cpf foreign key (`atração_evento_cliente_cpf`) references `app_Cliente`(`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Pagamento`;
select * from `app_Pagamento`;
insert into `app_Pagamento` values(98487899,'111','2022-03-2','Fernando O V',10,'01','1111111',1,070707);
insert into `app_Pagamento` values(71717171,'222','2022-03-12','Fernando O V',11,'01','2222222',1,070707);
insert into `app_Pagamento` values(82828282,'333','2023-03-11','Rafaela O V',10,'01','2222222',2,060606); 
insert into `app_Pagamento` values(93939393,'444','2024-03-10','Rafaela O V',12,'01','3333333',1,060606);
insert into `app_Pagamento` values(74747474,'555','2025-03-09','Thais O V',12,'01','3333333',2,050505);
insert into `app_Pagamento` values(85858585,'666','2026-03-08','Thais O V',12,'01','3333333',3,050505);
 CREATE TABLE IF NOT EXISTS `app_Pagamento` (
 `numero_cartao` bigint(20) NOT NULL,
  `cvv` varchar(45) NOT NULL,
  `data_valid` datetime NOT NULL,
  `nome_titular` varchar(45) NOT NULL,
  PRIMARY KEY (`numero_cartao`),
   `pag_atração_evento_codigo` bigint(20) NOT NULL ,
  `pag_atração_evento_tipo_codigo` bigint(20) NOT NULL ,
  `pag_atração_evento_organizadora_evento_cnpj` bigint(20) NOT NULL ,
  `pag_atração_evento_atração_codigo` bigint(20) NOT NULL ,
  `pag_atração_evento_cliente_cpf` bigint(20) NOT NULL ,
  constraint fk_pag_atração_evento_codigo foreign key (`pag_atração_evento_codigo`) references `app_Evento_atração_cliente`(`atração_evento_codigo`),
  constraint fk_pag_evento_tipo_codigo foreign key (`pag_atração_evento_tipo_codigo`) references `app_Evento_atração_cliente`(`atração_evento_tipo_codigo`),
  constraint fk_pag_evento_organizadora_evento_cnpj foreign key (`pag_atração_evento_organizadora_evento_cnpj`) references `app_Evento_atração_cliente`(`atração_evento_organizadora_evento_cnpj`),
  constraint fk_pag_evento_atração_codigo foreign key (`pag_atração_evento_atração_codigo`) references `app_Evento_atração_cliente`(`atração_evento_atração_codigo`),
  constraint fk_pag_cliente_cpf foreign key (`pag_atração_evento_cliente_cpf`) references `app_Evento_atração_cliente`(`atração_evento_cliente_cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_Ingresso`;
select * from `app_Ingresso`;
insert into `app_Ingresso` values(98487899);
insert into `app_Ingresso` values(71717171);
insert into `app_Ingresso` values(82828282); 
insert into `app_Ingresso` values(93939393);
insert into `app_Ingresso` values(74747474);
 CREATE TABLE IF NOT EXISTS `app_Ingresso` (
 `pag_numero_cartao` bigint(20) NOT NULL AUTO_INCREMENT,
  constraint fk_pag_numero_cartao foreign key (`pag_numero_cartao`) references `app_Pagamento`(`numero_cartao`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;


CREATE VIEW all_ingresso    
	as select `app_evento`.`codigo`, `app_organizadora`.`nome_fantasia`,`app_tipo`.`tipo`,`app_atração`.`nome`,`app_evento`.`local_codigo`,`app_cliente`.`cpf`, `app_evento`.`preço`, `app_evento`.`horário`
	from `app_cliente`, `app_atração`, `app_evento`, `app_organizadora`, `app_tipo`,`app_Ingresso`,`app_Pagamento`
	where `app_Ingresso`.`pag_numero_cartao` = `app_Pagamento`.`numero_cartao` 
	and `app_Pagamento`.`pag_atração_evento_organizadora_evento_cnpj` = `app_organizadora`.`cnpj`
	and `app_Pagamento`.`pag_atração_evento_tipo_codigo` = `app_tipo`.`codigo`
	and `app_Pagamento`.`pag_atração_evento_atração_codigo` = `app_atração`.`codigo`
	and `app_Pagamento`.`pag_atração_evento_cliente_cpf` = `app_cliente`.`cpf`
	and `app_Pagamento`.`pag_atração_evento_codigo` = `app_evento`.`codigo`;

CREATE VIEW all_evento    
	as select distinct `app_evento`.`codigo`,`app_organizadora`.`cnpj`, `app_organizadora`.`nome_fantasia`,`app_tipo`.`tipo`,`app_atração`.`nome`,`app_evento`.`local_codigo`, `app_evento`.`preço`, `app_evento`.`horário`
	from `app_atração`, `app_evento`, `app_organizadora`, `app_tipo`, `app_evento_has_atração`
	where `app_evento_has_atração`.`evento_codigo` = `app_evento`.`codigo` 
	and `app_evento_has_atração`.`evento_tipo_codigo` = `app_tipo`.`codigo`
	and `app_evento_has_atração`.`evento_organizadora_evento_cnpj` = `app_organizadora`.`cnpj`
	and `app_evento_has_atração`.`evento_atração_codigo` = `app_atração`.`codigo`;
    
CREATE VIEW cliente_views_eventos    
	as select distinct `app_evento`.`codigo`, `app_organizadora`.`nome_fantasia`,`app_tipo`.`tipo`,`app_atração`.`nome`,`app_evento`.`local_codigo`, `app_evento`.`preço`, `app_evento`.`horário`,`app_cliente`.`cpf`
	from `app_cliente`, `app_atração`, `app_evento`, `app_organizadora`, `app_tipo`, `app_Evento_atração_cliente`
	where `app_Evento_atração_cliente`.`atração_evento_codigo` = `app_evento`.`codigo` 
	and `app_Evento_atração_cliente`.`atração_evento_tipo_codigo` = `app_tipo`.`codigo`
	and `app_Evento_atração_cliente`.`atração_evento_organizadora_evento_cnpj` = `app_organizadora`.`cnpj`
	and `app_Evento_atração_cliente`.`atração_evento_atração_codigo` = `app_atração`.`codigo`
    and `app_Evento_atração_cliente`.`atração_evento_cliente_cpf` = `app_cliente`.`cpf`;

CREATE  VIEW counter_ingresso
	as select `cpf`, count(*) ingresso_compro
	from all_ingresso
	group by all_ingresso.`cpf`
    
CREATE VIEW overview_cliente
	as select distinct all_ingresso.`cpf`,`app_cliente`.`nome`,`telefone`,`email`, counter_ingresso.ingresso_compro
	from all_ingresso
	inner join `app_tel_email` on `app_tel_email`.`cliente_cpf` = all_ingresso.`cpf`
	inner join `app_cliente` on `app_cliente`.`cpf` = all_ingresso.`cpf`
	inner join counter_ingresso on counter_ingresso.`cpf` = all_ingresso.`cpf`
    
CREATE  VIEW counter_eventos
	as select `cnpj`, count(*) eventos_cadastrado
	from all_evento
	group by all_evento.`cnpj`

CREATE VIEW overview_empresa    
	as select distinct `app_organizadora`.`cnpj`,`nome_real`,`app_organizadora`.`nome_fantasia`,`telefone`, counter_eventos.eventos_cadastrado
	from all_evento
	inner join `app_organizadora` on `app_organizadora`.`cnpj` = all_evento.`cnpj`
	inner join `app_telefone` on `app_telefone`.`organizadora_cnpj` = all_evento.`cnpj`
	inner join counter_eventos on counter_eventos.`cnpj` = all_evento.`cnpj`

delimiter $$
CREATE PROCEDURE  baixa_ingresso(in ncodigo int, in nquantidade int)
begin
    update `app_evento`
    set `app_evento`.`qnt_ingresso` = `app_evento`.`qnt_ingresso` - nquantidade
    where `app_evento`.`codigo` = ncodigo;
	end
$$
call baixa_ingresso(10,2);
call baixa_ingresso(11,1);
call baixa_ingresso(12,2);





--
-- Estrutura da tabela `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add person', 7, 'add_person'),
(26, 'Can change person', 7, 'change_person'),
(27, 'Can delete person', 7, 'delete_person'),
(28, 'Can view person', 7, 'view_person');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'app', 'person');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-08 14:32:03.030772'),
(2, 'auth', '0001_initial', '2021-05-08 14:32:03.649135'),
(3, 'admin', '0001_initial', '2021-05-08 14:32:03.785713'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-05-08 14:32:03.795712'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-08 14:32:03.805709'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-05-08 14:32:03.878639'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-05-08 14:32:03.919651'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-05-08 14:32:03.957993'),
(9, 'auth', '0004_alter_user_username_opts', '2021-05-08 14:32:03.967993'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-05-08 14:32:04.005813'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-05-08 14:32:04.008813'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-05-08 14:32:04.018795'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-05-08 14:32:04.055667'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-05-08 14:32:04.091667'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-05-08 14:32:04.130553'),
(16, 'auth', '0011_update_proxy_permissions', '2021-05-08 14:32:04.143565'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-05-08 14:32:04.179835'),
(18, 'sessions', '0001_initial', '2021-05-08 14:32:04.229959'),
(19, 'app', '0001_initial', '2021-05-08 14:36:37.040655');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

