# PraisonAI Chat Makefile

.PHONY: help install dev build test sync-upstream clean

help:
	@echo "PraisonAI Chat - Development Commands"
	@echo ""
	@echo "  make install       - Install all dependencies"
	@echo "  make dev           - Start development server"
	@echo "  make build         - Build frontend and backend"
	@echo "  make test          - Run all tests"
	@echo "  make sync-upstream - Sync with upstream Chainlit"
	@echo "  make clean         - Clean build artifacts"

install:
	pnpm install
	cd backend && poetry install --with tests

dev:
	cd backend && poetry run chainlit run demo.py -w

build:
	pnpm run buildUi
	cd backend && poetry build

test:
	cd backend && poetry run pytest
	pnpm run test:ui

sync-upstream:
	./scripts/sync-upstream.sh

clean:
	rm -rf backend/dist
	rm -rf frontend/dist
	rm -rf libs/copilot/dist
	rm -rf libs/react-client/dist
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true

# Upstream management
fetch-upstream:
	git fetch upstream

show-upstream-changes:
	git log --oneline main..upstream/main | head -30

merge-upstream:
	git merge upstream/main --no-edit -m "Merge upstream Chainlit changes"
