%{
#include <stdio.h>
%}

%token ID
%left '+''-'
%left '*''/'
%left '('')'

%%
line:
| line exp'\n' {
		 printf("\nvalid expression\n");
		 return 0;
		}

exp:ID
| exp'+'exp
| exp'-'exp
| exp'*'exp
| exp'/'exp
| '('exp')'

;
%%

main()
{
	printf("\nEnter a expression\n");
	yyparse();
}

yyerror()
{
	printf("\ninvalid\n");
	return -1;
}

yylex()
{
	char c = getchar();
	
	if(isalnum(c)) return ID;
	
	return c;
}
