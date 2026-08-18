import 'package:calclutor/cores/calc_repo.dart';
import 'package:calclutor/cores/colors_app.dart';
import 'package:calclutor/cubit/calc_cubit.dart';
import 'package:calclutor/widgets/calc_buttons.dart';
import 'package:calclutor/widgets/calc_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.black,
      body: BlocProvider(
        create: (context) => CalculatorCubit(CalcRepo()),
        child: SafeArea(
          child: Container(
            color: ColorsApp.black,
            child: Column(
              children: [
                CalcDisplay(),
                CalcButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
