import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputCntroller extends StatefulWidget {
  Function addItem;
  InputCntroller(this.addItem);
  
  @override
  State<InputCntroller> createState() => _InputCntrollerState();
}

class _InputCntrollerState extends State<InputCntroller> {
  var foodName = TextEditingController();
  var ammount_food = TextEditingController();
  DateTime _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    double price;
    return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLength: 25,
              decoration: InputDecoration(label: Text("Item")),
              controller: foodName,
              onSubmitted: (_) => _addIteminList(),
            ),
            TextField(
              maxLength: 2,
              decoration: InputDecoration(label: Text("Price in \$")),
              keyboardType: TextInputType.number,
              controller: ammount_food,
              onSubmitted: (_) => _addIteminList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text("Pick Date"),
                ),
                Text(_selectedDate == null
                    ? "Pls chose a Date"
                    : DateFormat("dd/MMMM/yyyy").format(_selectedDate).toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () => {
                          _addIteminList(),

                        },
                    child: Text("Add Item"))
              ],
            )
          ],
        ));
  }

  _addIteminList() {
    double price = double.parse(ammount_food.text);
    if (price > 0 && foodName.text != "" && _selectedDate != null) {
      widget.addItem(foodName.text, price.toString(), _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) => {
              if (pickedDate != null){
                  _selectedDate = pickedDate,
                  setState(() {
                    _selectedDate;
                  }),
                }
            });
  }
}
