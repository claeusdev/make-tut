all: fact readme

fact: main.o fact.o
	gcc -Wall -Wextra -Werror -o fact main.o fact.o

clean:
	rm -f fact README.html main.o fact.o

main.o: main.c fact.h
	gcc -Wall -Wextra -Werror -c -o main.o main.c

fact.o: fact.c fact.h
	gcc -Wall -Wextra -Werror -c -o fact.o fact.c

readme: README.md
	pandoc -o README.html README.md
