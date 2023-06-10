## Sample 5: No movement or Tie
This sample shows the case when there is no movement and also shows the game is a tie when there is no more turn left.
1. When there is no valid move. The player simply picks a card and swaps the chosen card with the side card. No need to move any pawns.
2. When there is no more turn left. The game is tied.

```
>> game
Input the test case number: 5
Number of turns left: 3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | B |   |   |   |    .x.x.    .x.x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .....   v
c |   | W |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    .x.x.   v
d | a |   |   |   |   |    .xx..    .x...    ..x..
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x...
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: a2
Input the position you want to move the selected pawn: b1
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .....
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | B |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
c |   | W |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    .x.x.   v
d | a |   |   |   |   |    .xx..    .x...    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x...
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): l

Number of turns left: 2
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .....
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | B |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    ..x..    .x.x.   ^
c | W |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .x.x.   ^
d | a |   |   |   |   |    .xx..    .x...    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x...
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
There is no valid move.
Simply pick a card you want to swap with the side card (1 or 2): 2
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .....
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | B |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    ..x..    .x...   ^
c | W |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .x...   ^
d | a |   |   |   |   |    .xx..    .x.x.    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x.x.
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): u
You cannot move the wall there. It is occupied by your opponent.
u(up), l(left), d(down), r(right), s(stay): d

Number of turns left: 1
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    .x.x.    .....
  +---+---+---+---+---+    ..o..    ..o..    Side card
b | B |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    ..x..    ...x.   v
c | a |   |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    ...x.   v
d | W |   |   |   |   |    .xx..    .x.x.    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x.x.
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: b1
Input the position you want to move the selected pawn: c1
Player B, you capture opponent's soldier. The soldier is removed from the board.
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    .....
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ...x.    .x.x.    .....
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
c | B |   |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    ..x..   v
d | W |   |   |   |   |    .xx..    .x.x.    .....
  +---+---+---+---+---+    .xo..    ..o..
e | A |   |   |   |   |    .....    .x.x.
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): s

This is the last turn. The game is tied.
```
