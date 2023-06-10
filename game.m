setup;
% Rotate cardB1 and cardB2 first
cardB1 = fliplr(flipud(cardB1));
cardB2 = fliplr(flipud(cardB2));

% Rotate sideCard player B plays first
if currentPlayer == 'B'
    sideCard = fliplr(flipud(sideCard));
end

while true
    fprintf('Number of turns left: %d\n', turnNum)
    
    % Display board
    dispBoard(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard);
    
    % Player A or B's turn
    fprintf('Player %c, it is your turn.\n', currentPlayer)
    
    % Obtain row and column of the wall
    [rowW, colW] = find(board == 'W');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Check all valid moves
    if currentPlayer == 'A'
        for i = 1:2 % Loop 2 times to check 2 cards
            if i == 1
                [rowX, colX] = find(cardA1 == 'x'); % Rows and columns of all 'x' in the card
                [rowO, colO] = find(cardA1 == 'o'); % Rows and columns of all 'o' in the card
                cardNum = 1;
            else
                [rowX, colX] = find(cardA2 == 'x');
                [rowO, colO] = find(cardA2 == 'o');
                cardNum = 2;
            end
            
            [rowP, colP] = find(board == 'a' | board == 'A'); % Rows and columns of all pawns on the board
            rowDifX = rowX - rowO; % Difference of rows of all 'x' and 'o'
            colDifX = colX - colO; % Difference of columns of all 'x' and 'o'
            
            % Check all valid moves by the function "check"
            [cardInt, cardFin] = check(rowW, colW, rowP, colP, rowDifX, colDifX);
            
            % Save all moves
            if i == 1
                card1Int = cardInt;
                card1Fin = cardFin;
            else
                card2Int = cardInt;
                card2Fin = cardFin;
            end
        end
    elseif currentPlayer == 'B'
        for i = 1:2 % Loop 2 times to check 2 cards
            if i == 1
                [rowX, colX] = find(cardB1 == 'x'); % Rows and columns of all 'x' in the card
                [rowO, colO] = find(cardB1 == 'o'); % Rows and columns of all 'o' in the card
                cardNum = 1;
            else
                [rowX, colX] = find(cardB2 == 'x');
                [rowO, colO] = find(cardB2 == 'o');
                cardNum = 2;
            end
            
            [rowP, colP] = find(board == 'b' | board == 'B'); % Rows and columns of all pawns on the board
            rowDifX = rowX - rowO; % Difference of rows of all 'x' and 'o'
            colDifX = colX - colO; % Difference of columns of all 'x' and 'o'
            
            % Check all valid moves by the function "check"
            [cardInt, cardFin] = check(rowW, colW, rowP, colP, rowDifX, colDifX);
            
            % Save all moves
            if i == 1
                card1Int = cardInt;
                card1Fin = cardFin;
            else
                card2Int = cardInt;
                card2Fin = cardFin;
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while true
        if size(cardInt, 1) == 0 % No more valid moves
            fprintf('There is no valid move.\n')
            cardInput = input('Simply pick a card you want to swap with the side card (1 or 2): ');
        else % There are at least one valid move
            % Input card number and initial position
            cardInput = input('Pick a card (1 or 2) or enter 0 to list all moves: ');
            
            % When cardInput = 0, show all possible moves
            if cardInput == 0
                for i = 1:2
                    if i == 1
                        for j = 1:size(card1Int, 1)
                            fprintf('Card 1, %s->%s\n', card1Int(j,:), card1Fin(j,:))
                        end
                    else
                        for j = 1:size(card2Int, 1)
                            fprintf('Card 2, %s->%s\n', card2Int(j,:), card2Fin(j,:))
                        end
                    end
                end
                continue;
            end
            
            % When cardInput = 1 or 2, execute the following codes
            initialPos = input('Input the position of your pawn you want to move: ', 's');
            
            % Obtain initial position
            initialRow = double(initialPos(1)) - 96;
            initialCol = str2double(initialPos(2));
            
            % No pawn at initial position
            if currentPlayer == 'A'
                if board(initialRow, initialCol) ~= 'a' && board(initialRow, initialCol) ~= 'A'
                    fprintf('You have no pawn at %s.\n', initialPos)
                    continue;
                end
            elseif currentPlayer == 'B'
                if board(initialRow, initialCol) ~= 'b' && board(initialRow, initialCol) ~= 'B'
                    fprintf('You have no pawn at %s.\n', initialPos)
                    continue;
                end
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % If initial position is valid, then ask player to input final position
            finalPos  = input('Input the position you want to move the selected pawn: ', 's');
            
            validMoveCard = 0; % For checking valid moves according to the selected card (Assume to be FALSE)
            validMovePawn = 1; % For checking valid moves according to the positions of own pawns (Assume to be TRUE)
            
            % Obtain row and column of the wall
            [rowW, colW] = find(board == 'W');
            
            % Obtain final position
            finalRow = double(finalPos(1)) - 96;
            finalCol = str2double(finalPos(2));
            
            if currentPlayer == 'A' && cardInput == 1
                [rowX, colX] = find(cardA1 == 'x'); % Rows and columns of all 'x' in the card
                [rowO, colO] = find(cardA1 == 'o'); % Rows and columns of all 'o' in the card
                [rowP, colP] = find(board == 'a' | board == 'A'); % Rows and columns of all pawns on the board
            elseif currentPlayer == 'A' && cardInput == 2
                [rowX, colX] = find(cardA2 == 'x');
                [rowO, colO] = find(cardA2 == 'o');
                [rowP, colP] = find(board == 'a' | board == 'A');
            elseif currentPlayer == 'B' && cardInput == 1
                [rowX, colX] = find(cardB1 == 'x');
                [rowO, colO] = find(cardB1 == 'o');
                [rowP, colP] = find(board == 'b' | board == 'B');
            elseif currentPlayer == 'B' && cardInput == 2
                [rowX, colX] = find(cardB2 == 'x');
                [rowO, colO] = find(cardB2 == 'o');
                [rowP, colP] = find(board == 'b' | board == 'B');
            end
            
            rowDifX = rowX - rowO; % Difference of rows of all 'x' and 'o'
            colDifX = colX - colO; % Difference of columns of all 'x' and 'o'
            
            % Check valid moves according to the selected card
            % The move is valid if at least one of the moves in the card is fulfilled
            for i = 1:length(rowX)
                if (finalRow - initialRow) == rowDifX(i) && (finalCol - initialCol) == colDifX(i)
                    validMoveCard = 1;
                end
            end
            
            % Check valid moves according to the positions of own pawns
            % The move is invalid if at least one pawns have the same position as the move
            for i = 1:length(rowP)
                if finalRow == rowP(i) && finalCol == colP(i)
                    validMovePawn = 0;
                end
            end
            
            % Not a valid move according to the selected card
            if validMoveCard == 0
                fprintf('Not a valid move by card %d.\n', cardInput)
                continue;
            end
            
            % Not a valid move if the position is occupied by your own pawn
            if validMovePawn == 0
                fprintf('Your pawn cannot move there. The position is occupied by your own pawn.\n')
                continue;
            end
            
            % Not a valid move if the position is occupied by the wall
            if finalRow == rowW && finalCol == colW
                fprintf('Your pawn cannot move there. The position is occupied by the wall.\n')
                continue;
            end
            
            % Valid move: Capture opponent's soldier
            if (currentPlayer == 'A' && board(finalRow, finalCol) == 'b') || (currentPlayer == 'B' && board(finalRow, finalCol) == 'a')
                fprintf('Player %s, you capture opponent''s soldier. The soldier is removed from the board.\n', currentPlayer)
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Remark: Refer to Sample 2d, if both winning condition can fulfill at
            % the same time, then winning condition 1 is prioritized
            
            % Winning condition 1: General reaches opponent's military base
            if currentPlayer == 'A' && board(initialRow, initialCol) == 'A'
                if finalRow == 1 && finalCol == 3
                    fprintf('Player A, your general reaches opponent''s military base. You win.\n')
                    return;
                end
            elseif currentPlayer == 'B' && board(initialRow, initialCol) == 'B'
                if finalRow == 5 && finalCol == 3
                    fprintf('Player B, your general reaches opponent''s military base. You win.\n')
                    return;
                end
            end
            
            % Winning condition 2: Capture opponent's general
            if currentPlayer == 'A'
                [rowGen, colGen] = find(board == 'B');
                if finalRow == rowGen && finalCol == colGen
                    fprintf('Player A, you capture opponent''s general. You win.\n')
                    return;
                end
            elseif currentPlayer == 'B'
                [rowGen, colGen] = find(board == 'A');
                if finalRow == rowGen && finalCol == colGen
                    fprintf('Player B, you capture opponent''s general. You win.\n')
                    return;
                end
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Make a move
            if (currentPlayer == 'A' && board(finalRow, finalCol) == 'b') || (currentPlayer == 'B' && board(finalRow, finalCol) == 'a')
                board(finalRow, finalCol) = board(initialRow, initialCol);
                board(initialRow, initialCol) = ' ';
            else
                temp = board(initialRow, initialCol);
                board(initialRow, initialCol) = board(finalRow, finalCol);
                board(finalRow, finalCol) = temp;
            end
        end
        
        break;
    end
    
    % Swap cards
    if currentPlayer == 'A'
        if(cardInput == 1)
            temp = cardA1;
            cardA1 = sideCard;
            sideCard = temp;
        else
            temp = cardA2;
            cardA2 = sideCard;
            sideCard = temp;
        end
    elseif currentPlayer == 'B'
        if(cardInput == 1)
            temp = cardB1;
            cardB1 = sideCard;
            sideCard = temp;
        else
            temp = cardB2;
            cardB2 = sideCard;
            sideCard = temp;
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Display board again to choose movement of W
    dispBoard(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard);
    fprintf('Player %c, choose the movement of W.\n', currentPlayer)
    
    while true
        % Player input
        moveW = input('u(up), l(left), d(down), r(right), s(stay): ', 's');
        
        % Obtain initial position of W
        [rowW, colW] = find(board == 'W');
        
        % Make a move on W and check moving conditions
        if moveW == 'u'
            if rowW - 1 < 1 % Check out of bound
                fprintf('You cannot move the wall out of bound.\n')
                continue;
            elseif rowW - 1 == 1 && colW == 3 % Cannot move to a military base
                fprintf('You cannot move the wall to a military base.\n')
                continue;
            elseif board(rowW - 1, colW) == currentPlayer % Occupied by own general
                fprintf('You cannot move the wall there. It is occupied by your general.\n')
                continue;
            elseif currentPlayer == 'B' && (board(rowW - 1, colW) == 'a' || board(rowW - 1, colW) == 'A') % Occupied by opponent A
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            elseif currentPlayer == 'A' && (board(rowW - 1, colW) == 'b' || board(rowW - 1, colW) == 'B') % Occupied by opponent B
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            else % Can move to a empty space or position occupied by own soldier
                temp = board(rowW, colW);
                board(rowW, colW) = board(rowW - 1, colW);
                board(rowW - 1, colW) = temp;
                break;
            end
        elseif moveW == 'l'
            if colW - 1 < 1 % Check out of bound
                fprintf('You cannot move the wall out of bound.\n')
                continue;
            elseif (rowW == 1 || rowW == 5) && colW - 1 == 3 % Cannot move to a military base
                fprintf('You cannot move the wall to a military base.\n')
                continue;
            elseif board(rowW, colW - 1) == currentPlayer % Occupied by own general
                fprintf('You cannot move the wall there. It is occupied by your general.\n')
                continue;
            elseif currentPlayer == 'B' && (board(rowW, colW - 1) == 'a' || board(rowW, colW - 1) == 'A') % Occupied by opponent A
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            elseif currentPlayer == 'A' && (board(rowW, colW - 1) == 'b' || board(rowW, colW - 1) == 'B') % Occupied by opponent B
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            else % Can move to a empty space or position occupied by own soldier
                temp = board(rowW, colW);
                board(rowW, colW) = board(rowW, colW - 1);
                board(rowW, colW - 1) = temp;
                break;
            end
        elseif moveW == 'd'
            if rowW + 1 > 5 % Check out of bound
                fprintf('You cannot move the wall out of bound.\n')
                continue;
            elseif rowW + 1 == 5 && colW == 3 % Cannot move to a military base
                fprintf('You cannot move the wall to a military base.\n')
                continue;
            elseif board(rowW + 1, colW) == currentPlayer % Occupied by own general
                fprintf('You cannot move the wall there. It is occupied by your general.\n')
                continue;
            elseif currentPlayer == 'B' && (board(rowW + 1, colW) == 'a' || board(rowW + 1, colW) == 'A') % Occupied by opponent A
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            elseif currentPlayer == 'A' && (board(rowW + 1, colW) == 'b' || board(rowW + 1, colW) == 'B') % Occupied by opponent B
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            else % Can move to a empty space or position occupied by own soldier
                temp = board(rowW, colW);
                board(rowW, colW) = board(rowW + 1, colW);
                board(rowW + 1, colW) = temp;
                break;
            end
        elseif moveW == 'r'
            if colW + 1 > 5 % Check out of bound
                fprintf('You cannot move the wall out of bound.\n')
                continue;
            elseif (rowW == 1 || rowW == 5) && colW + 1 == 3 % Cannot move to a military base
                fprintf('You cannot move the wall to a military base.\n')
                continue;
            elseif board(rowW, colW + 1) == currentPlayer % Occupied by own general
                fprintf('You cannot move the wall there. It is occupied by your general.\n')
                continue;
            elseif currentPlayer == 'B' && (board(rowW, colW + 1) == 'a' || board(rowW, colW + 1) == 'A') % Occupied by opponent A
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            elseif currentPlayer == 'A' && (board(rowW, colW + 1) == 'b' || board(rowW, colW + 1) == 'B') % Occupied by opponent B
                fprintf('You cannot move the wall there. It is occupied by your opponent.\n')
                continue;
            else % Can move to a empty space or position occupied by own soldier
                temp = board(rowW, colW);
                board(rowW, colW) = board(rowW, colW + 1);
                board(rowW, colW + 1) = temp;
                break;
            end
        elseif moveW == 's'
            break;
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Reduce number of turns by 1
    turnNum = turnNum - 1;
    
    % Last turn, game is tied
    if turnNum == 0
        fprintf('\nThis is the last turn. The game is tied.\n')
        break;
    end
    
    % Rotate side card 180 degrees
    sideCard = fliplr(flipud(sideCard));
    
    % Change player
    if currentPlayer == 'A'
        currentPlayer = 'B';
    elseif currentPlayer == 'B'
        currentPlayer = 'A';
    end
    
    % Skip a line
    fprintf('\n')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sub-function 1: For checking and showing all valid moves
