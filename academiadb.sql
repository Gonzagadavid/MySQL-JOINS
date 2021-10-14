
DROP SCHEMA IF EXISTS academia ;

CREATE SCHEMA IF NOT EXISTS academia ;
USE academia ;

CREATE TABLE IF NOT EXISTS academia.Endereco (
  Endereco_ID INT NOT NULL,
  Logradouro VARCHAR(100) NOT NULL,
  Numero INT NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  CEP INT NOT NULL,
  PRIMARY KEY (Endereco_ID));

CREATE TABLE IF NOT EXISTS academia.Telefone (
  Telefone_ID INT NOT NULL,
  Telefone_Contato VARCHAR(45) NULL,
  Telefone_Emergencia VARCHAR(45) NULL,
  PRIMARY KEY (Telefone_ID));
  
CREATE TABLE IF NOT EXISTS academia.Plano (
  Plano_ID INT NOT NULL,
  Nome_plano VARCHAR(45) NOT NULL,
  Valor DOUBLE NOT NULL,
  PRIMARY KEY (Plano_ID));

CREATE TABLE IF NOT EXISTS academia.Horario (
  Horario_ID INT NOT NULL,
  Periodo VARCHAR(45) NOT NULL,
  PRIMARY KEY (Horario_ID));

CREATE TABLE IF NOT EXISTS academia.Modalidade (
  Modalidade_ID INT NOT NULL,
  Nome_modalidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (Modalidade_ID));

CREATE TABLE IF NOT EXISTS academia.Pessoa_Associada (
  Pessoa_Associada_ID INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Sobrenome VARCHAR(45) NOT NULL,
  Endereco_ID INT NOT NULL,
  Telefone_ID INT NULL,
  Plano_ID INT NOT NULL,
  PRIMARY KEY (Pessoa_Associada_ID),
    FOREIGN KEY (Endereco_ID)
    REFERENCES academia.Endereco (Endereco_ID),
    FOREIGN KEY (Telefone_ID)
    REFERENCES academia.Telefone (Telefone_ID),
    FOREIGN KEY (Plano_ID)
    REFERENCES academia.Plano (Plano_ID));

CREATE TABLE IF NOT EXISTS academia.Pessoa_Treinadora (
  Pessoa_Treinadora_ID INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Sobrenome VARCHAR(45) NOT NULL,
  Endereco_ID INT NOT NULL,
  Telefone_ID INT NULL,
  PRIMARY KEY (Pessoa_Treinadora_ID),
    FOREIGN KEY (Endereco_ID)
    REFERENCES academia.Endereco (Endereco_ID),
    FOREIGN KEY (Telefone_ID)
    REFERENCES academia.Telefone (Telefone_ID));

CREATE TABLE IF NOT EXISTS academia.Treino (
  Pessoa_Associada_ID INT NOT NULL,
  Modalidade_ID INT NOT NULL,
  Horario_ID INT,
  PRIMARY KEY (Pessoa_Associada_ID, Modalidade_ID),
    FOREIGN KEY (Pessoa_Associada_ID)
    REFERENCES academia.Pessoa_Associada (Pessoa_Associada_ID),
    FOREIGN KEY (Modalidade_ID)
    REFERENCES academia.Modalidade (Modalidade_ID),
    FOREIGN KEY (Horario_ID)
    REFERENCES academia.Horario (Horario_ID));

CREATE TABLE IF NOT EXISTS academia.Aula (
  Pessoa_Treinadora_ID INT NOT NULL,
  Modalidade_ID INT NOT NULL,
  Horario_ID INT NOT NULL,
  PRIMARY KEY (Pessoa_Treinadora_ID, Modalidade_ID, Horario_ID),
    FOREIGN KEY (Pessoa_Treinadora_ID)
    REFERENCES academia.Pessoa_Treinadora (Pessoa_Treinadora_ID),
    FOREIGN KEY (Horario_ID)
    REFERENCES academia.Horario (Horario_ID),
    FOREIGN KEY (Modalidade_ID)
    REFERENCES academia.Modalidade (Modalidade_ID));

INSERT INTO academia.Plano ( Plano_ID, Nome_plano, Valor)
  VALUES 
    (1, 'Mensal', 90.00),
    (2, 'Trimestral', 210.00),
    (3, 'Semestral', 380.00),
    (4, 'Anual', 720.00);
    
INSERT INTO academia.Horario (Horario_ID, Periodo)
  VALUES 
    (1, 'Manhã'),
    (2, 'Tarde'),
    (3, 'Noite');
    
INSERT INTO academia.Modalidade (Modalidade_ID, Nome_modalidade)
  VALUES
    (1, 'Musculação'),
    (2, 'Natação'),
    (3, 'Dança'),
    (4, 'Boxe'),
    (5, 'Aeróbica');
    
