package main

import (
  "database/sql"
  "fmt"
  "log"
  "net/http"
  "encoding/json"
  d "golangApi/db"
  o "golangApi/models"

  _ "github.com/lib/pq"
)

var db *sql.DB

func main() {
  d.InitDb()
  fmt.Println("Database connection established")
  defer db.Close()
  http.HandleFunc("/", helloWorldHandler)
  http.HandleFunc("/api/v1/olympians/", olympiansHandler)
  if err := http.ListenAndServe("localhost:8080", nil); err != nil {
    log.Fatal("ListenAndServe: ", err)
}
}

func helloWorldHandler(w http.ResponseWriter, req *http.Request) {
  output := make(map[string]string)
  output["message"] = "Hello World!"
  out, err := json.Marshal(output)
  if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
  fmt.Fprintf(w, string(out))
}

func olympiansHandler(w http.ResponseWriter, req *http.Request) {
	data := o.Olympians{}

	err := d.QueryOlympians(&data)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	out, err := json.Marshal(data)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	fmt.Fprintf(w, string(out))
}
