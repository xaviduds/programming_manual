.PHONY: dev build install

MDBOOK_BIN := $(shell which mdbook 2>/dev/null || echo $(HOME)/.cargo/bin/mdbook)

install:
	@if [ ! -x "$(MDBOOK_BIN)" ]; then \
		echo "mdbook not found. Installing..."; \
		cargo install mdbook; \
	else \
		echo "Using mdbook at $(MDBOOK_BIN)"; \
	fi

dev: install
	@$(MDBOOK_BIN) serve --port 9999

build: install
	@$(MDBOOK_BIN) build -d ./dist
