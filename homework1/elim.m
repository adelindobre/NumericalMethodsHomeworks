function elim(fisier)           
	% Functie pentru rezolvarea sistemului tridiagonal
	format free;
	
	fid=fopen(fisier,'r');
	v=fscanf(fid,'%lf',inf);
	% In v, retin vectorul de numere din fisier, iar prin formula de mai jos determin dimensiunea matricii A
	n=(length(v)+2)/4;

	A=zeros(n);
	b=zeros(n,1);
	q=1;
	% Elementele nenule de pe prima linie a matricii, vor fi primele doua elemente din v.
	A(1,1)=v(q++);
	A(1,2)=v(q++);
	% Apoi liniile urmatoare, pana la ultima, vor contine cate trei elemente nenule.
	for i=2:n-1
		for k=i-1:i+1
			A(i,k)=v(q++);
		end
	end
	% Ultima linie va avea de asemenea doar doua elemente nenule
	A(n,n-1)=v(q++);
	A(n,n)=v(q++);

	for i=1:n
		b(i)=v(q++);
	end

	fclose(fid);
	x=zeros(n,1);
	% In cazul in care dimensiunea matricii e mai mica decat 100, dar dar si pentru ca Thomas nu se poate implementa in cazul primelor doua teste :)
	% Am aplicat eliminarea gaussiana cu pivotare partiala
	if (n<100)
		% Algoritmul lucreaza cu matricea extinsa
		A = [A b];
		[n m]=size(A);
		
		% Caut elementul maxxim in modul de pe coloana, si in caz ca difera de elementul de pe diagonala primcipala, se interschimba liniile
		for k=1:n-1
        		poz=k;
        		aux=A(k,k);
        		for i=k+1:n
                		if (abs(A(i,k))>abs(aux))
                        		aux=A(i,k);
                        		poz=i;
                		end
        		end
        		if (aux~=A(k,k))
                		v=A(k,:);
                		A(k, :)=A(poz,:);
                		A(poz , :)=v;
       		 	end

        		for(i=k+1:n)
                		xmult=A(i,k)/A(k,k);

                		for(j=k:m)
                        		A(i,j)=A(i, j) - xmult*A(k,j);
                		endfor
        		endfor
		endfor

		b=A(:,m);
		A=A(:,1:n);
		x(n) = b(n)/A(n,n); 
		% Rezolvarea sistemului superior triunghiular
		for i= n-1:-1:1	
        		s=0;
        		for j=i+1:n
                		s=s+A(i,j)*x(j);
        		endfor
        		x(i) = (b(i)-s)/A(i,i);
		endfor 
	
	
	else	
		% Algoritmul Thomas de rezolvare a sistemelor tridiagonale
		A(1,2) = A(1,2)/A(1,1);
        	b(1) = b(1)/ A(1,1);
       		
		for i = 2:n-1
        	        temp = A(i,i) - A(i,i-1) * A(i-1,i);
               		 A(i,i+1) = A(i,i+1) / temp;
              		 b(i) = (b(i) - A(i,i-1) * b(i-1)) / temp;
       		 end
      		  b(n) = (b(n) - A(n,n-1) * b(n-1)) / (A(n,n) - A(n,n-1) * A(n-1,n));
      		  x(n) = b(n);
       		 for i = n-1:-1:1
               		 x(i) = b(i) - A(i,i+1) * x(i+1);
     		  end

	end
		% Tiparirea rezultatului in fisierul "date.out"
 	    	fid=fopen('date.out','w+');

		for i=1:length(x)
			fprintf(fid,'%f',x(i));
			fprintf(fid,'\n');
		end

		fclose(fid);
  

endfunction

	
