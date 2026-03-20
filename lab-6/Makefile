default: bnr;


build:
	fpc src/solve.dpr -obin/solve.o

run:
	./bin/solve.o
	
bnr:
	@echo "\n\n---===---\nbuilding... \n---===---\n\n"
	make build
	@echo "\n\n---===---\nbuild done \ntrying to run:\n---===---\n\n"
	make run