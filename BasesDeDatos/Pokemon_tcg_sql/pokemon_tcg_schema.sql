DROP SCHEMA IF EXISTS pokemon_tcg;
CREATE SCHEMA pokemon_tcg;
USE pokemon_tcg;

CREATE TABLE carta (
    id_carta SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    costo TINYINT UNSIGNED NOT NULL,
    efecto VARCHAR(100) NOT NULL,
    descripcion TEXT,
  PRIMARY KEY  (id_carta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE mano (
    id_mano SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    id_carta SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (id_mano)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE animacion (
	id_animacion SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    duracion SMALLINT NOT NULL,
    diseño SMALLINT NOT NULL,
  PRIMARY KEY  (id_animacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE coleccion_cartas (
	id_coleccion_cartas SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    id_carta SMALLINT UNSIGNED NOT NULL,
    id_mazo SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (id_coleccion_cartas),
  CONSTRAINT fk_coleccion_jugador FOREIGN KEY (id_jugador) REFERENCES jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_coleccion_carta FOREIGN KEY (id_carta) REFERENCES carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_coleccion_mazo FOREIGN KEY (id_mazo) REFERENCES mazo (id_mazo) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE jugador (
	id_jugador SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carta SMALLINT UNSIGNED NOT NULL,
    id_turno SMALLINT UNSIGNED NOT NULL,
    id_mazo SMALLINT UNSIGNED NOT NULL,
    id_mano SMALLINT UNSIGNED NOT NULL,
    id_partida SMALLINT UNSIGNED NOT NULL,
    id_coleccion_cartas SMALLINT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    nivel SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_jugador),
    KEY fk_id_carta_id_jugador_id_mazo_id_mano_id_turno_ (id_carta, id_jugador, id_mazo, id_mano, id_turno),
    CONSTRAINT fk_jugador_carta FOREIGN KEY (id_carta) REFERENCES carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador_turno FOREIGN KEY (id_turno) REFERENCES turno (id_turno) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador_mazo FOREIGN KEY (id_mazo) REFERENCES mazo (id_mazo) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador_mano FOREIGN KEY (id_mano) REFERENCES mano (id_mano) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador_partida FOREIGN KEY (id_partida) REFERENCES partida (id_partida) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador_coleccion_cartas FOREIGN KEY (id_coleccion_cartas) REFERENCES coleccion_cartas (id_coleccion_cartas) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE partida (
	id_partida SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador1 SMALLINT UNSIGNED NOT NULL,
    id_jugador2 SMALLINT UNSIGNED NOT NULL,
    id_turno SMALLINT UNSIGNED NOT NULL,
    tiempo SMALLINT NOT NULL,
    turnos_jugados SMALLINT NOT NULL,
    cartas_jugadas SMALLINT NOT NULL,
  PRIMARY KEY  (id_partida)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE turno (
	id_turno SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    id_jugador SMALLINT UNSIGNED NOT NULL,
    id_partida SMALLINT UNSIGNED NOT NULL,
    numero_turno SMALLINT NOT NULL,
    cartas_jugadas SMALLINT NOT NULL,
  PRIMARY KEY  (id_turno),
  CONSTRAINT fk_turno_jugador FOREIGN KEY (id_jugador) REFERENCES jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_turno_partida FOREIGN KEY (id_partida) REFERENCES partida (id_partida) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE jugado (
	id_jugado SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	id_turno SMALLINT UNSIGNED NOT NULL,
    id_carta SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (id_jugado),
  CONSTRAINT fk_jugado_turno FOREIGN KEY (id_turno) REFERENCES turno (id_turno) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_jugado_carta FOREIGN KEY (id_carta) REFERENCES carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE triggers (
	id_trigger SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carta SMALLINT UNSIGNED NOT NULL,
    id_animacion SMALLINT UNSIGNED NOT NULL,
    id_turno SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_trigger),
    KEY fk_id_carta_id_animacion_id_turno (id_carta, id_animacion, id_turno),
    CONSTRAINT fk_triggers_carta FOREIGN KEY (id_carta) REFERENCES carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_triggers_animacion FOREIGN KEY (id_animacion) REFERENCES animacion (id_animacion) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_triggers_turno FOREIGN KEY (id_turno) REFERENCES efecto (id_turno) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tablero (
    id_tablero SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_partida SMALLINT UNSIGNED NOT NULL,
    id_mazo SMALLINT UNSIGNED NOT NULL,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    cartas_premio SMALLINT UNSIGNED NOT NULL,
    cartas_en_banca SMALLINT UNSIGNED NOT NULL,
    cartas_en_juego SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY  (id_tablero),
    KEY fk_id_partida_id_mazo_id_jugador (id_partida, id_mazo, id_jugador),
	CONSTRAINT fk_tablero_partida FOREIGN KEY (id_partida) REFERENCES partida (id_partida) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_tablero_mazo FOREIGN KEY (id_mazo) REFERENCES mazo (id_mazo) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_tablero_jugador FOREIGN KEY (id_jugador) REFERENCES jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;