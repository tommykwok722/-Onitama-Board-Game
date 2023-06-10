% Remark: If the function output is changed to D, then output will be a summarized
% dataset to list out all possible moves and checking parameters
% (D is defined in line 130)

function [cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
    cardA1, cardA2, cardB1, cardB2, sideCard, turn)

% Rotate cardB1 and cardB2 first
cardB1 = fliplr(flipud(cardB1));
cardB2 = fliplr(flipud(cardB2));

% Rotate sideCard player B plays first
if currentPlayer == 'B'
    sideCard = fliplr(flipud(sideCard));
end

% Obtain row and column of the wall
[rowW, colW] = find(board == 'W');

% Check all valid moves of the pawns
if currentPlayer == 'A'
    for i = 1:2 % Loop 2 times to check 2 cards
        if i == 1
            [rowX, colX] = find(cardA1 == 'x'); % Rows and columns of all 'x' in the card
            [rowO, colO] = find(cardA1 == 'o'); % Rows and columns of all 'o' in the card
        else
            [rowX, colX] = find(cardA2 == 'x');
            [rowO, colO] = find(cardA2 == 'o');
        end
        
        [rowP, colP] = find(board == 'a' | board == 'A'); % Rows and columns of all pawns on the board
        rowDifX = rowX - rowO; % Difference of rows of all 'x' and 'o'
        colDifX = colX - colO; % Difference of columns of all 'x' and 'o'
        
        % Find all valid pawn moves (Sub-function 1: checkPawn)
        [cardInt, cardFin] = checkPawn(rowW, colW, rowP, colP, rowDifX, colDifX);
        
        % Save all valid pawn moves
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
        else
            [rowX, colX] = find(cardB2 == 'x');
            [rowO, colO] = find(cardB2 == 'o');
        end
        
        [rowP, colP] = find(board == 'b' | board == 'B'); % Rows and columns of all pawns on the board
        rowDifX = rowX - rowO; % Difference of rows of all 'x' and 'o'
        colDifX = colX - colO; % Difference of columns of all 'x' and 'o'
        
        % Find all valid pawn moves (Sub-function 1: checkPawn)
        [cardInt, cardFin] = checkPawn(rowW, colW, rowP, colP, rowDifX, colDifX);
        
        % Save all valid pawn moves
        if i == 1
            card1Int = cardInt;
            card1Fin = cardFin;
        else
            card2Int = cardInt;
            card2Fin = cardFin;
        end
    end
end

% Analysize the moves (Sub-function 2: checkPmove)
[capSol, capGen, reaMil] = checkPmove(card1Int, card1Fin, card2Int, card2Fin, board, currentPlayer);

% Find out all possible wDir for every move (Sub-function 3: checkWdir)
[wDirU, wDirL, wDirD, wDirR, wDirS] = checkWdir(capGen, reaMil, ...
    card1Int, card1Fin, card2Int, card2Fin, board, currentPlayer, rowW, colW);

% Summarize the data
move_From = vertcat(card1Int, card2Int);
move_To   = vertcat(card1Fin, card2Fin);
card1Num = transpose(ones(1, length(card1Int)));
card2Num = transpose(2 * ones(1, length(card2Int)));
card_Picked = vertcat(card1Num, card2Num);

cP = []; cS = []; cG = []; rM = [];
mF = string([]); mT = string([]); w_Dir = string([]);

% Combine wDirU, ..., wDirS into wDir
n = 1;
for i = 1:length(card_Picked)
    if wDirU(i) == 1
        cP(n) = card_Picked(i); mF(n) = move_From(i,:); mT(n) = move_To(i,:);
        cS(n) = capSol(i); cG(n) = capGen(i); rM(n) = reaMil(i); w_Dir(n) = 'u';
        n = n + 1;
    end
    if wDirL(i) == 1
        cP(n) = card_Picked(i); mF(n) = move_From(i,:); mT(n) = move_To(i,:);
        cS(n) = capSol(i); cG(n) = capGen(i); rM(n) = reaMil(i); w_Dir(n) = 'l';
        n = n + 1;
    end
    if wDirD(i) == 1
        cP(n) = card_Picked(i); mF(n) = move_From(i,:); mT(n) = move_To(i,:);
        cS(n) = capSol(i); cG(n) = capGen(i); rM(n) = reaMil(i); w_Dir(n) = 'd';
        n = n + 1;
    end
    if wDirR(i) == 1
        cP(n) = card_Picked(i); mF(n) = move_From(i,:); mT(n) = move_To(i,:);
        cS(n) = capSol(i); cG(n) = capGen(i); rM(n) = reaMil(i); w_Dir(n) = 'r';
        n = n + 1;
    end
    if wDirS(i) == 1
        cP(n) = card_Picked(i); mF(n) = move_From(i,:); mT(n) = move_To(i,:);
        cS(n) = capSol(i); cG(n) = capGen(i); rM(n) = reaMil(i); w_Dir(n) = 's';
        n = n + 1;
    end
