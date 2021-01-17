import 'dart:math';

import 'package:flutter/material.dart';

/*
 1. Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 2. Any live cell with two or three live neighbors lives on to the next generation.
 3. Any live cell with more than three live neighbors dies, as if by overcrowding.
 4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 */

class Cell {
  bool first, previous, current;
  int age;
  Cell({
    this.first = false,
    this.previous = false,
    this.current = false,
    this.age = 0,
  });
}

class GameOfLife extends ChangeNotifier {
  double _prob;
  int _numRow, _numCol;
  List<List<Cell>> _cells;
  bool _periodicEdges;

  final int numAgeSteps = 4;

  GameOfLife({
    sizeX = 40,
    sizeY = 40,
    prob = 0.15,
    periodicEdges = false,
  }) {
    _numRow = sizeY;
    _numCol = sizeX;
    _prob = prob;
    _periodicEdges = periodicEdges;

    // instantiate the grids
    _cells = []..length = _numRow;
    for (int i = 0; i < _numRow; i++) {
      _cells[i] = []..length = _numCol;
      for (int j = 0; j < _numCol; j++) {
        _cells[i][j] = Cell();
        if (_prob != 0) {
          double rand = Random().nextDouble();
          _cells[i][j].current = rand <= _prob;
          _cells[i][j].age = rand <= _prob ? 0 : numAgeSteps;
        } else {
          _cells[i][j].current = false;
          _cells[i][j].age = numAgeSteps;
        }
        _cells[i][j].first = _cells[i][j].current;
      }
    }
  }

  /// getters
  List<List<Cell>> get cells => _cells;
  int get width => _numCol;
  int get height => _numRow;
  bool get isPeriodic => _periodicEdges;

  /// function to set the periodicity of the gol model
  void setGridWrapping(bool wrap) {
    _periodicEdges = wrap;
  }

  /// change the size of the gol grid.
  /// any previous grid data is centered when the size is changed.
  void setGridSize(int w, int h) {
    // save the old grids
    List<List<Cell>> oldCells = []..length = _numRow;
    for (int i = 0; i < _numRow; i++) {
      oldCells[i] = []..length = _numCol;
      for (int j = 0; j < _numCol; j++) {
        oldCells[i][j] = _cells[i][j];
      }
    }

    // resize the class grids
    _numRow = h;
    _numCol = w;
    _cells = []..length = _numRow;
    for (int i = 0; i < _numRow; i++) {
      _cells[i] = []..length = _numCol;
      for (int j = 0; j < _numCol; j++) {
        _cells[i][j] = Cell(
          current: false,
          previous: false,
          first: false,
          age: numAgeSteps,
        );
      }
    }

    // place the old grid pattern onto the resized grids
    // I want to place the previous pattern with periodic edges off
    // otherwise it wouldn't scale correctly.
    bool periodic = _periodicEdges;
    _periodicEdges = false;
    placePattern(
      patternCell: oldCells,
      x: _numCol ~/ 2,
      y: _numRow ~/ 2,
      centered: true,
    );
    _periodicEdges = periodic;

    notifyListeners();
  }

  /// function to clear the grid completely
  void clearGrid() {
    for (int i = 0; i < _numRow; i++) {
      for (int j = 0; j < _numCol; j++) {
        _cells[i][j].current = false;
        _cells[i][j].first = false;
        _cells[i][j].age = 0;
      }
    }
    notifyListeners();
  }

  /// resets the gol sim to the initial configuration
  void reset() {
    for (int i = 0; i < _numRow; i++) {
      for (int j = 0; j < _numCol; j++) {
        _cells[i][j].current = _cells[i][j].first;
      }
    }
    notifyListeners();
  }

  /// function to create a new random arrangement
  void randomize({double prob}) {
    if (prob != null) _prob = prob;
    for (int i = 0; i < _numRow; i++) {
      for (int j = 0; j < _numCol; j++) {
        if (_prob != 0) {
          double rand = Random().nextDouble();
          _cells[i][j].current = rand <= _prob;
        } else {
          _cells[i][j].current = false;
        }
        _cells[i][j].first = _cells[i][j].current;
      }
    }
    notifyListeners();
  }

