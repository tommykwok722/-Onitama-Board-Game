# Onitama Board Game
An Implementation of Board Game by MATLAB.

## Introduction
This project is about writing a game. The game is based on the board game named **Onitama**, with a few rules added to the original Onitama board game.

The game is played by two players, A and B. Each player controls an army of 5 pawns, represented by **A** or **a** (**B** or **b**). In the board, **A** or **B** represent generals, **a** or **b** represent soldiers. The pawns are placed on a 5×5 board. **W** represents a wall. Here is a sample set up of the game.
```
  +---+---+---+---+---+
a | b | b | B | b | b |
  +---+---+---+---+---+
b |   |   |   |   |   |
  +---+---+---+---+---+
c | W |   |   |   |   |
  +---+---+---+---+---+
d |   |   |   |   |   |
  +---+---+---+---+---+
e | a | a | A | a | a |
  +---+---+---+---+---+
    1   2   3   4   5
```

In the program, the board is represented by a 5×5 matrix of characters:
```
board = ['bbBbb'
         '     '
         'W    '
         '     '
         'aaAaa'];
```

Each player take turns on moving his pawn according to movement cards (details will be explained below) and then move the wall one space.
The goal is to
1. Capture opponent’s general or
2. Use your general to occupy opponent’s military base (A’s military base is e3, B’s military base is a3)

## Terminology
1. **Players:** Player A and Player B
2. **Pawn:** A, a, B, b. Letters A and a are player A’s pawns. Letters B and b are player B’s pawns
3. **Wall:** W
4. **General:** A, B. Letter A is player A’s general. Letter B is player B’s general
5. **Soldier:** a, b. Letter a is player A’s soldier. Letter b is player B’s soldier
6. **Military Base:** Player A’s military base is at position e3. Player B’s military base is at position a3

## Goal
The goal is to
1. Capture opponent’s general (**A** or **B**) or
2. Use your general to occupy opponent’s military base (A’s military base is **e3**, B’s military base is **a3**)

## Movement Card
A movement card indicates the movements a pawn can make. It is represented by a 5×5 matrix of characters. Here is a sample of the card.
```
.....
...x.
.xo.x
.....
.....
```

The circle represents your pawn, the cross represents the possible movements. **The circle is not necessarily at position (3,3)**.

The above card indicates your pawn can move
1. 1 space to the left
2. 2 spaces to the right or
3. 1 space to upper right diagonal

The possible movements of a pawn at d2 are d2→d1, d2→c3, and d2→d4. Those positions are marked by X.
For the movement d2→d4, we don’t care if the space d3 is occupied or not.
```
  +---+---+---+---+---+
a |   |   |   |   |   |
  +---+---+---+---+---+
b |   |   |   |   |   |
  +---+---+---+---+---+
c |   |   | X |   |   |
  +---+---+---+---+---+
d | X | a |   | X |   |
  +---+---+---+---+---+
e |   |   |   |   |   |
  +---+---+---+---+---+
    1   2   3   4   5
```

### Movement card from the viewpoint of B
Since player B sits on the opposition side, the card should be rotated 180 degrees.
```
  +---+---+---+---+---+
a |   |   |   |   |   |    same card (view from B)
  +---+---+---+---+---+
b | X |   | b | X |   |    .....
  +---+---+---+---+---+    .....
c |   | X |   |   |   |    x.ox.
  +---+---+---+---+---+    .x...
d |   |   |   |   |   |    .....
  +---+---+---+---+---+
e |   |   |   |   |   |    X are the possible movements of b
  +---+---+---+---+---+
    1   2   3   4   5
```

### Other movement card examples
```
  +---+---+---+---+---+
a |   |   |   |   |   |
  +---+---+---+---+---+
b |   |   | X |   |   |    ..x..
  +---+---+---+---+---+    .....
c |   |   |   |   |   |    ..o..
  +---+---+---+---+---+    .x.x.
d |   |   | a |   |   |    .....
  +---+---+---+---+---+
e |   | X |   | X |   |    X are the possible movements of a
  +---+---+---+---+---+
    1   2   3   4   5
```

```
  +---+---+---+---+---+
a |   |   |   |   |   |
  +---+---+---+---+---+
b |   |   |   |   |   |    .....
  +---+---+---+---+---+    .x...
c | X |   |   |   |   |    ..ox.
  +---+---+---+---+---+    .....
d |   | a | X |   |   |    .....
  +---+---+---+---+---+
e |   |   |   |   |   |    X are the possible movements of a
  +---+---+---+---+---+
    1   2   3   4   5

```

## Movement rules of the pawn
1. The pawn moves according to the movement card.
2. The pawn cannot move out of boundary.
3. The pawn cannot move to a space occupied by his own pawn.
4. The pawn cannot move to a space occupied by W.
5. The pawn **CAN** move to a space occupied by opponent’s pawn. If the pawn captures the opponent’s pawn, the opponent’s pawn is then removed from the board.

## Movement rules of the wall (W)
1. After the movement of the pawn, the player can move W.
2. The player can move W one space up, right, down, left. He can also choose not to move W.
3. The player cannot move W out of bound.
4. The player cannot move W to a space occupied by his opponent.
5. The player cannot move W to a space occupied by his own general.
6. The player cannot move W to a military base (position a3 or e3).
7. The player **CAN** move to a space occupied by his soldier. In this case, W swaps the position with the solider.

## Game Setup
There are 5 moving cards. For each game, there will be different movement cards. For example,
```
.....     .....     .....     .....     ..x..
.x...     ..x..     ..x..     .x.x.     ...x.
.xo.x     ..ox.     ..o..     ..o..     ..o..
.....     .....     .x...     .x...     .....
.....     .....     .....     .....     .....
```

The first two cards are player A’s cards. The next two cards are player B’s cards. The last card is a side card.
The set up of the board is as following. **(Note that Card 3 and Card 4 are rotated 180 degrees as they are viewed by Player B’s side)**.
The arrow at the side card indicates the direction of the side card.
```
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
```
## How to play the game
