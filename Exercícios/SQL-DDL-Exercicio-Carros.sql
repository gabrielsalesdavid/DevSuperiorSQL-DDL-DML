/* DDL */

CREATE TABLE tb_categoria(
    id INT NOT NULL,
    descricao VARCHAR(10) NOT NULL,
    preco_diario FLOAT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE tb_carro(
    id INT NOT NULL,
    modelo VARCHAR(10) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    cor CHAR(1) NOT NULL,
    ano VARCHAR(6) NOT NULL,
    data_aquisicao DATE NOT NULL,
    cat_id INT,
    sede_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(cat_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_sede(
    codigo INT NOT NULL,
    localidade_s FLOAT NOT NULL,
    localidade_w FLOAT NOT NULL,
	PRIMARY KEY(codigo)
);

CREATE TABLE tb_endereco(
    id INT NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(20) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    cidade_id INT,
	PRIMARY KEY(id)
);

CREATE TABLE tb_cidade(
    id INT NOT NULL,
    nome VARCHAR(20) NOT NULL,
    estado_id INT,
	PRIMARY KEY(id)
);

CREATE TABLE tb_estado(
    id INT NOT NULL,
    nome VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE tb_cliente(
    cpf VARCHAR(20) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY(cpf)
);

CREATE TABLE tb_telefone(
    cpf VARCHAR(20) NOT NULL,
    numero VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY(cpf, numero),
    FOREIGN KEY(cpf) REFERENCES tb_cliente(cpf)
);

CREATE TABLE tb_locacao(
    id INT NOT NULL,
    instante_locacao TIMESTAMP NOT NULL,
    instante_devolucao TIMESTAMP NOT NULL,
	cliente_id VARCHAR(20),
    carro_id INT NOT NULL,
    local_retirada_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tb_locacao_diaria(
    id INT NOT NULL,
    dias_previstos INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tb_locacao_periodo(
    id INT NOT NULL,
    porcentagem FLOAT NOT NULL,
    PRIMARY KEY(id)
);

/* Adiconando a chave estrangeira na tabela passando os ID's */

ALTER TABLE tb_carro ADD FOREIGN KEY(sede_id) REFERENCES tb_sede(codigo);

ALTER TABLE tb_endereco ADD FOREIGN KEY(cidade_id) REFERENCES tb_cidade(id);

ALTER TABLE tb_cidade ADD FOREIGN KEY(estado_id) REFERENCES tb_estado(id);

ALTER TABLE tb_locacao ADD FOREIGN KEY(cliente_id) REFERENCES tb_cliente(cpf);

ALTER TABLE tb_locacao ADD FOREIGN KEY(carro_id) REFERENCES tb_carro(id);

ALTER TABLE tb_locacao ADD FOREIGN KEY(local_retirada_id) REFERENCES tb_sede(codigo);

ALTER TABLE tb_locacao_diaria ADD FOREIGN KEY(id) REFERENCES tb_locacao(id);

ALTER TABLE tb_locacao_periodo ADD FOREIGN KEY(id) REFERENCES tb_locacao(id);