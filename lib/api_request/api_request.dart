import 'package:one_request/one_request.dart';

import '../model/map_model.dart';
import '../model/posts_model.dart';

class ApiRequest {
  // Create an instance
  static oneRequest request = oneRequest();

  // This is for starting List
  // static List<PostsModel> posts = [];
  // static Future<void> getPosts() async {
  //   var response = await request.send(
  //     // Url requared
  //     url: 'https://jsonplaceholder.typicode.com/posts',
  //     method: RequestType.GET,
  //     responsetype: ResponseType.json,
  //   );
  //   response.fold(
  //       (success) => posts = List<PostsModel>.from(
  //           success.map((x) => PostsModel.fromJson(x)) as Iterable),
  //       (error) => print(error.error));
  // }

  static MapModel mapModel = MapModel();

  static Future<void> getMap() async {
    var response = await request.send(
      // Url requared
      url: 'https://reqres.in/api/users?page=2',
      method: RequestType.GET,
      responsetype: ResponseType.json,
    );
    response.fold((success) => mapModel = MapModel.fromJson(success),
        (error) => print(error.error));
  }
}
