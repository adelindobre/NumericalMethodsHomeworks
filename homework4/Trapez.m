function I = Trapez(x,y)
	% Calculul integralei folosind metoda trapezelor 
	n = length(x);
	I = 0;
	a = min(x);
	b = max(x);
	delta = (b - a) / n;
	for i=1:n-1
		% In cazul in care doua elemente consecutive din vectorul corespunzator coordonatei x sunt egale se va trece mai departe la urmatoarea iteratie 
		if ( x(i) ~= x(i+1) )
			I = I + delta * ( (y(i) + y(i+1) ) / 2 );
		end
	end
endfunction
