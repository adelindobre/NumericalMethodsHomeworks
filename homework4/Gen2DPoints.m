function [x,y] = Gen2DPoints(N,a,b,c,d)
	% Functie de generare automata e punctelor 
	% Pentru aceasta am folosit metoda Halton
	x = zeros(1,N);
	y = zeros(1,N);
	for i=1:N
		% Apelez functia halseq cu indexul i si baza 2 pentru vectorul x, baza fiind 3 pentru vectorul y
		x(i) = halseq(i,2);
		y(i) = halseq(i,3);
	end
	% Punctele generate trebuie incadrate intr-un domeniu cerut . Astfel coordonatle punctelor generate trebuie adaptate 
	% pentru intervalele [a,b], respectiv [c,d]
	x = (b - a) * x + a;
	y = (d - c) * y + c;
	plot(x,y,'+');
	grid on;
	% functie de generare a punctelor aleatoare conform metodei halton	
	function result = halseq (index , base)
        	result = 0;
        	f = 1 / base;
        	i = index;
        	while (i > 0)
               		result  = result + f * (mod (i,base));
                		i = floor(i / base);
                	f = f / base;
       		 end
	endfunction

endfunction
