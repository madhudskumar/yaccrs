%{
#include <stdio.h>
%}

%token AL ID

%%
line:
| line exp '\n' {
		 printf("\nIs valid \n");
		 return 0;
		} 

exp:AL mid

mid:
| AL mid
| ID mid

;
%%

main()
{
	printf("\nEnter a variable\n");
	yyparse();
}

yylex()
{
	char c = getchar();
	
	if(isalpha(c)) return AL;
	
	if(isdigit(c)) return ID;
	
	return c;
}

yyerror()
{
	printf("\nInvalid \n");
	return -1;
}

