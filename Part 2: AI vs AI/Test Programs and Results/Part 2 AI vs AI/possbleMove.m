% moves ignore direction
function moves = possbleMove(board, player, cardA1, cardA2, cardB1, cardB2, sideCard, show)
if player == 'A'
    otherPlayer = 'B';
else
    otherPlayer = 'A';
end

tempmoves = char(zeros(100,8));
n=0;
for cardPicked = 1:2
    if player == 'A'
        if cardPicked == 1
            card = cardA1;
        else
            card = cardA2;
        end
    else % player = 'B'
        if cardPicked == 1
            card = rot90(cardB1,2);
        else
            card = rot90(cardB2,2);
        end
    end
    
    [r, c] = find(upper(board)==player);
    allStartP = transpose([r c]);
    [rx, cx] =  find(card=='x');
    [ro, co] =  find(card=='o');
    allMove = transpose([rx,cx]-[ro,co]);
    %disp(allStartP);
    %disp(allMove);
    
    for startP = allStartP
        for endP = startP+allMove
            if endP(1) >=1 && endP(1) <= 5 && endP(2)>=1 && endP(2) <=5  
                if upper(board(endP(1),endP(2)))==otherPlayer || upper(board(endP(1),endP(2)))==' '
                    n=n+1;
                    if show
                    fprintf('Card %d, %c%d->%c%d\n', cardPicked, 'a'+startP(1)-1, startP(2), 'a'+endP(1)-1, endP(2));
                    end
                    tempmoves(n,:)=[player, '1'+cardPicked-1, 'a'+startP(1)-1, '1'+startP(2)-1,...
                    'a'+endP(1)-1, '1'+endP(2)-1, 'u', 'n'];
                end
            end
        end
    end
    
    moves=tempmoves(1:n,:);
end