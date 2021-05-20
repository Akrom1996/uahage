import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageReview extends StatefulWidget {
  @override
  _ImageReviewState createState() => _ImageReviewState();
}

class _ImageReviewState extends State<ImageReview> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffff7292)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            '사진리뷰 모아보기',
            style: TextStyle(
                color: Color(0xffff728e),
                fontFamily: "NotoSansCJKkr_Medium",
                fontSize: 30.0.sp),
          ),
        ),
      ),
      body: GridView.builder(
          itemCount: 40,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              // width: 178.w,
              // height: 178.w,
              child: Image.asset("assets/imagereview/${index % 8 + 1}.png"),
            );
          }),
    );
  }
}
