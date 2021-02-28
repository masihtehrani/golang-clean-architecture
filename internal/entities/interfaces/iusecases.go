package interfaces

import (
	"context"

	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtocreate"
	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtodelete"
	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtoread"
	"github.com/masihtehrani/golang-clean-architecture/internal/ports/ui/dto/dtoupdate"
)

type IUseCases interface {
	Create(ctx context.Context, r *dtocreate.Request) (*dtocreate.Response, error)
	Read(ctx context.Context, r *dtoread.Request) (*dtoread.Response, error)
	Update(ctx context.Context, r *dtoupdate.Request) (*dtoupdate.Response, error)
	Delete(ctx context.Context, r *dtodelete.Request) (*dtodelete.Response, error)
}
