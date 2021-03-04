import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String baseURL = "https://mock-api-mobile.dev.lalamove.com/";

  // Post Request No Token
  postRequest(data) async {
    // print(baseURL+url);
    Response res = await post("$baseURL",
        body: data, headers: {'Content-Type': 'application/json'});
    return jsonDecode(res.body);
  }

  // Get Request No Token
  getRequestNoToken(String url) async {
    Response res = await get("$baseURL$url");
    print(res);
    return jsonDecode(res.body);
    // if (res.statusCode == 200){
    //   List<dynamic> body = jsonDecode(res.body);
    //   return body;
    // } else {

    //   throw "Can't get Resource";
    // }
  }
}
