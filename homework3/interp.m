function X=interp(Y,option)
	%  Functiile de interpolare liniara si polinomiala le-am unit intr-o singura functie, trimitand ca parametru un string
	%  ce indica tipul de interpolare dorit. Acesta string e retinut in variabila "option". Functia mai primeste ca date de intrare
	% o matrice tridimensionala. Presupun ca am doua seturi : set1 [1 3 5 7; 10 30 50 70] si set2 [2 4 6: 20 40 60]. Matricea Y am construit-o
	% dupa cum urmeaza: Y=[1 3 5 7; 2 4 6 0] , apoi Y(:,:,2) = [10 30 50 70; 20 40 60 0]. Astfel, cand voi apela Y(1,:,:) , se va afisa datele
	% corespunzatoare primului set de date. Am tinut sa precizez acest aspect deoarece este un detaliu ce tine de implementarea temei.	
	
	[n m q]=size(Y);
	v=0;
	u=0;
	% In continuare, toti timpii corespunzatori tuturor seturilor de date, i-am introdus intr-un vector, din care am eliminat elementele zero 
	% si l-am sortat crescator cu functia unique.
	for i=1:n
		for j=1:m
			if (Y(i,j,1)~=0)
				v=[v Y(i,j,1)];
			end
		end
	end
	v=v(v~=0);
	v=unique(v);
	% Apoi am aflat pasul minim intre doi timpi succesivi, parcurgand vectorul v.
	t = v(2)-v(1);
	for i=2:length(v)-1
		if (v(i+1)-v(i)<t)
			t=v(i+1)-v(i);
		end
	end
	% Dupa ce am aflat cea mai mica diferenta intre doi timpi consecutivi,
	% am format vectorul u plecand de la cel mai mic element din vectorul v pana la cel mai mare , cu pasul t.
	for i=v(1):t:v(length(v))
		u=[u i];
	end
	u=u(u~=0);
	% Formez matricea tridimensionala de iesire in care pentru fiecare set de date voi avea vectorul u pe prima linie. 
	X=zeros(n,length(u),2);
	for i=1:n
		for j=1:length(u)
			X(i,j,1)=u(j);
		end
	end

	if (strcmp(option,"linear")==1)
		for i=1:n
		% interpolare liniara
			contX = 1;
			contY = 1;
		
			y1=Y(i,:,1);
			y1=y1(y1~=0);
	
			y2=Y(i,:,2);
			y2=y2(y2~=0);
			% Retin in matricea y fiecare set de date in parte.
			y=[y1;y2];
			% Ideea interpolarii liniare  este de a aplica ecuatia dreptei intre doua puncte sucesive. In felul acesta
			% voi putea determina valoarea functiei intr-un punct intermediar. 
			pas = (y(2,2) - y(2,1)) / (y(1,2) - y(1,1)) ;
			% Verific daca elementele din vectorul u sunt mai mici decat primul element corespunzator setului de date
			while (contX < length(u) && u(contX) < y(1,1))
				X(i,contX,2) = y(2,1) - ( pas * (y(1,1) - u(contX)) );
				++contX;
			end
			% contX reprezinta un contor ce indica cand se termina de parcurs elementele vectorului u.
			%  Similar contY indica cand se termina de parcurs timpii corespunzatori fiecarui set.
			%  A doua bucla while trateaza cazul in care punctul intermediar se poate afla intre doua puncte din vectorul y(1,:),
			%  caz in care variabila pas se modifica in mod corespunzator.
			while ( contX < length(u)  && contY < length(y))
				while (contY < length(y) && u(contX) >= y(1,contY))
					++contY;
				end
				if (contY ~= length(y))
					pas = (y(2,contY) - y(2,contY-1)) / (y(1,contY) - y(1,contY-1));
					X(i,contX,2) = y(2,contY) - ( pas * ( y(1,contY) - u(contX)) );
					++contX;
				end
			end
			% Ultima bucla while verifica cazurile in care elmentele din u sunt mai mari decat ultimul element din vectorul y(1,:),
			% caz in care puncte intermediare vor fi ultimele doua puncte din matricea y.
			if (contX <= length(u))
				pas = (y(2,length(y)) - y(2,length(y)-1)) / (y(1,length(y)) - y(1,length(y)-1));
				while (contX <= length(u))
					X(i,contX,2) = y(2,length(y)) + ( pas * ( u(contX) - y(1,length(y))) );
					++contX;
				end
			end
		end		
	end
	% La interpolare polinomiala am folosit metoda Neville.
	if (strcmp(option,"polinomial")==1)
		for i=1:n
			x=Y(i,:,1);
			x=x(x~=0);
			elem=length(x);
			% Aplic metoda pentru fiecare element din u in parte.
			for k=1:length(u)
				% Vectorul P este initializat de fiecare data cu valorile de pe a doua linie din fiecare set de date.
				P=Y(i,:,2);
				P=P(P~=0);
				for q=1:elem-1
					for j=1:elem-q
						P(j) = ((u(k) - x(j+q)) * P(j) - (u(k) - x(j)) * P(j+1)) / (x(j) - x(j+q));
					end
				end
			X(i,k,2)=P(1);
			end         			
		end
  	end	
	      
endfunction
