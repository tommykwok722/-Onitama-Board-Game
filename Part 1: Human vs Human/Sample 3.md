## Sample 3: Movement of Pawns and the Wall
This sample tests the movements of the pawns and the wall.
1. You have to pick a position with your pawn on it.
2. You must move your pawn according to the movement card you picked.
3. You cannot move your pawn to a position that is occupied your own pawn or by the wall.

```
>> game
Input the test case number: 3
Number of turns left: 50
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   |   |   |    ..x..    .x.x.    ..x..
  +---+---+---+---+---+    .....    .....    ...x.   ^
c |   |   |   | a |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    .....   ^
d |   | b |   | A |   |    .x...    ..x..    .....
  +---+---+---+---+---+    .xo.x    ..ox.
e | B |   |   | W | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: e3
You have no pawn at e3.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: d2
You have no pawn at d2.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: e4
You have no pawn at e4.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: c4
Input the position you want to move the selected pawn: b4
Not a valid move by card 1.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d4
Input the position you want to move the selected pawn: d3
Not a valid move by card 2.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c4
Input the position you want to move the selected pawn: d4
Not a valid move by card 2.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: e4
You have no pawn at e4.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: e5
Input the position you want to move the selected pawn: d4
Your pawn cannot move there. The position is occupied by your own pawn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d4
Input the position you want to move the selected pawn: c4
Your pawn cannot move there. The position is occupied by your own pawn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: e5
Input the position you want to move the selected pawn: e4
Your pawn cannot move there. The position is occupied by the wall.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: d4
Input the position you want to move the selected pawn: e4
Not a valid move by card 1.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c4
Input the position you want to move the selected pawn: b4
```
<br>
<br>

1. You cannot move the wall out of bound.
2. You cannot move the wall occupied by the general.
3. You cannot move the wall to the military base.
4. You can move the wall to a position occupied by your own soldier and swap with it.
```
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   | a |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c |   |   |   |   |   |                      ..ox.   ^
  +---+---+---+---+---+    .....    ..x..    .....   ^
d |   | b |   | A |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | B |   |   | W | a |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): u
You cannot move the wall there. It is occupied by your general.
u(up), l(left), d(down), r(right), s(stay): l
You cannot move the wall to a military base.
u(up), l(left), d(down), r(right), s(stay): d
You cannot move the wall out of bound.
u(up), l(left), d(down), r(right), s(stay): r
```
<br>
<br>

1. Soldier can move to the military bases, but this is not a winning method.
2. The wall cannot be moved to a position occupied by your opponent.
```
Number of turns left: 49
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    ...x.
  +---+---+---+---+---+    ..o..    ..o..    Side card
b |   |   |   | a |   |    ..x..    .x.x.    .....
  +---+---+---+---+---+    .....    .....    .....   v
c |   |   |   |   |   |                      .xo..   v
  +---+---+---+---+---+    .....    ..x..    ..x..   v
d |   | b |   | A |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | B |   |   | a | W |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d2
Input the position you want to move the selected pawn: e4
Not a valid move by card 2.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d2
Input the position you want to move the selected pawn: e1
Your pawn cannot move there. The position is occupied by your own pawn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d2
Input the position you want to move the selected pawn: e3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    .....
  +---+---+---+---+---+    ..o..    .xo..    Side card
b |   |   |   | a |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c |   |   |   |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    ..x..    .x.x.   v
d |   |   |   | A |   |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | B |   | b | a | W |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): l
You cannot move the wall there. It is occupied by your opponent.
u(up), l(left), d(down), r(right), s(stay): r
You cannot move the wall out of bound.
u(up), l(left), d(down), r(right), s(stay): d
You cannot move the wall out of bound.
u(up), l(left), d(down), r(right), s(stay): u

Number of turns left: 48
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   |   |   |   |   |    ...x.    .....
  +---+---+---+---+---+    ..o..    .xo..    Side card
b |   |   |   | a |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .....    .....    .x.x.   ^
c |   |   |   |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    ..x..    .x...   ^
d |   |   |   | A | W |    .x...    ...x.    .....
  +---+---+---+---+---+    .xo.x    ..o..
e | B |   | b | a |   |    .....    .....
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 
```
