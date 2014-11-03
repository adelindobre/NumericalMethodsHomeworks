function [rez]=interp3D(A,x)
	% Primesc ca parametru o matrice tridimensioanala care poate retine mai multe cuburi. Am considerat insa ca primele opt linii din matrice reprezinta varfurile 
	% primului cub , iar urmatoarele opt linii reprezinta varfurile urmatorului cub. Deci D=[ liniile pentru varfurile primului cub]. Apoi D(:,:,2)=[liniile pentru varfurile cubului 2] 	
	rez=zeros(2,1)';
	% Asadar q reprezinta numarul de cuburi, p va fi intotdeauna egal cu 5 iar m va fi intotdeauna 8.
	[m p q]=size(A);
	cub=zeros(q,1);
	cub=cub';
	% pentru fiecare cub in parte, testeaz daca punctul cerut se afla in interiorul acestuia si retin intr-un vector volumul cubului
	% pentru a determina in cele dein urma cubul cu dimensiunea cea mai mica in care se poate afla cubul.
	for i=1:q
		xA=unique(A(:,1,i));
		yA=unique(A(:,2,i));
		zA=unique(A(:,3,i));
		if ( x(1) > xA(1) && x(1) < xA(2) )
			if ( x(2) > yA(1) && x(2) < yA(2) )
				if (x(3) > zA(1) && x(3) < zA(2))
					cub(i) = (xA(2) - xA(1)) * (yA(2) - yA(1)) * (zA(2) - zA(1));
				end
			end
		end
	end
	cub=cub(cub~=0);
	minim = cub(1);
	cont=1;
	for i=2:length(cub)
		if cub(i) < minim 
			minim=cub(i);
			cont=i;	
		end
	end
	
	xA=unique(A(:,1,cont));
	yA=unique(A(:,2,cont));
	zA=unique(A(:,3,cont));
	% xd , yd si zd reprezinta diferentele dintre fiecare coordonata a punctului cerut(adica x)
	xd = ( x(1) - xA(1) ) / ( xA(2) - xA(1) );
	yd = ( x(2) - yA(1) ) / ( yA(2) - yA(1) );
	zd = ( x(3) - zA(1) ) / ( zA(2) - zA(1) );
	k=1;
	% Ultimele doua coloane ale matricei tridimensionale reprezinta valorile luate de functie in punctul respectiv
	for i=4:5
		for j=1:m
			% Mai intai realizez interpolarea pentru prima coordonata a vectorului x
			if ( A(j,1,cont) == xA(1) && A(j,2,cont) == yA(1) && A(j,3,cont) == zA(1) )
				c(k++) = A(j,i,cont) * (1 - xd) + A(j,i,cont) * xd;
			end

			if ( A(j,1,cont) == xA(1) && A(j,2,cont) == yA(2) && A(j,3,cont) == zA(1) ) 
				c(k++) = A(j,i,cont) * (1 - xd) + A(j,i,cont) * xd;
			end

			if ( A(j,1,cont) == xA(1) && A(j,2,cont) == yA(1) && A(j,3,cont) == zA(2) )
				c(k++) = A(j,i,cont) * (1 - xd) + A(j,i,cont) * xd;
			end

			if ( A(j,1,cont) == xA(1) && A(j,2,cont) == yA(2) && A(j,3,cont) == zA(2) )
				c(k++) = A(j,i,cont) * (1 - xd) + A(j,i,cont) * xd;
			end
		end
	end
	k=1;
	% apoi interpolez pentru x(2), adica cea de-a doua coordonata.
	for i=1:4
		cc(i) = c(k++) * (1 - yd) + c(k++) * yd;
	end
	k=1;
	% apoi realizez interpolarea pentru z.
	for i=1:2
		rez(i) = cc(k++) * (1 - zd) + cc(k++) * zd;

	end
endfunction
	  					
