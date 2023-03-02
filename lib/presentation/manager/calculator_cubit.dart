import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());
  static CalculatorCubit get(context) => BlocProvider.of(context);
  var firstNum = TextEditingController();
  var secondNum = TextEditingController();
  double sum(double number1, double number2) {
    number1 += number2;
    emit(CalculatorSumState());
    return number1;
  }

  double sub(double number1, double number2) {
    number1 -= number2;
    emit(CalculatorSubState());
    return number1;
  }

  double multi(double number1, double number2) {
    number1 *= number2;
    emit(CalculatorMultiState());
    return number1;
  }

  double division(double number1, double number2) {
    if (number2 != 0) {
      number1 /= number2;
      emit(CalculatorDiviState());
      return number1;
    }
    return 0;
  }

  double mod(double number1, double number2) {
    number1 %= number2;
    emit(CalculatorModState());
    return number1;
  }

  double power(double number1, double number2) {
    number1 = pow(number1, number2).toDouble();
    emit(CalculatorPowerState());
    return number1;
  }
}
