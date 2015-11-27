/*
 * $$ > standard 
 * in a + b { a > $1} + {b > $3}
 * $2 is the actual evaluating value || actual expression value
 */

%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM UMIN
%left '+' '-' '*' '/' UMIN

%%
line:
| line exp'\n' {
		printf("\n\nValid expression val:%-3d\n\n",$2);
		return 0;
		}

exp: NUM {$$ = $1;}
| exp'+'exp {$$ = $1 + $3;}
| exp'-'exp {$$ = $1 - $3;}
| exp'*'exp {$$ = $1 * $3;}
| exp'/'exp {
		if($3 == 0) yyerror();
		$$ = $1 / $3;
		}
| '('exp')' {$$ = $2;}
| '-'exp %prec UMIN {$$ = -$2;}
%%

main()
{
	yyparse();
}

yylex()
{
	char c = getchar();
	
	if(isdigit(c))
	{
		ungetc(c,stdin);
		scanf("%d",&yylval);
		return NUM;
	}
	return c;
}

yyerror()
{
	fprintf(stderr,"\nError\n");
	exit(-1);
}
