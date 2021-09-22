import 'package:dio/dio.dart';

Future<List?> getTextData() async {
  try {
    var res = await Dio().get<List>('https://api.publicapis.org/categories');
    print(res);
    return res.data;
  } catch (e) {
    print(e);
  }
}
