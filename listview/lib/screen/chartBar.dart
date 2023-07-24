import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String? label;
  final double amoutSpent;
  final double mostExpensive;
  final double _maxBarHeight = 100;

  const ChartBar({
    super.key,
    required this.label,
    required this.amoutSpent,
    required this.mostExpensive,
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final barHeight = amoutSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text('\$${amoutSpent.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.w600),),
        const SizedBox(height: 6.0,),
        Container(
          height: barHeight,
          width: 15,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text('$label',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }

}