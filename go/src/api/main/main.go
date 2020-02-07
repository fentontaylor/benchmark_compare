package main

import (
  "log"
  "net/http"
)

func main() {
  http.HandleFunc("/api/v1/olympians", olympiansHandler)
  log.Fatal(http.ListenAndServe("localhost:8000", nil))
}

func olympiansHandler(w http.ResponseWriter, r *http.Request) {
  //
}
