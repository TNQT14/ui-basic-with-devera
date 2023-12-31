import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
            Expanded(
              child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:[ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child:  Text('${category.expenses[i].name}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child:  Text('-\$${category.expenses[i].cost.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.red),),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(height: 70),
          ],
        ));
      }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    double percent = category.total/category.maxAmount;
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:[ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text('\$${category.total.toStringAsFixed(2)}/\$${category.maxAmount}',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                    ),
                  ),
                   Container(
                     height: 200,
                    alignment: Alignment.center,
                    child: Center(
                      child: Transform.scale(
                        scale: 5,
                        child: CircularPercentIndicator(
                          radius: 45,
                          backgroundColor: Colors.grey,
                          percent: percent,
                          lineWidth: 3,
                          progressColor: Colors.green,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ..._detailCategory(),
          ],
        ),
      ),
    );
  }
}
