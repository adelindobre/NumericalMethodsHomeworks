Dobre Grigore Adelin 313CC
    Tema a fost implementata si testata in mediul Octave
    
    Cerinta 1: Functia Iterative
        
        Aceasta functie calculeaza indicele PageRank pentru fiecare pagina, printr-o metoda iterativa.
   
        Detalii legate de implementare sunt continute in comentariile pe care le-am scris in interiorul functiei.
       
        Vectorul de PageRank-uri este R, care se va obtine dupa ce conditia norm(R0-R)>eps nu va mai fi indeplinita.
        
        In calcularea lui R, aplic formula R0=(d .* M) * R + ((1-d)/N) .* l. In aceste conditii, R0 este vectorul de la pasul curent, iar R este vectorul de la 
pasul anterior.
        
        Matricea M o determin dupa formula M=(K^-1*A)', unde A reprezinta matricea de adiacenta iar K este o matrice diagonala cu elementele de pe diagonala 
principala egale cu numarul de pagini catre care indica fiecare pagina in parte. Cu alte cuvinte, K are pe diagonala principala, elementele de pe coloana a
doua din fiserul de intrare.

        Pentru calculul inversei matricii K, a fost de ajuns sa fac inversele elementelor de pe diagonala principala, deoarece K este o matrice diagonala.
   
    Cerinta 2: Functia Algebraic

        Citirea din fisier si construirea matricii M se face la fel ca in cadrul functiei Iterative. De aceasta data, determinarea vectorului de PageRank-uri se
face pe cale algebrica, deci nu mai este nevoie de vreo conditie de oprire. Ecuatia folosita este: R = d*M*R +((1−d)/N)*l

        Notez T = I - d*M si fac descompunerea ei in Q*R folosind Gram-Schmidt.
        Apoi, pentru a determina inversa lui T rezolv sistemul T*x=e,unde x reprezinta fiecare coloana in parte din inversa matricii T, iar e reprezinta 
fiecare coloana in parte din matricea unitate.
        
        In continuarea, aplic algoritmul pentru rezolvarea unui sistem superior triunghiular: R1*R=b. 
        
    Cerinta 3: Functia Apartenenta
        
        Functia Apartenenta primeste ca input vectorul de PageRank-uri obtinut la cerinta 2, si ultimele doua valori ddin fisierul de intrare.

        Parametrii a si b ai functiei u se obtin din conditia de continuitate a functiei. Astfel, in urma aplicarii limitelor laterale in punctele val1 si val2
vor rezulta urmatoarele doua ecuatii: a*val1+b=0 (dupa aplicarea conditiei de continuitate in punctul val1) si a*val2+b=1 (in punctul val2).

        Apoi, in cadrul functiei calculez valoare functiei u corespunzatoare fiecarui x.

               Functia PageRank

        In cadrul acestei functii, se apeleaza functiile definite la cerintele 1 si 2. Se realizeaza sortarea vectorului R2 obtinut dupa apelarea functiei 
Algebraic si retinerea lui in PR1. Apoi apelarea functiei Apartenenta se face cu parametrii PR1, val1, val2.  
                                                            
      
