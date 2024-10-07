# Tools

CC = gcc

# Targets

SRC = $(wildcard *.c)
HEADERS = $(wildcard *.h)

INPUT = $(wildcard tests/*.input)
EXPECTED = $(INPUT:.input=.expected)
TESTS = $(INPUT:.input=.test)

# Goals

.PHONY: all clean test %.test
.DEFAULT_GOAL := all

all: main

main: $(SRC) $(HEADERS)
	$(CC) $< -o $@

clean:
	rm -f main

test: $(TESTS)

%.test: %.input %.expected main
	./main < $*.input 2>&1 | diff -u $*.expected -

docker-build:
	docker run --rm -it -u `stat -c %u:%g .` -v `pwd`:/tmp/src -w /tmp/src gcc:4.9 make

docker-test:
	docker run --rm -it -u `stat -c %u:%g .` -v `pwd`:/tmp/src -w /tmp/src gcc:4.9 make -j test
