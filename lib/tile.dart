import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final double size;

  const Tile(
    this.size, {
    super.key,
  });

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  int fillScale = 1;
  int marginScale = 1;
  bool expanded = false;

  void onInteraction(BuildContext context) {
    expanded = !expanded;

    if (expanded) {
      setState(() {
        fillScale = 100;
        marginScale = 10;
      });
    } else {
      setState(() {
        fillScale = 1;
        marginScale = 1;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$expanded"),
      ),
    );
  }

  double getEdgeInsets() {
    return widget.size * (marginScale / (fillScale + marginScale));
  }

  double getSize() {
    return widget.size * (fillScale / (fillScale + marginScale));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        if (details.down) {
          onInteraction(context);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          onInteraction(context);
        },
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Center(
            child: SizedBox(
              width: getSize(),
              height: getSize(),
              child: const ColoredBox(
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
