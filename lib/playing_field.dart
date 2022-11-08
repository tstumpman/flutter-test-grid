import 'package:flutter/cupertino.dart';
import 'package:win_flutter_test/tile.dart';

class PlayingField extends StatelessWidget {
  final int height;
  final int width;
  final int tileSize;
  final List<List<Tile>> tiles = List.empty(growable: true);

  PlayingField({required this.height, required this.width, required this.tileSize, super.key}){
    for(int i = 0; i < width; i++){
      List<Tile> column = List.generate(height, (rowIndex){
        return Tile(tileSize.toDouble());
      });
      tiles.add(column);
    }
  }

  List<Widget> getColumns() {
    return List.generate(width, (columnIndex) {
      return Column( children: List.generate(height, (rowIndex){
        return tiles[columnIndex][rowIndex];
      }));
    });
  }

  Tile pixelToTile(double x, double y){
    int row = (y % tileSize).toInt();
    int col = (x % tileSize).toInt();
    return tiles[col][row];
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: getColumns());
  }
}
