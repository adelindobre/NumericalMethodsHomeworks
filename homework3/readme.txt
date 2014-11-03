    Cerinta 1:   Interpolar. Functia se numeste interp.m 

                Functiile de interpolare liniara si polinomiala le-am unit intr-o singura functie, trimitand ca parametru un string
        ce indica tipul de interpolare dorit. Acesta string e retinut in variabila "option". Functia mai primeste ca date de intrare
        o matrice tridimensionala. Presupun ca am doua seturi : set1 [1 3 5 7; 10 30 50 70] si set2 [2 4 6: 20 40 60]. Matricea Y am construit-o
        dupa cum urmeaza: Y=[1 3 5 7; 2 4 6 0] , apoi Y(:,:,2) = [10 30 50 70; 20 40 60 0]. Astfel, cand voi apela Y(1,:,:) , se va afisa datele
        corespunzatoare primului set de date. Am tinut sa precizez acest aspect deoarece este un detaliu ce tine de implementarea temei.

            In continuare, toti timpii corespunzatori tuturor seturilor de date, i-am introdus intr-un vector, din care am eliminat elementele zero 
        si l-am sortat crescator cu functia unique.

            Apoi am aflat pasul minim intre doi timpi succesivi, parcurgand vectorul v.

            Dupa ce am aflat cea mai mica diferenta intre doi timpi consecutivi, am format vectorul u plecand de la cel mai mic element din vectorul v 
        pana la cel mai mare , cu pasul t.

            Formez matricea tridimensionala de iesire in care pentru fiecare set de date voi avea vectorul u pe prima linie.

            La interpolare liniara, retin in matricea y fiecare set de date in parte. Ideea interpolarii liniare  este de a aplica ecuatia dreptei intre
         doua puncte sucesive. In felul acesta, voi putea determina valoarea functiei intr-un punct intermediar.

            ContX reprezinta un contor ce indica cand se termina de parcurs elementele vectorului u. Similar contY indica cand se termina de parcurs timpii
         corespunzatori fiecarui set.
            A doua bucla while trateaza cazul in care punctul intermediar se poate afla intre doua puncte din vectorul y(1,:), caz in care variabila pas se 
        modifica in mod corespunzator.

            Ultima bucla while verifica cazurile in care elmentele din u sunt mai mari decat ultimul element din vectorul y(1,:), caz in care puncte intermediare 
        vor fi ultimele doua puncte din matricea y.
    
            La interpolare polinomiala am folosit metoda Neville. Aplic metoda pentru fiecare element din u in parte. Vectorul P este initializat de fiecare data
         cu valorile de pe a doua linie din fiecare set de date.
            
    Cerinta 2: Extrapolare. Functia se numeste extrapolare.m
        
            Functia este aceeasi ca si cea de la prima cerinta, doar ca de data aceasta vectorul u va mai contine un element corespunzator unui moment ulterior
            Se sorteaza vectorul continand timpii si se afla cea mai mica diferenta dintre doi timpi succesivi.
            Vectorului u i se mai adauga un element cu t mai mare fata de ultimul. Ca si la prima cerinta, se va returna tot  o matrice tridimensionala.
        Aplic metoda Neville pentru fiecare element din u.

    Cerinta 3: Interpolare tridimensionala. Functia se numeste interp3D.m
    
            Primesc ca parametru o matrice tridimensioanala care poate retine mai multe cuburi. Am considerat insa ca primele opt linii din matrice reprezinta varfurile 
        primului cub , iar urmatoarele opt linii reprezinta varfurile urmatorului cub. Deci D=[ liniile pentru varfurile primului cub]. Apoi D(:,:,2)=[liniile pentru varfurile cubului 2] 
            Asadar q reprezinta numarul de cuburi, p va fi intotdeauna egal cu 5 iar m va fi intotdeauna 8. Pentru fiecare cub in parte, testez daca punctul cerut se afla in interiorul 
        acestuia si retin intr-un vector volumul cubului, pentru a determina in cele din urma cubul cu dimensiunea cea mai mica in care se poate afla cubul.
            Detalii legate de algoritm sunt continute si in comentariile functiei

    Cerinta 4;: Interpolare nearest neighbour. Functia se numeste nearest.m

            A reprezinta o matrice de nX5 unde n reprezinta numarul de puncte care se cunoaste. Pentru fiecare linie in parte calculez distanta euclidiana dintre punctul de pe 
       linia respectiva si punctul cerut.
            Valorile calculate le retin intr-un vector. Parcurg pentru a vedea care este cea mai mica valoarea si retin in varibila poz pozitia punctului din matrice pentru care 
        s-a obtinut valoarea cea mai mica (adica cu alte cuvinte linia pe care se afla punctul).
            Si in variabila rez intorc valoarea functiei in punctul  respectiv.

    
            