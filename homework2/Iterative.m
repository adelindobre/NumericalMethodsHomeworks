function [R]=Iterative(nume,d,eps)
   % functie care calculeaza indicele PageRank pentru fiecare pagina, prin metoda iterativa
   format long;	
   fid=fopen(nume,'r');
   % N-> reprezinta numarul de pagini 
   N=fscanf(fid,'%f',1);
   % A reprezinta matricea de adiacenta, iar K reprezinta matricea diagonala
   % Elementele de pe diagonala principala a lui K reprezinta numarul de noduri cu care se invecineaza fiecare nod, adica pentru fiecare pagina, elementul de pe diagonala lui K semnifica numarul linkurilor catre celelalte pagini
   A=zeros(N);
   K=zeros(N);	
   fseek(fid,1,'cof');
   % cu fseek ma mut pe linia a doua 
   for i=1:N
	% Citesc linie cu linie, transform vectorul de caractere intr-un vector de numere cu ajutorul functiei str2num si retin in l, numarrul nodului curent.
	line=fgetl(fid);
	line=str2num(line);
	m=length(line);
	l=line(1);
	for j=3:m
		% Testez daca nu cumva pagina web are link catre ea insasi, caz ce nu se va lua in considerare in construirea matricii de adiacenta, deci A(l,l)=0.
		% In cazul in care pagina are link catre ea insasi, numarul paginilor vecine va scadea cu 1.
		if (l!=line(j))
			A(l,line(j))=1;	
		else
			line(2)--;
		end
	end
	% In construirea matricii M, va fi folosit K^-1. Dar pentru ca matricea K este diagonala, atunci inversa ei este egala cu K,dar cu elementele de pe diagonala inversate
	A(l,l)=0;
	K(i,i)=1/line(2);
   end	
   fclose(fid);
  R=zeros(N,1);
  R0=zeros(N,1);	
  % se initializeaza vectorul de pageRank-uri cu 1/N
  for i=1:N
	R(i)=1/N;
  end
  % se construieste matricea M
  M=(K*A)';
  l=ones(N,1);			  					
  R0=(d .* M) * R + ((1-d)/N) .* l;
  % conditia de oprire 
  while ( norm(R0-R) >eps)
	R=R0;
	R0=d .* M *R + ((1-d)/N) .* l;
  end

endfunction
