import 'package:calclutor/cores/colors_app.dart';
import 'package:calclutor/cubit/calc_cubit.dart';
import 'package:calclutor/widgets/number_buttons.dart';
import 'package:calclutor/widgets/operation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcButtons extends StatelessWidget {
  const CalcButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          NumberButton(
                            text: 'AC',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onClearPressed();
                            },
                            backgroundColor: ColorsApp.lightGrey,
                          ),
                          NumberButton(
                            text: 'C',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onDeletePressed();
                            },
                            backgroundColor: ColorsApp.lightGrey,
                          ),
                          NumberButton(
                            text: '/',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onOperatorPressed('/');
                            },
                            backgroundColor: ColorsApp.blue,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          NumberButton(
                            text: '7',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('7');
                            },
                          ),
                          NumberButton(
                            text: '8',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('8');
                            },
                          ),
                          NumberButton(
                            text: '9',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('9');
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          NumberButton(
                            text: '4',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('4');
                            },
                          ),
                          NumberButton(
                            text: '5',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('5');
                            },
                          ),
                          NumberButton(
                            text: '6',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('6');
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          NumberButton(
                            text: '1',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('1');
                            },
                          ),
                          NumberButton(
                            text: '2',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('2');
                            },
                          ),
                          NumberButton(
                            text: '3',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('3');
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          NumberButton(
                            text: '0',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('0');
                            },
                            flex: 2,
                          ),
                          NumberButton(
                            text: '.',
                            onPressed: () {
                              context
                                  .read<CalculatorCubit>()
                                  .onNumberPressed('.');
                            },
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OPerationButton(
                      text: '*',
                      backgroundColor: ColorsApp.blue,
                      onPressed: () {
                        context
                            .read<CalculatorCubit>()
                            .onOperatorPressed('*');
                      },
                      flex: 1,
                    ),
                    OPerationButton(
                      text: '-',
                      backgroundColor: ColorsApp.blue,
                      onPressed: () {
                        context
                            .read<CalculatorCubit>()
                            .onOperatorPressed('-');
                      },
                      flex: 1,
                    ),
                    OPerationButton(
                      text: '+',
                      backgroundColor: ColorsApp.blue,
                      onPressed: () {
                        context
                            .read<CalculatorCubit>()
                            .onOperatorPressed('+');
                      },
                      flex: 3,
                    ),
                    OPerationButton(
                      text: '=',
                      backgroundColor: ColorsApp.lightblue,
                      onPressed: () {
                        context.read<CalculatorCubit>().calculate();
                      },
                      flex: 3,
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