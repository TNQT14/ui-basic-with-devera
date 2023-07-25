import 'package:flutter/material.dart';
import 'package:listview/screen/chartBar.dart';

import '../models/category_model.dart';
import 'package:listview/screen/detailCategory.dart';

import '../widget/image_with_top_shadow_widget.dart';

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

  List<Widget> _weeklySpengdingCategory(BuildContext context ,double screenWidth){
    late double barWeight;
    late double percent;
    late Color colorChart;

    List<Widget> weeklySpengdingCategory = [];
    for (int i=0;i<categories.length;i++) {
      percent = categories[i].total/categories[i].maxAmount;
      barWeight = percent*(screenWidth-60);

    //Color for chart
      if(percent<0.25)
        colorChart=Colors.red;
      else if(percent>0.5)
        colorChart = Colors.green;
      else
        colorChart = Colors.orange;

      print('${categories[i].name} : $barWeight');

      weeklySpengdingCategory.add(Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (builder)=>Detail(category: categories[i])));
            },
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
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
                 Stack(
                   children: [
                     Container(
                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                       height: 15,
                       width: double.infinity,
                       alignment: Alignment(10, 10),
                       decoration: BoxDecoration(
                         color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                       height: 15,
                       width: barWeight,
                       alignment: Alignment(10, 10),
                       decoration: BoxDecoration(
                         color: colorChart,
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                   ],
                 )
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

  List<Widget> _bodySimpleBudget(BuildContext context, double screenWidth) {
    List<Widget> bodySimpleBudget = [];

    bodySimpleBudget.add(
      Container(
        color: Colors.grey.shade200,
        child: SingleChildScrollView( // Thay thế Expanded bằng SingleChildScrollView
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true, // Thêm shrinkWrap cho ListView
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  Container(
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Weekly Spending',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                            Container(
                              child: Text(
                                'Jun 05, 2023 - Jun 11, 2023',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10, left: 5),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            spacing: 10,
                            children: <Widget>[
                              ..._buildWeekSpendingList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._weeklySpengdingCategory(context, screenWidth),
                  const Center(
                    child: Text('Make with TNQT by devera.vn'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return bodySimpleBudget;
  }


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    // _buildWeekSpendingList();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   leading: Icon(Icons.settings,
      //     color: Colors.white,
      //     size: 30,),
      //   title: Container(
      //       child: Center(
      //           child: const Text('Simple Budet',
      //             style: TextStyle(fontSize: 30),
      //           ))),
      //   actions: [
      //     IconButton(onPressed: (){}, icon: Icon(
      //       Icons.add,
      //       color: Colors.white,
      //       size: 30,
      //     ))
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            expandedHeight: 200,
            leading: IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Simple Budget', style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white),
            ),
              background: ImageWithTopShadowWidget(),
          ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
                ))
              ],
            backgroundColor: Colors.green,
          ),
          SliverList(delegate: SliverChildListDelegate(
            // Container(
            //   color: Colors.grey.shade200,
            //   child: SafeArea(
            //     child: ListView(
            //       padding: const EdgeInsets.all(10),
            //       children: <Widget>[
            //         Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Column(
            //             children: <Widget>[
            //               Container(
            //                 height: 50,
            //                 child: Center(
            //                   child: Text('Weekly Spending',
            //                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //                   ),
            //                 ),),
            //               Container(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: <Widget>[
            //                     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
            //                     Container(
            //                       child: Text('Jun 05, 2023 - Jun 11, 2023', style: TextStyle(fontSize: 20),),
            //                     ),
            //                     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
            //                   ],
            //                 ),
            //               ),
            //               Container(
            //                 alignment: Alignment.center,
            //                 margin: EdgeInsets.only(bottom: 10,left: 5),
            //                 // padding: EdgeInsets.all(30),
            //                 child: Wrap(
            //                   crossAxisAlignment: WrapCrossAlignment.end,
            //                   spacing: 10,
            //                   // direction: Axis.horizontal,
            //                   // verticalDirection: VerticalDirection.up,
            //                   children: <Widget>[
            //                     ..._buildWeekSpendingList(),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         SizedBox(height: 8),
            //         ..._weeklySpengdingCategory(context, screenWidth),
            //         Center(
            //           child: Container(
            //             child: Text('Make with TNQT by devera.vn'),
            //           ),
            //         ),
            //         // Container(
            //         //   decoration: BoxDecoration(
            //         //     color: Colors.white,
            //         //     borderRadius: BorderRadius.circular(10),
            //         //   ),
            //         //   child: Container(
            //         //     padding: EdgeInsets.all(8),
            //         //     child: Row(
            //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //       children: <Widget>[
            //         //         ..._weeklySpengdingCategory(),
            //         //         Container(
            //         //           child: Text('${categories[0].name}',
            //         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            //         //         ),
            //         //         Container(
            //         //           child: Text('\$-----/\$${categories[0].maxAmount}',
            //         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            //         //         ),
            //         //       ],
            //         //     ),
            //         // ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            _bodySimpleBudget(context, screenWidth),
          ))
        ],
        // child: Container(
        //   color: Colors.grey.shade200,
        //   child: SafeArea(
        //     child: ListView(
        //       padding: const EdgeInsets.all(10),
        //       children: <Widget>[
        //         Container(
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Column(
        //             children: <Widget>[
        //               Container(
        //                 height: 50,
        //                 child: Center(
        //                   child: Text('Weekly Spending',
        //                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //                   ),
        //                 ),),
        //               Container(
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: <Widget>[
        //                     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        //                     Container(
        //                       child: Text('Jun 05, 2023 - Jun 11, 2023', style: TextStyle(fontSize: 20),),
        //                     ),
        //                     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 alignment: Alignment.center,
        //                 margin: EdgeInsets.only(bottom: 10,left: 5),
        //                 // padding: EdgeInsets.all(30),
        //                 child: Wrap(
        //                   crossAxisAlignment: WrapCrossAlignment.end,
        //                   spacing: 10,
        //                   // direction: Axis.horizontal,
        //                   // verticalDirection: VerticalDirection.up,
        //                   children: <Widget>[
        //                     ..._buildWeekSpendingList(),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 8),
        //         ..._weeklySpengdingCategory(context, screenWidth),
        //         Center(
        //           child: Container(
        //             child: Text('Make with TNQT by devera.vn'),
        //           ),
        //         ),
        //         // Container(
        //         //   decoration: BoxDecoration(
        //         //     color: Colors.white,
        //         //     borderRadius: BorderRadius.circular(10),
        //         //   ),
        //         //   child: Container(
        //         //     padding: EdgeInsets.all(8),
        //         //     child: Row(
        //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         //       children: <Widget>[
        //         //         ..._weeklySpengdingCategory(),
        //         //         Container(
        //         //           child: Text('${categories[0].name}',
        //         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        //         //         ),
        //         //         Container(
        //         //           child: Text('\$-----/\$${categories[0].maxAmount}',
        //         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        //         //         ),
        //         //       ],
        //         //     ),
        //         // ),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
