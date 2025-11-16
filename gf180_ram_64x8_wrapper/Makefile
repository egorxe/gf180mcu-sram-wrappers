MAKEFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

RUN_TAG ?= $(shell ls runs/ | tail -n 1)

export PDK_ROOT ?= $(MAKEFILE_DIR)/../gf180mcu
export PDK ?= gf180mcuD

all: librelane copy-final ## Build the project (runs librelane)
.PHONY: all
.NOTPARALLEL: all

librelane:
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk
.PHONY: librelane

librelane-openroad: ## Open the last run in OpenROAD
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInOpenROAD
.PHONY: librelane-openroad

librelane-klayout: ## Open the last run in KLayout
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInKLayout
.PHONY: librelane-klayout

copy-final: ## Copy final output files from the last run & liberty/verilog files from the pdk
	rm -rf final/
	cp -r runs/${RUN_TAG}/final/ final/
	gzip -f9 final/gds/*.gds
	@../utils/copy_liberty.sh
	
.PHONY: copy-final
