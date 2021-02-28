package structs

import "time"

type Todo struct {
	ID          uint64
	Name        string
	Description string
	IsDone      bool
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
