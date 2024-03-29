SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE pokemon_tcg;

SET AUTOCOMMIT = 0;

INSERT INTO carta (nombre, tipo, costo, efecto, descripcion) VALUES
('Pikachu', 'Eléctrico', 2, 'Parálisis', 'Un ágil Pokémon que puede paralizar a sus oponentes.'),
('Charizard', 'Fuego', 3, 'Quemadura', 'Un poderoso dragón de fuego capaz de lanzar llamas ardientes.'),
('Blastoise', 'Agua', 3, 'Ninguno', 'Un tortugo gigante con cañones de agua en su espalda.'),
('Venusaur', 'Planta', 3, 'Veneno', 'Un imponente Pokémon con una flor en la espalda que puede envenenar a sus enemigos.'),
('Mewtwo', 'Psíquico', 4, 'Confusión', 'Un Pokémon legendario con poderes psíquicos increíbles.'),
('Dragonite', 'Dragón', 3, 'Ninguno', 'Un dragón majestuoso que puede volar a grandes alturas.'),
('Gyarados', 'Agua', 3, 'Ninguno', 'Un temible Pokémon marino con una mandíbula poderosa.'),
('Alakazam', 'Psíquico', 3, 'Ninguno', 'Un Pokémon con un intelecto superior y habilidades psíquicas.'),
('Snorlax', 'Normal', 4, 'Siesta', 'Un gigantesco Pokémon que ama dormir y comer.'),
('Gengar', 'Fantasma', 2, 'Ninguno', 'Un espeluznante Pokémon que acecha en las sombras.'),
('Machamp', 'Lucha', 3, 'Ninguno', 'Un Pokémon musculoso capaz de mover montañas con sus puños.'),
('Gardevoir', 'Psíquico', 3, 'Ninguno', 'Un elegante Pokémon con habilidades psíquicas y una conexión emocional con su entrenador.');

INSERT INTO mano (id_jugador, id_carta) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 4),
(1, 5),
(2, 6),
(1, 7),
(2, 8),
(1, 9),
(2, 10),
(1, 11),
(2, 12);

INSERT INTO animacion (duracion, diseño) VALUES
(10, 1),
(15, 2),
(20, 3),
(25, 4),
(30, 5),
(35, 6),
(40, 7),
(45, 8),
(50, 9),
(55, 10),
(60, 11),
(65, 12);

INSERT INTO coleccion_cartas (id_jugador, id_carta, id_mazo) VALUES
(1, 1, 1),
(2, 2, 2),
(1, 3, 1),
(2, 4, 2),
(1, 5, 1),
(2, 6, 2),
(1, 7, 1),
(2, 8, 2),
(1, 9, 1),
(2, 10, 2),
(1, 11, 1),
(2, 12, 2);

INSERT INTO jugador (id_carta, id_turno, id_mazo, id_mano, id_partida, id_coleccion_cartas, nombre, nivel) VALUES
(1, 1, 1, 1, 1, 1, 'Ash Ketchum', 10),
(2, 2, 2, 2, 2, 2, 'Gary Oak', 10);

INSERT INTO partida (id_jugador1, id_jugador2, id_turno, tiempo, turnos_jugados, cartas_jugadas) VALUES
(1, 2, 1, 120, 10, 20),
(2, 1, 2, 150, 12, 24),
(1, 2, 3, 180, 14, 28),
(2, 1, 4, 210, 16, 32),
(1, 2, 5, 240, 18, 36),
(2, 1, 6, 270, 20, 40),
(1, 2, 7, 300, 22, 44),
(2, 1, 8, 330, 24, 48),
(1, 2, 9, 360, 26, 52),
(2, 1, 10, 390, 28, 56),
(1, 2, 11, 420, 30, 60),
(2, 1, 12, 450, 32, 64);

INSERT INTO turno (id_jugador, id_partida, numero_turno, cartas_jugadas) VALUES
(1, 1, 1, 2),
(2, 1, 2, 2),
(1, 2, 3, 2),
(2, 2, 4, 2),
(1, 3, 5, 2),
(2, 3, 6, 2),
(1, 4, 7, 2),
(2, 4, 8, 2),
(1, 5, 9, 2),
(2, 5, 10, 2),
(1, 6, 11, 2),
(2, 6, 12, 2);

INSERT INTO jugado (id_turno, id_carta) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

INSERT INTO triggers (id_carta, id_animacion, id_turno) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12);

INSERT INTO tablero (id_partida, id_mazo, id_jugador, cartas_premio, cartas_en_banca, cartas_en_juego) VALUES
(1, 1, 1, 6, 10, 4),
(1, 2, 2, 6, 10, 4),
(2, 1, 1, 6, 10, 4),
(2, 2, 2, 6, 10, 4),
(3, 1, 1, 6, 10, 4),
(3, 2, 2, 6, 10, 4),
(4, 1, 1, 6, 10, 4),
(4, 2, 2, 6, 10, 4),
(5, 1, 1, 6, 10, 4),
(5, 2, 2, 6, 10, 4),
(6, 1, 1, 6, 10, 4),
(6, 2, 2, 6, 10, 4);

