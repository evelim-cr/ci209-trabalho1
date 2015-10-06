% moedas(0, []) :- !.
% moedas (N, [(_P1, _P2, _P3, _P4, _P5, _P6, P7 ))


%% pesa1([M1,M2,M3,M4,M5,M6,M7,M8|_]) :-
%% 	...

%% moeda_diferente(Moedas, Posicao, Peso) :-
%% 	pesa1(Moedas).


mais_pesado([], [], S1, S2) :- 
	S1 > S2.
mais_pesado([V1|T1], [V2|T2], S1, S2) :-
	NovoS1 is S1+V1,
	NovoS2 is S2+V2,
	mais_pesado(T1, T2, NovoS1, NovoS2).

mais_leve([], [], S1, S2) :- 
	S1 < S2.
mais_leve([V1|T1], [V2|T2], S1, S2) :-
	NovoS1 is S1+V1,
	NovoS2 is S2+V2,
	mais_leve(T1, T2, NovoS1, NovoS2).

igual([], [], S1, S2) :- 
	S1 =:= S2.
igual([V1|T1], [V2|T2], S1, S2) :-
	NovoS1 is S1+V1,
	NovoS2 is S2+V2,
	igual(T1, T2, NovoS1, NovoS2).				

%regras baseadas na logica descoberta para solucao do problema

%posicao 8 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 8, menos) :-
	mais_pesado([M7], [M8], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 3 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 3, mais) :-
	igual([M7], [M8], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 7 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 7, menos) :-
	mais_leve([M7], [M8], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).	
%------------------------------------


%posicao 1 mais pesada
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 1, mais) :-
	mais_pesado([M1], [M2], 0, 0),
	igual([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 2 mais pesada
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 2, mais) :-
	mais_leve([M1], [M2], 0, 0),
	igual([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).
%-------------------------------------
%

%posicao 6 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 6, menos) :-
	mais_pesado([M5], [M6], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 4 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 4, mais) :-
	igual([M5], [M6], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 5 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 5, menos) :-
	mais_leve([M5], [M6], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_pesado([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).	
					
%-----------------------------------


%posicao11 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 11, menos) :-
	mais_pesado([M10], [M11], 0, 0),
	mais_pesado([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 12 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 12, menos) :-
	igual([M10], [M11], 0, 0),
	mais_pesado([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 10 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 10, menos) :-
	mais_leve([M10], [M11], 0, 0),
	mais_pesado([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).	
%------------------------------------


%posicao 9 mais leve
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], 9, mais) :-
	mais_pesado([M5], [M9], 0, 0),
	igual([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 9 mais pesada
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12], 9, mais) :-
	mais_leve([M5], [M9], 0, 0),
	igual([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).
%-------------------------------------
%

%posicao 10 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 10, mais) :-
	mais_pesado([M10], [M11], 0, 0),
	mais_leve([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 12 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 12, mais) :-
	igual([M10], [M11], 0, 0),
	mais_leve([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 11 mais pesada
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,M10,M11,M12], 11, mais) :-
	mais_leve([M10], [M11], 0, 0),
	mais_leve([M6,M7,M8], [M10,M11,M12], 0, 0),
	igual([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%------------------------------------


%posicao 5 mais pesada
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 5, mais) :-
	mais_pesado([M5], [M6], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 4 mais leve 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 4, menos) :-
	igual([M5], [M6], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 6 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 6, mais) :-
	mais_leve([M5], [M6], 0, 0),
	mais_pesado([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).	
					
%-----------------------------------	

%posicao 2 mais leve
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 2, menos) :-
	mais_pesado([M1], [M2], 0, 0),
	igual([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 1 mais leve
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 1, menos) :-
	mais_leve([M1], [M2], 0, 0),
	igual([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).
%-------------------------------------

%posicao 7 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 7, mais) :-
	mais_pesado([M7], [M8], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 3 mais leve
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 3, menos) :-
	igual([M7], [M8], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).

%posicao 8 mais pesada 
moeda_diferente([M1,M2,M3,M4,M5,M6,M7,M8,_,_,_,_], 8, mais) :-
	mais_leve([M7], [M8], 0, 0),
	mais_leve([M3,M5,M6], [M4,M7,M8], 0, 0),
	mais_leve([M1,M2,M3,M4], [M5, M6, M7, M8], 0, 0).	
%------------------------------------





	