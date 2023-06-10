## Sample 2: Winning Conditions

### Sample 2a
1. W cannot be moved to a military base or out of bound.
2. Player A captures player B’s general.
```
>> game
Input the test case number: 2
Number of turns left: 10
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | W |   |   | b |    ..x..    ...x.
  +---+---+---+---+---+    ..o..    ..ox.    Side card
b |   | B |   |   |   |    ..x..    .x...    ..x..
  +---+---+---+---+---+    .....    .....    x....   v
c |   |   | A |   |   |                      ...o.   v
  +---+---+---+---+---+    .....    .....    .....   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: b2
Input the position you want to move the selected pawn: c1
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    ..x..
a |   | W |   |   | b |    ..x..    x....
  +---+---+---+---+---+    ..o..    ...o.    Side card
b |   |   |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c | B |   | A |   |   |                      ..ox.   v
  +---+---+---+---+---+    .....    .....    .x...   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r
You cannot move the wall to a military base.
u(up), l(left), d(down), r(right), s(stay): u
You cannot move the wall out of bound.
u(up), l(left), d(down), r(right), s(stay): d

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    ..x..
a |   |   |   |   | b |    ..x..    x....
  +---+---+---+---+---+    ..o..    ...o.    Side card
b |   | W |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    .....    ...x.   ^
c | B |   | A |   |   |                      .xo..   ^
  +---+---+---+---+---+    .....    .....    .x...   ^
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: d2
Input the position you want to move the selected pawn: c1
Player A, you capture opponent's general. You win.
```

### Sample 2b
Player A captures Player B’s general.
```
>> game
Input the test case number: 2
Number of turns left: 10
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | W |   |   | b |    ..x..    ...x.
  +---+---+---+---+---+    ..o..    ..ox.    Side card
b |   | B |   |   |   |    ..x..    .x...    ..x..
  +---+---+---+---+---+    .....    .....    x....   v
c |   |   | A |   |   |                      ...o.   v
  +---+---+---+---+---+    .....    .....    .....   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: b2
Input the position you want to move the selected pawn: c2
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    ..x..    .....
a |   | W |   |   | b |    x....    ...x.
  +---+---+---+---+---+    ...o.    ..ox.    Side card
b |   |   |   |   |   |    .....    .x...    .....
  +---+---+---+---+---+    .....    .....    ..x..   v
c |   | B | A |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    ..x..   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): l

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    ..x..    .....
a | W |   |   |   | b |    x....    ...x.
  +---+---+---+---+---+    ...o.    ..ox.    Side card
b |   |   |   |   |   |    .....    .x...    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c |   | B | A |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    ..x..   ^
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: c3
Input the position you want to move the selected pawn: c2
Player A, you capture opponent's general. You win.
```

### Sample 2c
Player A’s general reaches Player B’s military base.
```
>> game
Input the test case number: 2
Number of turns left: 10
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | W |   |   | b |    ..x..    ...x.
  +---+---+---+---+---+    ..o..    ..ox.    Side card
b |   | B |   |   |   |    ..x..    .x...    ..x..
  +---+---+---+---+---+    .....    .....    x....   v
c |   |   | A |   |   |                      ...o.   v
  +---+---+---+---+---+    .....    .....    .....   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 1
Input the position of your pawn you want to move: b2
Input the position you want to move the selected pawn: c2
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    ..x..    .....
a |   | W |   |   | b |    x....    ...x.
  +---+---+---+---+---+    ...o.    ..ox.    Side card
b |   |   |   |   |   |    .....    .x...    .....
  +---+---+---+---+---+    .....    .....    ..x..   v
c |   | B | A |   |   |                      ..o..   v
  +---+---+---+---+---+    .....    .....    ..x..   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    ..x..    .....
a |   | W |   |   | b |    x....    ...x.
  +---+---+---+---+---+    ...o.    ..ox.    Side card
b |   |   |   |   |   |    .....    .x...    .....
  +---+---+---+---+---+    .....    .....    ..x..   ^
c |   | B | A |   |   |                      ..o..   ^
  +---+---+---+---+---+    .....    .....    ..x..   ^
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c3
Input the position you want to move the selected pawn: a3
Player A, your general reaches opponent's military base. You win.
```

### Sample 2d
If your general captures opponent’s general and reaches the base at the same time, reaching military bases message is displayed.
```
>> game
Input the test case number: 2
Number of turns left: 10
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    .....
a |   | W |   |   | b |    ..x..    ...x.
  +---+---+---+---+---+    ..o..    ..ox.    Side card
b |   | B |   |   |   |    ..x..    .x...    ..x..
  +---+---+---+---+---+    .....    .....    x....   v
c |   |   | A |   |   |                      ...o.   v
  +---+---+---+---+---+    .....    .....    .....   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: b2
Input the position you want to move the selected pawn: a3
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    ..x..
a |   | W | B |   | b |    ..x..    x....
  +---+---+---+---+---+    ..o..    ...o.    Side card
b |   |   |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    .....    ...x.   v
c |   |   | A |   |   |                      ..ox.   v
  +---+---+---+---+---+    .....    .....    .x...   v
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player B, choose the movement of W.
u(up), l(left), d(down), r(right), s(stay): r
You cannot move the wall to a military base.
u(up), l(left), d(down), r(right), s(stay): s

Number of turns left: 9
                        Player B
                          Card 1   Card 2
  +---+---+---+---+---+    .....    ..x..
a |   | W | B |   | b |    ..x..    x....
  +---+---+---+---+---+    ..o..    ...o.    Side card
b |   |   |   |   |   |    ..x..    .....    .....
  +---+---+---+---+---+    .....    .....    ...x.   ^
c |   |   | A |   |   |                      .xo..   ^
  +---+---+---+---+---+    .....    .....    .x...   ^
d |   | a |   |   |   |    ..x..    ..x..    .....
  +---+---+---+---+---+    .xox.    .x.x.
e |   |   |   |   |   |    .....    ..o..
  +---+---+---+---+---+    .....    .....
    1   2   3   4   5     Card 1   Card 2
                        Player A
Player A, it is your turn.
Pick a card (1 or 2) or enter 0 to list all moves: 2
Input the position of your pawn you want to move: c3
Input the position you want to move the selected pawn: a3
Player A, your general reaches opponent's military base. You win.
```
