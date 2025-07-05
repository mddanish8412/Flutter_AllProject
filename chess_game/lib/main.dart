import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';  // For chessboard logic

void main() {
  runApp(ChessApp());
}

class ChessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Game',
      theme: ThemeData.dark(),
      home: ChessGame(),
    );
  }
}

class ChessGame extends StatefulWidget {
  @override
  _ChessGameState createState() => _ChessGameState();
}

class _ChessGameState extends State<ChessGame> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChessBoard(
              controller: controller,
              boardColor: BoardColor.brown,
              boardOrientation: PlayerColor.white,
              enableUserMoves: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.resetBoard();
                  },
                  child: Text('Reset Game'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.undoMove();
                  },
                  child: Text('Undo Move'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class AnimatedChessPiece extends StatelessWidget {
  final Widget piece;
  final Offset start;
  final Offset end;
  final Duration duration;

  AnimatedChessPiece({required this.piece, required this.start, required this.end, required this.duration});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: end.dy,
      left: end.dx,
      child: piece,
    );
  }
}
void makeAIMove() {
  // You could call Stockfish engine or any AI here
  // Example move: e2 to e4
  var controller;
  controller.makeMove('e2', 'e4');
}
void makeMoveOnline(String from, String to) {
  // Use Firestore or Realtime Database to update the state of the game
  FirebaseFirestore.instance
      .collection('games')
      .doc('gameId')
      .update({
    'lastMove': {'from': from, 'to': to},
  });
}







