#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


# Drop shit
echo "$($PSQL "DROP TABLE IF EXISTS public.games")"
echo "$($PSQL "DROP TABLE IF EXISTS public.teams")"

# Create tables from scratch
echo "$($PSQL "
CREATE TABLE IF NOT EXISTS public.teams
(
    team_id serial NOT NULL,
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT teams_pkey PRIMARY KEY (team_id),
    CONSTRAINT teams_name_key UNIQUE (name)
);")"

echo "$($PSQL "CREATE TABLE IF NOT EXISTS public.games
(
    game_id serial NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT games_pkey PRIMARY KEY (game_id),
    CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id)
        REFERENCES public.teams (team_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id)
        REFERENCES public.teams (team_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);")"

# parsing the CSV for teams only
all_teams=$((tail -n +2 games.csv | cut -d ',' -f3 && tail -n +2 games.csv | cut -d ',' -f4) | sort -u )
teams_values=""

declare -a tnames=()

while IFS= read -r line ;
do
  tnames+=($line)
  if [ ! -n "$teams_values" ]; then
    teams_values+="('${line}"
    continue
  fi
  teams_values+="'), ('"
  teams_values+=$line
done < <(echo "$all_teams");

teams_values="${teams_values}')"

# Inserting teams
# no protection against SQL injection
echo "$($PSQL "INSERT INTO teams(name) VALUES $teams_values;")"

games_values=""
while IFS='' read -r line; do
  ((cnt++))
  if [ $cnt = 1 ]; then
    continue
  fi

  IFS=',' read -r -a res <<< "$line"

  if [ $cnt != 2 ]; then
    games_values+=", "
  fi
  # no protection against SQL injection
  # Oh god help us all
  games_values+="(${res[0]}, '${res[1]}', (SELECT team_id FROM teams WHERE name='${res[2]}'), (SELECT team_id FROM teams WHERE name='${res[3]}'), ${res[4]}, ${res[5]})"
done <games.csv

echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES $games_values;")"