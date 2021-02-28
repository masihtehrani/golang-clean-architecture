package usecases

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtoupdate"
)

func (u UseCases) Update(ctx context.Context, r *dtoupdate.Request) (*dtoupdate.Response, error) {
	panic("implement me")
}
