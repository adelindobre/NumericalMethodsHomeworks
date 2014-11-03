function eroare()
	
	cd in;
	data=dlmread('data3');
	cd ..;
	for i=10:49
		%Formez pe rand matricea X, care initial are 10 linii, si la fiecare iteratie, i se adauga inca o linie
		X=data(1:i,[1,2]);
		y=data(1:i,3);
		% Calculez theta corespunzator liniilor din fisierul de intrare
		theta=train_parameters(X,y);
		%b reprezinta vectorul care contine caracteristicile bicicletei de la linia i+1
		b=data(i+1,[1 2]);
		b=[1 b];
		p=get_price(theta,b);
		% calculez eroarea ca diferenta intre pretul real si cel determinat cu ajutorul lui theta
		err=data(i+1,3)-p;
		hold on;
		plot(i,err,'rx -');	
		xlabel('Configuratii luate in considerare pentru vectorul theta');
		ylabel('Eroarea');
		hold off;
	endfor
endfunction




