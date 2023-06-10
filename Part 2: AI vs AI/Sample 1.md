## Sample 1
The board in the script `AITest1.m` is
```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   | b |   |   |    .....    .....
  +---+---+---+---+---+    ..o..    ..ox.    Side card
b | W | B |   |   |   |    .x.x.    ..x..    .....
  +---+---+---+---+---+    .....    .....    .....   v
c | a |   |   |   | A |    ..o..                     v
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
d |   |   |   |   |   |    x...x    ..x..    ..x..
  +---+---+---+---+---+    .xox.    ..o..
e |   |   |   |   |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
```

### Sample 1a
#### Output of my program
```
>> AITest1
currentPlayer = 'A';
turn = 50;
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)

cardPicked =

     2


moveFrom =

    'c1'


moveTo =

    'a1'


wDir =

    'u'
```
which fulfills one of the output below.

#### All possible output
| `cardPicked` | `moveFrom` | `moveTo` | `wDir` |
| ------------ | ---------- | -------- | ------ |
| 1 | 'c1' | 'c2' | 'd' |
| 1 | 'c1' | 'c2' | 's' |
| 1 | 'c1' | 'b3' | 'd' |
| 1 | 'c1' | 'b3' | 's' |
| 1 | 'c5' | 'b3' | 'd' |
| 1 | 'c5' | 'b3' | 's' |
| 1 | 'c5' | 'c4' | 'd' |
| 1 | 'c5' | 'c4' | 's' |
| 2 | 'c1' | 'a1' | 'u' |
| 2 | 'c1' | 'a1' | 'd' |
| 2 | 'c1' | 'a1' | 's' |
| 2 | 'c5' | 'a5' | 'd' |
| 2 | 'c5' | 'a5' | 's' |
| 2 | 'c5' | 'b5' | 'd' |
| 2 | 'c5' | 'b5' | 's' |
<br>

### Sample 1b
#### Output of my program
```
>> AITest1
currentPlayer = 'B';
turn = 10;
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)

cardPicked =

     1


moveFrom =

    'b2'


moveTo =

    'c1'


wDir =

    'u'
```
which fulfills one of the output below.

#### All possible output
| `cardPicked` | `moveFrom` | `moveTo` | `wDir` |
| ------------ | ---------- | -------- | ------ |
| 1 | 'b2' | 'c1' | 'u' |
| 1 | 'b2' | 'c1' | 'r' |
| 1 | 'b2' | 'c1' | 's' |
| 1 | 'b2' | 'c3' | 'u' |
| 1 | 'b2' | 'c3' | 'r' |
| 1 | 'b2' | 'c3' | 's' |
| 1 | 'a3' | 'b4' | 'u' |
| 1 | 'a3' | 'b4' | 's' |
| 2 | 'a1' | 'a2' | 'u' |
| 2 | 'a1' | 'a2' | 's' |
| 2 | 'b2' | 'c2' | 'u' |
| 2 | 'b2' | 'c2' | 'r' |
| 2 | 'b2' | 'c2' | 's' |
| 2 | 'b2' | 'b3' | 'u' |
| 2 | 'b2' | 'b3' | 'r' |
| 2 | 'b2' | 'b3' | 's' |
| 2 | 'a3' | 'b3' | 'u' |
| 2 | 'a3' | 'b3' | 's' |
| 2 | 'a3' | 'a4' | 'u' |
| 2 | 'a3' | 'a4' | 's' |
