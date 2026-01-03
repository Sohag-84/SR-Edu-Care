import 'package:any_image_view/any_image_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sr_edu_care/core/constants/export.dart';

Widget homeSlider({
  required List imageList,
  double height = 160,
  int autoPlayInterval = 4,
  BoxFit boxFit = BoxFit.none,
}) {
  int activeIndex = 0;

  return StatefulBuilder(
    builder: (context, setState) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: height.h,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: autoPlayInterval),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items: imageList.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AnyImageView(
                      imagePath: image,
                      height: 50,
                      fit: boxFit,
                      width: double.infinity,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 15,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: imageList.length,
              effect: SlideEffect(
                dotHeight: 3,
                dotWidth: 15,
                activeDotColor: whiteColor.withValues(alpha: .7),
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      );
    },
  );
}
