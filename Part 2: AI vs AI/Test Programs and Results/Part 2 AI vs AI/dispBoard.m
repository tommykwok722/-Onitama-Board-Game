function dispBoard(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard)
    % currentPlayerNum = currentPlayer-'A'+1;
    %otherPlayer = char('A'+'B'-currentPlayer);
    
    if currentPlayer=='A'
        sc = sideCard;
        arrow = '^^^';
        %arrow = '   ';
    else
        sc = rot90(sideCard,2);
        arrow = 'vvv';
        %arrow = '   ';
    end
    fprintf('                        Player %c\n', 'B');
    fprintf('                       %9s%9s\n', 'Card 1', 'Card 2');
    fprintf('  +---+---+---+---+---+%9s%9s\n', fliplr(cardB1(5,:)), fliplr(cardB2(5,:)));
    fprintf('a | %c | %c | %c | %c | %c |%9s%9s\n', board(1,:), fliplr(cardB1(4,:)), fliplr(cardB2(4,:)));
    fprintf('  +---+---+---+---+---+%9s%9s    Side card\n', fliplr(cardB1(3,:)), fliplr(cardB2(3,:)));
    fprintf('b | %c | %c | %c | %c | %c |%9s%9s%9s\n', board(2,:), fliplr(cardB1(2,:)), fliplr(cardB2(2,:)), sc(1,:));
    fprintf('  +---+---+---+---+---+%9s%9s%9s%4c\n', fliplr(cardB1(1,:)), fliplr(cardB2(1,:)), sc(2,:),arrow(1));
    fprintf('c | %c | %c | %c | %c | %c |%27s%4c\n', board(3,:), sc(3,:),arrow(2));
    fprintf('  +---+---+---+---+---+%9s%9s%9s%4c\n', cardA1(1,:), cardA2(1,:), sc(4,:),arrow(3));
    fprintf('d | %c | %c | %c | %c | %c |%9s%9s%9s\n', board(4,:), cardA1(2,:), cardA2(2,:), sc(5,:));
    fprintf('  +---+---+---+---+---+%9s%9s\n', cardA1(3,:), cardA2(3,:));
    fprintf('e | %c | %c | %c | %c | %c |%9s%9s\n', board(5,:), cardA1(4,:), cardA2(4,:));
    fprintf('  +---+---+---+---+---+%9s%9s\n', cardA1(5,:), cardA2(5,:));
    %fprintf('                       %9s%9s\n', 'Card 1', 'Card 2');
    fprintf('%5c%4c%4c%4c%4c%11s%9s\n', '12345','Card 1', 'Card 2');
    fprintf('                        Player %c\n', 'A');
end
