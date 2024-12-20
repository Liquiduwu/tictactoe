import 'package:flutter/material.dart';
import '../widgets/game_board.dart';
import '../widgets/player_turn.dart';
import '../widgets/game_status.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String winner = '';
  bool gameOver = false;

  void _handleTap(int index) {
    if (board[index].isNotEmpty || gameOver) return;

    setState(() {
      board[index] = xTurn ? 'X' : 'O';
      xTurn = !xTurn;
      _checkWinner();
    });
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      xTurn = true;
      winner = '';
      gameOver = false;
    });
  }

  void _checkWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        winner = board[i];
        gameOver = true;
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        winner = board[i];
        gameOver = true;
        return;
      }
    }

    // Check diagonals
    if (board[0].isNotEmpty && board[0] == board[4] && board[0] == board[8]) {
      winner = board[0];
      gameOver = true;
      return;
    }
    if (board[2].isNotEmpty && board[2] == board[4] && board[2] == board[6]) {
      winner = board[2];
      gameOver = true;
      return;
    }

    // Check for draw
    if (!board.contains('')) {
      winner = 'Draw';
      gameOver = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayerTurn(xTurn: xTurn, gameOver: gameOver),
            const SizedBox(height: 20),
            GameBoard(board: board, onTap: _handleTap),
            const SizedBox(height: 20),
            GameStatus(winner: winner),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetGame,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Game'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 