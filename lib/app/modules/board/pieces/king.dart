import 'package:chessy/app/modules/board/pieces/piece.dart';

class KingPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  KingPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.king,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    return [
      PieceOffset(row: position.row, col: position.col + 1),
      PieceOffset(row: position.row, col: position.col - 1),
      PieceOffset(row: position.row + 1, col: position.col),
      PieceOffset(row: position.row - 1, col: position.col),
      PieceOffset(row: position.row + 1, col: position.col + 1),
      PieceOffset(row: position.row - 1, col: position.col - 1),
      PieceOffset(row: position.row + 1, col: position.col - 1),
      PieceOffset(row: position.row - 1, col: position.col + 1),
    ];
  }
}
