/* DDL */

CREATE TABLE tb_curso(
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    carga_horaria INT NOT NULL,
    valor FLOAT NOT NULL,
    nota_prevista FLOAT NOT NULL,
    nota_minima FLOAT NOT NULL
);

CREATE TABLE tb_turma(
    id INT PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    inicio DATE NOT NULL,
    vagas INT NOT NULL,
    curso_id INT,
    FOREIGN KEY(curso_id) REFERENCES tb_curso(id)
);

CREATE TABLE tb_aluno(
    cpf VARCHAR(20) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE tb_matricula(
    turma_id INT NOT NULL,
    aluno_cpf VARCHAR NOT NULL,
    data_matricula DATE NOT NULL,
    prestacoes INT NOT NULL,
    PRIMARY KEY(turma_id, aluno_cpf),
    FOREIGN KEY(turma_id) REFERENCES tb_turma(id)
);

CREATE TABLE tb_avaliacao(
    id INT PRIMARY KEY NOT NULL,
    nota FLOAT NOT NULL,
    data_aval DATE NOT NULL,
    turma_id INT,
    FOREIGN KEY(turma_id) REFERENCES tb_turma(id)
);

CREATE TABLE tb_resultado(
    aluno_cpf VARCHAR,
    avaliacao_id INT,
    nota_obtida FLOAT NOT NULL,
    PRIMARY KEY(aluno_cpf, avaliacao_id),
    FOREIGN KEY(aluno_cpf) REFERENCES tb_aluno(cpf),
    FOREIGN KEY(avaliacao_id) REFERENCES tb_avaliacao(id)
);

ALTER TABLE tb_aluno ALTER COLUMN cpf TYPE VARCHAR(20);

ALTER TABLE tb_matricula RENAME aluno_id TO aluno_cpf;

ALTER TABLE tb_matricula ALTER COLUMN cpf TYPE VARCHAR;

ALTER TABLE tb_matricula ADD FOREIGN KEY(aluno_cpf) REFERENCES tb_aluno(cpf);