import 'package:flutter/material.dart';
import 'package:listview/screen/chartBar.dart';

class Home extends StatelessWidget {

  final List<double> expense;
  final List<String> weekLabels = const[];
  const Home({Key? key, required this.expense}):super(key:key);

  final List<String> weekLabel = const[
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa'];

  List<Widget> _buildWeekSpendingList()
  {
    return [];
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(bottom: 10,left: 5, right: 5),
                      child: Row(
                        children: <Widget>[
                          ChartBar(label: 'label', amoutSpent: 42, mostExpensive: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
