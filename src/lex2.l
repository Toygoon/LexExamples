%{
	int lineno = 0;	// line number
%}
%option noyywrap

%%

^(.*)\n	printf("%5d \t %s", ++lineno, yytext);

%%

int main(int argc, char** argv) {
	if (argc > 1) {
		yyin = fopen(argv[1], "r");
	}
	
	yylex();
	
	if (argc > 1) {
		fclose(yyin);
	}
	
	return 0;
}