function [cardInt, cardFin] = check(rowW, colW, rowP, colP, rowDifX, colDifX)

intR = []; intC = []; finR = []; finC = []; % Initialize some arrays
n = 1; % Count the number of valid moves

for i = 1:length(rowP)        % Check every own pawns
    for j = 1:length(rowDifX) % Check every possible moves according to the movement card
        newR = rowP(i) + rowDifX(j); newC = colP(i) + colDifX(j);
        if (newR > 0) && (newR < 6) && (newC > 0) && (newC < 6) % Reject out of bound positions
            invalidCheck = 0; % For checking invalid positions (Initialize to be FALSE)
            for k = 1:length(rowP)
                if (newR == rowP(k) && newC == colP(k)) || (newR == rowW && newC == colW)
                    invalidCheck = invalidCheck + 1; % Invalid if position is occupied by own pawn or the wall
                end
            end
            if invalidCheck == 0 % If valid, save all possible moves
                intR(n) = rowP(i);
                intC(n) = colP(i);
                finR(n) = newR;
                finC(n) = newC;
                n = n + 1;
            end
        end
    end
end

% Some char and string conversion for better output
intR = char(intR(:) + 96);
intC = char(string(intC'));
finR = char(finR(:) + 96);
finC = char(string(finC'));

% Output items
cardInt = horzcat(intR, intC); % Array for saving valid initial positions
cardFin = horzcat(finR, finC); % Array for saving valid final positions
end

% Sub-function 2: Display board
function dispBoard(board, currentPlayer, cardA1, cardA2, cardB1, cardB2, sideCard)
if currentPlayer == 'A'
    arrow = '^';
elseif currentPlayer == 'B'
    arrow = 'v';
end

fprintf('                        Player B\n')
fprintf('                          Card 1   Card 2\n')

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardB1(1,1), cardB1(1,2), cardB1(1,3), cardB1(1,4), cardB1(1,5))
fprintf('    %c%c%c%c%c\n', cardB2(1,1), cardB2(1,2), cardB2(1,3), cardB2(1,4), cardB2(1,5))

fprintf('a | %c | %c | %c | %c | %c |', board(1,1), board(1,2), board(1,3), board(1,4), board(1,5))
fprintf('    %c%c%c%c%c', cardB1(2,1), cardB1(2,2), cardB1(2,3), cardB1(2,4), cardB1(2,5))
fprintf('    %c%c%c%c%c\n', cardB2(2,1), cardB2(2,2), cardB2(2,3), cardB2(2,4), cardB2(2,5))

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardB1(3,1), cardB1(3,2), cardB1(3,3), cardB1(3,4), cardB1(3,5))
fprintf('    %c%c%c%c%c', cardB2(3,1), cardB2(3,2), cardB2(3,3), cardB2(3,4), cardB2(3,5))
fprintf('    Side card\n')

fprintf('b | %c | %c | %c | %c | %c |', board(2,1), board(2,2), board(2,3), board(2,4), board(2,5))
fprintf('    %c%c%c%c%c', cardB1(4,1), cardB1(4,2), cardB1(4,3), cardB1(4,4), cardB1(4,5))
fprintf('    %c%c%c%c%c', cardB2(4,1), cardB2(4,2), cardB2(4,3), cardB2(4,4), cardB2(4,5))
fprintf('    %c%c%c%c%c\n', sideCard(1,1), sideCard(1,2), sideCard(1,3), sideCard(1,4), sideCard(1,5))

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardB1(5,1), cardB1(5,2), cardB1(5,3), cardB1(5,4), cardB1(5,5))
fprintf('    %c%c%c%c%c', cardB2(5,1), cardB2(5,2), cardB2(5,3), cardB2(5,4), cardB2(5,5))
fprintf('    %c%c%c%c%c', sideCard(2,1), sideCard(2,2), sideCard(2,3), sideCard(2,4), sideCard(2,5))
fprintf('   %c\n', arrow)

fprintf('c | %c | %c | %c | %c | %c |', board(3,1), board(3,2), board(3,3), board(3,4), board(3,5))
fprintf('         ')
fprintf('         ')
fprintf('    %c%c%c%c%c', sideCard(3,1), sideCard(3,2), sideCard(3,3), sideCard(3,4), sideCard(3,5))
fprintf('   %c\n', arrow)

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardA1(1,1), cardA1(1,2), cardA1(1,3), cardA1(1,4), cardA1(1,5))
fprintf('    %c%c%c%c%c', cardA2(1,1), cardA2(1,2), cardA2(1,3), cardA2(1,4), cardA2(1,5))
fprintf('    %c%c%c%c%c', sideCard(4,1), sideCard(4,2), sideCard(4,3), sideCard(4,4), sideCard(4,5))
fprintf('   %c\n', arrow)

