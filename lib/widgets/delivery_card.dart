import 'package:flutter/material.dart';

class DeliveryCard extends StatefulWidget {
  String from;
  String to;
  bool isFavourited;
  String image;
  var data;
  DeliveryCard({this.from, this.to, this.isFavourited, this.image, this.data});

  @override
  _DeliveryCardState createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  bool isFav;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = widget.isFavourited;
    // print("build");
  }

  sanitise(String str) {
    String result = "";
    for (int i = 0; i < str.length; i++) {
      if (str[i] == r'$') {
        // print(str[i]);
      } else {
        result = result + str[i];
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // print(isFav);
    // print("yo");
    print(widget.isFavourited);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 90.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[900], width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(color: Colors.grey[400], height: 90.0, width: 80),
            Image.network(
              widget.image,
              height: 90.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From:  ${widget.from}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "To:  ${widget.to}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.isFavourited
                              ? Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : SizedBox(
                                  height: 25,
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$${double.parse(sanitise(widget.data['deliveryFee'])) + double.parse(sanitise(widget.data['deliveryFee']))}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
