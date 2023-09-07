import 'package:flutter/material.dart';
import 'package:practica3_moviles/info_lugar.dart';
import 'package:practica3_moviles/item_actividad.dart';


class HomePage extends StatelessWidget {
  final List<Map<String, String>> _listLugares = [
    {
      "name_Lugar": "Blue Point Beach",
    },
    {
      "name_Lugar": "Geger Beach",
    },
    {
      "name_Lugar": "Pemuteran",
    },
    {
      "name_Lugar": "Bias Tugel Beach",
    },
    {
      "name_Lugar": "Seminyak Beach",
    },
    {
      "name_Lugar": "Kuta Beach",
    },
    {
      "name_Lugar": "Karma Kandara Beach",
    },
    {
      "name_Lugar": "Balangan Beach",
    },
    {
      "name_Lugar": "Yeh Gangga Beach",
    },
    {
      "name_Lugar": "Pasir Putih",
    },
  ];
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/image_1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listLugares.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                              lugares: _listLugares[index], index_lugar: index);
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Reservación en progreso!"),
                          ),
                        );
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
