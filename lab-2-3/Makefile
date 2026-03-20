build:
	fpc '${name}'.dpr -obin/'${name}'.o

run:
	./bin/'${name}'.o
	
hanoi:
	@echo "\n\n---===---\nbuilding... \n---===---\n\n"
	make build name=hanoi
	@echo "\n\n---===---\nbuild done \ntrying to run:\n---===---\n\n"
	make run name=hanoi

trans:
	@echo "\n\n---===---\nbuilding... \n---===---\n\n"
	make build name=trans
	@echo "\n\n---===---\nbuild done \ntrying to run:\n---===---\n\n"
	make run name=trans