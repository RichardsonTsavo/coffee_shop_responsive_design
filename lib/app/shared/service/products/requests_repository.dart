import 'package:coffee_shop_website_design/app/shared/models/posts_blog_model.dart';
import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/models/review_model.dart';
import 'package:coffee_shop_website_design/app/shared/service/products/requests_repository_interface.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';

class RequestsRepository implements IRequestsRepository {
  // Aqui vou simular as requisições http

  ConstStyle constStyle = ConstStyle();
  @override
  Future<List<ProductModel>> getLastProducts() async {
    List<ProductModel> products = [];
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String,dynamic> data = {"data": [
      {
        "id": 0007,
        "image": constStyle.product1,
        "name":"FLAT WHITE",
        "price": 12.50,
        "promotionalPrice": 10.0,
        "rating": 3.5,
      },
      {
        "id": 0008,
        "image": constStyle.product2,
        "name":"FRAPPÉ",
        "price": 15.50,
        "promotionalPrice": 13.50,
        "rating": 5.0,
      },
      {
        "id": 0009,
        "image": constStyle.product3,
        "name":"FREAKSHAKE",
        "price": 7.50,
        "promotionalPrice": 5.00,
        "rating": 4.5,
      },
    ]};
    for(int i = 0; i < data["data"].length; i++){
      products.add(ProductModel.fromMap(data["data"][i]));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getMenuProducts() async {
    List<ProductModel> products = [];
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String,dynamic> data = {"data": [
      {
        "id": 0001,
        "image": constStyle.menu1,
        "name":"AFFOGATO",
        "price": 12.50,
        "promotionalPrice": 10.0,
        "rating": 4.0,
      },
      {
        "id": 0002,
        "image": constStyle.menu2,
        "name":"CAFFÈ LATTE",
        "price": 15.50,
        "promotionalPrice": 13.50,
        "rating": 5.0,
      },
      {
        "id": 0003,
        "image": constStyle.menu3,
        "name":"CAFFÈ MOCHA",
        "price": 7.50,
        "promotionalPrice": 5.00,
        "rating": 4.5,
      },
      {
        "id": 0004,
        "image": constStyle.menu4,
        "name":"CAFÈ AU LAIT",
        "price": 15.0,
        "promotionalPrice": 14.0,
        "rating": 5.0,
      },
      {
        "id": 0005,
        "image": constStyle.menu5,
        "name":"CAPPUCCINO",
        "price": 15.50,
        "promotionalPrice": 13.50,
        "rating": 3.5,
      },
      {
        "id": 0006,
        "image": constStyle.menu6,
        "name":"COLD BREW COFFEE",
        "price": 25.00,
        "promotionalPrice": 20.00,
        "rating": 5.0,
      },
    ]};
    for(int i = 0; i < data["data"].length; i++){
      products.add(ProductModel.fromMap(data["data"][i]));
    }
    return products;
  }

  @override
  Future<List<ReviewModel>> getReviews() async {
    List<ReviewModel> products = [];
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String,dynamic> data = {"data": [
      {
        "image": constStyle.pic1,
        "name":"John Deo",
        "comment": "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard "
            "dummy text ever since the 1500s, when an unknown printer took a "
            "galley of type and scrambled it to make a type specimen book. "
            "It has survived not only five centuries, but also the leap into "
            "electronic typesetting, remaining essentially unchanged.",
        "rating": 4.0,
      },
      {
        "image": constStyle.pic2,
        "name":"Mitchell",
        "comment": "It is a long established fact that a reader will be"
            " distracted by the readable content of a page when looking at"
            " its layout. The point of using Lorem Ipsum is that it has a"
            " more-or-less normal distribution of letters, as opposed to"
            " using 'Content here, content here', making it look like readable"
            " English. Many desktop publishing packages and web page editors"
            " now use Lorem Ipsum as their default model text, and a search"
            " for 'lorem ipsum' will uncover many web sites still in their"
            " infancy.",
        "rating": 4.5,
      },
      {
        "image": constStyle.pic3,
        "name":"O'Brien",
        "comment": "There are many variations of passages of Lorem Ipsum available,"
            " but the majority have suffered alteration in some form, by"
            " injected humour, or randomised words which don't look even"
            " slightly believable. If you are going to use a passage of Lorem"
            " Ipsum, you need to be sure there isn't anything embarrassing hidden"
            " in the middle of text. All the Lorem Ipsum generators on the"
            " Internet tend to repeat predefined chunks as necessary, making"
            " this the first true generator on the Internet.",
        "rating": 4.0,
      },
    ]};
    for(int i = 0; i < data["data"].length; i++){
      products.add(ReviewModel.fromMap(data["data"][i]));
    }
    return products;
  }

  @override
  Future<List<PostsBlog>> getPostsBlog() async {
    List<PostsBlog> posts = [];
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String,dynamic> data = {"data": [
      {
        "image": constStyle.blog1,
        "title": "Tast And Refreshing Coffee",
        "userName":"Admin",
        "comment": "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard "
            "dummy text ever since the 1500s, when an unknown printer took a "
            "galley of type and scrambled it to make a type specimen book.",
        "date": DateTime.now(),
    },
      {
        "image": constStyle.blog2,
        "userName":"Admin",
        "title": "Tast And Refreshing Coffee",
        "comment": "It is a long established fact that a reader will be"
            " distracted by the readable content of a page when looking at"
            " its layout.",
        "date": DateTime.now(),
      },
      {
        "image": constStyle.blog3,
        "userName":"Admin",
        "title": "Tast And Refreshing Coffee",
        "comment": "There are many variations of passages of Lorem Ipsum available,"
            " but the majority have suffered alteration in some form, by"
            " injected humour, or randomised words which don't look even"
            " slightly believable.",
        "date": DateTime.now(),
      },
    ]};
    for(int i = 0; i < data["data"].length; i++){
      posts.add(PostsBlog.fromMap(data["data"][i]));
    }
    return posts;
  }

}