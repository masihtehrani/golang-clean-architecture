package usecases

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtodelete"
)

func (u UseCases) Delete(ctx context.Context, r *dtodelete.Request) (*dtodelete.Response, error) {
	panic("implement me")
}
