/* DDL */

CREATE TABLE tb_categoria(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL
);

CREATE TABLE tb_atividade(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(40),
    preco FLOAT,
    cat_id INT NOT NULL,
    FOREIGN KEY(cat_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_bloco(
    id SERIAL PRIMARY KEY,
    inicio TIMESTAMP,
    fim TIMESTAMP,
    ativ_id INT NOT NULL,
    FOREIGN KEY(ativ_id) REFERENCES tb_atividade(id)
);

CREATE TABLE tb_participante(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE tb_participacao(
    parti_id INT,
    ativ_id INT,
	PRIMARY KEY(parti_id, ativ_id),
    FOREIGN KEY(parti_id) REFERENCES tb_participante(id),
    FOREIGN KEY(ativ_id) REFERENCES tb_atividade(id)
);