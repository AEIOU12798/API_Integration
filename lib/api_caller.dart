import 'package:api_integration/api_urls.dart';
import 'package:dio/dio.dart';


class UsersApiCaller {
   final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}

class TodosApiCaller {
  final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}

class AlbumsApiCaller {
  final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}

class PhotosApiCaller {
  final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}

class PostsApiCaller {
  final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}

class CommentsApiCaller {
  final dioInstanse = Dio();
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await dioInstanse.get('${ApiUrls.baseurl}$endpoint');
      if (response.statusCode != 200) throw Exception(response.statusMessage);
      return response.data;  // Dio already decodes JSON response, no need to jsonDecode
    } catch (e) {
      rethrow;
    }
  }
}