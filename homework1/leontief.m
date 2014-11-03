function [x]=leontief(matrix_file,column_file)
	%Pentru a calcula sistemul de ecuatii, am aplicat metoda Givens
	load(matrix_file,'S');
	b=load(column_file);
	
	format free;
	[n,n]=size(S);
	
	Q=eye(n);
	S=Q-S;
	x=zeros(n,1);
	
	t=zeros(2,n);
	u=zeros(2,1);	

	for k=1:n-1
		for l=k+1:n
			% Prin acest if, testez daca elementele de sub diagonala principala sunt "0" sau nu.
			if(S(l,k)!=0)			
				r=sqrt(S(k,k)^2+S(l,k)^2); 
				% Definesc elementele matricei de rotatie
				c=S(k,k)/r;
				s=S(l,k)/r;
				% Matricea de rotatie se inmulteste cu matricea formata din linia K si urmatoarele linii, luate pe rand
				t=[c s; -s c]*[S(k,1:n); S(l,1:n)];
				% Efectul inmultirii, va fi modificarea elementelor liniilor K si l.
				S(k,1:n)=t(1,1:n);
				S(l,1:n)=t(2,1:n);
				% De asemenea, se va modifica si vectorul termenilor liberi, prin inmultire cu matricea de rotatie.
				u=[c s; -s c]*[b(k); b(l)];
		
				b(k)=u(1);
				b(l)=u(2);

				t=[c s; -s c]*[Q(k,1:n); Q(l,1:n)];

				Q(k,1:n)=t(1,1:n);
				Q(l,1:n)=t(2,1:n);
			end

		endfor

	endfor

	x(n)=b(n)/S(n,n);
	% Rezolvarea sistemului superior triunghiular
	for k=n-1:-1:1
		
		sum=b(k);
	
		for j=k+1:n
			
			sum=sum-S(k,j)*x(j);

		endfor

		x(k)=sum/S(k,k);
	
	endfor
	% Tiparirea rezultatului in fisierul de iesire "date.out"
	fid=fopen('date.out','w+');
	for i=1:length(x)
		fprintf(fid,'%.16g',x(i));
		fprintf(fid,' ');
	end

	fclose(fid);



endfunction