fprintf('d | %c | %c | %c | %c | %c |', board(4,1), board(4,2), board(4,3), board(4,4), board(4,5))
fprintf('    %c%c%c%c%c', cardA1(2,1), cardA1(2,2), cardA1(2,3), cardA1(2,4), cardA1(2,5))
fprintf('    %c%c%c%c%c', cardA2(2,1), cardA2(2,2), cardA2(2,3), cardA2(2,4), cardA2(2,5))
fprintf('    %c%c%c%c%c\n', sideCard(5,1), sideCard(5,2), sideCard(5,3), sideCard(5,4), sideCard(5,5))

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardA1(3,1), cardA1(3,2), cardA1(3,3), cardA1(3,4), cardA1(3,5))
fprintf('    %c%c%c%c%c\n', cardA2(3,1), cardA2(3,2), cardA2(3,3), cardA2(3,4), cardA2(3,5))

fprintf('e | %c | %c | %c | %c | %c |', board(5,1), board(5,2), board(5,3), board(5,4), board(5,5))
fprintf('    %c%c%c%c%c', cardA1(4,1), cardA1(4,2), cardA1(4,3), cardA1(4,4), cardA1(4,5))
fprintf('    %c%c%c%c%c\n', cardA2(4,1), cardA2(4,2), cardA2(4,3), cardA2(4,4), cardA2(4,5))

fprintf('  +---+---+---+---+---+')
fprintf('    %c%c%c%c%c', cardA1(5,1), cardA1(5,2), cardA1(5,3), cardA1(5,4), cardA1(5,5))
fprintf('    %c%c%c%c%c\n', cardA2(5,1), cardA2(5,2), cardA2(5,3), cardA2(5,4), cardA2(5,5))

fprintf('    1   2   3   4   5     Card 1   Card 2\n')
fprintf('                        Player A\n')
end