targets := fact README.html
objs := main.o fact.o 

CC := gcc
CFLAGS := -Wall -Wextra -Werror -MMD
CFLAGS += -g
PANDOC := pandoc

ifneq ($(V),1)
Q = @
endif

all: $(targets)

deps := $(patsubst %.o,%.d,$(objs)) # expands into main.d, fact.d 
-include $(deps)


fact: $(objs)
	@echo "Building objects => $@"
	$(Q)$(CC) $(CFLAGS) -o $@ $^

%.o: %.c %.h
	@echo "Compiling => $@"
	$(Q)$(CC) $(CFLAGS) -c -o $@ $<

%.html: %.md
	@echo "Building docs => $@"
	$(Q)$(PANDOC) -o $@ $<

clean:
	@echo "HouseKeeping ....."
	$(Q)rm -f $(targets) $(objs) $(deps)
