/* DML */

INSERT INTO tb_usuario(id, nome, email, nascimento, website, genero, telefone, foto_perfil_id) VALUES ( 1, 'João Silva', 'joão@gmail.com', '1991-10-15', NULL, 'M', NULL, NULL);
INSERT INTO tb_usuario(id, nome, email, nascimento, website, genero, telefone, foto_perfil_id) VALUES ( 2, 'Maria Alice', 'maria@gmail.com', '1999-04-15', 'youtube.com/alice', 'F', NULL, NULL);
INSERT INTO tb_usuario(id, nome, email, nascimento, website, genero, telefone, foto_perfil_id) VALUES ( 3, 'Carlos Alves', 'carlos@yahoo.com', NULL, NULL, 'M', '997777-8383', NULL);
INSERT INTO tb_usuario(id, nome, email, nascimento, website, genero, telefone, foto_perfil_id) VALUES ( 4, 'Ana Clara', 'clara@gmail.com', '1997-01-23', 'blog.clara.com', 'F', '88181-2820', NULL);

INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES (1, 3);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES (1, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES (3, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES (2, 4);

INSERT INTO tb_postagem(id, texto, instante, autor_id) VALUES (1, '#partiu festa"', TIMESTAMP WITH TIME ZONE '2017-08-09T22:34:20Z', 4);
INSERT INTO tb_postagem(id, texto, instante, autor_id) VALUES (2, 'Bom dia pessoal!', TIMESTAMP WITH TIME ZONE '2017-08-10T13:50:00Z', 4);

INSERT INTO tb_album(id, titulo, instante_postagem, usuario_id) VALUES (1, 'Férias de verão', TIMESTAMP WITH TIME ZONE '2017-01-13T16:50:13Z', 3);

INSERT INTO tb_foto(uri, instante_postagem, postagem_id, usuario_id, album_id) VALUES ('http://dominio.com/praia1.jpg', TIMESTAMP WITH TIME ZONE '2017-01-10T13:30:14Z', NULL, 3, 1);
INSERT INTO tb_foto(uri, instante_postagem, postagem_id, usuario_id, album_id) VALUES ('http://dominio.com/praia2.jpg', TIMESTAMP WITH TIME ZONE '2017-01-10T13:31:12Z', NULL, 3, 1);
