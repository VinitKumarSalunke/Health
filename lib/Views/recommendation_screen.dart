import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health/Data/diabetes.dart';
import 'package:health/Data/diet.dart';
import 'package:health/Data/jokes.dart';
import 'package:health/Data/overweight.dart';
import 'package:health/Data/underweight.dart';
import 'package:health/Logic/bmi_suggestion.dart';
import 'package:health/Views/yoga_screen.dart';
import 'package:health/constant.dart';
import 'package:get/get.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({required this.name, required this.bmi, required this.disease, Key? key}) : super(key: key);

  final String name;
  final double bmi;
  final String disease;

  T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "Result"
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hello, $name",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            elevation: 5,
                            shadowColor: Colors.grey.shade200,
                            child: Container(
                              //height: 140,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: kColorPrimary,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Your BMI: ${bmi.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      bmiSuggestion(bmi),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: const [
                        Text(
                          "Suggested Yoga",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),


                    if (bmi < 18.0) ...[
                      CarouselSlider.builder(
                          itemCount: underWeight.length,
                          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                              InkWell(
                                onTap: () {
                                  Get.to(YogaInfoScreen(data: underWeight[index]));
                                },
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)
                                            ),
                                            child: Image.asset(
                                              underWeight[index]['img']!,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: Get.width,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  underWeight[index]['name']!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              underWeight[index]['content']!,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            // aspectRatio: 16/10,
                            height: 320,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          )
                      )
                    ] else if (18.5 <= bmi && bmi < 24.9) ...[
                      CarouselSlider.builder(
                          itemCount: diabetes.length,
                          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                              InkWell(
                                onTap: () {
                                  Get.to(YogaInfoScreen(data: diabetes[index]));
                                },
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)
                                            ),
                                            child: Image.asset(
                                              diabetes[index]['img']!,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: Get.width,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  diabetes[index]['name']!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              diabetes[index]['content']!,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            // aspectRatio: 16/10,
                            height: 320,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          )
                      )
                    ] else if (24.9 <= bmi && bmi < 29.9) ...[
                      CarouselSlider.builder(
                          itemCount: overWeight.length,
                          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                              InkWell(
                                onTap: () {
                                  Get.to(YogaInfoScreen(data: overWeight[index]));
                                },
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)
                                            ),
                                            child: Image.asset(
                                              overWeight[index]['img']!,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: Get.width,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  overWeight[index]['name']!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              overWeight[index]['content']!,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            // aspectRatio: 16/10,
                            height: 320,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          )
                      )
                    ] else if (bmi >= 30) ...[
                      CarouselSlider.builder(
                          itemCount: overWeight.length,
                          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                              InkWell(
                                onTap: () {
                                  Get.to(YogaInfoScreen(data: overWeight[index]));
                                },
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)
                                            ),
                                            child: Image.asset(
                                              overWeight[index]['img']!,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: Get.width,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  overWeight[index]['name']!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              overWeight[index]['content']!,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            // aspectRatio: 16/10,
                            height: 320,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          )
                      )
                    ],


                    if (disease != "Other") ...[
                      if (disease == "Sugar") ...[
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Suggested Food",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: sugarDiet.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: kColorPrimary,
                                      width: 2
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      sugarDiet[index],
                                      style: const TextStyle(
                                        color: kColorPrimary
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ] else if (disease == "BP") ...[
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Suggested Food",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: bpDiet.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: kColorPrimary,
                                          width: 2
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      bpDiet[index],
                                      style: const TextStyle(
                                          color: kColorPrimary
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ] else if (disease == "Cancer") ...[
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Suggested Food",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: cancerDiet.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: kColorPrimary,
                                          width: 2
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      cancerDiet[index],
                                      style: const TextStyle(
                                          color: kColorPrimary
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ] else if (disease == "Stroke") ...[
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Suggested Food",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: strokeDiet.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: kColorPrimary,
                                          width: 2
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      strokeDiet[index],
                                      style: const TextStyle(
                                          color: kColorPrimary
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ]
                    ],


                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Joke",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        getRandomElement(jokes)
                    ),
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
