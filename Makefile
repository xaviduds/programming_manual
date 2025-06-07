.PHONY: dev build

dev:
	@MDBOOK_BIN=$$(which mdbook 2>/dev/null || echo "$$HOME/.cargo/bin/mdbook"); \
	if [ ! -x "$$MDBOOK_BIN" ]; then \
		echo "mdbook not found. Installing..."; \
		cargo install mdbook; \
	fi; \
	echo "Using mdbook at $$MDBOOK_BIN"; \
	"$$MDBOOK_BIN" serve --port 9999

build:
	docker build -t manual-prog .
	docker run -it --rm -p 8080:80 manual-prog
