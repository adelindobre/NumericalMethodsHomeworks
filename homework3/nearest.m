function rez=nearest(A,x)
	% A reprezinta o matrice de nX5 unde n reprezinta numarul de puncte care se cunoaste 
	[n m] = size(A);
	% Pentru fiecare linie in parte calculez distanta euclidiana dintre punctul de pe linia respectiva si punctul cerut
	for i=1:n
		s=0;
		for j=1:m-1
			s = s + (x(j) - A(i,j)).^2 ;	
		end
		% Valorile calculate le retin intr-un vector.
		v(i) = sqrt(s);
	end
	% Parcurg pentru a vedea care este cea mai mica valoarea si retin in varibila poz pozitia punctului din matrice
	% pentru care s-a obtinut valoarea cea mai mica (adica cu alte cuvinte linia pe care se afla punctul) 
	minim = v(1);
	poz=1;

	for i=2:n
		if v(i) < minim
			minim = v(i); 
			poz=i;
		end
	end
	%Si in variabila rez intorc valoarea functiei in punctul  respectiv.
	rez = A(poz,5);

endfunction
	
