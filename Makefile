PREFIX?=/usr/local
BIN_DIR?=$(PREFIX)/bin

install:
	@echo "Installing rundeck-plugins-cli to $(BIN_DIR)"
	@install -m 755 rundeck-plugins-cli $(BIN_DIR)

uninstall:
	@echo "Uninstalling rundeck-plugins-cli from $(BIN_DIR)"
	@rm -f $(BIN_DIR)/rundeck-plugins-cli

.PHONY: install uninstall