end

CARDPICKED = transpose(cP); MOVEFROM = char(transpose(mF)); MOVETO = char(transpose(mT));
capSol = transpose(cS); capGen = transpose(cG); reaMil = transpose(rM);
WDIR = char(transpose(w_Dir));

% Analyze opponent's move which can capture my pawns (Sub-function 4: checkOpp)
[capOppInt, capOppFin, LoseInt, LoseFin] = checkOpp(CARDPICKED, ...
    MOVEFROM, MOVETO, board, cardA1, cardA2, cardB1, cardB2, currentPlayer);

% Every possible moves of pawns and the wall (summarized in a dataset for checking)
D = dataset(CARDPICKED, MOVEFROM, MOVETO, WDIR, capSol, capGen, reaMil, capOppInt, capOppFin, LoseInt, LoseFin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remark: Below are the terminologies of the parameters
% These parameters are used for finding the best moves
% They only have the values of 1 (TRUE) or 0 (FALSE)

% capSol    : Determines whether the move can capture opponent's soldier (1 = can capture; 0 = cannot)
% capGen    : Determines whether the move can capture opponent's general (1 = can capture; 0 = cannot)
% reaMil    : Determines whether the move can reach opponent's military position (1 = can reach; 0 = cannot)
% capOppInt : Determines whether opponent can capture my pawn if I does NOT move that pawn
% capOppFin : Determines whether opponent can capture my pawn if I move that pawn
% LoseInt   : Determines whether I will lose if I does NOT move that pawn
% LoseFin   : Determines whether I will lose if I move that pawn
% Total of 2^7 = 128 combinations

% Find out the best move
% The best move: Winning the game
% (96 combinations; 32 combinations left)
if isempty(find(capGen == 1 | reaMil == 1)) == 0
    k = find(capGen == 1 | reaMil == 1);
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

% 2nd best move: Avoid losing the game
% Pick the pawn that I will lose if I does NOT move it
% (16 combinations; 16 combinations left)
if isempty(find(LoseInt == 1)) == 0
    k = find(LoseInt == 1);
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

% 3rd best move:
% Move -> Capture opponent's pawn (soldier) and
% Not move -> Captured by opponent
% (4 combinations; 12 combinations left)
if isempty(find(capSol == 1 & capOppInt == 1)) == 0
    k = find(capSol == 1 & capOppInt == 1);
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

% 4th best move:
% Move -> Safe, will not lose
% (3 combinations; 9 combinations left)
if currentPlayer == 'A'
    % Prioritize a move which moves forward (towards opponent's base direction)
    if isempty(find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) < 0)) == 0
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) < 0);
    elseif isempty(find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) == 0)) == 0
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) == 0);
    else
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) > 0);
    end
    
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
elseif currentPlayer == 'B'
    % Prioritize a move which moves forward (towards opponent's base direction)
    if isempty(find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) > 0)) == 0
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) > 0);
    elseif isempty(find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) == 0)) == 0
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) == 0);
    else
        k = find(LoseFin == 0 & capOppFin == 0 & double(MOVETO(:,1)) - double(MOVEFROM(:,1)) < 0);
    end
    
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

% 5th best move:
% Not the worst case:
% Move -> Not lose but captured by opponent
% (3 combinations; 6 combinations left)
if isempty(find(LoseFin == 0 & capOppFin == 1)) == 0
    k = find(LoseFin == 0 & capOppFin == 1);
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

% Last best move:
% Move -> lose and captured by opponent
if isempty(find(LoseFin == 1 & capOppFin == 1)) == 0
    k = find(LoseFin == 1 & capOppFin == 1);
    cardPicked = CARDPICKED(k(1));
    moveFrom = MOVEFROM(k(1),:);
    moveTo = MOVETO(k(1),:);
    wDir = WDIR(k(1));
    return;
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sub-function 1: Checking and showing all valid moves of pawns
% Meanings of parameters:
% cardInt: Valid initial position of the pawns
% cardFin: Valid final position of the pawns
function [cardInt, cardFin] = checkPawn(rowW, colW, rowP, colP, rowDifX, colDifX)
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

% If no valid moves, assign 'XX' to the variables
if length(intR) == 0
    cardInt = string([]);
    cardInt([1:length(rowP)], 1) = 'XX';
    cardInt = char(cardInt);
    cardFin = cardInt;
    return;
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

