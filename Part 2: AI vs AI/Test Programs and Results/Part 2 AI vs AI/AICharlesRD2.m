function [cardPicked, startP, endP, wDir]=AICharlesRD2(player, board, cardA1, cardA2, cardB1, cardB2, sideCard, turn)
moves = listMove(player, board, cardA1, cardA2, cardB1, cardB2, sideCard);

[w, cardPicked, startP, endP, wDir] = winNext(player, board, cardA1, cardA2, cardB1, cardB2, sideCard);

if w
    return;
end


[m, ~]=size(moves);

moves2 = moves;
[m, ~]=size(moves);
r = 0;
pri = nextprime(5000);
ran = 123; % generate pseud random 
for ii=1:m
    str = moves(ii,:);
    [win, nextBoard, nextCardA1, nextCardA2, nextCardB1,nextCardB2, nextSideCard]...
    =move(str, board, cardA1, cardA2, cardB1, cardB2, sideCard);
    [w, cardPicked, startP, endP, wDir] = winNext(char('A'+'B'-player),...
        nextBoard, nextCardA1, nextCardA2, nextCardB1,nextCardB2, nextSideCard);
    if ~w
        r=r+1;
        moves2(r,:)=str;
    end
    
end

%disp(moves2(1:r,:));
if r > 0
    str = moves2(mod(ran,r)+1,:);
else
%fprintf('m is %d\n',m);
    str = moves(mod(ran,m)+1,:);
end
ran=mod(ran^2+1,pri);

cardPicked = str(2) - '1'+1;
startP = [str(3), str(4)];
endP = [str(5), str(6)];
wDir = str(7);

end

function moves = listMove(player, board, cardA1, cardA2, cardB1, cardB2, sideCard)
if player == 'A'
    otherPlayer = 'B';
else
    otherPlayer = 'A';
end

tempmoves = char(zeros(100,7));
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
    %tempBoard = board;
    
    for startP = allStartP
        for endP = startP+allMove
            tempBoard = board;
            if endP(1) >=1 && endP(1) <= 5 && endP(2)>=1 && endP(2) <=5
                if upper(tempBoard(endP(1),endP(2)))==otherPlayer || upper(tempBoard(endP(1),endP(2)))==' '
                    %fprintf('Card %d, %c%d->%c%d\n', cardPicked, 'a'+startP(1)-1, startP(2), 'a'+endP(1)-1, endP(2));
                    temp2 = tempBoard(startP(1), startP(2));
                    %temp2 = tempBoard(endP(1), endP(2));
                    tempBoard(startP(1), startP(2))=' ';
                    tempBoard(endP(1), endP(2)) = temp2;
                    %board
                    %tempBoard %debug
                    [rw, cw] = find(tempBoard=='W');
                    for wDir = 'urdls'
                        %disp(board);
                        switch wDir
                            case 'u'
                                rw2 = rw-1;
                                cw2 = cw;
                            case 'l'
                                rw2 = rw;
                                cw2 = cw-1;
                            case 'd'
                                rw2 = rw+1;
                                cw2 = cw;
                            case 'r'
                                rw2 = rw;
                                cw2 = cw+1;
                            case 's'
                                rw2=rw;
                                cw2=cw;
                            otherwise
                                rw2=rw;
                                cw2=cw;
                        end
                        %fprintf('cw2=%d, rw2=%d\n', cw2, rw2);
                        %whos cw2 rw2
                        %disp(cw2 <= 0 || cw2 >= 6 || rw2 <=0 || rw2 >= 6);
                        if cw2 < 1 || cw2 > 5 || rw2 < 1 || rw2 > 5   
                            %fprintf('cw2=%d, rw2=%d', cw2, rw2);
                            %fprintf('Out of bound\n');
                            continue;
                        elseif cw2==3 && (rw2==1 || rw2==5)
                            %fprint('You cannot move the wall to a base.\n');
                            continue;
                        end
                        
                        temp = tempBoard(rw2,cw2);
                        if temp ==lower(player) || temp == ' ' || temp == 'W'
                            n=n+1;
                            % swap
                            %board(rw,cw)=temp;
                            %board(rw2,cw2)='W';
                            tempmoves(n,:)=[player, '1'+cardPicked-1, 'a'+startP(1)-1, '1'+startP(2)-1,...
                        'a'+endP(1)-1, '1'+endP(2)-1, wDir];
                            %fprintf('%s\n', tempmoves(n,:)); % debug
                            continue;
                        elseif temp == player
                            %fprintf('You cannot move the wall there. It is occupied by your general.\n');
                            continue;
                        elseif temp == otherPlayer || temp == lower(otherPlayer)
                            %fprintf('You cannot move the wall there. It is occupied by your opponent.\n');
                            continue;
                        else % will not happen
                            %fprintf('Not a valid move.\n')
                            continue;
                        end
                    
                    end
                    
                end
            end
        end
    end
    
    if n==0 % no possible move
        for cardPicked = 1:2
            [rw, cw] = find(tempBoard=='W');
            for wDir = 'urdls'
                %disp(board);
                switch wDir
                    case 'u'
                        rw2 = rw-1;
                        cw2 = cw;
                    case 'l'
                        rw2 = rw;
                        cw2 = cw-1;
                    case 'd'
                        rw2 = rw+1;
                        cw2 = cw;
                    case 'r'
                        rw2 = rw;
                        cw2 = cw+1;
                    case 's'
                        rw2=rw;
                        cw2=cw;
                    otherwise
                        rw2=rw;
                        cw2=cw;
                end
                %fprintf('cw2=%d, rw2=%d\n', cw2, rw2);
                %whos cw2 rw2
                %disp(cw2 <= 0 || cw2 >= 6 || rw2 <=0 || rw2 >= 6);
                if cw2 < 1 || cw2 > 5 || rw2 < 1 || rw2 > 5
                    %fprintf('cw2=%d, rw2=%d', cw2, rw2);
                    %fprintf('Out of bound\n');
                    continue;
                elseif cw2==3 && (rw2==1 || rw2==5)
                    %fprint('You cannot move the wall to a base.\n');
                    continue;
                end
                
                temp = tempBoard(rw2,cw2);
                if temp ==lower(player) || temp == ' ' || temp == 'W'
                    n=n+1;
                    % swap
                    %board(rw,cw)=temp;
                    %board(rw2,cw2)='W';
                    tempmoves(n,:)=[player, '1'+cardPicked-1, 'X', 'X', 'X', 'X', wDir];
                    continue;
                elseif temp == player
                    %fprintf('You cannot move the wall there. It is occupied by your general.\n');
                    continue;
                elseif temp == otherPlayer || temp == lower(otherPlayer)
                    %fprintf('You cannot move the wall there. It is occupied by your opponent.\n');
                    continue;
                else % will not happen
                    %fprintf('Not a valid move.\n')
                    continue;
                end
            end
        end
    else
        moves=tempmoves(1:n,:);
    end
