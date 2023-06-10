SIDA = input('Input the SID for player A (or simply press enter for using Charles'' AI): ','s');
SIDB = input('Input the SID for player B (or simply press enter for using Charles'' AI): ','s');

if isempty(SIDA)
    SIDA='CharlesRD2';
end

if isempty(SIDB)
    SIDB = 'CharlesRD2';
end

setup;

AIAName = ['AI' SIDA];
AIBName = ['AI' SIDB];

fprintf('Player A is %s.\n', SIDA);
fprintf('Player B is %s.\n', SIDB);

currentPlayerNum = currentPlayer-'A'+1;
player = currentPlayer;
card(:,:,1,1) = cardA1;
card(:,:,1,2) = cardA2;
card(:,:,2,1) = cardB1;
card(:,:,2,2) = cardB2;

commandEnd = '(currentPlayer, board, cardA1, cardA2, cardB1, cardB2, sideCard, turnLeft)';


win = false;
endgame = false;
winchar = 'T';
for turnLeft=turnNum:-1:1
    %if turnLeft > 1
    fprintf('Number of turns left: %d\n', turnLeft);
    %else
    %    fprintf('Last turn.\n');
    %end
    
    currentPlayer = char('A'-1+currentPlayerNum);
    otherPlayer = char('A'+'B'-currentPlayer);
    cp = currentPlayerNum;
    op = 3-currentPlayerNum;
    
    if currentPlayer == 'A';
        AIStr = [AIAName commandEnd];
    else % player B
        AIStr = [AIBName commandEnd];
    end
    
    dispBoard(board, currentPlayer, card(:,:,1,1), card(:,:,1,2),...
        card(:,:,2,1), card(:,:,2,2), sideCard);
    fprintf('Player %c, it is your turn.\n', currentPlayer);
    while true
        try
            [cardPicked, startP, endP, wDir] = eval(AIStr);
        catch ME
            % Some error occurred if you get here.
            errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
                ME.stack(1).name, ME.stack(1).line, ME.message);
            fprintf(1, '%s\n', errorMessage);
            %uiwait(warndlg(errorMessage));
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'F'; % B win by A making error
            else
                winchar = 'E'; % A win, B invalid move input
            end
            break;
        end
        fprintf('Card %d, %2s->%2s, W %c\n', cardPicked, startP, endP, wDir);
        if isempty(possbleMove(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard, false))
            fprintf('There is no valid move.\n');
            %cardPicked = input('Simply pick a card you want to swap with the side card (1 or 2): ');
            % simply take the cardPicked without consider startP
            break;
        else
            %cardPicked = input('Pick a card (1 or 2) or enter 0 to list all moves: ');
            if cardPicked ~=1 && cardPicked ~=2 % will not happen
                %possbleMove(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard, true);
                fprintf('Card picked cannot be %d.\n', cardPicked);
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            end
            
            %pos = input('Input the position of your pawn you want to move: ','s');
            pos = startP;
            r1 = pos(1)-'a'+1;
            c1 = pos(2)-'1'+1;
            
            if r1<=0 || r1 >=6 || c1<=0 || c1 >= 6
                % invalid input
                fprintf('Invalid input, the start position is invalid.\n');
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            end
            
            if upper(board(r1, c1)) ~= currentPlayer
                fprintf('Invalid input, you have no pawn at %2s.\n', pos);
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            end
            
            %pos2 = input('Input the position you want to move the selected pawn: ','s');
            pos2 = endP;
            r2 = pos2(1)-'a'+1;
            c2 = pos2(2)-'1'+1;
            
            if r2<=0 || r2 >=6 || c2<=0 || c2 >= 6
                % invalid input
                fprintf('Invalid input, the end position is invalid.\n');
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            end
            
            if currentPlayerNum == 1
                cardWithDirection = card(:,:,currentPlayerNum, cardPicked);
            else
                cardWithDirection = rot90(card(:,:,currentPlayerNum, cardPicked),2);
            end
            
            [r, c] = find(cardWithDirection=='x');
            [ro, co]=find(cardWithDirection=='o');
            compare = transpose([r,c]-[ro,co]==pos2-pos);
            
            if ~any(all(compare))
                fprintf('Not a valid move by card %d.\n', cardPicked);
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            elseif board(r2,c2) == 'W'
                fprintf('Your pawn cannot move there. The position is occupied by the wall.\n');
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            elseif upper(board(r2,c2)) == currentPlayer
                fprintf('Your pawn cannot move there. The position is occupied by your own pawn.\n');
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
            elseif  board(r1,c1)==currentPlayer && c2 == 3 && r2 == 1+4*(currentPlayerNum-1)
                fprintf('Player %c, your general reaches opponent''s military base. You win.\n', currentPlayer);
                endgame = true;
                win = true;
                winchar = currentPlayer;
                break;
            elseif  board(r2,c2) == otherPlayer
                fprintf('Player %c, you capture opponent''s general. You win.\n', currentPlayer);
                endgame = true;
                win = true;
                winchar = currentPlayer;
                win = true;
                break;
            elseif board(r2,c2) == lower(otherPlayer)
                fprintf('Player %c, you capture opponent''s soldier. The soldier is removed from the board.\n', currentPlayer);
                temp = board(r1,c1);
                board(r1,c1) = ' ';
                board(r2,c2) = temp;
                break;
            else
                temp = board(r1,c1);
                board(r1,c1) = ' ';
                board(r2,c2) = temp;
                break;
            end
        end
    end
    
    if endgame
        break;
    end
    
    tempCard = sideCard;
    sideCard=card(:,:,cp,cardPicked);
    card(:,:,cp,cardPicked)=tempCard;
    cardA1 = card(:,:,1,1);
    cardA2 = card(:,:,1,2);
    cardB1 = card(:,:,2,1);
    cardB2 = card(:,:,2,2);
    
    
    %dispBoard(board, currentPlayer, card(:,:,1,1), card(:,:,1,2),...
    %    card(:,:,2,1), card(:,:,2,2), sideCard);
    
    
    %fprintf('Player %c, choose the movement of W.\n', currentPlayer);
    while true
        %wDir = input('u(up), l(left), d(down), r(right), s(stay): ', 's');
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
                fprintf('Invalid W move\n');
                endgame = true;
                if currentPlayer == 'A'
                    winchar = 'D'; % B win, A invalid move input
                else
                    winchar = 'C'; % A win, B invalid move input
                end
                break;
        end
        
        if cw2 <= 0 || cw2 >= 6 || rw2 <=0 || rw2 >= 6
            fprintf('You cannot move the wall out of bound.\n');
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'D'; % B win, A invalid move input
            else
                winchar = 'C'; % A win, B invalid move input
            end
            break;
        elseif cw2==3 && (rw2==1 || rw2==5)
            fprintf('You cannot move the wall to a military base.\n');
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'D'; % B win, A invalid move input
            else
                winchar = 'C'; % A win, B invalid move input
            end
            break;
        end
        
        
        temp = board(rw2,cw2);
        if temp ==lower(currentPlayer) || temp == ' '
            % swap
            board(rw,cw)=temp;
            board(rw2,cw2)='W';
            break;
        elseif temp == currentPlayer
            fprintf('You cannot move the wall there. It is occupied by your general.\n');
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'D'; % B win, A invalid move input
            else
                winchar = 'C'; % A win, B invalid move input
            end
            break;
        elseif temp == otherPlayer || temp == lower(otherPlayer)
            fprintf('You cannot move the wall there. It is occupied by your opponent.\n');
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'D'; % B win, A invalid move input
            else
                winchar = 'C'; % A win, B invalid move input
            end
            break;
        elseif temp == 'W'
            % do nothing
            break;
        else % will not happen
            fprintf('Not a valid move of W.\n')
            endgame = true;
            if currentPlayer == 'A'
                winchar = 'D'; % B win, A invalid move input
            else
                winchar = 'C'; % A win by B making invalid input
            end
            break;
        end
    end
    
    if endgame
        break;
    end
    
    % switch
    currentPlayer = char('A'+'B'-currentPlayer');
    player = currentPlayer;
    currentPlayerNum = 3 - currentPlayerNum;
    %fprintf('%d\n', currentPlayerNum);
    fprintf('\n');
    
end

%if winchar
%fprintf('This is the last turn. The game is tied.\n');
%end
%fprintf('Win character is %c\n', winchar);
switch winchar
    case 'A'
        fprintf('Player A win.\n');
    case 'B'
        fprintf('Player B win.\n');
    case 'C'
        fprintf('Player A win as player B input invalid.\n');
    case 'D'
        fprintf('Player B win as player A input invalid.\n');
    case 'E'
        fprintf('Player A win as player B has programming error.\n');
    case 'F'
        fprintf('Player B win as player A has programming error.\n');
    case 'T'
        fprintf('The game is tied\n');
    otherwise
        fprintf('Cannot detemine the output. Something is wrong\n');
end
    
   