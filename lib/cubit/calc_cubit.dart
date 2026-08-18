import 'package:flutter_bloc/flutter_bloc.dart';
import '../cores/calc_repo.dart';
import '../models/calc_model.dart';
import 'calc_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  final CalcRepo calcRepo;

  CalculatorCubit(this.calcRepo) : super(CalculatorState()) {
    loadHistory();
  }

  void loadHistory() {
    emit(
      state.copyWith(
        history: calcRepo.getCalculations(),
      ),
    );
  }

  void onNumberPressed(String number) {
    if (state.calculated) {
      emit(
        state.copyWith(
          expression: number,
          result: '',
          calculated: false,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        expression: state.expression + number,
      ),
    );
  }

  void onOperatorPressed(String operator) {
    if (state.expression.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        expression: state.expression + operator,
        calculated: false,
      ),
    );
  }

  void onDeletePressed() {
    if (state.expression.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        expression: state.expression.substring(
          0,
          state.expression.length - 1,
        ),
      ),
    );
  }

  Future<void> calculate() async {
    try {
      final expression = state.expression;

      final numbers = expression.split(RegExp(r'[+\-*/]'));

      final operators = expression
          .split(RegExp(r'[0-9.]'))
          .where((e) => e.isNotEmpty)
          .toList();

      double result = double.parse(numbers[0]);

      for (int i = 0; i < operators.length; i++) {
        final number = double.parse(numbers[i + 1]);

        if (operators[i] == '+') {
          result += number;
        } else if (operators[i] == '-') {
          result -= number;
        } else if (operators[i] == '*') {
          result *= number;
        } else if (operators[i] == '/') {
          result /= number;
        }
      }

      String finalResult = result.toString();

      if (finalResult.endsWith('.0')) {
        finalResult = finalResult.substring(
          0,
          finalResult.length - 2,
        );
      }

      final calculation = CalculationModel(
        expression: expression,
        result: finalResult,
      );

      await calcRepo.addCalculation(calculation);

      final history = calcRepo.getCalculations();

      emit(
        state.copyWith(
          expression: finalResult,
          result: finalResult,
          history: history,
          calculated: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expression: 'Error',
          result: 'Error',
        ),
      );
    }
  }

  void selectHistory(CalculationModel calculation) {
    emit(
      state.copyWith(
        expression: calculation.expression,
        result: calculation.result,
        calculated: true,
      ),
    );
  }

  void onClearPressed() {
    emit(CalculatorState());
  }
}