%option noyywrap

%%

.	ECHO; // printf("%s", yytext);
\n	ECHO;

%%

int main() {
	yylex();

	return 0;
}