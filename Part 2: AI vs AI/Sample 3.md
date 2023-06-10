## Sample 3
The board in the script `AITest3.m` is
```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .x.x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | b | W |   |   |   |    ..x..    .x.x.    ..x..
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c |   |   | a | A |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .....   ^
d |   | B |   |   |   |    .xx..    .x...    .....
  +---+---+---+---+---+    .xo..    ..o..
e |   |   |   |   |   |    .....    .x...
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
```

### Sample 3a
#### Output of my program
```
>> AITest3
currentPlayer = 'A';
turn = 10;
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)

cardPicked =

     2


moveFrom =

    'c3'


moveTo =

    'd2'


wDir =

    'u'
```
which is able to spot the winning move.
<br>

### Sample 3b
#### Output of my program
```
>> AITest3
currentPlayer = 'B';
turn = 10;
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)

cardPicked =

     2


moveFrom =

    'd2'


moveTo =

    'e3'


wDir =

    'u'
```
which is able to spot the winning move.
