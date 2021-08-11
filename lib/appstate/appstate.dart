import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  bool isfetching = false;
  var news = [];
  Future getnews() async {
    isfetching = true;
    notifyListeners();

    try {
      http.Response response = await http
          .get(Uri.parse("https://api.sampleapis.com/futurama/characters"));
      if (response.statusCode == 200) {
        var tempresult = jsonDecode(response.body);

        news =tempresult;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    isfetching = false;
    notifyListeners();
  }
}
