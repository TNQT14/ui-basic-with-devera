import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import '../models/category_model.dart';

class Detail extends StatelessWidget {

  final Category category;
  const Detail({Key? key, required this.category}):super(key: key);
  // const Detail({super.key, required this.category});

  List<Widget> _detailCategory()
  {
    List<Widget> itemList = [];
    for(int i=0; i<category.expenses.length;i++)
      {
        itemList.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child:  Text('${category.expenses[i].name}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child:  Text('-\$${category.expenses[i].cost.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                      color: Colors.red),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ));

      }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    print(category.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
            child: Center(
                child: Text('${category.name}',
                  style: TextStyle(fontSize: 30),
                ))),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ))
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: ListView(
          padding: const EdgeInsets.all(8),

          children: <Widget>[
            SizedBox(height: 8),
            ..._detailCategory(),
          ],
        ),
      ),
    );
  }
}
