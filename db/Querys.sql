select * from tech_test_comments ttc ;
select * from tech_test_posts;

-- ===============================
-- INSERTS para tech_test_posts
-- ===============================
INSERT INTO order_api.tech_test_posts (title, slug, body)
VALUES
('Cómo iniciar con Docker Compose', 'docker-compose-intro', 'Guía rápida para levantar servicios con Docker Compose.'),
('NestJS para principiantes', 'nestjs-basics', 'Aprende los fundamentos del framework NestJS con ejemplos prácticos.'),
('Mejores prácticas en APIs REST', 'rest-api-best-practices', 'Consejos para diseñar y mantener APIs REST limpias y seguras.'),
('Uso de Redis como caché', 'redis-cache-guide', 'Implementa Redis en tu backend para mejorar el rendimiento.'),
('Introducción a PostgreSQL', 'postgresql-intro', 'Conceptos básicos y comandos esenciales para empezar con PostgreSQL.');

-- ===============================
-- INSERTS para tech_test_comments
-- ===============================
INSERT INTO order_api.tech_test_comments ("post_id", comment, "apiResponse")
VALUES
(1, 'Excelente explicación, pude levantar mi contenedor sin problemas.', '{"status":"ok"}'),
(1, '¿Podrías incluir un ejemplo con volúmenes persistentes?', '{"status":"pending"}'),
(2, 'Muy claro, aunque me gustaría más ejemplos de controladores.', '{"status":"ok"}'),
(3, 'El punto sobre validación fue muy útil, gracias!', '{"status":"approved"}'),
(3, 'Sería genial incluir un ejemplo de JWT.', '{"status":"pending"}'),
(4, 'Redis me ayudó muchísimo a mejorar la performance.', '{"status":"ok"}'),
(5, 'La guía es perfecta para principiantes. Muy recomendada.', '{"status":"ok"}');
