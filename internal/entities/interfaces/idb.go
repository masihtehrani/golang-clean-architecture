package interfaces

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/entities/structs"
)

type IDB interface {
	Create(ctx context.Context, t *structs.Todo) error
	Read(ctx context.Context, id uint64) (*structs.Todo, error)
	Update(ctx context.Context, t *structs.Todo) error
	Delete(ctx context.Context, id uint64) error
}
