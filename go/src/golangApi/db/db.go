package db

import (
  "database/sql"
  "fmt"
  o "golangApi/models"
  _ "github.com/lib/pq"
)

var db *sql.DB

const (
    dbhost = "localhost"
    dbport = "5432"
    dbuser = "t_schafer"
    dbpass = "\"\""
    dbname = "benchmark_compare_dev"
)

func InitDb() {
  var err error
  psqlInfo := fmt.Sprintf("host=%s port=%s user=%s "+
        "password=%s dbname=%s sslmode=disable",
        dbhost, dbport, dbuser, dbpass, dbname)

  db, err = sql.Open("postgres", psqlInfo)
  if err != nil {
        panic(err)
    }
  err = db.Ping()
  if err != nil {
      panic(err)
  }
}

func QueryOlympians(data *o.Olympians) error {
	rows, err := db.Query(`
		SELECT
			name,
			sex,
			age,
			height,
			weight
		FROM olympians`)
	if err != nil {
		return err
	}
	defer rows.Close()
	for rows.Next() {
		olympian := o.OlympianSummary{}
		err = rows.Scan(
			&olympian.Name,
			&olympian.Sex,
			&olympian.Age,
			&olympian.Height,
			&olympian.Weight,
		)
		if err != nil {
			return err
		}
		data.Olympians = append(data.Olympians, olympian)
	}
	err = rows.Err()
	if err != nil {
		return err
	}
	return nil
}
