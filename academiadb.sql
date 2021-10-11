
DROP SCHEMA IF EXISTS academia ;

CREATE SCHEMA IF NOT EXISTS academia ;
USE academia ;

CREATE TABLE IF NOT EXISTS academia.Endereco (
  Endereco_ID INT NOT NULL,
  Logradouro VARCHAR(45) NOT NULL,
  Bairro VARCHAR(45) NOT NULL,
  CEP VARCHAR(45) NOT NULL,
  PRIMARY KEY (Endereco_ID));

CREATE TABLE IF NOT EXISTS academia.Telefone (
  Telefone_ID INT NOT NULL,
  Telefone_Contato VARCHAR(45) NOT NULL,
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
  Telefone_ID INT NOT NULL,
  Plano_ID INT NOT NULL,
  Horario_ID INT NOT NULL,
  Modalidade_ID INT NOT NULL,
  PRIMARY KEY (Pessoa_Associada_ID),
    FOREIGN KEY (Endereco_ID)
    REFERENCES academia.Endereco (Endereco_ID),
    FOREIGN KEY (Telefone_ID)
    REFERENCES academia.Telefone (Telefone_ID),
    FOREIGN KEY (Plano_ID)
    REFERENCES academia.Plano (Plano_ID),
    FOREIGN KEY (Horario_ID)
    REFERENCES academia.Horario (Horario_ID),
    FOREIGN KEY (Modalidade_ID)
    REFERENCES academia.Modalidade (Modalidade_ID));

CREATE TABLE IF NOT EXISTS academia.Pessoa_Treinadora (
  Pessoa_Treinadora_ID INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Sobrenome VARCHAR(45) NOT NULL,
  Endereco_ID INT NOT NULL,
  Telefone_ID INT NOT NULL,
  Horario_ID INT NOT NULL,
  Modalidade_ID INT NOT NULL,
  PRIMARY KEY (Pessoa_Treinadora_ID),
    FOREIGN KEY (Endereco_ID)
    REFERENCES academia.Endereco (Endereco_ID),
    FOREIGN KEY (Telefone_ID)
    REFERENCES academia.Telefone (Telefone_ID),
    FOREIGN KEY (Horario_ID)
    REFERENCES academia.Horario (Horario_ID),
    FOREIGN KEY (Modalidade_ID)
    REFERENCES academia.Modalidade (Modalidade_ID));

