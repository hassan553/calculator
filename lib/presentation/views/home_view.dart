import 'package:calculator/presentation/manager/calculator_cubit.dart';
import 'package:calculator/presentation/widgets/build_button_widget.dart';
import 'package:calculator/presentation/widgets/build_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    double result = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Simple Calculator '),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                var cubit = CalculatorCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldWidget(
                      title: 'First number:',
                      controller: cubit.firstNum,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FieldWidget(
                      title: 'Second number:',
                      controller: cubit.secondNum,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            onPressed: () {
                              result = cubit.sum(
                                double.parse(cubit.firstNum.text),
                                double.parse(cubit.secondNum.text),
                              );
                            },
                            text: '+'),
                        CustomButton(
                            onPressed: () {
                              result = cubit.sub(
                                double.parse(cubit.firstNum.text),
                                double.parse(cubit.secondNum.text),
                              );
                            },
                            text: '-'),
                        CustomButton(
                          onPressed: () {
                            result = cubit.multi(
                              double.parse(cubit.firstNum.text),
                              double.parse(cubit.secondNum.text),
                            );
                          },
                          text: '*',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            onPressed: () {
                              result = cubit.division(
                                double.parse(cubit.firstNum.text),
                                double.parse(cubit.secondNum.text),
                              );
                            },
                            text: '/'),
                        CustomButton(
                            onPressed: () {
                              result = cubit.mod(
                                double.parse(cubit.firstNum.text),
                                double.parse(cubit.secondNum.text),
                              );
                            },
                            text: '%'),
                        CustomButton(
                          onPressed: () {
                            result = cubit.power(
                              double.parse(cubit.firstNum.text),
                              double.parse(cubit.secondNum.text),
                            );
                          },
                          text: '**',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        onPressed: () {
                          cubit.firstNum.clear();
                          cubit.secondNum.clear();
                        },
                        text: '⌫',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Result : ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blue,
                              ),
                            ),
                            child: Text(
                              result.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
