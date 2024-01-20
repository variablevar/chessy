import 'package:chessy/app/modules/board/pieces/piece.dart';

class KnightPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  KnightPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.knight,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    return [
      PieceOffset(row: position.row - 2, col: position.col + 1),
      PieceOffset(row: position.row - 2, col: position.col - 1),
      PieceOffset(row: position.row + 2, col: position.col + 1),
      PieceOffset(row: position.row + 2, col: position.col - 1),
      PieceOffset(row: position.row - 1, col: position.col + 2),
      PieceOffset(row: position.row - 1, col: position.col - 2),
      PieceOffset(row: position.row + 1, col: position.col + 2),
      PieceOffset(row: position.row + 1, col: position.col - 2),
    ];
  }
}
