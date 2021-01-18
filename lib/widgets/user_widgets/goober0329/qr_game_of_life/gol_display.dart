import 'package:flutter/material.dart';

import 'package:flutter_buddies/widgets/user_widgets/goober0329/qr_game_of_life/game_of_life_model.dart';

class GoLDisplay extends StatelessWidget {
  final GameOfLife gol;
  final double cellSize;
  final bool displayAge;
  final Color color;
  final double cornerRadiusRatio;
  GoLDisplay({
    @required this.gol,
    @required this.cellSize,
    this.displayAge = false,
    this.color = Colors.black,
    this.cornerRadiusRatio = 0,
  });

  @override
  Widget build(BuildContext context) {
    return buildGoLGrid();
  }

  /// function to build the GoL grid
  Widget buildGoLGrid() {
    List<Row> rows = [];
    for (int i = 0; i < gol.cells.length; i++) {
      List<Widget> row = [];
      for (int j = 0; j < gol.cells[0].length; j++) {
        row.add(buildGoLCell(i, j));
      }
      rows.add(Row(
        children: row,
        mainAxisSize: MainAxisSize.min,
      ));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }

  /// function to build individual GoL cells
  Widget buildGoLCell(int i, int j) {
    if (gol.cells[i][j].current) {
      return Container(
        width: cellSize,
        height: cellSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cornerRadiusRatio * cellSize),
        ),
      );
    } else {
      if (displayAge) {
        return Container(
          width: cellSize,
          height: cellSize,
          decoration: BoxDecoration(
            color: Color.lerp(
              color,
              Colors.white.withOpacity(0.0),
              gol.cells[i][j].age / gol.numAgeSteps,
            ),
            borderRadius: BorderRadius.circular(cornerRadiusRatio * cellSize),
          ),
        );
      } else {
        return Container(
          width: cellSize,
          height: cellSize,
        );
      }
    }
  }
}
