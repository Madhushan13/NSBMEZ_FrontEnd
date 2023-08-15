import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            autoPlayAnimationDuration: Duration(seconds: 3),
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

class LectureDetailsContainer extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String lectureName;
  final String lectureHall;

  const LectureDetailsContainer({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.lectureName,
    required this.lectureHall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lecture Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start Time: $startTime',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'End Time: $endTime',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lecture Name: $lectureName',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lecture Hall: $lectureHall',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
