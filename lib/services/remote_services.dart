import 'package:phase5_project/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json);
      } else {
        // Handle the case when the response code is not 200
        return null;
      }
    } catch (e) {
      // Handle any other errors that might occur
      return null;
    } finally {
      client.close();
    }
  }
}
