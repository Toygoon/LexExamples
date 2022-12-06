CC=gcc
LIBS=-lfl
LEXFILE=src/calc.l
YACCFILE=src/calc.y
YACC=bison -d

all: main
main: y.tab.o lex.yy.o
	mkdir -p bin/
	$(CC) -o bin/main y.tab.o lex.yy.c $(LIBS) 
	
lex.yy.o: lex.yy.c

y.tab.c y.tab.h:$(YACCFILE)
	$(YACC) -v $(YACCFILE) -o y.tab.c

lex.yy.c: $(LEXFILE)
	flex $(LEXFILE)
	
clean:
	rm -f *.o bin/main lex.yy.c *.tab.* *.output
	