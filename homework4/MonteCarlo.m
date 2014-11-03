function A  = MonteCarlo(x,y,tol)
	
	x1 = min(x);
	x2 = max(x);
	y1 = min(y);
	y2 = max(y);
	% Calculez Aria dreptunghiului ce va incadra curba
	Ariep = ( x2  -  x1 ) * ( y2 - y1 );
	Aprev = 0;
	% N  reprezinta  numarul de puncte generate
	N = 128;
	[randx randy] = Gen2DPoints (N,x1,x2,y1,y2);
	% Vectorii testx si testy sunt necesari in testarea conditiei daca punctele generate se afla in interiorul curbei sau nu
	% Dupa cum se observa, acesti vectori au ca prin element ultimul element din vectorul x, respectiv y
	testx = [ x(length(x)) x(1:length(x) - 1 )];
	testy = [ y(length(x)) y(1:length(x) - 1) ];
	% Nint reprezinta numarul de puncte din interiorul curbei
	Nrandp = 0;
	Nint = 0;
	while (1)       
		for i=1:N - Nrandp
			% conditii de testare a existentei punctelor generate in interiorul curbei
		     	cond1 = ((y >= randy(i) ) ~= ( testy >= randy(i) ));
			cond2 =  ( randx(i) <= (testx - x) .* ( randy(i) - y ) ./ (testy - y) + x ) ;
			cond3 =(cond1 & cond2) ;
			suma =0;
			% Pentru fiecare punct generat se testeaza daca apartine curbei, iar rezultatul este retinut in vectorul cond3
			% Suma elementelor din vectorul cond3 ne spune daca intr-adevar un punct apartine curbei sau nu.
			for j=1:length(cond3)
				suma  = suma + cond3(j);
			end 
			% Conditia de apartenenta este aceea ca suma elementelor sa nu se imparta exact la doi. Acest lucru este o consecinta a teoremei lui jordan
			% Astfel, daca am trasa o linie orizontala in dreptul punctului pentrua vedea de cate ori intersecteaza conturul poligonului, rezzultatul s-ar interpreta in felul urmator:
			% Daca numarul de intersectii ar fi impar, inseamna ca punctul apartine poligonului, iar daca este par, atunci nu ar apartine.
		     if ( mod (suma,2) ~= 0)
			% In cazul in care punctul apartine poligonului, incrementez variabila Nint;
			Nint = Nint + 1;
		     end
		end
		% Calculul Ariei curbei inchise 
		A = Nint / N * Ariep;
		if abs( A - Aprev ) <= tol
			break;
		end
		% in cazul in care conditia abs(A - Aprev )<= tol nu este indeplinita va trece la o noua iteratie
		[randx randy] = Gen2DPoints (N,x1,x2,y1,y2);
		Nrandp = N;
		N = N*2;
		Aprev = A;
	end

endfunction 
			
				
	
