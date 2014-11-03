function [B]=GramSchmidt(T)
    % Aflu descompunerea Q*R pentru fiecare T
   [N N]=size(T);
   B=zeros(N);
   Q = zeros(N);
   R = zeros(N);
   I=eye(N); 
   for i = 1:N
        R(i,i) = norm(T(:,i));
        Q(:,i) = T(:,i) / R(i,i);
        for j = i+1:N
                R(i,j) = Q(:,i)' * T(:,j);
                T(:,j) = T(:,j) - Q(:,i) * R(i,j);
        endfor
   endfor

   b=zeros(N,1);
   % Rezolv sistemul T*x=e, unde x reprezinta fiecare coloana in parte din inversa matricii T, iar e reprezinta fiecare coloana in parte din matricea unitate  
   for k=1:N
	b=Q'*I(:,k);	
   	for i=N:-1:1
        	s=0;
        	for j=i+1:N
                	s=s+R(i,j)*B(j,k);
        	endfor
        	B(i,k)=(b(i)-s)/R(i,i);
   	endfor
 endfor

endfunction