INSERT INTO academia.Endereco (
  Endereco_ID, 
  Logradouro,
  Numero, 
  Bairro, 
  CEP
) 
  VALUES
		(1, 'Rua Visconde de Parnaíba', 355, 'Brás', 03045000),
		(2, 'Travessa Capachos II', 659, 'Jardim Célia', 08191331),
		(3, 'Rua Domenico Venturi', 365, 'Jardim Patente', 04243040),
		(4, 'Rua Varadouro', 100, 'Jardim Soares', 03919040),
		(5, 'Rua Cardoso de Almeida', 175, 'Sumaré' , 01251001),
		(6, 'Rua Fábio Monte Negro', 928, 'Cidade Nova América', 04897500),
		(7, 'Praça Eduardo Berlendis', 237, 'Jardim Lourdes', 08452445),
		(8, 'Rua Doutor Antônio Ruggiero Júnior', 782, 'Jardim Monte Alegre', 05165120),
		(9, 'Rua Antônio Romero Fernandes', 919, 'Vila Alpina', 03208050),
		(10, 'Rua Estado de Rondônia', 180, 'Jardim Cidade Pirituba', 02945150),
		(11, 'Rua Júlio Brandão', 617, 'Jardim Porteira Grande', 03917040),
		(12, 'Rua Ipacaraí', 581, 'Perdizes', 05011020),
		(13, 'Rua Professor Arnaldo João Semeraro', 941, 'Jardim Santa Emília', 04184900),
		(14, 'Rua Carlos Motta Marchi', 994, 'Parque Bristol', 04193210),
		(15, 'Rua Doutor Mello Nogueira', 639, 'Vila Baruel', 02510040),
		(16, 'Rua José Maria Lisboa 480', 673, 'Jardim Paulista', 01423908),
		(17, 'Rua Jaguapeba', 672, 'Conjunto Habitacional Fazenda do Carmo', 08421521),
		(18, 'Rua José Henrique Tomaz de Lima', 958, 'Vila Verde', 08230850),
		(19, 'Travessa Paulo Leitão', 717, 'Capão Redondo', 05866003),
		(20, 'Rua Equador', 198, 'Jardim América', 01436080),
		(21, 'Avenida Brigadeiro Luís Antônio', 452, 'Jardim Paulista', 01402002),
		(22, 'Rua Doutor Raul Manso Sayão Filho', 688, 'Cidade São Mateus', 03965010),
		(23, 'Rua Edgar Codazzi', 309, 'Cidade Antônio Estevão de Carvalho', 08225280),
		(24, 'Rua Piracanjuba', 805, 'Vila Carbone', 02750040),
		(25, 'Rua Canori', 910, 'Jardim Olinda', 05765170),
		(26, 'Passagem Sebastião Festa', 870, 'Conjunto Promorar Estrada da Parada', 02873710),
		(27, 'Avenida General Charles de Gaulle', 380, 'Parque São Domingos', 05124901),
		(28, 'Rua Pepita de Fogo', 317, 'Jardim São Carlos (Zona Leste)', 08062740),
		(29, 'Rua Paulo da Silva', 793, 'Jardim do Lago', 05397110),
		(30, 'Praça Daniel Berciano Villasol', 291, 'Perdizes', 05009050),
    (31, 'Rua Doutor Sílvio Dante Bertacchi', 154, 'Vila Sônia', 05625001);

INSERT INTO academia.Telefone (
  Telefone_ID,
  Telefone_Contato,
  Telefone_Emergencia
) 
  VALUES
		(1, '(11)997016542', '(11)36178405'),
		(2, '(11)999124939', NULL),
		(3, '(11)987492668', '(11)36215274'),
		(4, '(11)996133401', '(11)38382770'),
		(5, '(11)981875877', '(11)26640540'),
		(6, '(11)991828746', '(11)26074255'),
		(7, '(11)996702111', '(11)35659534'),
		(8, '(11)988589105', NULL),
		(9, '(11)993762497', '(11)28598239'),
		(10, '(11)997629440', '(11)26449065'),
		(11, '(11)982903669', '(11)29823025'),
		(12, '(11)981651295', '(11)27846478'),
		(13, '(11)29544808', NULL),
		(14, '(11)981126496', '(11)26736144'),
		(15, '(11)982591935', '(11)25415453'),
		(16, '(11)993509407', '(11)25945608'),
		(17, '(11)994293997', NULL),
		(18, '(11)998975027', '(11)26611809'),
		(19, '(11)993792683', '(11)26127452'),
		(20, '(11)981055416', '(11)36162485'),
		(21, '(11)996293237', '(11)35919556'),
		(22, '(11)991352745', '(11)29929050'),
		(23, '(11)993498573', '(11)38092873'),
		(24, '(11)983345058', '(11)26853653'),
		(25, '(11)985477714', '(11)39195446'),
		(26, '(11)993912951', '(11)39126508'),
		(27, '(11)996175387', '(11)39789749'),
		(28, '(11)985190150', '(11)39287080'),
		(29, '(11)989988795', '(11)38647391'),
		(30, '(11)987760331', '(11)35953526'),
    (31, '(11)986352698', '(11)27106247'),
    (32, '(11)984650287', '(11)36072875'),
    (33, '(11)985429620', '(11)28698585'),
    (34, '(11)996005453', '(11)27739729'),
    (35, '(11)982872235', '(11)28210058');
			

