import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getUsersData() async {
  var dio = Dio();
  try {
    Response response = await dio.get('https://reqres.in/api/users?page=2');

    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> getBibleData() async {
  var dio = Dio();
  try {
    Response response = await dio
        .get('https://www.abibliadigital.com.br/api/verses/nvi/sl/23Search');
    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> usersPostData(dynamic requestData) async {
  var dio = Dio();

  try {
    Response response = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: requestData,
    );
    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}
