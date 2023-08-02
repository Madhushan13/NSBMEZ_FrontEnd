import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

//handling the carousel and the indicator
class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/events recap.jpg',
    'assets/images/drama1.jpg',
    'assets/images/colorsnight23.jpg',
    'assets/images/fiesta.jpg',
    'assets/images/food.jpg',
    'assets/images/openday1.jpg',
    'assets/images/poson1.jpg',
    'assets/images/poson2.jpg',
    'assets/images/poson3.jpg',
    'assets/images/rasoga.jpg',
    'assets/images/athletic1.jpg'
  ];

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
            height: 180,
            autoPlay: true,
            enableInfiniteScroll: true, // Enable infinite scroll
            autoPlayAnimationDuration: Duration(seconds: 3),
            enlargeCenterPage: false, // Set to false
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
          dotHeight: 12,
          dotWidth: 12,
          dotColor: Color.fromARGB(255, 160, 227, 231),
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
        child: Image.asset(urlImage, fit: BoxFit.cover),
      );
}

//Home card widget
class HomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.3, // Fixed width for the card
      height: 120, // Fixed height for the card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 30,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align text to the bottom
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: Color.fromARGB(255, 74, 187, 9)),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                    color: Color.fromARGB(255, 6, 129, 245),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
