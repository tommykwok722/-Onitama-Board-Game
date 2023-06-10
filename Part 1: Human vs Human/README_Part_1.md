## Explanations

`game.m` is the main file to implement the game.

The script `setup.m` prompts the user to input test case number. The file also contains data for different test cases.
The file contains the following variables.
1. `turnNum`:  Maximum number of turns can be played. After this number, the game will be a tie.
2. `currentPlayer`: A character that represents the current player, either A or B.
3. `board`: A 5×5 matrix represents the board. For example,
```
board = [’bbBbb’
         ’     ’
         ’W    ’
         ’     ’
         ’aaAaa’];
```
4. `cardA1`, `cardA2` are player A’s cards. `cardB1`, `cardB2` are player B’s cards. `sideCard` is the side card. For example,
```
cardA1 = ['.....'
          'x...x'
          '.xox.'
          '.....'
          '.....'];
          
cardA2 = ['..x..'
          '..x..'
          '..o..'
          '.....'
          '.....'];
          
cardB1 = ['.....'
          '.x.x.'
          '..o..'
          '.....'
          '.....'];
          
cardB2 = ['.....'
          '..x..'
          '.xo..'
          '.....'
          '.....'];
          
sideCard = ['..x..'
            '.x.x.'
            '..o..'
            '.....'
            '.....'];
```

## Assumptions
You can assume users always input the correct format. That implies
1. When the user is asked to input integers 0, 1 or 2, he will input 0, 1 or 2.
2. When the user is asked to input u(up), l(left), d(down), r(right), s(stay), he will input one of those five letters.
3. When the user is asked to input a position (e.g. e3), he will input the correct format.

## Sample Output
To make sure the game works functionally, the script `setup.m` contains data for different test cases to test the program `game.m`. There are 6 samples to test the program, each sample has different scenarios and different output.
