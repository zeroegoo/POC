import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsSlides extends StatefulWidget {
  const NewsSlides({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<NewsSlides> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prefetch image slider demo')),
      body: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          viewportFraction: 1,
          pageSnapping: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          //aspectRatio: 2.0,
          //enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 24.w, right: 24.w, bottom: 24.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
                width: ScreenUtil().screenWidth,
              ),
            ),
          );
          // return Container(
          //   child: Center(
          //       child: Image.network(images[index],
          //           fit: BoxFit.cover, width: 1000)),
          // );
        },
      ),
    );
  }
}