end
end

function [w, cardPicked, startP, endP, wDir] = winNext(player, board, cardA1, cardA2, cardB1, cardB2, sideCard)
% check if there is a winning position
w = false;
cardNum = 0;
startP='XX';
endP = 'XX';
wDir ='s';

[gr, gc] = find(board == player);


if player == 'A'
    % oppoenent's military base is (5,3)
    mbr = 1;
    mbc = 3;
    opponent = 'B';
else
    mbr = 5;
    mbc = 3;
    opponent = 'A';
end

mr = mbr - gr;
mc = mbc - gc;


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
    
    
    [r, c] = find(card=='x');
    [ro, co]=find(card=='o');
    allmoves = transpose([r,c]-[ro,co]);
    
    % check if general can move to the military base
    compare = transpose([r,c]-[ro,co]==[mr, mc]);
    %[r, c]
    %[ro, co]
    %[r,c]-[ro,co]
    %[mr, mc]
    if any(all(compare))
        %compare
        w = true;
        startP = [char(gr - 1 + 'a'), char(gc - 1 + '1')];
        endP = [char(mbr - 1 + 'a'), char(mbc - 1 + '1')];
        return
    end
    
    % check if opponent's general being captured
    [ogr, ogc] = find(board==opponent);
    for mv = allmoves
        % go backward and check if there is a pawn
        backr = ogr-mv(1);
        backc = ogc-mv(2);
        if backr>=1 && backc >= 1 && backr <= 5 && backc <= 5
            if upper(board(backr, backc)) == player
                w = true;
                startP = [char(backr - 1 + 'a'), char(backc - 1 + '1')];
                endP = [char(ogr - 1 + 'a'), char(ogc - 1 + '1')];
                return
            end
        end
    end   
end
end

function [win, nextBoard, nextCardA1, nextCardA2, nextCardB1,nextCardB2, nextSideCard]...
    =move(str, board, cardA1, cardA2, cardB1, cardB2, sideCard)

win = false;
player = str(1);
otherPlayer = 'A'+'B'-str(1);
cardPicked = str(2)-'1'+1;
startP = [str(3)-'a'+1, str(4)-'1'+1];
endP = [str(5)-'a'+1, str(6)-'1'+1];
wDir = str(7);
nextBoard = board;
nextCardA1 = cardA1;
nextCardA2 = cardA2;
nextCardB1 = cardB1;
nextCardB2 = cardB2;
nextSideCard = sideCard;



if player == 'A'
    if cardPicked == 1
        nextCardA1 = sideCard;
        nextSideCard = cardA1;
    else
        nextCardA2 = sideCard;
        nextSideCard = cardA2;        
    end
else % player is 'B'
    if cardPicked == 1
        nextCardB1 = sideCard;
        nextSideCard = cardB1;
    else
        nextCardB2 = sideCard;
        nextSideCard = cardB2;        
    end
end
  
%disp([str(3) str(4)]);
%if ~isequal([str(3) str(4)], 'XX')
if str(3) ~= 'X'
    %fprintf('endP(1)=%c, endP(2)=%c\n', endP(1), endP(2));
    %disp(endP);
    if board(endP(1), endP(2)) == otherPlayer
        win = true;
    else
        if player == 'A'
            if endP(1)== 1 && endP(2) == 3 && board(startP(1), startP(2))=='A'
                win = true;
            else
                win = false;
            end
        else
            if endP(1)== 5 && endP(2) == 3 && board(startP(1), startP(2))=='B'
                win = true;
            else
                win = false;
            end
        end
    end
    
    nextBoard(startP(1), startP(2))=' ';
    nextBoard(endP(1), endP(2)) = board(startP(1), startP(2));
end

[rw, cw] = find(board=='W');
switch wDir
    case 'u'
        rw2 = rw-1;
        cw2 = cw;
    case 'l'
        rw2 = rw;
        cw2 = cw-1;
    case 'd'
        rw2 = rw+1;
        cw2 = cw;
    case 'r'
        rw2 = rw;
        cw2 = cw+1;
    case 's'
        rw2=rw;
        cw2=cw;
    otherwise
        rw2=rw;
        cw2=cw;
end
%swap
temp = nextBoard(rw2,cw2);
nextBoard(rw2,cw2)='W';
nextBoard(rw,cw) = temp;
end
