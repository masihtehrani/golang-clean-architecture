package usecases

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtoread"
)

func (u UseCases) Read(ctx context.Context, r *dtoread.Request) (*dtoread.Response, error) {
	panic("implement me")
}
