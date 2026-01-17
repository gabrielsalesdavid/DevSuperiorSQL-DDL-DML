/*DDL(
    CREATE,
    ALTER,
    DROP
)*/

CREATE TABLE tb_cargo(
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    nivel VARCHAR(10),
    salario FLOAT
);

CREATE TABLE tb_departamento(
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sigla VARCHAR(10) NOT NULL
);

CREATE TABLE tb_funcionario(
    id INT,
    nome VARCHAR(30) NOT NULL,
    data_adm DATE,
    sexo CHAR(1),
    cod_cargo INT NOT NULL,
    cod_depto INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id),
    FOREIGN KEY(cod_depto) REFERENCES tb_departamento(id)
);

DROP TABLE tb_funcionario;

ALTER TABLE tb_funcionario ADD data_nasc DATE;

ALTER TABLE tb_funcionario ADD contact_email VARCHAR(20) NOT NULL;

ALTER TABLE tb_funcionario DROP COLUMN data_nasc;

ALTER TABLE tb_funcionario RENAME contact_email TO email;

ALTER TABLE tb_funcionario ALTER COLUMN email TYPE VARCHAR(20);

/*Exemple*/

CREATE TABLE table_exemple(
    id INT,
    nome VARCHAR(40)
);

ALTER TABLE table_exemple ADD PRIMARY KEY(id);

ALTER TABLE table_exemple DROP CONSTRAINT table_exemple_pkey;

DROP TABLE table_exemple;

ALTER TABLE tb_funcionario DROP CONSTRAINT tb_funcionario_cod_cargo_fkey;

ALTER TABLE tb_funcionario ADD FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id);