import 'package:flutter/material.dart';

class GameStatus extends StatelessWidget {
  final String winner;

  const GameStatus({
    super.key,
    required this.winner,
  });

  @override
  Widget build(BuildContext context) {
    if (winner.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        winner == 'Draw' ? "It's a Draw!" : "Player $winner Wins!",
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 