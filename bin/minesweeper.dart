library Minesweeper;

class Minesweeper{
  var height = 0;
  var width = 0;
  var lines = [];
  
  Minesweeper(){
  }
  
  Minesweeper.withGrid (String grid){
      var lines = grid.split('\n');
      var firstLine = lines[0].split(' ');
      width = int.parse(firstLine[0]);
      height = int.parse(firstLine[1]);
      this.lines = lines.getRange(1, lines.length-1);
  }
  
  isBomb (x, y){
    if (x < width && x >= 0 &&
        y < height && y >= 0){
      return lines[y][x] == '*';
    }
    return false;
  }
  
  numberOfAdjacentBombs (x, y){
    var numberOfBombs = 0;
    for (var xx=x-1; xx <= x+1; xx++){
      for (var yy=y-1; yy <= y+1; yy++){
        if (isBomb (xx, yy)){
          numberOfBombs++;
        }
      }
    }
    return numberOfBombs;
  }
  
  renderCell (x, y){
    if (isBomb(x,y))
      return '*';
    else
      return numberOfAdjacentBombs(x, y).toString();
  }
  
  render (){
    var result="";
    for (var y=0; y < height; y++){
      for (var x=0; x < width; x++){
        result = result.concat(renderCell(x, y));
      }
      result = result.concat("\n");
    }
    return result;
  }
}