  /// a prearranged 2D boolean pattern can be placed onto the GoL grid
  /// any part of the pattern that goes off the GoL grid is not
  /// copied over unless periodic boundary conditions are present
  void placePattern({
    List<List<Cell>> patternCell,
    List<List<bool>> patternBool,
    int x = 0,
    int y = 0,
    bool centered = false,
  }) {
    if (patternCell == null && patternBool == null) {
      throw StateError("pattern cannot be null");
    }

    bool cellOrBool = patternCell != null;

    if (cellOrBool) {
      if (patternCell.length == 0) {
        throw StateError("pattern must be of size greater than 0");
      }
    } else {
      if (patternBool.length == 0) {
        throw StateError("pattern must be of size greater than 0");
      }
    }

    // calculate the starting position of the pattern
    // this changes depending on whether it is centered or not
    int sx, sy, w, h;
    w = (cellOrBool ? patternCell[0].length : patternBool[0].length);
    h = (cellOrBool ? patternCell.length : patternBool.length);
    if (centered) {
      sx = x - w ~/ 2;
      sy = y - h ~/ 2;
    } else {
      sx = x;
      sy = y;
    }

    // loop over the pattern area and place it onto the
    // current grid and the first grid

    // make sure to take into account periodic edges if it is on
    // if it is not on, then any part of the pattern that is outside of the
    // grid size should be ignored
    for (int i = sy; i < sy + h; i++) {
      if ((i < 0 || i >= _numRow) && !_periodicEdges) continue;
      for (int j = sx; j < sx + w; j++) {
        if ((j < 0 || j >= _numCol) && !_periodicEdges) continue;
        bool val = (cellOrBool
            ? patternCell[i - sy][j - sx].current
            : patternBool[i - sy][j - sx]);
        if (_periodicEdges) {
          _cells[_pbc(i, _numRow)][_pbc(j, _numCol)].current = val;
          _cells[_pbc(i, _numRow)][_pbc(j, _numCol)].first = val;
        } else {
          _cells[i][j].current = val;
          _cells[i][j].first = val;
        }
      }
    }
    notifyListeners();
  }

  /// next iteration in the Game of Life simulation
  void step() {
    // copy _currentGrid to _previousGrid
    for (int i = 0; i < _numRow; i++) {
      for (int j = 0; j < _numCol; j++) {
        _cells[i][j].previous = _cells[i][j].current;
      }
    }

    // set new iteration of the Game of Life
    bool survival;
    for (int i = 0; i < _numRow; i++) {
      for (int j = 0; j < _numCol; j++) {
        survival = _cellSurvival(i, j);
        _cells[i][j].current = survival;
        _cells[i][j].age = survival ? 0 : _cells[i][j].age + 1;
        _cells[i][j].age = _cells[i][j].age.clamp(0, numAgeSteps);
      }
    }
    notifyListeners();
  }

  /// checks the cells survival based on neighbors
  bool _cellSurvival(int i, int j) {
    int liveNeighbors = 0;
    for (int r = i - 1; r <= i + 1; r++) {
      for (int c = j - 1; c <= j + 1; c++) {
        if (r == i && c == j) continue;
        if (_periodicEdges) {
          liveNeighbors +=
              _cells[_pbc(r, _numRow)][_pbc(c, _numCol)].previous ? 1 : 0;
        } else {
          if (r >= 0 && r < _numRow && c >= 0 && c < _numCol) {
            liveNeighbors += _cells[r][c].previous ? 1 : 0;
          }
        }
      }
    }

    if (_cells[i][j].previous) {
      if (liveNeighbors < 2) {
        return false;
      } else if (liveNeighbors == 2 || liveNeighbors == 3) {
        return true;
      } else if (liveNeighbors > 3) {
        return false;
      }
    } else {
      if (liveNeighbors == 3) {
        return true;
      } else {
        return false;
      }
    }
    print("it's not reaching this is it??");
    return false;
  }

  /// periodic boundary conditions
  int _pbc(int pos, int size) {
    return (pos + size) % size;
  }
}