% Sub-function 2: Analysing the valid pawn moves
% Meanings of parameters:
% capSol: Check whether or not to capture opponent's soldier
% capGen: Check whether or not to capture opponent's general
% reaMil: Check whether or not to reach opponent's military base
function [capSol, capGen, reaMil] = checkPmove(card1Int, card1Fin, card2Int, card2Fin, board, currentPlayer)
capSol = zeros(1, length(card1Int) + length(card2Int));
capGen = zeros(1, length(card1Int) + length(card2Int));
reaMil = zeros(1, length(card1Int) + length(card2Int));
n = 1; % Count the number of valid moves

% Checking no valid moves
check1 = string([]); check1([1:length(card1Int)], 1) = 'XX'; check1 = char(check1);
check2 = string([]); check2([1:length(card2Int)], 1) = 'XX'; check2 = char(check2);
if isequal(card1Int, check1) && isequal(card2Int, check2)
    return;
end

for i = 1:length(card1Int)
    % Outcome 1: Capture opponent's soldier
    if (currentPlayer == 'A' && board(double(card1Fin(i,1))-96, str2num(card1Fin(i,2))) == 'b') || ...
            (currentPlayer == 'B' && board(double(card1Fin(i,1))-96, str2num(card1Fin(i,2))) == 'a')
        capSol(n) = 1;
    end
    
    % Outcome 2: Capture opponent's general
    if (currentPlayer == 'A' && board(double(card1Fin(i,1))-96, str2num(card1Fin(i,2))) == 'B') || ...
            (currentPlayer == 'B' && board(double(card1Fin(i,1))-96, str2num(card1Fin(i,2))) == 'A')
        capGen(n) = 1;
    end
    
    % Outcome 3: General reaches opponent's military base
    if (currentPlayer == 'A' && board(double(card1Int(i,1))-96, str2num(card1Int(i,2))) == 'A' && ...
            double(card1Fin(i,1)) - 96 == 1 && str2num(card1Fin(i,2)) == 3) || ...
            (currentPlayer == 'B' && board(double(card1Int(i,1))-96, str2num(card1Int(i,2))) == 'B' && ...
            double(card1Fin(i,1)) - 96 == 5 && str2num(card1Fin(i,2)) == 3)
        reaMil(n) = 1;
    end
    
    n = n + 1;
end

for i = 1:length(card2Int)
    % Outcome 1: Capture opponent's soldier
    if (currentPlayer == 'A' && board(double(card2Fin(i,1))-96, str2num(card2Fin(i,2))) == 'b') || ...
            (currentPlayer == 'B' && board(double(card2Fin(i,1))-96, str2num(card2Fin(i,2))) == 'a')
        capSol(n) = 1;
    end
    
    % Outcome 2: Capture opponent's general
    if (currentPlayer == 'A' && board(double(card2Fin(i,1))-96, str2num(card2Fin(i,2))) == 'B') || ...
            (currentPlayer == 'B' && board(double(card2Fin(i,1))-96, str2num(card2Fin(i,2))) == 'A')
        capGen(n) = 1;
    end
    
    % Outcome 3: General reaches opponent's military base
    if (currentPlayer == 'A' && board(double(card2Int(i,1))-96, str2num(card2Int(i,2))) == 'A' && ...
            double(card2Fin(i,1)) - 96 == 1 && str2num(card2Fin(i,2)) == 3) || ...
            (currentPlayer == 'B' && board(double(card2Int(i,1))-96, str2num(card2Int(i,2))) == 'B' && ...
            double(card2Fin(i,1)) - 96 == 5 && str2num(card2Fin(i,2)) == 3)
        reaMil(n) = 1;
    end
    
    n = n + 1;
end

capSol = transpose(capSol);
capGen = transpose(capGen);
reaMil = transpose(reaMil);
end

% Sub-function 3: Checking all possible direction of W for each move
% Meanings of parameters:
% wDirU: Check whether it is valid or not to move the wall upwards
% wDirL: Check whether it is valid or not to move the wall leftwards
% wDirD: Check whether it is valid or not to move the wall downwards
% wDirR: Check whether it is valid or not to move the wall rightwards
% wDirS: Check whether it is valid or not to not move the wall (must be valid)
function [wDirU, wDirL, wDirD, wDirR, wDirS] = checkWdir(capGen, reaMil, card1Int, card1Fin, card2Int, card2Fin, board, currentPlayer, rowW, colW)
wDirU = zeros(1, length(card1Int) + length(card2Int));
wDirL = zeros(1, length(card1Int) + length(card2Int));
wDirD = zeros(1, length(card1Int) + length(card2Int));
wDirR = zeros(1, length(card1Int) + length(card2Int));
wDirS = ones (1, length(card1Int) + length(card2Int));
n = 1; % Count the number of valid moves

