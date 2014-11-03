function grafic()
      % Functia de la punctul "d", care adauga la graficul realizat la punctul "a" , si punctele corespunzatoare caracteristicilor noilor biciclete(pretul, vechimea, tipul)
      % Theta-ul este cel obtinut cu ajutorul functiei implementate la subpunctul b, train_parameters.
theta=[55.57622634621354,-2.628724657762463,5.652272396985559]

    cd in;
    b = dlmread('in3c');
    data = dlmread('data3');
    X = data(:,[1,2]);
    price = data(:,3);
    cd ..;
    pret = zeros (20,1);
    plot_data(price, X(:,1), X(:,2));
    
    for i = 1 : 20
        pret(i) = get_price(theta, b(i,:));
    endfor
    hold on;
    plot3(pret,b(:,2),b(:,3),'rx b');	
    hold off;	  

endfunction
