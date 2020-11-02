import 'package:flutter/material.dart';
import 'package:flutter_meals_food/detail_screen.dart';
import 'package:flutter_meals_food/model/meals_model.dart';

class Breakfast extends StatefulWidget {
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  List<Meals> breakfastList = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    if (breakfastList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return _gridViewBreakfast(context);
    }
  }

  Widget _gridViewBreakfast(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 4;
    final double itemWidth = size.width / 2;

    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: itemWidth / itemHeight,
      children: _buildGridBreakfast(context),
    );
  }

  List<Card> _buildGridBreakfast(BuildContext context) {
    var count = breakfastList.length;

    List<Card> card = List.generate(
      count,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(
                      id: breakfastList[index].id,
                    );
                  },
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 13.0,
                  child: Image.network(
                    breakfastList[index].thumb,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        breakfastList[index].meal,
                        maxLines: 1,
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return card;
  }

  void loadData() {
    Meals.getBreakfast().then(
      (value) {
        for (int i = 0; i < value.length; i++) {
          breakfastList.add(value[i]);
        }

        setState(() {});
      },
    );
  }
}
