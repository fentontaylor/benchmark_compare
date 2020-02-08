package olympian

import "database/sql"

type OlympianSummary struct {
	ID         int
	Name       string
  Sex        string
  Age        int
	Height     sql.NullString
	Weight     sql.NullString
}

type Olympians struct {
	Olympians []OlympianSummary
}
