/* DML */

INSERT INTO tb_categoria(id, descricao, preco_diario) VALUES(1, 'Básico', 60.0);
INSERT INTO tb_categoria(id, descricao, preco_diario) VALUES(2, 'Luxo', 150.0);

INSERT INTO tb_carro(id, modelo, placa, cor, ano, data_aquisicao, cat_id, sede_id) VALUES(1, 'Polo', 'HDD9383', 0, '2015', '2015-07-21', 1, 1);
INSERT INTO tb_carro(id, modelo, placa, cor, ano, data_aquisicao, cat_id, sede_id) VALUES(2, 'Fusion', 'PEH3837', 1, '2015', '2016-12-25', 2, 1);

INSERT INTO tb_sede(codigo, localidade_s, localidade_w) VALUES(1, 18.28272, 23.38474);

INSERT INTO tb_endereco(id, logradouro, numero, complemento, bairro, cep, cidade_id) VALUES(1, 'Rua Flores', 205, 'Bloco C', 'Jardim', '38400282', 1);

INSERT INTO tb_cidade(id, nome, estado_id) VALUES(1, 'São Paulo', 1);

INSERT INTO tb_estado(id, nome) VALUES(1, 'São Paulo');

INSERT INTO tb_cliente(cpf, nome, email) VALUES('93838673610', 'Maria Silva', 'maria@gmail.com');
INSERT INTO tb_cliente(cpf, nome, email) VALUES('58236392715', 'Joaquim Jorge', 'joaquim@gmail.com');

INSERT INTO tb_telefone(cpf, numero) VALUES('93838673610', '37635393');
INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '37636364');
INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '89988464');

INSERT INTO tb_locacao(id, instante_locacao, instante_devolucao, cliente_id, carro_id, local_retirada_id) VALUES(1, TIMESTAMP WITH TIME ZONE'2017-09-30T12:34:00Z', TIMESTAMP WITH TIME ZONE'2017-10-04T13:00:00Z', '93838673610', 1, 1);
INSERT INTO tb_locacao(id, instante_locacao, instante_devolucao, cliente_id, carro_id, local_retirada_id) VALUES(2, TIMESTAMP WITH TIME ZONE'2017-11-11T11:00:00Z', TIMESTAMP WITH TIME ZONE'2017-11-15T12:00:00Z', '93838673610', 2, 1);
INSERT INTO tb_locacao(id, instante_locacao, instante_devolucao, cliente_id, carro_id, local_retirada_id) VALUES(3, TIMESTAMP WITH TIME ZONE'2017-12-25T12:34:00Z', TIMESTAMP WITH TIME ZONE'2017-07-31T20:00:00Z', '58236392715', 2, 1);

INSERT INTO tb_locacao_diaria(id. dias_previstos) VALUES(1, 4);
INSERT INTO tb_locacao_diaria(id. dias_previstos) VALUES(2, 4);

INSERT INTO tb_locacao_periodo(id, porcentagem) VALUES(3, 50.0);

/* Altera os dados do campo cpf na tabela cliente passando a informação que deseja ser alterada */

UPDATE tb_cliente SET cpf = '58236392715' WHERE cpf = '58236382715v';