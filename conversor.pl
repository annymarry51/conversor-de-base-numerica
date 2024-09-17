
%Para converte da base 10, para outras bases (2, 8, 16).

base16([0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F']).
numero(0,[X|_],X).
numero(Num,[_|Xs],Elemento):-
    Indice is Num-1,
    numero(Indice,Xs,Elemento).
converter(Num, Base, [X]):-
    Num < Base,
    base16(Base16List),
    numero(Num,Base16List,X).
converter(Num,Base,[X|Xs]) :-
    Auxiliar is Num mod Base,
    base16(Base16List),
    numero(Auxiliar,Base16List,X),
    Quociente is  Num//Base,
    converter(Quociente,Base,Xs).
converte(Num,Base,Resul) :-
    (Base=:=10;
    Base=:=16;
    Base=:=2;
    Base=:=8),
    converter(Num, Base, R),
    reverse(R,Aux),atomic_list_concat(Aux, '', Resul).
