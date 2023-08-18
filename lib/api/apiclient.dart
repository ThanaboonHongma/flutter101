import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _httpClient;

  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Map<String, dynamic>>> getProduct() async {
    try {
      final url = Uri.https('fakestoreapi.com', 'products');
      final reponse = await _httpClient.get(url);

      final data = jsonDecode(reponse.body) as List<dynamic>;

      return data.map((item) => item as Map<String, dynamic>).toList();
    } catch (erorr) {
      throw Exception();
    }
  }
}
