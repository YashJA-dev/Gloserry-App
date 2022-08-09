import 'dart:io';

import 'package:flutter/material.dart';
import '../model/Item.dart';
import 'package:intl/intl.dart';

class Transection_List extends StatelessWidget {
  List<Item> items_list;
  Function removeTransection;
  Transection_List(@required this.items_list, this.removeTransection);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return Container(
            height: contraints.maxHeight,
            child: items_list.length != 0
                ? ListView.builder(
                    itemBuilder: _listViewItem,
                    itemCount: items_list.length,
                  )
                : Image.asset('images/splash.jpg'));
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
            child: Text("\$${item.price}"),
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
            removeTransection(index),
            print(index),
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }

  Card _listViewItemCostum(BuildContext ctx, int index) {
    Item item = items_list.elementAt(index);
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(4),
            child: Text(
              "\$" + "${item.price}",
              style: TextStyle(
                  color: Theme.of(ctx).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    item.itemName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  DateFormat("dd-mm-yyyy").format(item.time).toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(ctx).primaryColor,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
