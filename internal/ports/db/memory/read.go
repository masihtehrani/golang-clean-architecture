package memory

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/entities/structs"
)

func (m Memory) Read(ctx context.Context, id uint64) (*structs.Todo, error) {
	panic("implement me")
}
