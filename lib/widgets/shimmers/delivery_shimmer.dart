import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DeliveryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cont_width = MediaQuery.of(context).size.width * 0.65;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.white,
      child: Container(
        // height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: cont_width,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
