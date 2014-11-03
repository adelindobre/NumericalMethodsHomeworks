function R=Algebraic(nume,d)
   format long;
   % citirea si construirea matricilor A si K se face la fel ca in cazul  functiei Iterative.m
   fid=fopen(nume,'r');
   N=fscanf(fid,'%f',1);
   A=zeros(N);
   K=zeros(N);
   % Cu fseek pozitia in fisier va fi incepand cu linia doua.
   fseek(fid,1,'cof');
   for i=1:N
	% citire linie cu linie
        line=fgetl(fid);
        line=str2num(line);
        m=length(line);
        l=line(1);
        for j=3:m
		if (l!=line(j))
                	A(l,line(j))=1;
		else
			line(2)--;
		end	
        end
	% intotdeauna elementele de pe diagonala principala vor fi 0 
	A(l,l)=0;
	K(i,i)=1/line(2);
   end
   fclose(fid);
   R=zeros(N,1);
   M=(K*A)';
   l=ones(N,1);
   T=eye(N)- d .*M;
    % B reprezinta inversa matricii T
   B=GramSchmidt(T);
   R=B*((1-d)/N)*l;

endfunction   

