include Makefile.check

AM_HOME ?= $(shell pwd)

default:
	@$(MAKE) -s -C am

# clean everything
ALLMAKE = $(dir $(shell find . -mindepth 2 -name "Makefile"))
# -mindepth 2 至少向下搜索两层(就是不包括当前层), 可能子目录很深
$(ALLMAKE):
	-@$(MAKE) -s -C $@ clean

clean: $(ALLMAKE)

.PHONY: default clean $(ALLMAKE)
