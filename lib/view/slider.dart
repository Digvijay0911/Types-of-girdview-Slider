import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  // --------------------------------------
   final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  List imageList = [
    {
      "id": 1,
      "image_path": 'assets/images/alexander-rotker-l8p1aWZqHvE-unsplash.jpg'
    },
    {
      "id": 2,
      "image_path": 'assets/images/chuttersnap-4JHMt29fvj8-unsplash.jpg'
    },
    {"id": 3, "image_path": 'assets/images/domino-164_6wVEHfI-unsplash.jpg'}
  ];
  // ====================================
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Slider Example"),
      ),
      body: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
