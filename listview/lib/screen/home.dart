
import 'package:flutter/material.dart';
import 'package:listview/screen/chartBar.dart';

import '../models/category_model.dart';

class Home extends StatelessWidget {

  final List<double> expense;
  final List<Category> categories;
  final List<String> weekLabels = const[];
  const Home({Key? key, required this.expense, required this.categories}):super(key:key);

  final List<String> weekLabel = const[
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa'];

  List<Widget> _buildWeekSpendingList(){
    // double mostExpensive = expense.max();
    double mostExpensive = expense.reduce((value, element)
                                          => value > element ? value : element);

    List<Widget> weeklySpendingList = [];
    for(int i=0; i<expense.length; i++)
      weeklySpendingList.add(ChartBar(label: weekLabel[i],
          amoutSpent: expense[i],
          mostExpensive: mostExpensive));
    return weeklySpendingList;
  }

  List<Widget> _weeklySpengdingCategory(){

    List<Widget> weeklySpengdingCategory = [];
    for (int i=0;i<categories.length;i++) {
      weeklySpengdingCategory.add(Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text('${categories[i].name}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: Text('\$${categories[i].total.toStringAsFixed(2)}/\$${categories[i].maxAmount}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8,),
        ],
      )
      );
    }

    print('Xong for');
    return weeklySpengdingCategory;
  }

  // List<Widget> _weeklySpengdingCategory() {
  //   List<Widget> weeklySpengdingCategory = [];
  //   print('Chạy hàm _weeklySpengdingCategory');
  //   for (int i = 0; i < categories.length; i++) {
  //     weeklySpengdingCategory.add(
  //       Column(
  //         children: [
  //           SizedBox(height: 100), // Khoảng cách 100 pixels giữa các Container
  //           Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Container(
  //               padding: EdgeInsets.all(8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Container(
  //                     child: Text(
  //                       '${categories[i].name}',
  //                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   Container(
  //                     child: Text(
  //                       '\$-----/\$${categories[i].maxAmount}',
  //                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   print('Xong for');
  //   return weeklySpengdingCategory;
  // }




  @override
  Widget build(BuildContext context) {

    // _buildWeekSpendingList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.settings,
          color: Colors.white,
          size: 30,),
        title: Container(
            child: Center(
                child: const Text('Simple Budet',
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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Center(
                        child: Text('Weekly Spending',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                          Container(
                            child: Text('Jun 05, 2023 - Jun 11, 2023', style: TextStyle(fontSize: 20),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 10,left: 5),
                      // padding: EdgeInsets.all(30),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        spacing: 10,
                        // direction: Axis.horizontal,
                        // verticalDirection: VerticalDirection.up,
                        children: <Widget>[
                          ..._buildWeekSpendingList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              ..._weeklySpengdingCategory(),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Container(
              //     padding: EdgeInsets.all(8),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         ..._weeklySpengdingCategory(),
              //         Container(
              //           child: Text('${categories[0].name}',
              //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              //         ),
              //         Container(
              //           child: Text('\$-----/\$${categories[0].maxAmount}',
              //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              //         ),
              //       ],
              //     ),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
