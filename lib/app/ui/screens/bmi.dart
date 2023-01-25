import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bmi.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/bmi_gender_card.dart';
import '../widgets/bmi_height_card.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

enum Gender {
  male,
  female,
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.01),
                    child: const CommonText(
                      text: "BMI Calculate",
                      fontSize: AppFontSize.twenty,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: BmiGenderCard(
                        color: selectedGender == Gender.male
                            ? AppColors.primary
                            : AppColors.grey,
                        gender: "Male",
                        genderIcon: Icons.male_rounded,
                        fontColor: selectedGender == Gender.male
                            ? AppColors.white
                            : AppColors.black,
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
                      child: BmiGenderCard(
                        color: selectedGender == Gender.female
                            ? AppColors.primary
                            : AppColors.grey,
                        gender: "Female",
                        genderIcon: Icons.female,
                        fontColor: selectedGender == Gender.female
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              BmiHeightCard(
                color: AppColors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CommonText(
                      text: "Height",
                      fontColor: AppColors.black,
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        CommonText(
                          text: height.toString(),
                          fontColor: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        const CommonText(
                          text: " cm",
                          fontColor: AppColors.black,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: AppColors.white,
                        thumbColor: Colors.grey,
                        overlayColor: AppColors.white,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 35.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BmiHeightCard(
                      color: AppColors.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText(
                            text: "Wight",
                          ),
                          CommonText(
                            text: weight.toString(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  BmiHeightCard(
                    color: AppColors.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CommonText(
                          text: "Age",
                        ),
                        CommonText(
                          text: age.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CommonButton(
                text: "Calculate",
                onPressed: () async {
                  BmiController.to.showBmiResult = true;
                  BmiController.to.calculateBMI(height: height, weight: weight);
                  BmiController.to.getText();
                  BmiController.to.getAdvise();
                  BmiController.to.getTextColor();
                },
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0.6, 0.2),
                          color: AppColors.grey.withOpacity(.2))
                    ],
                    color: AppColors.white),
                width: Get.width,
                height: Get.height * 0.2,
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CommonText(
                      text: "Normal BMI Range",
                      // fontSize: 18,
                      fontColor: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    const CommonText(
                      text: "18.5 - 25 kg/m2",
                      // fontSize: 18,
                      fontColor: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                    Obx(() => BmiController.to.showBmiResult == false
                        ? const SizedBox()
                        : CommonText(
                            text: "Your BMI : ${BmiController.to.finalBmi}",
                            // fontSize: 18,
                            fontColor: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                    Obx(() => BmiController.to.showBmiResult == false
                        ? const SizedBox()
                        : CommonText(
                            text: BmiController.to.weightResult,
                            fontColor: BmiController.to.getTextColor(),
                          )),
                    Obx(() => BmiController.to.showBmiResult == false
                        ? const SizedBox()
                        : CommonText(
                            text: BmiController.to.advise,
                            fontColor: BmiController.to.getTextColor(),
                          )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        constraints: const BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        elevation: 0.0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: const Color(0xFF4C4F5E),
        child: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
