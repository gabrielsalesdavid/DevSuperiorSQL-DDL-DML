/* DML */

INSERT INTO tb_local_nascimento(codigo, cidade, uf) VALUES (94, 'Uberlandia', 'MG');
INSERT INTO tb_local_nascimento(codigo, cidade, uf) VALUES (88, 'Indaiatuba', 'SP');
INSERT INTO tb_local_nascimento(codigo, cidade, uf) VALUES (90, 'Sao Paulo', 'SP');
INSERT INTO tb_local_nascimento(codigo, cidade, uf) VALUES (75, 'Brasilia', 'DF');

INSERT INTO tb_aluno(codigo, nome, cod_nasc) VALUES (111, 'Alex', 94);
INSERT INTO tb_aluno(codigo, nome, cod_nasc) VALUES (222, 'Ari', 88);
INSERT INTO tb_aluno(codigo, nome, cod_nasc) VALUES (333, 'Ana', 90);
INSERT INTO tb_aluno(codigo, nome, cod_nasc) VALUES (444, 'Pedro', 75);


INSERT INTO tb_disciplina(codigo, nome) VALUES (1, 'Logica de Programação');
INSERT INTO tb_disciplina(codigo, nome) VALUES (2, 'Banco de Dados');
INSERT INTO tb_disciplina(codigo, nome) VALUES (3, 'Java Script');
INSERT INTO tb_disciplina(codigo, nome) VALUES (4, 'POO');


INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (111, 001, 1);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (111, 001, 2);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (222, 002, 3);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (222, 002, 4);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (333, 001, 2);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (333, 001, 4);
INSERT INTO tb_matricula(cod_aluno, cod_turma, cod_disc) VALUES (444, 002, 1);
