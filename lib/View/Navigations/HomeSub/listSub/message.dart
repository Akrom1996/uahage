import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostMessage extends StatelessWidget {
  final avatarLink;
  final userName;
  final datetime;
  final tasteLevel;
  final priceLevel;
  final serviceLevel;
  final textMessage;
  final imageList;
  const PostMessage({
    Key key,
    this.avatarLink,
    this.userName,
    this.datetime,
    this.tasteLevel,
    this.priceLevel,
    this.serviceLevel,
    this.textMessage,
    this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280);

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40.w, 30.w, 40.w, 33.w),
            width: double.infinity,
            child: Column(
              children: [
                // first container
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.w,
                      child: Image.asset(avatarLink),
                    ),
                    // Container after avatar image
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // userName
                          Row(
                            children: [
                              Text(
                                "$userName", //하나뿐인쥬이
                                style: TextStyle(
                                    fontFamily: "NotoSansCJKkr_Bold",
                                    fontSize: 26.sp),
                              ),
                              Padding(padding: EdgeInsets.only(left: 16.w)),
                              Text(
                                "$datetime", //2021.04.20
                                style: TextStyle(
                                    fontFamily: "NotoSansCJKkr_Medium",
                                    fontSize: 26.sp,
                                    color: Color.fromRGBO(147, 147, 147, 1.0)),
                              ),
                            ],
                          ),
                          // 3 Rating buttons
                          Row(
                            children: [
                              ContainerRating(
                                  width: 110.w,
                                  text: '맛',
                                  rating: "$tasteLevel"),
                              Padding(padding: EdgeInsets.only(left: 8.w)),
                              ContainerRating(
                                  width: 115.w,
                                  text: '가격',
                                  rating: "$priceLevel"),
                              Padding(padding: EdgeInsets.only(left: 8.w)),
                              ContainerRating(
                                  width: 140.w,
                                  text: '서비스',
                                  rating: "$serviceLevel"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "신고",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: "NotoSansCJKkr_Medium",
                            color: Color.fromRGBO(147, 147, 147, 1.0)),
                      ),
                    ),
                  ],
                ),
                //text message
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 16.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 19.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1.0),
                  ),
                  child: Text(
                    "$textMessage", //
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 26.sp,
                        fontFamily: "NotoSansCJKkr_Medium"),
                  ),
                ),
                //Images
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.w),
                    child: Wrap(
                      spacing: 10.w,
                      runSpacing: 10.w,
                      children: [
                        for (int i = 0; i < 3; i++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/sublistPage/image${i % 2 + 3}.png",
                              // height: 236.w,
                              width: 311.w,
                            ),
                          ),
                      ],
                    )),
              ],
            ),
          ),
          Divider(
            color: Color.fromRGBO(212, 212, 212, 1.0),
          )
        ],
      ),
    );
  }
}

class ContainerRating extends StatelessWidget {
  final width;
  final text;
  final rating;
  const ContainerRating({
    Key key,
    @required this.width,
    @required this.text,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(77, 77, 77, 0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //taste
          Text(
            '$text',
            style: TextStyle(
              color: Color.fromRGBO(77, 77, 77, 1.0),
              fontSize: 24.sp,
              fontFamily: "NotoSansCJKkr_Medium",
            ),
          ),
          Image.asset(
            "./assets/listPage/star_color.png",
            width: 23.w,
          ),
          Text(
            "$rating",
            style: TextStyle(
              color: Color.fromRGBO(248, 195, 61, 1.0),
              fontSize: 24.sp,
              fontFamily: "NotoSansCJKkr_Medium",
            ),
          )
        ],
      ),
    );
  }
}
