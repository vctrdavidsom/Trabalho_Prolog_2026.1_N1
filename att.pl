main :-
    modelo(Lista),
    imprime_lista(Lista).

modelo(Lista) :-
    Lista = [
        (Mochila1, Nome1, Mes1, Jogo1, Materia1, Suco1),
        (Mochila2, Nome2, Mes2, Jogo2, Materia2, Suco2),
        (Mochila3, Nome3, Mes3, Jogo3, Materia3, Suco3),
        (Mochila4, Nome4, Mes4, Jogo4, Materia4, Suco4),
        (Mochila5, Nome5, Mes5, Jogo5, Materia5, Suco5)
    ],

    write(Lista), nl,% para mostrar a lista de variáveis antes de resolver o problema

    mochila(Mochila1), mochila(Mochila2), mochila(Mochila3), mochila(Mochila4), mochila(Mochila5),
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    mes(Mes1), mes(Mes2), mes(Mes3), mes(Mes4), mes(Mes5),
    jogo(Jogo1), jogo(Jogo2), jogo(Jogo3), jogo(Jogo4), jogo(Jogo5),
    materia(Materia1), materia(Materia2), materia(Materia3), materia(Materia4), materia(Materia5),
    suco(Suco1), suco(Suco2), suco(Suco3), suco(Suco4), suco(Suco5),

    alldifferent([Mochila1, Mochila2, Mochila3, Mochila4, Mochila5]),
    alldifferent([Nome1, Nome2, Nome3, Nome4, Nome5]),
    alldifferent([Mes1, Mes2, Mes3, Mes4, Mes5]),
    alldifferent([Jogo1, Jogo2, Jogo3, Jogo4, Jogo5]),
    alldifferent([Materia1, Materia2, Materia3, Materia4, Materia5]),
    alldifferent([Suco1, Suco2, Suco3, Suco4, Suco5]),

    %fixos

    Nome5 = lenin,% dica: lennin esta na quinta posição
    Nome1 = otavio,% dica: otavio em uma das pontas
    Jogo3 = jogo_da_forca, % na terceira posição esta o menino que gosta do jogo da forca
    Suco1 = limao, %na primeira posição esta quem gosta de suco de limão
    Suco3 = morango,%na terceira posição esta quem gosta de suco de morango
    Materia3 = biologia, %o garoto que gosta de biologia gosta de suco de morango

    


    ( Mochila2 = vermelha ; Mochila4 = vermelha ),% quem gosta de jogo da forca esta ao lado do dono da mochila vermelha
    ( Jogo1 = cubo_vermelho ; Jogo5 = cubo_vermelho ),%em uma das pontas esta o menino que adora jogar cubo vermelho
    
    (%quem gosta de matemática gosta tambem de suco de maracujá
    (Materia1 = matematica, Suco1 = maracuja);
    (Materia2 = matematica, Suco2 = maracuja);
    (Materia3 = matematica, Suco3 = maracuja);
    (Materia4 = matematica, Suco4 = maracuja);
    (Materia5 = matematica, Suco5 = maracuja)
    ),

    (%O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
        (Mes1 = setembro, Jogo2 = cubo_vermelho);
        (Mes2 = setembro, (Jogo1 = cubo_vermelho ; Jogo3 = cubo_vermelho));
        (Mes3 = setembro, (Jogo2 = cubo_vermelho ; Jogo4 = cubo_vermelho));
        (Mes4 = setembro, (Jogo3 = cubo_vermelho ; Jogo5 = cubo_vermelho));
        (Mes5 = setembro, Jogo4 = cubo_vermelho)
    ),

    (%O dono da mochila azul nasceu em janeiro.
    (Mochila1 = azul, Mes1 = janeiro);
    (Mochila2 = azul, Mes2 = janeiro);
    (Mochila3 = azul, Mes3 = janeiro);
    (Mochila4 = azul, Mes4 = janeiro);
    (Mochila5 = azul, Mes5 = janeiro)
    ),

    (%Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
    (Jogo1 = prob_de_logica, Mochila2 = amarela);
    (Jogo2 = prob_de_logica, (Mochila1 = amarela ; Mochila3 = amarela));
    (Jogo3 = prob_de_logica, (Mochila2 = amarela ; Mochila4 = amarela));
    (Jogo4 = prob_de_logica, (Mochila3 = amarela ; Mochila5 = amarela));
    (Jogo5 = prob_de_logica, Mochila4 = amarela)
    ),

    (%O menino que gosta de Matemática nasceu em dezembro.
    (Materia1 = matematica, Mes1 = dezembro);
    (Materia2 = matematica, Mes2 = dezembro);
    (Materia3 = matematica, Mes3 = dezembro);
    (Materia4 = matematica, Mes4 = dezembro);
    (Materia5 = matematica, Mes5 = dezembro)
    ),

    (%Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
    (Suco1 = uva, Materia2 = portugues);
    (Suco2 = uva, Materia3 = portugues);
    (Suco3 = uva, Materia4 = portugues);
    (Suco4 = uva, Materia5 = portugues)
    ),

    (%O menino que nasceu em janeiro está ao lado de quem nasceu em setembro.
    (Mes1 = janeiro, Mes2 = setembro);
    (Mes2 = janeiro, (Mes1 = setembro ; Mes3 = setembro));
    (Mes3 = janeiro, (Mes2 = setembro ; Mes4 = setembro));
    (Mes4 = janeiro, (Mes3 = setembro ; Mes5 = setembro));
    (Mes5 = janeiro, Mes4 = setembro)
    ),

    (%O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
    (Mochila1 = azul, (Suco2 = uva ; Suco3 = uva ; Suco4 = uva ; Suco5 = uva));
    (Mochila2 = azul, (Suco3 = uva ; Suco4 = uva ; Suco5 = uva));
    (Mochila3 = azul, (Suco4 = uva ; Suco5 = uva));
    (Mochila4 = azul, Suco5 = uva)
    ),

    ( Jogo2 = tres_ou_mais ; Jogo4 = tres_ou_mais ),%O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.

    (%Quem gosta de suco de Uva gosta de Problemas de Lógica.
    (Suco1 = uva, Jogo1 = prob_de_logica);
    (Suco2 = uva, Jogo2 = prob_de_logica);
    (Suco3 = uva, Jogo3 = prob_de_logica);
    (Suco4 = uva, Jogo4 = prob_de_logica);
    (Suco5 = uva, Jogo5 = prob_de_logica)
    ),

    (%O garoto da mochila Branca está exatamente à esquerda de Will.
    (Mochila1 = branca, Nome2 = will);
    (Mochila2 = branca, Nome3 = will);
    (Mochila3 = branca, Nome4 = will);
    (Mochila4 = branca, Nome5 = will)
    ),

    (%O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
    (Mochila1 = azul, (Mes2 = maio ; Mes3 = maio ; Mes4 = maio ; Mes5 = maio));
    (Mochila2 = azul, (Mes3 = maio ; Mes4 = maio ; Mes5 = maio));
    (Mochila3 = azul, (Mes4 = maio ; Mes5 = maio));
    (Mochila4 = azul, Mes5 = maio)
    ),

    (% joao gosta de historia
    (Nome2 = joao, Materia2 = historia);
    (Nome3 = joao, Materia3 = historia);
    (Nome4 = joao, Materia4 = historia)
    ),

    (%O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de laranja.
    (Mes1 = setembro, Suco2 = laranja);
    (Mes2 = setembro, (Suco1 = laranja ; Suco3 = laranja));
    (Mes3 = setembro, (Suco2 = laranja ; Suco4 = laranja));
    (Mes4 = setembro, (Suco3 = laranja ; Suco5 = laranja));
    (Mes5 = setembro, Suco4 = laranja)
    ).

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

imprime_lista([]) :-
    write('\nFim.\n').

imprime_lista([H|T]) :-
    write(H), nl,
    imprime_lista(T).