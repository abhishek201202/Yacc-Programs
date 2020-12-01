%{ 
	#include<stdio.h> 
	#include<stdlib.h> 
	extern int cnt;
%} 

%token A B C NL 


%% 

stmt: S NL  { 
				printf("valid string\n"); 
				printf("Total number of substring of the form abc and bca are :: %d\n", cnt);
				exit(0); 
			} 
	;

S: A S | B S | C S |
 ; 

%% 



int yyerror(char *msg){ 
	printf("invalid string\n"); 
	exit(0); 
} 

main(){ 
	printf("enter the string\n"); 
	yyparse(); 
} 
