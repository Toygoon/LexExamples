%{
#include <strings.h>

int longest = 0;
char longword[128];
%}
%option noyywrap

%%

[a-zA-Z]+	{
			// yyleng : The length of previous read strings
                if (yyleng > longest) {
                    // save current length of the string
                    longest = yyleng;
                    strcpy(longword, yytext);
                }
		    }
.	;
\n	;

%%

int main() {
	yylex();
	printf("Longest word : %s, %d\n", longword, longest);

	return 0;
}
