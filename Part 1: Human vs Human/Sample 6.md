## Sample 6: Show All Moves
This sample shows all the possible moves.
1. When prompted choosing movement cards, if the user enters 0, the program lists out all the possible moves.
2. The order of the moves displayed is not important. The program can display the moves in different order, as long as it displays all the movement.

### Sample 6a
```
>> game
Input the test case number: 1
Number of turns left: 50
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b | B | b | b |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    ..x..
  +---+---+---+---+---+    .....    .....    ...x.   ^
c | W |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .....   ^
d |   |   |   |   |   |    .x...    ..x..    .....
  +---+---+---+---+---+    .xo.x    ..ox.
e | a | a | A | a | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 0
Card 1, e2->d1
Card 1, e3->d2
Card 1, e4->d3
Card 1, e5->d4
Card 2, e1->d1
Card 2, e2->d2
Card 2, e3->d3
Card 2, e4->d4
Card 2, e5->d5
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: e5
Input the position you want to move the selected pawn: d5
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b | B | b | b |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c | W |   |   |   |   |                      ..ox.   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d |   |   |   |   | a |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | a | a | A | a |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): u

Number of turns left: 49
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b | B | b | b |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | W |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .....   v
c |   |   |   |   |   |                      .xo..   v
  +---+---+---+---+---+    .....    ..x..    ..x..   v
d |   |   |   |   | a |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | a | a | A | a |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 0
Card 1, a2->b2
Card 1, a3->b3
Card 1, a4->b4
Card 1, a5->b5
Card 2, a1->b2
Card 2, a2->b3
Card 2, a3->b2
Card 2, a3->b4
Card 2, a4->b3
Card 2, a4->b5
Card 2, a5->b4
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: a3
Input the position you want to move the selected pawn: b3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b |   | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b | W |   | B |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c |   |   |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    ..x..    ..x..   v
d |   |   |   |   | a |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | a | a | A | a |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r

Number of turns left: 48
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b |   | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b |   | W | B |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c |   |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   |   |   |   | a |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | a | a | A | a |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 0
Card 1, e2->d1
Card 1, e3->d2
Card 1, e3->e5
Card 1, e4->d3
Card 1, d5->c4
Card 1, d5->d4
Card 2, e1->c1
Card 2, e1->d2
Card 2, e2->c2
Card 2, e2->d3
Card 2, e3->c3
Card 2, e3->d4
Card 2, e4->c4
Card 2, d5->b5
```

### Sample 6b
```
>> game
Input the test case number: 4
Number of turns left: 10
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ...x.
  +---+---+---+---+---+    .....    ..o..    Side card
b |   |   |   | b |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    ..o..   v
c |   | W | a |   |   |                      .....   v
  +---+---+---+---+---+    .....    ..x..    .x...   v
d |   | a | a |   |   |    .x.x.    .....    .....
  +---+---+---+---+---+    .xo..    ..o..
e |   |   | A |   |   |    .....    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 0
Card 1, a1->c1
Card 1, a4->a3
Card 1, a4->c4
Card 1, b4->b3
Card 1, b4->d4
Card 1, a5->c5
Card 2, a4->b3
Card 2, b4->c3
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: b4
Input the position you want to move the selected pawn: c3
Player B, you capture opponent's soldier. The soldier is removed from the board.
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c |   | W | b |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    ..x..    .x...   v
d |   | a | a |   |   |    .x.x.    .....    .....
  +---+---+---+---+---+    .xo..    ..o..
e |   |   | A |   |   |    .....    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    ...x.   ^
c |   | b | W |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   | a | a |   |   |    .x.x.    .....    .....
  +---+---+---+---+---+    .xo..    ..o..
e |   |   | A |   |   |    .....    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 0
Card 1, d2->c1
Card 1, d2->d1
Card 1, d3->c2
Card 1, d3->c4
Card 1, e3->e2
Card 1, e3->d4
Card 2, d2->b2
Card 2, d2->e2
Card 2, d3->b3
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: d3
Input the position you want to move the selected pawn: c2
Player A, you capture opponent's soldier. The soldier is removed from the board.
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c |   | a | W |   |   |                      .xo..   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d |   | a |   |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 8
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    .....   v
c |   | a | W |   |   |                      ..ox.   v
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
d |   | a |   |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 
```
