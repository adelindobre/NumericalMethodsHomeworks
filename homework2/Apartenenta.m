function [y]=Apartenenta(x,val1,val2)
	format long;	
	% In x se va memora vectorul de pagerank-uri obtinut dupa apelarea functiei Algebraic
	% y reprezinta vectorul cu gradele de apartenenta pentru fiecare pagina in parte
	y=zeros(length(x),1);
	% a si b se obtin din conditia de continuitate a functiei.
	% Astfel, din aplicarea limitelor laterale in punctele val1 si val2, rezulta ecuatiile: a*val1+b=0 si a*val2+b=1
	a=1/(val2-val1);
	b=val1/(val1-val2);
	% Pentru fiecare Pageerank in parte, testez conditiile functiei u din cerinta si determin valoarea acesteia.
	for i=1:length(x)
		if (x(i)>=0 && x(i)<val1)
			y(i)=0;
		endif 
		if (x(i)>=val1 && x(i)<=val2)
			y(i)=a*x(i)+b;
		endif
	        if (x(i)>val2 && x(i)<=1)
			y(i)=1;
		endif
	endfor

endfunction
