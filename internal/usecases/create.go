package usecases

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtocreate"
)

func (u UseCases) Create(ctx context.Context, r *dtocreate.Request) (*dtocreate.Response, error) {
	panic("implement me")
}
