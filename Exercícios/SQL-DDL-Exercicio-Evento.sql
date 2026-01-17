/* DDL */

CREATE TABLE tb_local_nascimento(
    codigo SERIAL PRIMARY KEY,
    cidade VARCHAR(10) NOT NULL,
    uf CHAR(2)
);

CREATE TABLE tb_aluno(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    cod_nasc INT NOT NULL,
    FOREIGN KEY(cod_nasc) REFERENCES tb_local_nascimento(codigo)
);

CREATE TABLE tb_disciplina(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_matricula(
    cod_aluno INT,
    cod_turma INT,
    cod_disc INT,
	PRIMARY KEY(cod_aluno, cod_turma, cod_disc),
    FOREIGN KEY(cod_aluno) REFERENCES tb_aluno(codigo),
    FOREIGN KEY(cod_disc) REFERENCES tb_disciplina(codigo)
);

/* Ateração de dados da tabela do tipo caracter de tamanho 20 */

ALTER TABLE tb_funcionario ALTER COLUMN email TYPE VARCHAR(20);

/* Ateração de dados da tabela exclusão de chave primaria */

ALTER TABLE tb_matricula DROP CONSTRAINT tb_matricula_pkey;