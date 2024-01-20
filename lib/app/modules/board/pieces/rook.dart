import 'package:chessy/app/modules/board/pieces/piece.dart';

class RookPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  RookPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.rook,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    return [
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row + i,
          col: position.col,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row,
          col: position.col + i,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row - i,
          col: position.col,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row,
          col: position.col - i,
        ),
      ),
    ];
  }
}
