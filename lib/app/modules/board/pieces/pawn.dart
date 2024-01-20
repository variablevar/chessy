import 'package:chessy/app/modules/board/pieces/piece.dart';

class PawnPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  PawnPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.pawn,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    if (pieceColor == PieceColor.white) {
      if (position.row == 2) {
        return [
          PieceOffset(row: position.row + 1, col: position.col),
          PieceOffset(row: position.row + 2, col: position.col)
        ];
      } else {
        return [
          PieceOffset(row: position.row + 1, col: position.col),
        ];
      }
    } else {
      if (position.row == 7) {
        return [
          PieceOffset(row: position.row - 1, col: position.col),
          PieceOffset(row: position.row - 2, col: position.col)
        ];
      } else {
        return [
          PieceOffset(row: position.row - 1, col: position.col),
        ];
      }
    }
  }
}
