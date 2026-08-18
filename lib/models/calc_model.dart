import 'package:hive/hive.dart';

part 'calc_model.g.dart';

@HiveType(typeId: 0)
class CalculationModel {
  @HiveField(0)
  final String expression;

  @HiveField(1)
  final String result;

  CalculationModel({
    required this.expression,
    required this.result,
  });
}