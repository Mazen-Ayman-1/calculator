import '../models/calc_model.dart';

class CalculatorState {
  final String expression;
  final String result;
  final List<CalculationModel> history;
  final bool calculated;

  CalculatorState({
    this.expression = '',
    this.result = '',
    this.history = const [],
    this.calculated = false,
  });

  CalculatorState copyWith({
    String? expression,
    String? result,
    List<CalculationModel>? history,
    bool? calculated,
  }) {
    return CalculatorState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      history: history ?? this.history,
      calculated: calculated ?? this.calculated,
    );
  }
}