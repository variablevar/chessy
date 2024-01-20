import 'package:chessy/app/modules/board/pieces/piece.dart';

class BishopPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  BishopPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.bishop,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    return [
      ...position.baseCondition(
          board, Operation.increment, Operation.decrement),
      ...position.baseCondition(
          board, Operation.decrement, Operation.increment),
      ...position.baseCondition(
          board, Operation.increment, Operation.increment),
      ...position.baseCondition(
          board, Operation.decrement, Operation.decrement),
    ];
  }
}
