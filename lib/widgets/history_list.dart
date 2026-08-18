import 'package:calclutor/cores/colors_app.dart';
import 'package:calclutor/models/calc_model.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<CalculationModel> history;
  final void Function(CalculationModel calculation) onTap;

  const HistoryList({
    super.key,
    required this.history,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: history.isEmpty
          ? Center(
        child: Text(
          'No History',
          style: TextStyle(
            color: ColorsApp.white,
            fontSize: 20,
          ),
        ),
      )
          : ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final calculation = history[index];

          return ListTile(
            onTap: () {
              onTap(calculation);
              Navigator.pop(context);
            },
            title: Text(
              calculation.expression,
              style: TextStyle(
                color: ColorsApp.white,
                fontSize: 18,
              ),
            ),
            trailing: Text(
              calculation.result,
              style: TextStyle(
                color: ColorsApp.white,
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}