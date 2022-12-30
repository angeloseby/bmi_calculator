import 'package:bmi_calculator/bmi_function.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/custom_widgets.dart';

const cardColor = Color(0xFF1D1E33);
const inActiveCardColor = Colors.white;
const activeCardColor = Color(0xFFD93558);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 100;
  int age = 18;
  int weight = 50;
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 2,
              color: Color.fromARGB(255, 234, 234, 234),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: BGCard(
                        color: cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 50,
                              color: selectedGender == Gender.male
                                  ? activeCardColor
                                  : inActiveCardColor,
                            ),
                            const Text(
                              "MALE",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: BGCard(
                        color: cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: selectedGender == Gender.female
                                  ? activeCardColor
                                  : inActiveCardColor,
                            ),
                            const Text(
                              "FEMALE",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BGCard(
                color: cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          " cm",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          trackHeight: 1,
                          thumbColor: const Color(0xFFEB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10.0),
                          overlayShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12.0)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 10),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(
                              () {
                                height = newValue.round();
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BGCard(
                      color: cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                " kg",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        weight <= 30 ? weight : weight--;
                                      });
                                    },
                                    child: const MinusButton()),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        weight >= 170 ? weight : weight++;
                                      });
                                    },
                                    child: const PlusButton()),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BGCard(
                      color: cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () => setState(() {
                                        age == 18 ? age : age--;
                                      }),
                                  child: const MinusButton()),
                              GestureDetector(
                                  onTap: () => setState(() {
                                        age == 65 ? age : age++;
                                      }),
                                  child: const PlusButton()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                List bmiValues =
                    calculateBMI(height.toDouble(), weight.toDouble());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: bmiValues,
                    ),
                  ),
                );
              },
              child: Container(
                color: const Color(0xFFD93558),
                height: 50,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
