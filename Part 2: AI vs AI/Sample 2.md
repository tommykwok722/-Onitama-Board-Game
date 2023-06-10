## Sample 2
The board in the script `AITest2.m` is
```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .x.x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | B |   |   |   |   |    ..x..    .x.x.    ..x..
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c | W |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .....   ^
d | a |   |   |   |   |    .xx..    .x...    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x...
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
```

#### Output of my program
```
>> AITest2
currentPlayer = 'A';
turn = 50;
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)

cardPicked =

     1


moveFrom =

    'XX'


moveTo =

    'XX'


wDir =

    'd'
```
which fulfills one of the output below.

#### All possible output
| `cardPicked` | `moveFrom` | `moveTo` | `wDir` |
| ------------ | ---------- | -------- | ------ |
| 1 | 'XX' | 'XX' | 'r' |
| 1 | 'XX' | 'XX' | 'd' |
| 1 | 'XX' | 'XX' | 's' |
| 2 | 'XX' | 'XX' | 'r' |
| 2 | 'XX' | 'XX' | 'd' |
| 2 | 'XX' | 'XX' | 's' |
