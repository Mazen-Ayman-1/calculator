import 'package:calclutor/cores/colors_app.dart';
import 'package:calclutor/cubit/calc_cubit.dart';
import 'package:calclutor/cubit/calc_state.dart';
import 'package:calclutor/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcDisplay extends StatefulWidget {
  const CalcDisplay({super.key});

  @override
  State<CalcDisplay> createState() => _CalcDisplayState();
}

class _CalcDisplayState extends State<CalcDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  final cubit = context.read<CalculatorCubit>();

                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: BlocBuilder<CalculatorCubit, CalculatorState>(
                          builder: (context, state) {
                            return HistoryList(
                              history: state.history,
                              onTap: (calculation) {
                                context.read<CalculatorCubit>().selectHistory(calculation);
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.history,
                  color: ColorsApp.white,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<CalculatorCubit, CalculatorState>(
                      builder: (context, state) {
                        return Text(
                          state.expression,
                          style: TextStyle(
                            fontSize: 24,
                            color: ColorsApp.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
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