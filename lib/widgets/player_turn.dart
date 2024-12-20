import 'package:flutter/material.dart';

class PlayerTurn extends StatelessWidget {
  final bool xTurn;
  final bool gameOver;

  const PlayerTurn({
    super.key,
    required this.xTurn,
    required this.gameOver,
  });

  @override
  Widget build(BuildContext context) {
    if (gameOver) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Player ${xTurn ? 'X' : 'O'}'s Turn",
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 