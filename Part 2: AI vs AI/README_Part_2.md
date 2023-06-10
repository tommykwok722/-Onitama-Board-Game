## Specification

`AI1155126361.m` is the main file to implement an AI for the game.

Given the current player, the board, the cards and the number of turns left. The function tries to pick the best possible move, then returns a move of the current player. The function is
```
[cardPicked, moveFrom, moveTo, wDir] = AI1155126361(currentPlayer, board, ...
cardA1, cardA2, cardB1, cardB2, sideCard, turn)
```
The function returns the following
1. `cardPicked`: 1 or 2. The card you picked.
2. `moveFrom`: 2 characters, the position of the pawn you want to move, e.g. 'e2'.
3. `moveTo`: 2 characters, the position you want to move your pawn, e.g. 'a4'.
4. `wDir`: A character, u, l, d, r, s. The direction to move the wall.
5. If there is no valid move, `moveFrom` and `moveTo` should be 'XX'.

## Sample Output
To determine the AI is good or not, the scripts `AITest1.m`, `AITest2.m` and `AITest3.m` contain data for different test cases to test the AI `AI1155126361.m` on whether the AI can return valid or winning moves. There are 3 samples to test the AI, each sample has different scenarios and different output.

## Design of my AI
It is difficult to design a good AI. The AI program designed by me is obviously not the best and might contain errors. However, it is a good experience and practice for me to understand how computer programs and AI behave based on different conditions and scenarios.

### Functions
1. **Checking and showing all valid moves of the pawns**
   - Valid initial position of the pawns.
   - Valid final position of the pawns.

2. **Analysing valid moves of the pawns**
   - Check whether or not to capture opponent's soldier.
   - Check whether or not to capture opponent's general.
   - Check whether or not to reach opponent's military base.

3. **Checking all possible directions of W for each move**
   - Check whether it is valid or not to move the wall upwards.
   - Check whether it is valid or not to move the wall leftwards.
   - Check whether it is valid or not to move the wall downwards.
   - Check whether it is valid or not to move the wall rightwards.
   - Check whether it is valid or not to not move the wall.

4. **Analysing opponent's moves (check whether the opponent can capture my pawns after my move)**
   - Check whether my initial position will be captured by opponent's pawns after my move.
   - Check whether my final position will be captured by opponent's pawns after my move.
   - Check whether I will lose if I do not move the pawn.
   - Check whether I will lose if I move the pawn.

### How to determine the best move / which pawn should I move
The moves of my pawns are based on the following prioritization.
1. **The best move: Winning the game**
   - Pick the pawn that I will win if I move it.

2. **2nd best move: Avoid losing the game**
   - Pick the pawn that I will lose if I don't move it.

3. **3rd best move**
   - Pick the pawn that if it moves, then I can capture opponent's pawn (soldier).
   - Pick the pawn that if it does not move, then it will be captured by opponent.

4. **4th best move**
   - Pick the pawn that if it moves, then I will be safe and will not lose.

5. **5th best move (not the worst case)**
   - Pick the pawn that if it moves, I will not lose but one of my pawns will be captured by opponent.

6. **Last best move**
   - Pick the pawn that if it moves, I will lose and one of my pawns will be captured by opponent.
