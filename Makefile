# vim:ft=make:ts=8:sts=8:sw=8:noet:tw=80:nowrap:nolist

# My vars: simple
_os             := $(shell uname -sr)
_distro         := $(shell test -f /etc/os-release && awk -F= '/^ID/ {print $$2}' /etc/os-release)
_pkg            := mv-home
#venv           := .venv
#python_version := $(shell python -V)

.DEFAULT_GOAL:=help

################################################################################
##@ Help
.PHONY: help
help:   ## - Default goal: list of targets in Makefile
	@awk '\
	  BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[01;33m<target>\033[0m\n" }        \
	  /^##@/                  { printf "\n\033[01;37m  %s   \033[0m\n"   , substr($$0, 5) } \
	  /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[01;33m  %-25s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo

.PHONY: show
show:   ## - Show header vars
	@echo
	@echo "  ## OS             [${_os}]"
	@echo "  ## Distro         [${_distro}]"
#	@echo "  ## Python Version [${_python_version}]"
#	@echo "  ## Virtualenv     [${_venv}]"
	@echo "  ## Pkg            [${_pkg}]"
#	@echo "  ## Pkg Repo       [${_pkg_repo}]"
#	@echo "  ## Pkg Version    [${_pkg_version}]"
	@echo



################################################################################
##@ Docker

.PHONY: _build
_build: ## - Build
	docker build -f docker/Dockerfile.${_distro} -t ${_tag} .
	@echo
	docker images | grep -E '^REPOS|${_tag}' | column -t

.PHONY: _run
_run: ## - Run
	docker run -ti --rm  \
	  -v .:/work/${_pkg} \
	  --env PS1='\u@\h:\w\n\$$ ' \
	  ${_tag}  bash


_distro:=alma
_tag:=${_pkg}-${_distro}
.PHONY: alma-build
alma-build: ## - Build
	@make _build

.PHONY: alma-run
alma-run: ## - Run AlmaLinux
	@make _run
