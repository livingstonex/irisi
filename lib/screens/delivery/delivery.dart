import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:irisi/screens/delivery/delivery_detail.dart';
import 'package:irisi/widgets/delivery_card.dart';
import 'package:irisi/widgets/shimmers/delivery_shimmer.dart';
import 'package:irisi/widgets/shimmers/network_shimmer.dart';
import '../../handlers/request.dart';
import '../../handlers/helpers.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  Future _data;
  var _localData = [];
  var fav = [];
  var newFav = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = _getRemoteDeliveries();
    // _getLocalDelivery();
    // print("Init state called");
    // _data = _connection();
  }

  Future _connection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      print(result);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String _url = "v2/deliveries";
        HttpService service = HttpService();
        var res = await service.getRequestNoToken(_url);
        // print(res);
        setDeliveryData(jsonEncode(res));
        print('connected');
        return res;
      }
    } on SocketException catch (_) {
      print('not connected');
      var _encodedData = await getDeliveryData();
      var _decodedData = jsonDecode(_encodedData);
      print(_decodedData);
      setState(() {
        _localData = _decodedData;
      });
      // return Scaffold.of(context).showSnackBar(
      //     SnackBar(content: Text("No network detected, check your internet")));

      // print(_localData);
      // return _decodedData;
    }
  }

  Future _getRemoteDeliveries() async {
    String _url = "v2/deliveries";
    HttpService service = HttpService();
    var res = service.getRequestNoToken(_url);
    // print(res);
    // setDeliveryData(jsonEncode(res));

    return res;
  }

  // Redundant function: @TODO remember to delete
  _getLocalDelivery() async {
    var _encodedData = await getDeliveryData();
    var _decodedData = jsonDecode(_encodedData);
    print(_decodedData.runtimeType);

    setState(() {
      _localData = _decodedData;
    });
    return _decodedData;
  }

// Function to ad favourites
  addFav(String id) {
    print("hrdddyy");
    if (fav.contains(id) == false) {
      fav.add(id);
    } else {
      fav.remove(id);
    }
    setState(() {
      newFav = fav;
    });

    print(fav);
  }

// Function ot remove favourite
  removeFav(String id) {
    if (fav.contains(id) == true) {
      fav.remove(id);
    }

    setState(() {
      newFav = fav;
    });
    print(fav);
  }

  // // Refresh
  // refresh() async {
  //   String _url = "v2/deliveries";
  //   HttpService service = HttpService();
  //   var res = await service.getRequestNoToken(_url);
  //   // print(res);
  //   setDeliveryData(jsonEncode(res));

  //   setState(() {
  //     _data = res;
  //   });
  // }

  // Refresh Function
  _refresh() {
    print('heyyy');
    // return Scaffold.of(ctx).showSnackBar(SnackBar(
    //   content: Text("Refreshing..."),
    // ));
    setState(() {
      _data = _getRemoteDeliveries();
      // allbills = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("I just pooped back");
    // setState(() {});
    // _getRemoteDeliveries();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Deliveries"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              _refresh();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(Icons.refresh),
            ),
          )
        ],
      ),
      body: FutureBuilder(
          // initialData: {},
          future: _data,
          builder: (BuildContext context, snapshot) {
            // try {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // _getLocalDelivery();
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: NetworkErrorShimmer(
                    refresh: _refresh,
                  ),
                ));
              } else {
                if (snapshot.data != null) {
                  print("returns");

                  return ListView.builder(
                    // physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    // scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      // print(snapshot.data[index]);
                      return InkWell(
                          child: DeliveryCard(
                            from: snapshot.data[index]['route']['start'],
                            to: snapshot.data[index]['route']['end'],
                            isFavourited:
                                newFav.contains(snapshot.data[index]['id']),
                            image: snapshot.data[index]['goodsPicture'],
                            data: snapshot.data[index],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeliveryDetail(
                                        data: snapshot.data[index],
                                        add: addFav,
                                        remove: removeFav,
                                        fav: fav)));
                          });
                    },
                  );
                } else {
                  return Text('No Deliveries Yet');
                }
              }
            } else {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: DeliveryShimmer(),
                  // SpinKitWave(size: 30.0, color: hex("#1A1CF8"),)
                ),
              );
            }
            // } catch (e) {
            //     print(e);
            //     return Text('Network Error!');
            // }
          }),
    );
  }
}
