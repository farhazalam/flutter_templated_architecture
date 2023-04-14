import '../../common/network_handler.dart';
import '../../models/category.dart';

class HomeService {
  final NetworkHandler _networkHandler;
  HomeService(this._networkHandler);

  Future<List<Category?>?> getAllCategoriesAndProducts() async {
    try {
      final res = await _networkHandler.get(url: 'category/catProducts');
      List<Category> categoryProducts = [];

      if (res != null) {
        categoryProducts = List<Category>.from(
            res.data["data"].map((x) => Category.fromJson(x))).toList();
        return categoryProducts;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
