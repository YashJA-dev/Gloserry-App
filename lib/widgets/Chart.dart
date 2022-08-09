import 'package:flutter/material.dart';
import 'package:grocery_app/model/ChartData.dart';
import 'package:grocery_app/model/Item.dart';
import 'package:grocery_app/widgets/ChartBarWidget.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Item> itemList;
  Chart(this.itemList);
  List<ChartData> get groupedTransectionValues {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double sum = 0;
      for (int i = 0; i < itemList.length; i++) {
        var date = itemList[i].time;
        if (date.day == weekDay.day &&
            date.month == weekDay.month &&
            date.year == weekDay.year) {
          sum += double.parse(itemList[i].price);
        }
      }
      String day = DateFormat.E().format(weekDay).toString().substring(0, 1);
      return ChartData(day, sum);
    });
  }

  double get maxSpending {
    return groupedTransectionValues.fold(0, (sum, item) {
      return sum + item.ammount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        child: Container (
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransectionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: maxSpending!=0?ChartBar(
                    data.day, data.ammount, data.ammount / maxSpending):ChartBar(
                    data.day, 0,0),
              );
            }).toList(),
          ),
        ));
  }
}
