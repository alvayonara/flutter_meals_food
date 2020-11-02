import 'package:flutter/material.dart';
import 'package:flutter_meals_food/model/meals_model.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  Meals meals;

  DetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Meals>(
        future: Meals.getDetail(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(
                            snapshot.data.thumb,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SafeArea(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.meal ?? "-",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          snapshot.data.category ?? "-",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Area",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          snapshot.data.area ?? "-",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Tags",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          snapshot.data.tags ?? "-",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Instructions",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          snapshot.data.instructions ?? "-",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
