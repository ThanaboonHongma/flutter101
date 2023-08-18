import 'package:homework/api/apiclient.dart';
import 'package:homework/model/Prodect.dart';

class StoreReprository{
  final ApiClient apiClient;

  StoreReprository(this.apiClient);

  Future<List<Product>> getProduct() async {
    final reslt = await apiClient.getProduct();
    return reslt.map((item) => Product.fromMap(item)).toList();
  }
}