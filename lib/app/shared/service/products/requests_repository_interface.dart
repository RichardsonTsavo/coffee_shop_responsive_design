import 'package:coffee_shop_website_design/app/shared/models/posts_blog_model.dart';
import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/models/review_model.dart';

abstract class IRequestsRepository {
  Future<List<ProductModel>> getMenuProducts();
  Future<List<ProductModel>> getLastProducts();
  Future<List<ReviewModel>> getReviews();
  Future<List<PostsBlog>> getPostsBlog();
}