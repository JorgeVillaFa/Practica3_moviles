import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final Map<String, String> lugares;
  final int index_lugar;
  ItemActividad({super.key, required this.lugares, required this.index_lugar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(children: [
                Positioned.fill(child: _lugarImg()),
              ]),
            ),
          ),
          Text("Day ${index_lugar + 1}", style: TextStyle(fontSize: 11)),
          Text("${lugares["name_Lugar"]}"),
        ],
      ),
    );
  }

  Widget _lugarImg() {
    return Image.asset('assets/image_${index_lugar + 1}.jpg',
        fit: BoxFit.cover);
  }
}
