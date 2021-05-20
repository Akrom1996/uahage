import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ReviewPage extends StatefulWidget {
  final data;

  const ReviewPage({Key key, @required this.data}) : super(key: key);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  var data;
  List ratingLabel = ["아주 좋아요", "맘에 들어요", "보통이에요", "그냥 그래요", "별로예요", "평가없음"];
  List<dynamic> uploadingImage = [];
  int index1 = 5, index2 = 5, index3 = 5;
  bool btnColor = false;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(
                        Icons.photo_library,
                        color: Color.fromRGBO(255, 114, 148, 1.0),
                      ),
                      title: Text('겔러리'),
                      onTap: () async {
                        await _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(
                      Icons.photo_camera,
                      color: Color.fromRGBO(255, 114, 148, 1.0),
                    ),
                    title: Text('카메라'),
                    onTap: () async {
                      await _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    try {
      var image = await ImagePicker().getImage(
          source: ImageSource.camera,
          imageQuality: 20,
          maxWidth: 480,
          maxHeight: 600);
      print("ImagePath: ${image.path}");
      setState(() {
        uploadingImage.add(image.path);
      });
    } catch (err) {
      print(err);
    }
  }

  Future _imgFromGallery() async {
    try {
      var image = await ImagePicker()
          .getImage(source: ImageSource.gallery, imageQuality: 20);
      print("ImagePath: ${image.path}");
      setState(() {
        uploadingImage.add(image.path);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280);

    var textStyle1 = TextStyle(
        letterSpacing: -0.75.h,
        fontSize: 30.sp,
        color: Color.fromRGBO(77, 77, 77, 1.0),
        fontFamily: "NotoSansCJKkr_Bold");
    var textStyle2 = TextStyle(
        fontSize: 30.sp,
        color: Color.fromRGBO(255, 114, 142, 0.6),
        fontFamily: "NotoSansCJKkr_Medium");
    var textStyle3 = TextStyle(
      color: Color.fromRGBO(239, 239, 239, 1.0),
      letterSpacing: -0.75.h,
      fontSize: 30.sp,
    );

    String review = "1";
    double taste, price, service;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AppBar(
          backgroundColor: Colors.white,
          // elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffff7292)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            '$data',
            style: TextStyle(
                color: Color(0xffff7292),
                fontFamily: "NotoSansCJKkr_Medium",
                fontSize: 30.0.sp),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 36.h, bottom: 27.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  './assets/reviewPage/image1.png',
                  height: 45.h,
                  width: 306.w,
                ),
                Text(
                  "방문하셨나요?",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: "NotoSansCJKkr_Medium",
                      color: Color.fromRGBO(147, 147, 147, 1.0)),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.h,
          ),

          // 3 stars
          Container(
            height: 207.h,
            width: double.infinity,
            margin: EdgeInsets.only(
                top: 36.sp, bottom: 35.7.sp, right: 77.sp, left: 77.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(padding: EdgeInsets.only(left: 22.w)),
                    Container(
                      width: 82.w,
                      child: Text("맛",
                          style: textStyle1, textAlign: TextAlign.center),
                    ),

                    Rating(
                      changed: (v) {
                        if (v == 5) {
                          index1 = 0;
                        } else if (v >= 4) {
                          index1 = 1;
                        } else if (v >= 3) {
                          index1 = 2;
                        } else if (v >= 2) {
                          index1 = 3;
                        } else if (v >= 1) {
                          index1 = 4;
                        } else {
                          index1 = 5;
                        }
                        setState(() {
                          taste = v;
                        });
                      },
                    ),

                    Container(
                      width: 160.w,
                      child: Text(
                        ratingLabel[index1],
                        style: index1 == 5 ? textStyle3 : textStyle1,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(padding: EdgeInsets.only(left: 11.w)),
                    Container(
                      width: 82.w,
                      child: Text("가격",
                          style: textStyle1, textAlign: TextAlign.center),
                    ),

                    Rating(
                      changed: (v) {
                        if (v == 5) {
                          index2 = 0;
                        } else if (v >= 4) {
                          index2 = 1;
                        } else if (v >= 3) {
                          index2 = 2;
                        } else if (v >= 2) {
                          index2 = 3;
                        } else if (v >= 1) {
                          index2 = 4;
                        } else {
                          index2 = 5;
                        }
                        setState(() {
                          price = v;
                        });
                      },
                    ),

                    Container(
                      width: 160.w,
                      child: Text(
                        ratingLabel[index2],
                        style: index2 == 5 ? textStyle3 : textStyle1,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 82.w,
                      child: Text("서비스",
                          style: textStyle1, textAlign: TextAlign.center),
                    ),
                    Rating(
                      changed: (v) {
                        if (v == 5) {
                          index3 = 0;
                        } else if (v >= 4) {
                          index3 = 1;
                        } else if (v >= 3) {
                          index3 = 2;
                        } else if (v >= 2) {
                          index3 = 3;
                        } else if (v >= 1) {
                          index3 = 4;
                        } else {
                          index3 = 5;
                        }
                        setState(() {
                          service = v;
                        });
                      },
                    ),
                    Container(
                      width: 160.w,
                      child: Text(
                        ratingLabel[index3],
                        style: index3 == 5 ? textStyle3 : textStyle1,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Text input
          Container(
            margin: EdgeInsets.only(
              // top: 25.7.w,
              right: 36.sp,
              left: 36.sp,
            ),
            padding: EdgeInsets.only(bottom: 15.sp),
            width: double.infinity,
            height: 330.w,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 114, 142, 0.05),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Color.fromRGBO(255, 114, 142, 0.4),
              ),
            ),
            child: TextFormField(
              onChanged: (value) {
                review = value;
                if (review.length >= 10) {
                  setState(() {
                    btnColor = true;
                  });
                } else {
                  if (btnColor)
                    setState(() {
                      btnColor = false;
                    });
                }
              },
              textAlign: TextAlign.left,
              style: textStyle2,
              maxLines: 20,
              maxLength: 1000,
              cursorColor: Color.fromRGBO(255, 114, 142, 0.6),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: "최소 10자 이상 리뷰를 작성해주세요.",
                hintStyle: textStyle2,
                counterStyle: TextStyle(
                    color: Color.fromRGBO(255, 114, 142, 0.6),
                    fontFamily: "NotoSansCJKkr_Medium"),
                contentPadding:
                    EdgeInsets.only(top: 10.sp, right: 19.sp, left: 19.sp),
              ),
            ),
          ),

          // image upload
          Container(
            margin: EdgeInsets.only(top: 20.sp, right: 36.sp, left: 36.sp),
            width: double.infinity,
            height: 130.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    _showPicker(context);
                  },
                  child: Image.asset(
                    "assets/reviewPage/camera_button.png",
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 17.w)),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          uploadingImage == null ? 0 : uploadingImage.length,
                      itemBuilder: (context, index) {
                        print(
                            "uploadingImage.length: ${uploadingImage.length}");
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 130.w,
                                    height: 130.w,
                                    child: Image.file(
                                      File(uploadingImage[index]),
                                      fit: BoxFit.cover,
                                    ),

                                    //     Container(
                                    //   decoration: BoxDecoration(
                                    //     shape: BoxShape.rectangle,
                                    //     image: DecorationImage(
                                    //         image: FileImage(File(uploadingImage[
                                    //             index])), //imageURL
                                    //         fit: BoxFit.cover),
                                    //     borderRadius: BorderRadius.circular(10.0),
                                    //   ),
                                    // ),
                                  ),
                                  Container(
                                    width: 130.w,
                                    height: 130.w,
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          uploadingImage.removeAt(index);
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        "assets/reviewPage/x_button.svg",
                                        height: 27.3.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 17.w)),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
          //  Bottom button
          Container(
            margin: EdgeInsets.only(
                top: 36.w, right: 110.w, left: 110.w, bottom: 65.w),
            width: double.infinity,
            height: 93.w,
            child: RaisedButton(
              elevation: 0,
              hoverElevation: 0,
              color: btnColor
                  ? Color.fromRGBO(255, 114, 142, 1.0)
                  : Color.fromRGBO(212, 212, 212, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "리뷰 남기기",
                style: TextStyle(
                    letterSpacing: -0.75.h,
                    fontSize: 30.sp,
                    fontFamily: "NotoSansCJKkr_Bold",
                    color: Colors.white),
              ),
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}

class Rating extends StatelessWidget {
  final rateValue;
  final Function changed;
  const Rating({
    Key key,
    this.rateValue,
    this.changed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SmoothStarRating(
    //     allowHalfRating: true,
    //     onRated: changed,
    //     starCount: 5,
    //     rating: 0,
    //     size: 26.0,
    //     isReadOnly: false,
    //     color: Colors.amber,
    //     borderColor: Colors.amber,
    //     spacing: 0.0);
    return RatingBar(
      initialRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 46.w,
      ratingWidget: RatingWidget(
        full: Image.asset(
          'assets/listPage/star_color.png',
          // width: 1.3.h,
        ),
        half: Image.asset(
          'assets/listPage/star_half.png',
          // width: 1.3.h,
        ),
        empty: Image.asset(
          'assets/listPage/star_grey.png',
          // width: 1.3.h,
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
      onRatingUpdate: changed,
    );
  }
}
