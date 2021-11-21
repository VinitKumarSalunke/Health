import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YogaInfoScreen extends StatelessWidget {
  const YogaInfoScreen({required this.data, Key? key}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            data['name']!
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        data['img']!,
                        fit: BoxFit.fill,
                        height: 200,
                        width: Get.width,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      data['content']!,
                      textAlign: TextAlign.justify,
                    )
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
