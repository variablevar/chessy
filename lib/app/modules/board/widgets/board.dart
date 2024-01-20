import 'package:chessy/app/constants/colors.dart';
import 'package:chessy/app/modules/board/pieces/piece.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

enum BlockTile { black, white }

class _ChessBoardState extends State<ChessBoard> {
  List<List<Piece?>> pieces = [];
  List<List<PieceOffset>> board = [];
  List<PieceOffset> moves = [];
  PieceOffset? currentOffset;
  PieceColor currentPlayer = PieceColor.white;

  @override
  void initState() {
    pieces = [
      [
        RookPiece(pieceColor: PieceColor.black),
        KnightPiece(pieceColor: PieceColor.black),
        BishopPiece(pieceColor: PieceColor.black),
        QueenPiece(pieceColor: PieceColor.black),
        KingPiece(pieceColor: PieceColor.black),
        BishopPiece(pieceColor: PieceColor.black),
        KnightPiece(pieceColor: PieceColor.black),
        RookPiece(pieceColor: PieceColor.black),
      ],
      List.generate(8, (i) => PawnPiece(pieceColor: PieceColor.black)),
      List.generate(8, (_) => null),
      List.generate(8, (_) => null),
      List.generate(8, (_) => null),
      List.generate(8, (_) => null),
      List.generate(8, (i) => PawnPiece(pieceColor: PieceColor.white)),
      [
        RookPiece(pieceColor: PieceColor.white),
        KnightPiece(pieceColor: PieceColor.white),
        BishopPiece(pieceColor: PieceColor.white),
        QueenPiece(pieceColor: PieceColor.white),
        KingPiece(pieceColor: PieceColor.white),
        BishopPiece(pieceColor: PieceColor.white),
        KnightPiece(pieceColor: PieceColor.white),
        RookPiece(pieceColor: PieceColor.white),
      ],
    ];
    board = List.generate(
      8,
      (row) {
        return List.generate(
          8,
          (col) {
            return PieceOffset(
              row: 8 - row,
              col: col + 1,
              piece: pieces[row][col],
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              8,
              (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    8,
                    (col) {
                      return Tile(
                        blockTile: (row + col) % 2 == 0
                            ? BlockTile.white
                            : BlockTile.black,
                        child: board[row][col].piece != null
                            ? GestureDetector(
                                onTap: () {
                                  if (board[row][col].piece != null) {
                                    setState(
                                      () {
                                        moves = board[row][col]
                                            .piece!
                                            .move(board[row][col], board);

                                        currentOffset = board[row][col];
                                        if (currentPlayer == PieceColor.white) {
                                          currentPlayer = PieceColor.black;
                                        } else {
                                          currentPlayer = PieceColor.white;
                                        }
                                      },
                                    );
                                  }
                                },
                                child: Image(
                                  image: board[row][col].piece!.getIcon(),
                                ),
                              )
                            : null,
                      );
                    },
                  ).toList(),
                );
              },
            ).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              8,
              (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    8,
                    (col) {
                      return SizedBox(
                        height: 48,
                        width: 48,
                        child: Builder(
                          builder: (context) {
                            List<PieceOffset> filter = moves.where(
                              (element) {
                                return 8 - element.row == row &&
                                    element.col - 1 == col;
                              },
                            ).toList();
                            if (filter.isNotEmpty) {
                              return GestureDetector(
                                onTap: () {
                                  board[8 - filter.first.row]
                                          [filter.first.col - 1]
                                      .piece = board[8 - currentOffset!.row]
                                          [currentOffset!.col - 1]
                                      .piece;
                                  board[8 - currentOffset!.row]
                                          [currentOffset!.col - 1]
                                      .piece = null;
                                  moves.clear();
                                  setState(
                                    () {},
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(12.5),
                                  child: CircleAvatar(),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.blockTile, this.child});
  final BlockTile blockTile;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      color:
          blockTile == BlockTile.black ? PRIMARY_COLOR.shade200 : WHITE_COLOR,
      child: child,
    );
  }
}