% Checking invalid moves
check1 = string([]); check1([1:length(card1Int)], 1) = 'XX'; check1 = char(check1);
check2 = string([]); check2([1:length(card2Int)], 1) = 'XX'; check2 = char(check2);

for i = 1:length(card1Int)
    simBoard = board; % Reset the simulated board every loop
        
    if isequal(card1Int, check1)
        % Nothing changed on the simBoard if no moves are available
    else
        % Simulate the move of pawn if there are available moves
        simBoard(double(card1Fin(i,1))-96, str2num(card1Fin(i,2))) = ...
            simBoard(double(card1Int(i,1))-96, str2num(card1Int(i,2)));
        
        simBoard(double(card1Int(i,1))-96, str2num(card1Int(i,2))) = ' ';
    end
    
    % Check 'u'
    if (rowW - 1 < 1) || (rowW - 1 == 1 && colW == 3) || (simBoard(rowW - 1, colW) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW - 1, colW) == 'a' || simBoard(rowW - 1, colW) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW - 1, colW) == 'b' || simBoard(rowW - 1, colW) == 'B'))
        wDirU(n) = 0;
    else
        wDirU(n) = 1;
    end
    
    % Check 'l'
    if (colW - 1 < 1) || ((rowW == 1 || rowW == 5) && colW - 1 == 3) || (simBoard(rowW, colW - 1) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW, colW - 1) == 'a' || simBoard(rowW, colW - 1) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW, colW - 1) == 'b' || simBoard(rowW, colW - 1) == 'B'))
        wDirL(n) = 0;
    else
        wDirL(n) = 1;
    end
    
    % Check 'd'
    if (rowW + 1 > 5) || (rowW + 1 == 5 && colW == 3) || (simBoard(rowW + 1, colW) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW + 1, colW) == 'a' || simBoard(rowW + 1, colW) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW + 1, colW) == 'b' || simBoard(rowW + 1, colW) == 'B'))
        wDirD(n) = 0;
    else
        wDirD(n) = 1;
    end
    
    % Check 'r'
    if (colW + 1 > 5) || ((rowW == 1 || rowW == 5) && colW + 1 == 3) || (simBoard(rowW, colW + 1) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW, colW + 1) == 'a' || simBoard(rowW, colW + 1) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW, colW + 1) == 'b' || simBoard(rowW, colW + 1) == 'B'))
        wDirR(n) = 0;
    else
        wDirR(n) = 1;
    end
    
    n = n + 1;
end

for i = 1:length(card2Int)
    simBoard = board; % Reset the simulated board every loop
    
    if isequal(card2Int, check2)
        % Nothing changed on the simBoard if no moves are available
    else
        % Simulate the move of pawn if there are available moves
        simBoard(double(card2Fin(i,1))-96, str2num(card2Fin(i,2))) = ...
            simBoard(double(card2Int(i,1))-96, str2num(card2Int(i,2)));
        
        simBoard(double(card2Int(i,1))-96, str2num(card2Int(i,2))) = ' ';
    end
    
    % Check 'u'
    if (rowW - 1 < 1) || (rowW - 1 == 1 && colW == 3) || (simBoard(rowW - 1, colW) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW - 1, colW) == 'a' || simBoard(rowW - 1, colW) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW - 1, colW) == 'b' || simBoard(rowW - 1, colW) == 'B'))
        wDirU(n) = 0;
    else
        wDirU(n) = 1;
    end
    
    % Check 'l'
    if (colW - 1 < 1) || ((rowW == 1 || rowW == 5) && colW - 1 == 3) || (simBoard(rowW, colW - 1) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW, colW - 1) == 'a' || simBoard(rowW, colW - 1) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW, colW - 1) == 'b' || simBoard(rowW, colW - 1) == 'B'))
        wDirL(n) = 0;
    else
        wDirL(n) = 1;
    end
    
    % Check 'd'
    if (rowW + 1 > 5) || (rowW + 1 == 5 && colW == 3) || (simBoard(rowW + 1, colW) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW + 1, colW) == 'a' || simBoard(rowW + 1, colW) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW + 1, colW) == 'b' || simBoard(rowW + 1, colW) == 'B'))
        wDirD(n) = 0;
    else
        wDirD(n) = 1;
    end
    
    % Check 'r'
    if (colW + 1 > 5) || ((rowW == 1 || rowW == 5) && colW + 1 == 3) || (simBoard(rowW, colW + 1) == currentPlayer) || ...
            (currentPlayer == 'B' && (simBoard(rowW, colW + 1) == 'a' || simBoard(rowW, colW + 1) == 'A')) || ...
            (currentPlayer == 'A' && (simBoard(rowW, colW + 1) == 'b' || simBoard(rowW, colW + 1) == 'B'))
        wDirR(n) = 0;
    else
        wDirR(n) = 1;
    end
    
    n = n + 1;