INSERT INTO  academia.Pessoa_Associada (
  Pessoa_Associada_ID,
  Nome,
  Sobrenome,
  Endereco_ID,
  Telefone_ID,
  Plano_ID
)
  VALUES
    (1, 'Ayla', 'Cunha', 9, 11, 1),
    (2, 'Catarina', 'Almeida', 10, 12, 1),
    (3, 'Heitor', 'Rocha', 11, 13, 3),
    (4, 'Noah', 'Soares', 12, 14, 3 ),
    (5, 'Anderson', 'Silva', 13, 15, 3),
    (6, 'Luiza', 'Ramos', 14, 16, 2),
    (7, 'Bárbara', 'Soares', 12, 17, 1),
    (8, 'Nair', 'Ramos', 15, 18, 2),
    (9, 'André', 'Silva', 16, 19, 2),
    (10, 'Yuri', 'Pereira', 17, 20, 1),
    (11, 'José', 'Antunes', 18, NULL, 2),
    (12, 'Betina', 'Texeira', 19, 22, 3),
    (13, 'Antônia', 'Souza', 20, 23, 3),
    (14, 'Antônio', 'Nunes', 21, 24, 4),
    (15, 'Vitória', 'Santos', 22, 25, 1),
    (16, 'Emily', 'Oliveira', 23, 26, 1),
    (17, 'Reginaldo', 'Rocha', 24, 27, 2),
    (18, 'Carla', 'Perez', 25, 28, 1),
    (20, 'Joana', 'Gonçalves', 26, 29, 1),
    (21, 'Paula', 'Costa', 27, 30, 3),
    (22, 'Sonia', 'Nunes', 28, 31, 1),
    (23, 'Francisco', 'Rodrigues', 29, 32, 1),
    (24, 'Alessandra', 'Rodrigues', 29, 33, 1),
    (25, 'Cauê', 'Costa', 30, 34, 2),
    (26, 'Marcelo', 'Souza', 15, 21, 3),
    (27, 'Angela', 'Pereira', 17, NULL, 1),
    (29, 'Saulo', 'Gonçalves', 26, NULL, 3),
    (30, 'Maria', 'Silva', 13, NULL, 1),
    (31, 'Livia', 'Almeida', 10, NULL, 1),
    (32, 'Oswaldo', 'Garibaldo', 29, NULL, 3);

	
INSERT INTO  academia.Pessoa_Treinadora (
  Pessoa_Treinadora_ID,
  Nome,
  Sobrenome,
  Endereco_ID,
  Telefone_ID
)
  VALUES
    (1, 'Jorge', 'Galvão', 1, 1),
    (2, 'Sophia', 'Galvão', 1, 2),
    (3, 'Camila', 'Cunha', 2, 3),
    (4, 'Mário', 'Peixoto', 3, 4),
    (5, 'Gustavo', 'Bernades', 4, 5),
    (6, 'Aline', 'Oliveira', 5, 6),
    (7, 'Beatriz', 'Oliveira', 6, 7),
    (8, 'Maya', 'Galvão', 1, 8),
    (9, 'Marcos', 'Fernades', 7, 9),
    (10, 'Vinicios', 'Morais', 8, 10),
    (11, 'Laura', 'Fernandes', 31, 35);


INSERT INTO academia.Aula (
  Pessoa_Treinadora_ID,
  Modalidade_ID,
  Horario_ID
) 
  VALUES
    (1, 1, 1),
    (6, 1, 2),
    (1, 1, 3),
    (2, 2, 1),
    (4, 2, 2),
    (2, 2, 3),
    (3, 3, 1),
    (10, 3, 2),
    (3, 3, 3),
    (5, 4, 1),
    (7, 4, 2),
    (5, 4, 3),
    (6, 5, 1),
    (8, 5, 2),
    (6, 5, 3);

INSERT INTO academia.Treino (
  Pessoa_Associada_ID,
  Modalidade_ID,
  Horario_ID
)
  VALUES
    (1, 3, 1),
    (2, 2, 3),
    (3, 1, NULL),
    (4, 1, 2),
    (5, 4, NULL),
    (6, 4, 1),
    (7, 2, 3),
    (8, 5, 1),
    (9, 4, 2),
    (10, 1, 2),
    (11, 4, 3),
    (12, 1, NULL),
    (13, 5, 3),
    (14, 1, 1),
    (15, 2, 3),
    (16, 3, 1),
    (17, 4, 2),
    (18, 3, NULL),
    (20, 1, 3),
    (21, 4, 1),
    (22, 2, 2),
    (23, 4, NULL),
    (24, 2, 3),
    (25, 2, NULL),
    (26, 3, 3),
    (27, 5, NULL),
    (29, 5, 3),
    (30, 5, 1),
    (31, 2, 3),
    (32, 1, 1);
