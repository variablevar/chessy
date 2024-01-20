import 'package:chessy/app/constants/image.dart';
import 'package:flutter/material.dart';

export 'bishop.dart';
export 'king.dart';
export 'knight.dart';
export 'pawn.dart';
export 'queen.dart';
export 'rook.dart';

enum PieceColor { black, white }

enum PieceType { king, queen, bishop, knight, rook, pawn }

enum Operation { increment, decrement, none }

class PieceOffset {
  PieceOffset({required this.row, required this.col, this.piece});
  Piece? piece;
  int row;
  int col;

  bool isPiecePlaced() {
    return piece != null ? true : false;
  }

  PieceType? getPieceType() {
    if (isPiecePlaced()) {
      return piece!.pieceType;
    }

    return null;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '($row , $col)';
  }

  List<PieceOffset> baseCondition(
    List<List<PieceOffset>> board,
    Operation row,
    Operation col,
  ) {
    int i = 1;
    List<PieceOffset> pieces = [];
    int r = this.row;
    int c = this.col;
    while (r >= 0 && r <= 8 && c >= 0 && c <= 8) {
      r = row == Operation.increment
          ? this.row + i
          : row == Operation.decrement
              ? this.row - i
              : this.row;
      c = col == Operation.increment
          ? this.col + i
          : col == Operation.decrement
              ? this.col - i
              : this.col;
      pieces.add(
        PieceOffset(
          row: r,
          col: c,
        ),
      );

      i++;
    }

    List<PieceOffset> filter = [];

    for (PieceOffset piece in pieces) {
      if (piece.row > 0 &&
          piece.row <= 8 &&
          piece.col > 0 &&
          piece.col <= 8 &&
          board[8 - piece.row][piece.col - 1].isPiecePlaced()) {
        return filter;
      }
      filter.add(piece);
    }

    return pieces;
  }
}

abstract class Piece {
  Piece({required this.pieceColor, required this.pieceType});
  final PieceColor pieceColor;
  final PieceType pieceType;

  ImageProvider getIcon() {
    if (pieceColor == PieceColor.white) {
      switch (pieceType) {
        case PieceType.king:
          return const AssetImage(WHITE_KING);
        case PieceType.queen:
          return const AssetImage(WHITE_QUEEN);
        case PieceType.rook:
          return const AssetImage(WHITE_ROOK);
        case PieceType.bishop:
          return const AssetImage(WHITE_BISHOP);
        case PieceType.knight:
          return const AssetImage(WHITE_KNIGHT);
        default:
          return const AssetImage(WHITE_PAWN);
      }
    } else {
      switch (pieceType) {
        case PieceType.king:
          return const AssetImage(BLACK_KING);
        case PieceType.queen:
          return const AssetImage(BLACK_QUEEN);
        case PieceType.rook:
          return const AssetImage(BLACK_ROOK);
        case PieceType.bishop:
          return const AssetImage(BLACK_BISHOP);
        case PieceType.knight:
          return const AssetImage(BLACK_KNIGHT);
        default:
          return const AssetImage(BLACK_PAWN);
      }
    }
  }

  List<PieceOffset> move(PieceOffset position, List<List<PieceOffset>> board);
}
