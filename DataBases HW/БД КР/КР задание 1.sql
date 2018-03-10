
USE FT_DB;


CREATE TABLE stats (
 stats_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
win INT(3) NULL,
lose INT(3) NULL,
draw INT(3) NULL
);

CREATE TABLE football_teams (
  team_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  team_name VARCHAR(45) NOT NULL,
  country VARCHAR(20) NOT NULL,
  stats_id INT NOT NULL,
  CONSTRAINT stats_stats_id_fk
  FOREIGN KEY (stats_id)
  REFERENCES stats(stats_id)
  );



CREATE TABLE players (
  player_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  p_name VARCHAR(50) NOT NULL,
  p_type  VARCHAR(10) NOT NULL,
  age DATE NULL
  );

CREATE TABLE football_players (
  team_id INT NOT NULL,
  player_id INT NOT NULL,
  CONSTRAINT football_teams_team_id_fk
    FOREIGN KEY (team_id)
    REFERENCES football_teams (team_id),
  CONSTRAINT players_player_id_fk
    FOREIGN KEY (player_id)
    REFERENCES players (player_id)
  );
