CC=gcc
LIBS=-lfl
LEXFILE=src/lex5.l

all: main
main: lex.yy.c
	$(CC) -o bin/main lex.yy.c $(LIBS) 
	
lex.yy.c: $(LEXFILE)
	flex $(LEXFILE)
	
clean:
	rm -f *.o bin/main lex.yy.c
	