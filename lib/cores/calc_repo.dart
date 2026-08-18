import 'package:hive/hive.dart';
import '../models/calc_model.dart';

class CalcRepo {
  static const String boxName = 'calculations';

  Future<void> init() async {
    await Hive.openBox<CalculationModel>(boxName);
  }

  Future<void> addCalculation(CalculationModel calculation) async {
    final box = Hive.box<CalculationModel>(boxName);
    await box.add(calculation);
  }

  List<CalculationModel> getCalculations() {
    final box = Hive.box<CalculationModel>(boxName);
    return box.values.toList();
  }

  Future<void> deleteCalculation(int index) async {
    final box = Hive.box<CalculationModel>(boxName);
    await box.deleteAt(index);
  }

  Future<void> clearHistory() async {
    final box = Hive.box<CalculationModel>(boxName);
    await box.clear();
  }
}