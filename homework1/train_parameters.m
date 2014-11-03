function [theta]=train_parameters(X,y)


	m=length(X);
	X=[ones(m,1) X];

	y=X'*y;
	X=X'*X;
	
	X=[X y];
	[n m]=size(X);
	theta=zeros(n,1);

	for k=1:n-1
		poz=k;
		aux=X(k,k);
		for i=k+1:n
			if (abs(X(i,k))>abs(aux))
		
				aux=X(i,k);
				poz=i;
			end
		end
		
		if (aux~=X(k,k))
			v=X(k,:);
			X(k,:)=X(poz,:);
			X(poz,:)=v;
		end

		for i=k+1:n
			xmult=X(i,k)/X(k,k);
			
			for j=k:m
				X(i,j)=X(i,j)-xmult*X(k,j);
			endfor
		endfor
	endfor

	y=X(:,m);
	X=X(:,1:n);
	theta(n)=y(n)/X(n,n);
	
	for i=n-1:-1:1
		
		s=0;
		for j=i+1:n
			s=s+X(i,j)*theta(j);
		end
		theta(i)=(y(i)-s)/X(i,i);
	end

endfunction
