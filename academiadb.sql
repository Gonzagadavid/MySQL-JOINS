
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
  Horario_ID INT NOT NULL,
  PRIMARY KEY (Pessoa_Associada_ID, Modalidade_ID, Horario_ID),
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
    (6, 'Aeróbica');
    
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
		(30, 'Praça Daniel Berciano Villasol', 291, 'Perdizes', 05009050);

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
		(13, NULL, '(11)29544808'),
		(14, '(11)981126496', '(11)26736144'),
		(15, '(11)982591935', '(11)25415453'),
		(16, '(11)993509407', '(11)25945608'),
		(17, '(11)994293997', '(11)36290457'),
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
		(30, '(11)987760331', '(11)35953526');
			

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
    (2, 'Catarina', 'Almeida', 10, 12, 1);
	
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
    (10, 'Vinicios', 'Morais', 8, 10);
