format:
	sh ./utils/format.sh

plugins:
	sh ./utils/plugins.sh

local:
	sh ./utils/local.sh

install:
	sh ./utils/install.sh

update:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+TSUpdate" +qa

.PHONY: format local plugins install update
