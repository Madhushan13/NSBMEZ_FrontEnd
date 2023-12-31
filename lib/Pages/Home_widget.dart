import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/drama1.jpg',
    'assets/images/colorsnight23.jpg',
    'assets/images/fiesta.jpg',
    'assets/images/food.jpg',
    'assets/images/openday1.jpg',
    'assets/images/poson1.jpg',
    'assets/images/poson2.jpg',
    'assets/images/poson3.jpg',
    'assets/images/athletic1.jpg'
  ];

  final imageWidth = 300.0; // Set your desired width for the images
  final imageHeight = 180.0; // Set your desired height for the images

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
          options: CarouselOptions(
            height: imageHeight,
            autoPlay: true,
            enableInfiniteScroll: true, // Enable infinite scroll
            autoPlayAnimationDuration: const Duration(seconds: 3),
            enlargeCenterPage: true, // Set to true for full view
            viewportFraction: 0.5, // Adjust this value for spacing
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        const SizedBox(height: 12),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ScrollingDotsEffect(
          dotHeight: 6,
          dotWidth: 6,
          dotColor: Color.fromARGB(255, 4, 11, 11),
          activeDotColor: Color.fromARGB(255, 6, 189, 16),
          activeStrokeWidth: 2.6,
          strokeWidth: 2.6,
          spacing: 8,
        ),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildImage(String urlImage, int index) => Container(
        width: imageWidth,
        height: imageHeight,
        child: Image.asset(urlImage, fit: BoxFit.cover),
      );
}

class GifImageWidget extends StatelessWidget {
  final String gifImagePath;

  const GifImageWidget({
    Key? key,
    required this.gifImagePath,
    required Null Function() onTap,
    required int height,
    required int width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width * 0.2;

    return Container(
      width: cardSize * 1, // Adjust the width of the image
      height: cardSize * 1, // Adjust the height of the image
      child: Image.asset(
        gifImagePath,
        fit: BoxFit.contain, // Ensure the image covers the container
      ),
    );
  }
}

class LectureDetails extends StatelessWidget {
  final String moduleName;
  final String moduleCode;
  final String hall;
  final String time;

  const LectureDetails({
    required this.moduleName,
    required this.moduleCode,
    required this.hall,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 220, 215),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color.fromARGB(255, 4, 4, 5),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Module Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      decorationThickness: 2.5,
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                  Text(
                    moduleName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Module code',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      decorationThickness: 2.5,
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                  Text(
                    moduleCode,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Hall',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      decorationThickness: 2.5,
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                  Text(
                    hall,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      decorationThickness: 2.5,
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 7, 7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//bottom navigation Bar

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 56, 144, 76),
          activeColor: const Color.fromARGB(255, 255, 255, 255),
          tabBackgroundColor: const Color.fromARGB(255, 56, 144, 76),
          gap: 8,
          padding: const EdgeInsets.all(15),
          tabs: [
            GButton(
              icon: Icons.notifications,
              text: 'Notifications',
              onPressed: () {
                onTap(0);
              },
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                onTap(1);
              },
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat',
              onPressed: () {
                onTap(2);
              },
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: onTap,
        ),
      ),
    );
  }
}
