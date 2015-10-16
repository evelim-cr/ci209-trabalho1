pesa([], [], 0, 0) :- ! .

pesa([V1|T1], [V2|T2], S1, S2) :-
	pesa(T1, T2, NovoS1, NovoS2),
	S1 is NovoS1+V1,
	S2 is NovoS2+V2.


moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso) :-
	pesa([M1,M2,M3,M4], [M5, M6, M7, M8], Pesagem1A, Pesagem1B),
	verifica1(Pesagem1A, Pesagem1B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso).


% verifica o resultado da primeira pesagem
verifica1(Pesagem1A, Pesagem1B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso) :-
	Pesagem1A > Pesagem1B,
	pesa([M3,M5,M6], [M4,M7,M8], Pesagem2A, Pesagem2B),
	verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [maior]).

verifica1(Pesagem1A, Pesagem1B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso) :-
	Pesagem1A =:= Pesagem1B,
	pesa([M6,M7,M8], [M10,M11,M12], Pesagem2A, Pesagem2B),
	verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [igual]).

verifica1(Pesagem1A, Pesagem1B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso) :-
	Pesagem1A < Pesagem1B,
	pesa([M3,M5,M6], [M4,M7,M8], Pesagem2A, Pesagem2B),
	verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [menor]).


% verifica o resultado da segunda pesagem
verifica2(Pesagem2A, Pesagem2B, [_,_,_,_,_,_,M7,M8,_,_,_,_], Posicao, Peso, [maior]) :-
	Pesagem2A > Pesagem2B,
	pesa([M7], [M8], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [maior,maior]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,_,_,_,_,_,_,_,_,_,_], Posicao, Peso, [maior]) :-
	Pesagem2A =:= Pesagem2B,
	pesa([M1], [M2], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [maior,igual]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [maior]) :-
	Pesagem2A < Pesagem2B,
	pesa([M5], [M6], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [maior,menor]).


verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [igual]) :-
	Pesagem2A > Pesagem2B,
	pesa([M10], [M11], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [igual,maior]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [igual]) :-
	Pesagem2A =:= Pesagem2B,
	pesa([M5], [M9], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [igual,igual]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [igual]) :-
	Pesagem2A < Pesagem2B,
	pesa([M10], [M11], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [igual,menor]).


verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [menor]) :-
	Pesagem2A > Pesagem2B,
	pesa([M5], [M6], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [menor,maior]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [menor]) :-
	Pesagem2A =:= Pesagem2B,
	pesa([M1], [M2], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [menor,igual]).

verifica2(Pesagem2A, Pesagem2B, [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], Posicao, Peso, [menor]) :-
	Pesagem2A < Pesagem2B,
	pesa([M7], [M8], Pesagem3A, Pesagem3B),
	verifica3(Pesagem3A, Pesagem3B, Posicao, Peso, [menor,menor]).


% verifica o resultado da terceira pesagem
verifica3(Pesagem3A, Pesagem3B, 8, menos, [maior,maior]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 3, mais, [maior,maior]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 7, menos, [maior,maior]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 1, mais, [maior,igual]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 2, mais, [maior,igual]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 6, menos, [maior,menor]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 4, mais, [maior,menor]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 5, menos, [maior,menor]) :-
	Pesagem3A < Pesagem3B.


verifica3(Pesagem3A, Pesagem3B, 11, menos, [igual,maior]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 12, menos, [igual,maior]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 10, menos, [igual,maior]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 9, menos, [igual,igual]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 9, mais, [igual,igual]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 10, mais, [igual,menor]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 12, mais, [igual,menor]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 11, mais, [igual,menor]) :-
	Pesagem3A < Pesagem3B.


verifica3(Pesagem3A, Pesagem3B, 5, mais, [menor,maior]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 4, menos, [menor,maior]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 6, mais, [menor,maior]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 2, menos, [menor,igual]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 1, menos, [menor,igual]) :-
	Pesagem3A < Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 7, mais, [menor,menor]) :-
	Pesagem3A > Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 3, menos, [menor,menor]) :-
	Pesagem3A =:= Pesagem3B.

verifica3(Pesagem3A, Pesagem3B, 8, mais, [menor,menor]) :-
	Pesagem3A < Pesagem3B.
