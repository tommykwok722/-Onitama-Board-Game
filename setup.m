% Warning
% Don't modify this file
testCase = input('Input the test case number: '); 
switch testCase
    case 1
        turnNum = 50;
        currentPlayer = 'A';
        board = ['bbBbb'
            '     '
            'W    '
            '     '
            'aaAaa'];
        cardA1=['.....'
            '.x...'
            '.xo.x'
            '.....'
            '.....'];
        cardA2=['.....'
            '..x..'
            '..ox.'
            '.....'
            '.....'];
        cardB1=['.....'
            '..x..'
            '..o..'
            '.x...'
            '.....'];
        cardB2=['.....'
            '.x.x.'
            '..o..'
            '.x...'
            '.....'];
        sideCard=['..x..'
            '...x.'
            '..o..'
            '.....'
            '.....'];
    case 2
        turnNum = 10;
        currentPlayer = 'B';
        board = [' W  b'
            ' B   '
            '  A  '
            ' a   '
            '     '];
        cardA1=['.....'
            '..x..'
            '.xox.'
            '.....'
            '.....'];
        cardA2=['.....'
            '..x..'
            '.x.x.'
            '..o..'
            '.....'];
        cardB1=['.....'
            '..x..'
            '..o..'
            '..x..'
            '.....'];
        cardB2=['.....'
            '...x.'
            '.xo..'
            '.x...'
            '.....'];
        sideCard=['.....'
            '.....'
            '.o...'
            '....x'
            '..x..'];
    case 3
        turnNum = 50;
        currentPlayer = 'A';
        board = ['     '
            '     '
            '   a '
            ' b A '
            'B  Wa'];
        cardA1=['.....'
            '.x...'
            '.xo.x'
            '.....'
            '.....'];
        cardA2=['.....'
            '..x..'
            '..ox.'
            '.....'
            '.....'];
        cardB1=['.....'
            '..x..'
            '..o..'
            '.x...'
            '.....'];
        cardB2=['.....'
            '.x.x.'
            '..o..'
            '.x...'
            '.....'];
        sideCard=['..x..'
            '...x.'
            '..o..'
            '.....'
            '.....'];
    case 4
        turnNum = 10;
        currentPlayer = 'B';
        board = ['b  Bb'
            '   b '
            ' Wa  '
            ' aa  '
            '  A  '];
        cardA1=['.....'
            '.x.x.'
            '.xo..'
            '.....'
            '.....'];
        cardA2=['..x..'
            '.....'
            '..o..'
            '..x..'
            '.....'];
        cardB1=['.....'
            '..x..'
            '.....'
            '..ox.'
            '.....'];
        cardB2=['.....'
            '...x.'
            '..o..'
            '.x...'
            '.....'];
        sideCard=['.....'
            '...x.'
            '.....'
            '..o..'
            '.....']; 
        
    case 5
        turnNum = 3;
        currentPlayer = 'B';
        board = [
            ' B   '
            '     '
            ' W   '
            'a    '
            'A    '];
        cardA1=['.....'
            '.xx..'
            '.xo..'
            '.....'
            '.....'];
        cardA2=['.....'
            '.x...'
            '..o..'
            '.x...'
            '.....'];
        cardB1=['.....'
            '..x..'
            '..o..'
            '.x.x.'
            '.....'];
        cardB2=['.....'
            '.x.x.'
            '..o..'
            '.x.x.'
            '.....'];
        sideCard=['..x..'
            '.x.x.'
            '..o..'
            '.....'
            '.....'];

end


 