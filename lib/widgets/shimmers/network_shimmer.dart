import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkErrorShimmer extends StatelessWidget {
  final Function refresh;

  NetworkErrorShimmer({this.refresh});
  @override
  Widget build(BuildContext context) {
    var cont_width = MediaQuery.of(context).size.width * 0.65;

    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.white,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Icon(
                Icons.network_locked_outlined,
                size: 105.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text("NETWORK ERROR"),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  refresh();
                },
                child: Text("Ckick to Refresh"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
