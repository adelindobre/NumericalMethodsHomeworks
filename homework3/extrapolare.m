function X=extrapolare(Y)
	
	% Functia este aceeasi ca si cea de la prima cerinta , doar ca de data aceasta vectorul u va mai contine
	% un element corespunzator unui moment ulterior
	format free;
	
        [n m q]=size(Y);
      	k=1;
        for i=1:n
                for j=1:m
                        if (Y(i,j,1)~=0)
                                v(k++)=Y(i,j,1);				
                        end
                end
        end
	% Se sorteaza vectorul continand timpii si se afla cea mai mica diferenta dintre doi timpi succesivi
        v = v(v~=0);
        v = unique(v);
        t = v(2)-v(1);
        for i=2:length(v)-1
                if (v(i+1) - v(i) < t)
                        t = v(i+1)-v(i);
                end
        end
	k=1;
        for i=v(1):t:v(length(v))
                u(k++) =i;
        end
	% Vectorului u i se mai adauga un element cu t mai mare fata de ultimul.
	u(length(u)+1) = u(length(u)) + t;
	
        X = zeros(n,length(u),2);
  	% Ca si la prima cerinta, se va returna tot  o matrice tridimensionala
        for i=1:n
                for j=1:length(u)
                        X(i,j,1) = u(j);
                end
        end
	
	for i=1:n
                        x=Y(i,:,1);
                        x=x(x~=0);
                        elem=length(x);
			% Aplic metoda Neville pentru fiecare element din u
                        for k=1:length(u)
                                P=Y(i,:,2);
                                P=P(P~=0);
                                for h=1:elem-1
                                        for j=1:elem-h
                                                P(j) = ((u(k) - x(j+h)) * P(j) - (u(k) - x(j)) * P(j+1)) / (x(j) - x(j+h));
		                        end
                                end
                        X(i,k,2)=P(1);
                        end
                end
        end

endfunction	
