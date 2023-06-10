sid = input('Enter your SID: ', 's');


commandEnd = '(player, board, cardA1, cardA2, cardB1, cardB2, sideCard, 10)';

try
    fprintf('Test for valid movements:\n');
    testCase = 41;
    AIBasicTestCase;
    player = 'A';
    fprintf('Test case %d, player %c.\n', testCase, player)
    [cardPicked, startP, endP, wDir]= eval(['AI' sid commandEnd]);
    fprintf('CardPicked=%d, moveFrom=%s, moveTo=%s, wDir=%c\n', cardPicked, startP, endP, wDir);
catch ME
    % Some error occurred if you get here.
    errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
        ME.stack(1).name, ME.stack(1).line, ME.message);
    fprintf(1, '%s\n', errorMessage);
    %uiwait(warndlg(errorMessage));
end

try
    player = 'B';
    fprintf('Test case %d, player %c.\n', testCase, player)
    [cardPicked, startP, endP, wDir]=eval(['AI' sid commandEnd]);
    fprintf('CardPicked=%d, moveFrom=%s, moveTo=%s, wDir=%c\n', cardPicked, startP, endP, wDir);
catch ME
    % Some error occurred if you get here.
    errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
        ME.stack(1).name, ME.stack(1).line, ME.message);
    fprintf(1, '%s\n', errorMessage);
    %uiwait(warndlg(errorMessage));
end

try
    fprintf('\nTest for no movement:\n');
    testCase = 42;
    AIBasicTestCase;
    player = 'A';
    fprintf('Test case %d, player %c.\n', testCase, player)
    [cardPicked, startP, endP, wDir]=eval(['AI' sid commandEnd]);
    fprintf('CardPicked=%d, moveFrom=%s, moveTo=%s, wDir=%c\n', cardPicked, startP, endP, wDir)
catch ME
    % Some error occurred if you get here.
    errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
        ME.stack(1).name, ME.stack(1).line, ME.message);
    fprintf(1, '%s\n', errorMessage);
    %uiwait(warndlg(errorMessage));
end

try
    fprintf('\nTest for winning movement:\n');
    testCase = 43;
    AIBasicTestCase;
    player = 'A';
    fprintf('Test case %d, player %c.\n', testCase, player)
    [cardPicked, startP, endP, wDir]=eval(['AI' sid commandEnd]);
    fprintf('CardPicked=%d, moveFrom=%s, moveTo=%s, wDir=%c\n', cardPicked, startP, endP, wDir)
catch ME
    % Some error occurred if you get here.
    errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
        ME.stack(1).name, ME.stack(1).line, ME.message);
    fprintf(1, '%s\n', errorMessage);
    %uiwait(warndlg(errorMessage));
end

try
    testCase = 43;
    AIBasicTestCase;
    player = 'B';
    fprintf('Test case %d, player %c.\n', testCase, player)
    [cardPicked, startP, endP, wDir]=eval(['AI' sid commandEnd]);
    fprintf('CardPicked=%d, moveFrom=%s, moveTo=%s, wDir=%c\n', cardPicked, startP, endP, wDir)
catch ME
    % Some error occurred if you get here.
    errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
        ME.stack(1).name, ME.stack(1).line, ME.message);
    fprintf(1, '%s\n', errorMessage);
    %uiwait(warndlg(errorMessage));
end