end

wDirU = transpose(wDirU);
wDirL = transpose(wDirL);
wDirD = transpose(wDirD);
wDirR = transpose(wDirR);
wDirS = transpose(wDirS);
end

% Sub-function 4: Analysing opponent's moves
% Idea: This function is to check whether the opponent can capture my pawns
% after my move based on the initial and final positions of my pawns.

% Meanings of parameters:
% capOppInt: Check whether the MOVEFROM position will be captured by opponent's pawns after my move
% capOppFin: Check whether the MOVETO position will be captured by opponent's pawns after my move
% LoseInt:   Check whether I will lose if I do not move the pawn
% LoseFin:   Check whether I will lose if I move the pawn
function [capOppInt, capOppFin, LoseInt, LoseFin] = checkOpp(CARDPICKED, ...
    MOVEFROM, MOVETO, board, cardA1, cardA2, cardB1, cardB2, currentPlayer)
capOppInt = zeros(length(CARDPICKED), 1);
capOppFin = zeros(length(CARDPICKED), 1);
LoseInt = zeros(length(CARDPICKED), 1);
LoseFin = zeros(length(CARDPICKED), 1);

% Obtain opponent's moves according to his 2 cards
if currentPlayer == 'A'
    % Positions of all opponent's panws
    [rowOppInt, colOppInt] = find(board == 'b' | board == 'B');
    
    [rowX1, colX1] = find(cardB1 == 'x');
    [rowO1, colO1] = find(cardB1 == 'o');
    rowDifX1 = rowX1 - rowO1;
    colDifX1 = colX1 - colO1;
    
    [rowX2, colX2] = find(cardB2 == 'x');
    [rowO2, colO2] = find(cardB2 == 'o');
    rowDifX2 = rowX2 - rowO2;
    colDifX2 = colX2 - colO2;
    
    % All possible moves from cardB1 and cardB2
    rowDifX = vertcat(rowDifX1, rowDifX2);
    colDifX = vertcat(colDifX1, colDifX2);
elseif currentPlayer == 'B'
    % Positions of all opponent's panws
    [rowOppInt, colOppInt] = find(board == 'a' | board == 'A');
    
    [rowX1, colX1] = find(cardA1 == 'x');
    [rowO1, colO1] = find(cardA1 == 'o');
    rowDifX1 = rowX1 - rowO1;
    colDifX1 = colX1 - colO1;
    
    [rowX2, colX2] = find(cardA2 == 'x');
    [rowO2, colO2] = find(cardA2 == 'o');
    rowDifX2 = rowX2 - rowO2;
    colDifX2 = colX2 - colO2;
    
    % All possible moves from cardA1 and cardA2
    rowDifX = vertcat(rowDifX1, rowDifX2);
    colDifX = vertcat(colDifX1, colDifX2);
end

for i = 1:length(CARDPICKED)      % Check my every moves
    for j = 1:length(rowOppInt)   % Check every opponent's pawns
        for k = 1:length(rowDifX) % Check every opponent's move according to his 2 cards
            % CASE 1: If my pawn does not move and one of the opponent's pawn can capture my pawn
            if (double(MOVEFROM(i,1)) - 96 == rowOppInt(j) + rowDifX(k)) && ...
                    (str2num(MOVEFROM(i,2)) == colOppInt(j) + colDifX(k))
                capOppInt(i) = 1;
                
                % CASE 1.1: I will lose if my pawn (general) does not move
                if board(double(MOVEFROM(i,1)) - 96, str2num(MOVEFROM(i,2))) == currentPlayer
                    LoseInt(i) = 1;
                end
            end
            
            % CASE 2: If my pawn moves and one of the opponent's pawn can capture my pawn
            if (double(MOVETO(i,1)) - 96 == rowOppInt(j) + rowDifX(k)) && ...
                    (str2num(MOVETO(i,2)) == colOppInt(j) + colDifX(k))
                capOppFin(i) = 1;
                
                % CASE 2.1: I will lose if my pawn (general) moves
                if board(double(MOVETO(i,1)) - 96, str2num(MOVETO(i,2))) == currentPlayer
                    LoseFin(i) = 1;
                end
            end
        end
    end
end
end