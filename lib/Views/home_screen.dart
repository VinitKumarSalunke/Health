import 'package:flutter/material.dart';
import 'package:health/Controller/blood_group.dart';
import 'package:health/Controller/disease.dart';
import 'package:health/Custom%20Widgets/custom_raised_button.dart';
import 'package:health/Custom%20Widgets/custom_text_field.dart';
import 'package:health/Logic/bmi_calculator.dart';
import 'package:health/Views/recommendation_screen.dart';
import 'package:health/constant.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController();
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController age = TextEditingController();
    BloodGroupController bloodGroupController = Get.put(BloodGroupController());
    DiseaseController diseaseController = Get.put(DiseaseController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Health Care"
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Image.asset(
                      "assets/medicine.png"
                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: kTextStyleInputHeaders,
                          ),
                          CustomTextFields(
                            textEditingController: name,
                            hintText: "Enter name",
                            textInputType: TextInputType.name,
                          ),
                        ],
                      )
                  ),

                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Height (in cm)",
                            style: kTextStyleInputHeaders,
                          ),
                          CustomTextFields(
                            textEditingController: height,
                            hintText: "Enter height in cm",
                            textInputType: TextInputType.number,
                          ),
                        ],
                      )
                  ),

                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Weight (in kg)",
                            style: kTextStyleInputHeaders,
                          ),
                          CustomTextFields(
                            textEditingController: weight,
                            hintText: "Enter weight in kg",
                            textInputType: TextInputType.number,
                          ),
                        ],
                      )
                  ),

                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Age",
                            style: kTextStyleInputHeaders,
                          ),
                          CustomTextFields(
                            textEditingController: age,
                            hintText: "Enter age",
                            textInputType: TextInputType.number,
                          ),
                        ],
                      )
                  ),

                  Container(
                    //Blood Group Section
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Blood Group',
                          style: kTextStyleInputHeaders,
                        ),
                        Container(
                          height: 45,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kColorTextFieldFill,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width * 0.9,
                          child: Obx(() {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: bloodGroupController.bloodGroup.value,
                                onChanged: (newValue) {

                                  bloodGroupController.bloodGroup.value = newValue.toString();
                                },
                                items: <String>[
                                  '',
                                  'A +ve',
                                  "A -ve",
                                  'B +ve',
                                  'B -ve',
                                  'AB +ve',
                                  'AB -ve',
                                  'O +ve',
                                  'O -ve',
                                ].map((String bloodGroup) {
                                  return DropdownMenuItem(
                                    child: Text(bloodGroup),
                                    value: bloodGroup,
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Disease',
                          style: kTextStyleInputHeaders,
                        ),
                        Container(
                          height: 45,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kColorTextFieldFill,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width * 0.9,
                          child: Obx(() {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: diseaseController.disease.value,
                                onChanged: (newValue) {

                                  diseaseController.disease.value = newValue.toString();
                                },
                                items: <String>[
                                  '',
                                  'Sugar',
                                  "BP",
                                  'Cancer',
                                  'Stroke',
                                  'Other'
                                ].map((String disease) {
                                  return DropdownMenuItem(
                                    child: Text(disease),
                                    value: disease,
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomRaisedButton(
                      text: "Submit",
                      onPressed: () {

                        if (name.text.trim().isNotEmpty && height.text.trim().isNotEmpty && weight.text.trim().isNotEmpty && bloodGroupController.bloodGroup.value.isNotEmpty && diseaseController.disease.value.isNotEmpty && age.text.trim().isNotEmpty) {

                          double bmi = calculateBMI(double.parse(height.text)/100, double.parse(weight.text));
                          Get.to(
                              RecommendationScreen(
                                bmi: bmi,
                                name: name.text.trim(),
                                disease: diseaseController.disease.value,
                              )
                          );
                        } else {

                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Warning"),
                              content: const Text("Please fill all the details."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text("Ok"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  const Spacer(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
