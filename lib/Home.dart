import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/transectionlist.dart';
import 'package:provider/provider.dart';
import './model/Item.dart';
import 'package:intl/intl.dart';

import 'Providers/GloceryListProvider.dart';
import 'controller/InputController.dart';
import 'widgets/Chart.dart';

class Home extends StatelessWidget {
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
              child: Chart(),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.8,
              child: Transection_List(),
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
      builder: (bctx) => InputCntroller(context: ctx),
    );
  }
}
