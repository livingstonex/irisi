import 'package:flutter/material.dart';

class DeliveryDetail extends StatefulWidget {
  var data;
  final Function add;
  final Function remove;
  var fav;
  DeliveryDetail(
      {@required this.data, @required this.add, this.remove, this.fav});

  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  int total;
  bool isFav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.data['deliveryFee'].replaceAll(RegExp('$'), ''));
    // sanitise(widget.data['deliveryFee']);
    isFav = widget.fav.contains(widget.data['id']);
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Route Card
                Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.95,
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("From"),
                              Text("${widget.data['route']['start']}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 0,
                            right: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("To"),
                              Text("${widget.data['route']['end']}"),
                            ],
                          ),
                        )
                      ],
                    )),

                SizedBox(
                  height: 20.0,
                ),

                // Goods to Deliver section
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey[400],
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Goods to Deliver",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        SizedBox(height: 15.0),
                        // Container(
                        //   height: 100,
                        //   width: 100.0,
                        //   color: Colors.grey[700],
                        // ),
                        Image.network(
                          "https://loremflickr.com/320/240/cat?lock=9953",
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Delivery fee section
                Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey[400],
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "\$ ${double.parse(sanitise(widget.data['deliveryFee'])) + double.parse(sanitise(widget.data['deliveryFee']))}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Favourite button
                Container(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });

                      if (isFav) {
                        widget.add(widget.data['id']);
                      } else {
                        widget.remove(widget.data['id']);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.green[600], Colors.green[600]],
                            begin: Alignment.center,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.95,
                            minHeight: 45.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Favourite",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            SizedBox(width: 20.0),
                            isFav
                                ? Icon(
                                    Icons.favorite_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_outline,
                                    size: 30,
                                    color: Colors.white,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
