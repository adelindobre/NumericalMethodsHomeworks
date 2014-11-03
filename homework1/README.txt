Tema realizata a fost conceputa si testata in mediul Octave.
    Task 1:  Pentru prima cerinta am implementat metoda lui Givens pentru rezolvarea sistemului. Am ales acest algoritm deoarece matricea sistemului este o matrice rara, cu multe elemente egale 
cu 0, iar acest algoritm se preteaza cel mai bine, mai ales ca pentru eficienta am inclus si o conditie care testeaza daca elementele sunt egale cu 0 sau nu.
            Testarea primului task am facut-o cu ajutorul fisierului checker.m, unde primesc Corect pentru toate cele 13 teste.
    Task 2: Pentru a doua cerinta, in rezolvarea sistemului tridiagonal am distins doua cazuri, formulate pe baza cerintei. Primul caz este acela cand matricea este mai mica de 100 linii,
iar rezolvarea se face cu eliminare gaussiana prin pivotare partiala, iar al doilea caz , cand n> 100 rezolva sistemul prin algoritmul lui Thomas.
            Testarea acestui task, am facut-o cu ajutorul checkerul-ui special pentru problema 2, ce includea fisierul check1.sh. De asemenea, si la acest task, primesc maxim de puncte pe 
   toate testele.
    Task 3: La  subpunctul "d", se observa din graficul realizat cu ajutorul functie grafic.m, ca preturile bicicletelor calculate sunt asemanatoare cu cele ale bicicletelor deja existente,
ceea ce inseamna ca estimarile (adica theta calculat la punctul b) sunt destul de bune.  Acest lucru se datoreaza faptului ca setul de invatare este destul de vast.
            La subpunctul "e", graficul l-am facut cu ajutorul functiei eroare.m. Cum la fiecare pas, setul de date pentru algoritmul de invatare creste, inseamna ca estimarile facute (adica 
   theta) vor fi din ce in ce mai exacte, iar eroare calculata ca diferenta intre pretul real si cel obtinut prin parametri algoritmului de invatare, va fi din ce in ce mai mica.
             Taskul 3 l-am testat cu ajutorul fisierului check.m si primesc corect pentru subpunctele b si c.     
