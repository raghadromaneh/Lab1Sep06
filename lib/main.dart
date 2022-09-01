import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List imageNumber = [1, 2, 3, 4, 5];
Map toysName = {
  "0": "House",
  "1": "Robot",
  "2": "Ball",
  "3": "Doll",
  "4": "Lego",
};
Map oldPrice = {
  "0": 40,
  "1": 50,
  "2": 10,
  "3": 20,
  "4": 15,
};
Map newPrice = {
  "0": 30,
  "1": 35,
  "2": 5,
  "3": 15,
  "4": 7,
};

List toyCart = [false, false, false, false, false];
List toyFavorite = [false, false, false, false, false];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 210, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 74, 73),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (BuildContext context, i) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  "${toysName.values.elementAt(i)}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 99, 97, 97)),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${newPrice.values.elementAt(i)}",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${oldPrice.values.elementAt(i)}",
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Visibility(
                              child: Text("Added to cart"),
                              visible: toyCart[i],
                            ),
                            Visibility(
                              child: Text("Added to favorite"),
                              visible: toyFavorite[i],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                leading: Image.asset(
                  "images/${imageNumber[i]}.png",
                ),
                isThreeLine: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 234, 154, 181),
                    ),
                    onPressed: () {
                      bool value = toyCart[i];
                      setState(() {
                        toyCart[i] = !value;
                      });
                    },
                    icon: Icon(Icons.shopping_basket_sharp),
                    label: Text("Add to cart"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 234, 154, 181),
                    ),
                    onPressed: () {
                      bool value = toyFavorite[i];
                      setState(() {
                        toyFavorite[i] = !value;
                      });
                    },
                    icon: Icon(Icons.favorite),
                    label: Text("Add to favorite"),
                  ),
                ],
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
