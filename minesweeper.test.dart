import 'packages/unittest/unittest.dart';

import 'minesweeper.dart';

void main() {
  String minesfield = '''
4 2
...*
..*.
''';
    
  group ("Minesweeper", (){
    test("has height & width", () {
      var minesweeper = new Minesweeper();
      expect(minesweeper.height, equals(0));
      expect(minesweeper.width, equals(0));
    });
    
    test("has height & width initialized with a given grid", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.height, equals(2));
      expect(minesweeper.width, equals(4));
    });
    
    test("detect bomb where there is one", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.isBomb(3,0), equals(true));
    });
    
    test("don't detect bomb when we are out of field", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.isBomb(-1,-1), equals(false));
    });
    
    test("count the number of adajacent bombs", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.numberOfAdjacentBombs(2,0), equals(2));
    });
    
    test("render a bomb when this is one", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.renderCell(3,0), equals('*'));
    });
    
    test("render a number bomb around a cell", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.renderCell(1,1), equals('1'));
    });
    
    test("render solution", () {
      var minesweeper = new Minesweeper.withGrid(minesfield);
      expect(minesweeper.render(), equals("""
012*
01*2
"""));
    });
  });
    
}