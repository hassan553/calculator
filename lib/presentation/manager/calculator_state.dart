part of 'calculator_cubit.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorSumState extends CalculatorState {}

class CalculatorSubState extends CalculatorState {}

class CalculatorMultiState extends CalculatorState {}

class CalculatorDiviState extends CalculatorState {}

class CalculatorModState extends CalculatorState {}

class CalculatorPowerState extends CalculatorState {}
