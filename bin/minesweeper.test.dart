import 'package:/unittest/unittest.dart';

import 'minesweeper.dart';

void main() {
  String minesfield = '''
4 2
...*
..*.
''';
  
  group ("Minesweeper", (){
    test("has height & width", () {
      var _minesweeper = new Minesweeper();
      expect(_minesweeper.height, equals(0));
      expect(_minesweeper.width, equals(0));
    });
    
    test("has height & width initialized with a given grid", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.height, equals(2));
      expect(_minesweeper.width, equals(4));
    });
    
    test("detect bomb where there is one", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.isBomb(3,0), equals(true));
    });
    
    test("don't detect bomb when we are out of field", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.isBomb(-1,-1), equals(false));
    });
    
    test("count the number of adajacent bombs", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.numberOfAdjacentBombs(2,0), equals(2));
    });
    
    test("render a bomb when this is one", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.renderCell(3,0), equals('*'));
    });
    
    test("render a number bomb around a cell", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.renderCell(1,1), equals('1'));
    });
    
    test("render solution", () {
      var _minesweeper = new Minesweeper.withGrid(minesfield);
      expect(_minesweeper.render(), equals("""
012*
01*2
"""));
    });
  });
    
}