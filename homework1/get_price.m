function [p]=get_price(theta,b)

	m=length(theta);
	p=0;
	for i=1:m
		p=p+theta(i)*b(i);
	end
endfunction	
