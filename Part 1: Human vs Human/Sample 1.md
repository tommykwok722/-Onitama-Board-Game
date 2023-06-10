
## Sample Output 1: Basic
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
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: e1
Input the position you want to move the selected pawn: d1
```

1. Show the board.
2. Show the cards. Note that the cards for player B are rotated 180 degrees as the are viewed by player B.
3. Show the side card. There are arrow symbols to indicate the direction of the side cards.
4. Show the number of turns left.
5. The program prompts player A to pick a card. **(Assume the user input correct format, i.e. 0, 1 or 2)**
6. Input the position of your pawn and where you want to move the pawn. **(Assume the user input correct format)**
<br>
<br>

```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b | B | b | b |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c | W |   |   |   |   |                      ..ox.   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d | a |   |   |   |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e |   | a | A | a | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): d

Number of turns left: 49
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a | b | b | B | b | b |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .....   v
c | a |   |   |   |   |                      .xo..   v
  +---+---+---+---+---+    .....    ..x..    ..x..   v
d | W |   |   |   |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e |   | a | A | a | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: a1
Input the position you want to move the selected pawn: b1
```

1. Move the pawn from e1 to d1. Swap the card you just used with the side card.
2. The program then prompts the current player to pick a direction to move W. <br> **(Assume the user input the correct format, i.e. u, l, d, r or s)**
3. W is moved according to the direction.
4. The number of turns left is then reduced by 1.
5. The next turn will be played by player B.
6. The side card is rotated 180 degrees. The arrow is reversed to indicate the direction.
7. Player B’s turn now. He follows the same procedure. Pick a movement card and choose the movement of the W.
<br>
<br>

```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b | b |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c | a |   |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    ..x..    ..x..   v
d | W |   |   |   |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e |   | a | A | a | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): u
You cannot move the wall there. It is occupied by your opponent.
u(up), l(left), d(down), r(right), s(stay): l
You cannot move the wall out of bound.
u(up), l(left), d(down), r(right), s(stay): r
```

1. Player B chose the movement direction of W.
2. W cannot be moved to a position occupied by the opponent or out of bound.
<br>
<br>

Belows are the rest of the game till the general is captured.
```
Number of turns left: 48
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b | b |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c | a |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   | W |   |   |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e |   | a | A | a | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: c1
Input the position you want to move the selected pawn: c3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b | b |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .x...   ^
c |   |   | a |   |   |                      .xo.x   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d |   | W |   |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   | a | A | a | a |    .x...    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 47
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B | b | b |    .....    ...x.
  +---+---+---+---+---+    .xo..    ..o..    Side card
b | b |   |   |   |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .....   v
c |   |   | a |   |   |                      x.ox.   v
  +---+---+---+---+---+    .....    ..x..    ...x.   v
d |   | W |   |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   | a | A | a | a |    .x...    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: a4
Input the position you want to move the selected pawn: b3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B |   | b |    .....    .....
  +---+---+---+---+---+    .xo..    x.ox.    Side card
b | b |   | b |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c |   |   | a |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
d |   | W |   |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   | a | A | a | a |    .x...    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): u

Number of turns left: 46
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | b | B |   | b |    .....    .....
  +---+---+---+---+---+    .xo..    x.ox.    Side card
b | b |   | b |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c |   | W | a |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   |   |   |   |   |    ..x..    ...x.    .....
  +---+---+---+---+---+    ..o..    ..o..
e |   | a | A | a | a |    .x...    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c3
Input the position you want to move the selected pawn: a3
Player A, you capture opponent's general. You win.
```

1. Finally a pawn moves to the position occupied by opponent’s general and hence captures the general.
This is one of the winning conditions. The game ends.
