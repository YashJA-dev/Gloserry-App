import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/transectionlist.dart';
import './model/Item.dart';
import 'package:intl/intl.dart';

import 'controller/InputController.dart';
import 'widgets/Chart.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items_list = [];
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("Grocery App"),
      actions: [
        IconButton(
            onPressed: () => {
                  _bottomSheetStart(context),
                },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.2,
              child: Chart(items_list),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.8,
              child: Transection_List(items_list, removeTransection),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.add),
        onPressed: () => {
          _bottomSheetStart(context),
        },
      ),
    );
  }

  _bottomSheetStart(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (bctx) => InputCntroller(addTransections),
    );
  }

  void removeTransection(int index) {
    items_list.removeAt(index);
    print("${items_list.toString()} fdsafd");
    
    setState(() {
      items_list;
    });
  }

  void addTransections(String food_name, String ammount, DateTime time) {
    items_list.add(Item(ammount, food_name, time));
    setState(() {
      items_list;
    });
  }
}
