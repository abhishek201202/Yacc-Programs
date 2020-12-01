
%{ 
	#include "y.tab.h" 
	char F1, S1;
	char F2, S2;
	int cnt;
%} 



/* Rule Section */
%% 
[aA] { 
		F1 = S1 = 'a';
		if(F2 == 'b' && S2 == 'c'){
			cnt++;
			F2 = S2 = 'a';
		}

		return A;
	} 
[bB] {
		if(F1 == 'a'){
			S1 = 'b';
		}
		F2 = S2 = 'b';
		return B;} 
[cC] {
		if(F1 == 'a' && S1 == 'b'){
			cnt++;
			F1 = S1 = 'c';
		}

		if(F2 == 'b'){
			S2 = 'c';
		}
		return C;
	}
\n {return NL;} 
.  {return yytext[0];} 
%% 

int yywrap(){ 
	return 1; 
} 