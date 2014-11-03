function [R1 R2]=PageRank(nume,d,eps)
	format long;
	fid=fopen(nume,'r');
	v=fscanf(nume,'%f',inf);
	% N->numarul de pagini
	N=v(1);
	val1= v(length(v)-1);
	val2=v(length(v));
	fclose(fid);
	% Apelarea functiilor Iterative si Algebraic
	R1=Iterative(nume,d,eps);
	R2=Algebraic(nume,d);
	% PR1 va fi egal cu R2 sortat descrescator
	PR1=R2;
	k=zeros(N,1);
	% Vectorul k are ca elemente numarul paginii pentru care se calculeaza PR
	for i=1:N
		k(i)=i;
	end
	% Pentru sortare am folosit Bubble Sort
	for ultim=N:-1:1
		for i=1:ultim-1
			if (PR1(i)<PR1(i+1))
				aux1=PR1(i+1);
				PR1(i+1)=PR1(i);
				PR1(i)=aux1;
				
				aux1=k(i+1);
				k(i+1)=k(i);
				k(i)=aux1;
			endif
		endfor
	endfor
	x=zeros(N,1);
	% Functia Apartenenta va primi ca input vectorul sortat PR1 
 	x=Apartenenta(PR1,val1,val2);
	% in fnume retin numele fiserului de intrare la care se concateneaza string-ul ".out"
	fnume=[nume ".out"];
	fid=fopen(fnume,'w+');
	fprintf(fid,'%i',N);
	fprintf(fid,'\n');
	for i=1:N
		fprintf(fid,'%.6g',R1(i));
		fprintf(fid,'\n');
	end
	fprintf(fid,'\n');
	for i=1:N
		fprintf(fid,'%.6g',R2(i));
		fprintf(fid,'\n');
	end
	fprintf(fid,'\n');
	for i=1:N
		fprintf(fid,'%i %i %.6g',i,k(i),x(i));
		fprintf(fid,'\n');
	end
	fclose(fid);
endfunction	
