-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

create database larievini;
use larievini;

CREATE TABLE midia (
titulo_midia varchar(100) not null,
caminho_midia varchar(250),
cod_midia int not null auto_increment unique PRIMARY KEY,
cod_postagem int not null
);

CREATE TABLE tipo_usuario (
cod_tipuser int not null auto_increment unique PRIMARY KEY,
desc_tipuser varchar(250) not null
);

CREATE TABLE postagem (
titulo_postagem varchar(100) not null,
categoria varchar(100) not null,
cod_postagem int not null auto_increment unique PRIMARY KEY,
texto_postagem varchar(1000) not null,
cod_usuario int not null,
cod_ong int not null,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

CREATE TABLE usuario (
idade int not null,
nome varchar(250) not null,
email varchar(250) not null unique,
cod_usuario int not null auto_increment unique PRIMARY KEY,
telefone varchar(14) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

CREATE TABLE ong (
email_ong varchar(250) not null unique,
telefone_ong varchar(14) not null unique,
nome_ong varchar(100) not null unique,
cod_ong int not null auto_increment unique PRIMARY KEY
);

CREATE TABLE curtir (
cod_postagem int not null,
cod_usuario int not null,
dathora_curtir timestamp default current_timestamp(),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE comenta (
cod_postagem int not null,
cod_usuario int not null,
dathora_coment timestamp default current_timestamp(),
texto_coment varchar(250) not null,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE voluntario (
cod_ong int not null,
cod_usuario int not null,
dt_voluntario date not null,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE doacao (
cod_ong int not null,
cod_usuario int not null,
dt_doacao date not null,
valor_doacao decimal(10,2) not null,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);

insert into tipo_usuario(desc_tipuser) values
('Administrador'),
('Doador');

insert into usuario(idade, nome, email, telefone, cod_tipuser) values
(28, 'Maria da Silva', 'mariadasilva@gmail.com', '(47)99912-3432', 2),
(32, 'Joao Costa', 'costajoao@gmail.com', '(47)99553-4432', 1),
(25, 'Gustavo Duarte', 'duartegustavo123@gmail.com', '(54)99872-4663', 1),
(29, 'Allan Dias', 'allanzinho25@gmail.com', '(11)99933-4353', 2),
(18, 'Julia Antunes', 'jutunes10@gmail.com', '(21)99584-4356', 1),
(34, 'Gabriel Pereira', 'gabrielpereira7@gmail.com', '(47)98876-4343', 2),
(83, 'Jose Dias', 'josedias@gmail.com', '(47)99351-3432', 1),
(25, 'Jorge da Silva', 'silvajorge@gmail.com', '(47)98971-2342', 2),
(30, 'Yuri Martins', 'yurimartins04@gmail.com', '(21)98877-5656', 1),
(22, 'Luana Borba', 'borbalu333@gmail.com', '(11)99840-2309', 2);

insert into ong(nome_ong, email_ong, telefone_ong) values
('Caninos Felizes', 'caninosfelizes@gmail.com', '(47)99451-1414'),
('Felinos Felizes', 'felinosfelizes@gmail.com', '(47)99467-1776'),
('Caes Alegres', 'caesalegres@gmail.com', '(47)99471-1884'),
('Bichinhos Contentes', 'bichinhoscontentes@gmail.com', '(47)99648-1654'),
('Jovens em Missao', 'jovensmissao123@gmail.com', '(11)91451-1444'),
('Acao Social', 'acaosocial@gmail.com', '(47)96644-3532'),
('Instituto Amar', 'institutoamar@gmail.com', '(21)98751-6614'),
('Projeto Esperanca', 'projetoesperanca@gmail.com', '(11)99111-1114'),
('Vida Verde', 'vidaverde@gmail.com', '(47)92251-2214'),
('Fios de Alegria', 'alegriafios@gmail.com', '(54)94451-2224');

insert into postagem(titulo_postagem, categoria, texto_postagem, cod_ong, cod_usuario) values
('Obrigado Gabriel', 'Doacao', 'Obrigado Gabriel Pereira pela incrivel doacao de 5000 reais', 6, 6),
('Obrigado Maria', 'Doacao', 'Obrigado Maria da Silva pela doacao de 200 reais', 10, 1),
('Obrigado Jorge', 'Doacao', 'Obrigado Jorge da Silva pela doacao de 10,50 reais', 4, 8),
('Obrigado Yuri', 'Doacao', 'Obrigado Yuri Martis pela doacao de 100 reais', 2, 9),
('Obrigado Gustavo', 'Doacao', 'Obrigado Gustavo Duarte pela doacao de 150 reais', 5, 3),
('Obrigado Allan', 'Doacao', 'Obrigado Allan Dias pela doacao de 50 reais', 2, 4),
('Obrigado João', 'Doacao', 'Obrigado João Costa pela doacao de 25 reais', 1, 2),
('Obrigado Yuri', 'Doacao', 'Obrigado Yuri Martins pela doacao de 2,50 reais', 9, 9),
('Obrigado Maria', 'Doacao', 'Obrigado Maria da Silva pela doacao de 650 reais', 1, 1),
('Obrigado Jorge', 'Doacao', 'Obrigado Jorge da Silva pela doacao de 800 reais', 3, 8);

insert into midia(titulo_midia, caminho_midia, cod_postagem) values
('Foto1', '/home/aluno/Imagens/Foto1', 8),
('Foto2', '/home/aluno/Imagens/Foto2', 4),
('Foto3', '/home/aluno/Imagens/Foto3', 7),
('Foto4', '/home/aluno/Imagens/Foto4', 6),
('Foto5', '/home/aluno/Imagens/Foto5', 3),
('Foto6', '/home/aluno/Imagens/Foto6', 5),
('Foto7', '/home/aluno/Imagens/Foto7', 1),
('Foto8', '/home/aluno/Imagens/Foto8', 2),
('Foto9', '/home/aluno/Imagens/Foto9', 9),
('Foto10', '/home/aluno/Imagens/Foto10', 10);

insert into comenta(cod_postagem, cod_usuario, texto_coment) values
(2, 2, 'Parabens pela doacao'),
(5, 9, 'Obrigado pela doacao'),
(4, 8, 'Agradecemos do fundo do coracao'),
(3, 7, 'Parabens pela doacao'),
(1, 10, 'Obrigado pela contribuicao'),
(4, 5, 'Parabens'),
(1, 6, 'Obrigadoooo'),
(2, 2, 'Obrigado pela ajuda'),
(10, 7, 'Que incrivel, planejo visitar a ONG em breve'),
(4, 1, 'Quero adotar um bichinho ai');

insert into curtir(cod_postagem, cod_usuario) values
(1, 6),
(4, 5),
(3, 9),
(8, 8),
(6, 7),
(4, 2),
(5, 6),
(9, 3),
(2, 2),
(1, 10);

insert into voluntario(cod_ong, cod_usuario, dt_voluntario) values
(4, 8, '2021-09-24'),
(2, 9, '2021-02-21'),
(6, 6, '2021-10-29'),
(10, 1, '2022-03-11'),
(5, 3, '2022-05-02'),
(2, 4, '2018-05-23'),
(1, 2, '2014-04-05'),
(9, 9, '2022-08-12'),
(1, 1, '2013-01-01'),
(3, 8, '2020-07-04');

insert into doacao(cod_ong, cod_usuario, dt_doacao, valor_doacao) values
(4, 8, '2021-09-24', 10.50),
(2, 9, '2021-02-21', 100.00),
(6, 6, '2021-10-29', 5000.00),
(10, 1, '2022-03-11', 200.00),
(5, 3, '2022-05-02', 150.00),
(2, 4, '2018-05-23', 50.00),
(1, 2, '2014-04-05', 25.00),
(9, 9, '2022-08-12', 2.50),
(1, 1, '2013-01-01', 650.00),
(3, 8, '2020-07-04', 800.00);
