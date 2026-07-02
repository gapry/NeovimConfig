format:
	sh ./utils/format.sh

plugins:
	sh ./utils/plugins.sh

local:
	sh ./utils/local.sh

install:
	sh ./utils/install.sh

.PHONY: format local plugins install
