%{
	// nchar : the number of characters,
	// nword : the number of words,
	// nline : the number of lines
	int nchar, nword, nline;
%}
%option noyywrap

%%

\n	{
		// increase line
		// and \n is also character, so increase nchar
		nline++; nchar++;
	}
[^ \t\n]+	{	
			// except ' ', '\t', '\n'
			nword++;
			// yyleng means the length of current recognized word
			nchar += yyleng;
		}
.	{
		// and everything remained is just a character
		nchar++;
	}

%%

int main(int argc, char** argv) {
	// change stdin to arguments
	yyin = fopen(argv[1], "r");
	// call the core function
	yylex();
	// printf("nline : %d, nword : %d, nchar : %d\n", nline, nword, nchar);
	printf("%d %d %d %s\n", nline, nword, nchar, argv[1]);

	return 0;
}
