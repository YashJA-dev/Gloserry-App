import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_app/Providers/GloceryListProvider.dart';
import 'package:provider/provider.dart';
import '../model/Item.dart';
import 'package:intl/intl.dart';

class Transection_List extends StatelessWidget {
  List<Item> items_list;
  GloceryList gloceryList;
  @override
  Widget build(BuildContext context) {
    gloceryList = Provider.of<GloceryList>(context);
    items_list = gloceryList.getGloceryList;
    return LayoutBuilder(
      builder: (context, contraints) {
        return Container(
            height: contraints.maxHeight,
            child: items_list.length != 0
                ? ListView.builder(
                    itemBuilder: _listViewItem,
                    itemCount: items_list.length,
                  )
                : Image.asset('images/noproduct.png'));
      },
    );
  }

  Card _listViewItem(BuildContext ctx, int index) {
    Item item = items_list.elementAt(index);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(padding: EdgeInsets.all(5),child: Text("${item.price}")),
          ),
        ),
        title: Text(
          item.itemName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat("dd/MMMM/yyyy").format(item.time).toString()),
        trailing: IconButton(
          color: Theme.of(ctx).errorColor,
          onPressed: () => {
            gloceryList.remove(index: index),
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
