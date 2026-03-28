:- use_module(library(clpfd)).

main :-
    modelo(Lista),
    imprime_lista(Lista).

modelo(Lista) :-
    % Posicoes das mochilas.
    Mochilas = [Amarela, Azul, Branca, Verde, Vermelha],
    Mochilas ins 1..5,
    all_distinct(Mochilas),

    % Posicoes dos nomes.
    Nomes = [Denis, Joao, Lenin, Otavio, Will],
    Nomes ins 1..5,
    all_distinct(Nomes),

    % Posicoes dos meses.
    Meses = [Agosto, Dezembro, Janeiro, Maio, Setembro],
    Meses ins 1..5,
    all_distinct(Meses),

    % Posicoes dos jogos.
    Jogos = [TresOuMais, CacaPalavras, CuboVermelho, JogoDaForca, ProbDeLogica],
    Jogos ins 1..5,
    all_distinct(Jogos),

    % Posicoes das materias.
    Materias = [Biologia, Geografia, Historia, Matematica, Portugues],
    Materias ins 1..5,
    all_distinct(Materias),

    % Posicoes dos sucos.
    Sucos = [Laranja, Limao, Maracuja, Morango, Uva],
    Sucos ins 1..5,
    all_distinct(Sucos),

    % Fixos.
    Lenin #= 5,
    Otavio #= 1,
    JogoDaForca #= 3,
    Limao #= 1,
    Morango #= 3,
    Biologia #= 3,

    % Restricoes das pistas.
    abs(JogoDaForca - Vermelha) #= 1,
    CuboVermelho #= 1 #\/ CuboVermelho #= 5,
    Matematica #= Maracuja,
    abs(Setembro - CuboVermelho) #= 1,
    Azul #= Janeiro,
    abs(ProbDeLogica - Amarela) #= 1,
    Matematica #= Dezembro,
    Uva + 1 #= Portugues,
    abs(Janeiro - Setembro) #= 1,
    Uva #> Azul,
    abs(JogoDaForca - TresOuMais) #= 1,
    Uva #= ProbDeLogica,
    Branca + 1 #= Will,
    Azul #< Maio,
    Joao #= Historia,
    Joao #\= 1,
    Joao #\= 5,
    abs(Setembro - Laranja) #= 1,

    append([Mochilas, Nomes, Meses, Jogos, Materias, Sucos], Vars),
    labeling([ffc], Vars),

    MochilasMap = [amarela-Amarela, azul-Azul, branca-Branca, verde-Verde, vermelha-Vermelha],
    NomesMap = [denis-Denis, joao-Joao, lenin-Lenin, otavio-Otavio, will-Will],
    MesesMap = [agosto-Agosto, dezembro-Dezembro, janeiro-Janeiro, maio-Maio, setembro-Setembro],
    JogosMap = [tres_ou_mais-TresOuMais, caca_palavras-CacaPalavras, cubo_vermelho-CuboVermelho, jogo_da_forca-JogoDaForca, prob_de_logica-ProbDeLogica],
    MateriasMap = [biologia-Biologia, geografia-Geografia, historia-Historia, matematica-Matematica, portugues-Portugues],
    SucosMap = [laranja-Laranja, limao-Limao, maracuja-Maracuja, morango-Morango, uva-Uva],

    monta_linha(1, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap, L1),
    monta_linha(2, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap, L2),
    monta_linha(3, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap, L3),
    monta_linha(4, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap, L4),
    monta_linha(5, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap, L5),
    Lista = [L1, L2, L3, L4, L5].

monta_linha(Pos, MochilasMap, NomesMap, MesesMap, JogosMap, MateriasMap, SucosMap,
           (Mochila, Nome, Mes, Jogo, Materia, Suco)) :-
    item_na_posicao(MochilasMap, Pos, Mochila),
    item_na_posicao(NomesMap, Pos, Nome),
    item_na_posicao(MesesMap, Pos, Mes),
    item_na_posicao(JogosMap, Pos, Jogo),
    item_na_posicao(MateriasMap, Pos, Materia),
    item_na_posicao(SucosMap, Pos, Suco).

item_na_posicao([Item-Pos|_], Pos, Item) :- !.
item_na_posicao([_|T], Pos, Item) :-
    item_na_posicao(T, Pos, Item).

imprime_lista([]) :-
    write('\nFim.\n').

imprime_lista([H|T]) :-
    write(H), nl,
    imprime_lista(T).