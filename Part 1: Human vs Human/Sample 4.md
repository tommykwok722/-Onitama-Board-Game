## Sample 4: Capturing
This sample shows how to capture your opponent’s pawn. <br>
If your pawn moves on your opponent’s soldier. Your opponent’s pawn will be removed from the board.

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
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    ...x.   ^
c |   | W | b |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   | a | a |   |   |    .x.x.    .....    .....
  +---+---+---+---+---+    .xo..    ..o..
e |   |   | A |   |   |    .....    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: d2
Input the position you want to move the selected pawn: c3
Player A, you capture opponent's soldier. The soldier is removed from the board.
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B | b |    .xo..    ..o..
  +---+---+---+---+---+    .....    .....    Side card
b |   |   |   |   |   |    ..x..    .x...    .....
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c |   | W | a |   |   |                      .xo..   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d |   |   | a |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r

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
d |   |   | a |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: a5
Input the position you want to move the selected pawn: c4
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B |   |    .xo..    .....
  +---+---+---+---+---+    .....    ..ox.    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..o..   v
c |   | a | W | b |   |                      .....   v
  +---+---+---+---+---+    .....    ..x..    .x...   v
d |   |   | a |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): l
You cannot move the wall there. It is occupied by your opponent.
u(up), l(left), d(down), r(right), s(stay): r

Number of turns left: 7
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B |   |    .xo..    .....
  +---+---+---+---+---+    .....    ..ox.    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ...x.   ^
c |   | a | b | W |   |                      .....   ^
  +---+---+---+---+---+    .....    ..x..    ..o..   ^
d |   |   | a |   |   |    ...x.    .....    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   |   | A |   |   |    .x...    ..x..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: e3
Input the position you want to move the selected pawn: c3
Player A, you capture opponent's soldier. The soldier is removed from the board.
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B |   |    .xo..    .....
  +---+---+---+---+---+    .....    ..ox.    Side card
b |   |   |   |   |   |    ..x..    .x.x.    ..x..
  +---+---+---+---+---+    .....    .....    .....   ^
c |   | a | A | W |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    ..x..   ^
d |   |   | a |   |   |    ...x.    ...x.    .....
  +---+---+---+---+---+    ..o..    .....
e |   |   |   |   |   |    .x...    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 6
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b |   |   | B |   |    .xo..    .....
  +---+---+---+---+---+    .....    ..ox.    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   v
c |   | a | A | W |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    .....   v
d |   |   | a |   |   |    ...x.    ...x.    ..x..
  +---+---+---+---+---+    ..o..    .....
e |   |   |   |   |   |    .x...    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: a1
Input the position you want to move the selected pawn: b2
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   | B |   |    .xo..    ..x..
  +---+---+---+---+---+    .....    ..o..    Side card
b |   | b |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    ..x..    .....   v
c |   | a | A | W |   |                      ..ox.   v
  +---+---+---+---+---+    .....    .....    .x.x.   v
d |   |   | a |   |   |    ...x.    ...x.    .....
  +---+---+---+---+---+    ..o..    .....
e |   |   |   |   |   |    .x...    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r

Number of turns left: 5
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   | B |   |    .xo..    ..x..
  +---+---+---+---+---+    .....    ..o..    Side card
b |   | b |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    ..x..    .x.x.   ^
c |   | a | A |   | W |                      .xo..   ^
  +---+---+---+---+---+    .....    .....    .....   ^
d |   |   | a |   |   |    ...x.    ...x.    .....
  +---+---+---+---+---+    ..o..    .....
e |   |   |   |   |   |    .x...    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c3
Input the position you want to move the selected pawn: a4
Player A, you capture opponent's general. You win.
```
