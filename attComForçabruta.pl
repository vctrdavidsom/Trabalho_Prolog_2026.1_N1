main :-
    modelo(Lista),
    imprime_lista(Lista).

modelo(Lista) :-
    %fixos
    Nomes = [otavio, Nome2, Nome3, Nome4, lenin], % dica: lennin esta na quinta posição
    select(Nome2, [denis, joao, will], RestNomes1), % dica: otavio em uma das pontas
    select(Nome3, RestNomes1, RestNomes2),
    select(Nome4, RestNomes2, []),
    alldifferent(Nomes),

    Jogos = [Jogo1, Jogo2, jogo_da_forca, Jogo4, Jogo5], % na terceira posição esta o menino que gosta do jogo da forca
    select(Jogo1, [tres_ou_mais, caca_palavras, cubo_vermelho, prob_de_logica], RestJogos1),
    select(Jogo2, RestJogos1, RestJogos2),
    select(Jogo4, RestJogos2, RestJogos3),
    select(Jogo5, RestJogos3, []),
    alldifferent(Jogos),
    (Jogo1 = cubo_vermelho ; Jogo5 = cubo_vermelho), %em uma das pontas esta o menino que adora jogar cubo vermelho
    (Jogo2 = tres_ou_mais ; Jogo4 = tres_ou_mais), %O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.

    Sucos = [limao, Suco2, morango, Suco4, Suco5], %na primeira posição esta quem gosta de suco de limão
    select(Suco2, [laranja, maracuja, uva], RestSucos1), %na terceira posição esta quem gosta de suco de morango
    select(Suco4, RestSucos1, RestSucos2),
    select(Suco5, RestSucos2, []),
    alldifferent(Sucos),

    Materias = [Materia1, Materia2, biologia, Materia4, Materia5], %o garoto que gosta de biologia gosta de suco de morango
    select(Materia1, [geografia, historia, matematica, portugues], RestMaterias1),
    select(Materia2, RestMaterias1, RestMaterias2),
    select(Materia4, RestMaterias2, RestMaterias3),
    select(Materia5, RestMaterias3, []),
    alldifferent(Materias),

    %quem gosta de matemática gosta tambem de suco de maracujá
    nth1(PosMatematica, Materias, matematica),
    nth1(PosMatematica, Sucos, maracuja),

    %Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
    posicao_de(uva, Sucos, PosUva),
    posicao_de(portugues, Materias, PosPortugues),
    PosPortugues is PosUva + 1,

    %Quem gosta de suco de Uva gosta de Problemas de Lógica.
    nth1(PosUva, Jogos, prob_de_logica),

    % joao gosta de historia
    posicao_de(joao, Nomes, PosJoao),
    nth1(PosJoao, Materias, historia),

    Meses = [Mes1, Mes2, Mes3, Mes4, Mes5],
    select(Mes1, [agosto, dezembro, janeiro, maio, setembro], RestMeses1),
    select(Mes2, RestMeses1, RestMeses2),
    select(Mes3, RestMeses2, RestMeses3),
    select(Mes4, RestMeses3, RestMeses4),
    select(Mes5, RestMeses4, []),
    alldifferent(Meses),

    %O menino que gosta de Matemática nasceu em dezembro.
    nth1(PosMatematica, Meses, dezembro),

    %O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
    posicao_de(setembro, Meses, PosSetembro),
    posicao_de(cubo_vermelho, Jogos, PosCuboVermelho),
    ao_lado(PosSetembro, PosCuboVermelho),

    %O menino que nasceu em janeiro está ao lado de quem nasceu em setembro.
    posicao_de(janeiro, Meses, PosJaneiro),
    ao_lado(PosJaneiro, PosSetembro),

    %O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de laranja.
    posicao_de(laranja, Sucos, PosLaranja),
    ao_lado(PosSetembro, PosLaranja),

    Mochilas = [Mochila1, Mochila2, Mochila3, Mochila4, Mochila5],
    select(Mochila1, [amarela, azul, branca, verde, vermelha], RestMochilas1),
    select(Mochila2, RestMochilas1, RestMochilas2),
    select(Mochila3, RestMochilas2, RestMochilas3),
    select(Mochila4, RestMochilas3, RestMochilas4),
    select(Mochila5, RestMochilas4, []),
    alldifferent(Mochilas),

    (Mochila2 = vermelha ; Mochila4 = vermelha), % quem gosta de jogo da forca esta ao lado do dono da mochila vermelha

    %O dono da mochila azul nasceu em janeiro.
    posicao_de(azul, Mochilas, PosAzul),
    nth1(PosAzul, Meses, janeiro),

    %Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
    posicao_de(prob_de_logica, Jogos, PosProblemasLogica),
    posicao_de(amarela, Mochilas, PosAmarela),
    ao_lado(PosProblemasLogica, PosAmarela),

    %O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
    PosUva > PosAzul,

    %O garoto da mochila Branca está exatamente à esquerda de Will.
    posicao_de(branca, Mochilas, PosBranca),
    posicao_de(will, Nomes, PosWill),
    PosWill is PosBranca + 1,

    %Will está ao lado do menino que gosta de Problemas de Lógica.
    ao_lado(PosWill, PosProblemasLogica),

    %O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
    posicao_de(maio, Meses, PosMaio),
    PosAzul < PosMaio,

    Lista = [
        (Mochila1, otavio, Mes1, Jogo1, Materia1, limao),
        (Mochila2, Nome2, Mes2, Jogo2, Materia2, Suco2),
        (Mochila3, Nome3, Mes3, jogo_da_forca, biologia, morango),
        (Mochila4, Nome4, Mes4, Jogo4, Materia4, Suco4),
        (Mochila5, lenin, Mes5, Jogo5, Materia5, Suco5)
    ].

mochila(amarela).
mochila(azul).
mochila(branca).
mochila(verde).
mochila(vermelha).

nome(denis).
nome(joao).
nome(lenin).
nome(otavio).
nome(will).

mes(agosto).
mes(dezembro).
mes(janeiro).
mes(maio).
mes(setembro).

jogo(tres_ou_mais).
jogo(caca_palavras).
jogo(cubo_vermelho).
jogo(jogo_da_forca).
jogo(prob_de_logica).

materia(biologia).
materia(geografia).
materia(historia).
materia(matematica).
materia(portugues).

suco(laranja).
suco(limao).
suco(maracuja).
suco(morango).
suco(uva).

alldifferent([]).
alldifferent([H|T]) :-
    not(member(H, T)),
    alldifferent(T).

posicao_de(Elemento, Lista, Posicao) :-
    nth1(Posicao, Lista, Elemento).

ao_lado(Pos1, Pos2) :-
    Diff is Pos1 - Pos2,
    AbsDiff is abs(Diff),
    AbsDiff =:= 1.

imprime_lista([]) :-
    write('\nFim.\n').

imprime_lista([H|T]) :-
    write(H), nl,
    imprime_lista(T).