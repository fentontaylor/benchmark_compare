package main

import (
  "database/sql"
  "fmt"
  "log"
  "net/http"
  "ox"

  _ "github.com/lib/pq"
)
var db *sql.DB
const (
    dbhost = "DBHOST"
    dbport = "DBPORT"
    dbuser = "DBUSER"
    dbpass = "DBPASS"
    dbname = "DBNAME"
)

func main() {
  initDb()
  defer db.Close()
  http.HandleFunc("/api/v1/olympians", olympianHandler)
  log.Fatal(http.ListenAndServe("localhost:8000", nil))
}

func olympiansHandler(w http.ResponseWriter, r *http.Request) {
  //
}

func initDb() {
  config := dbConfig()
  var err error
  psqlInfo := fmt.Sprintf("host=%s port=%s user=%s "+
        "password=%s dbname=%s sslmode=disable",
        config[dbhost], config[dbport],
        config[dbuser], config[dbpass], config[dbname])

  db, err = sql.Open("postgres", psqlInfo)
  if err != nil {
        panic(err)
    }
    err = db.Ping()
    if err != nil {
        panic(err)
    }
    fmt.Println("Successfully connected!")
}
