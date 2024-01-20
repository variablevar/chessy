import 'package:chessy/app/modules/board/pieces/piece.dart';

class QueenPiece extends Piece {
  @override
  PieceColor pieceColor;

  @override
  QueenPiece({
    required this.pieceColor,
  }) : super(
          pieceColor: pieceColor,
          pieceType: PieceType.queen,
        );

  @override
  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board) {
    return [
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row + i,
          col: position.col + i,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row - i,
          col: position.col - i,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row - i,
          col: position.col + i,
        ),
      ),
      ...List.generate(
        8,
        (i) => PieceOffset(
          row: position.row + i,
          col: position.col - i,
        ),
      ),
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
