import 'package:bucket/functions/database_functions.dart';
import 'package:bucket/model/best_selling_products_model.dart';
import 'package:bucket/model/home_best_selling_products.dart';
import 'package:bucket/model/carousel_model.dart';
import 'package:bucket/model/home_fashion_styles_model.dart';
import 'package:bucket/model/home_category_model.dart';
import 'package:bucket/model/home_low_price_store_model.dart';
import 'package:bucket/model/sign_up_model.dart';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getUserData();
  }
  bool isLoading = false;
  List<SignUpModel> usersList = [];
  List<HomeCategoryModel> homeCategoryList = [
    HomeCategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP2li3OqQyOx_Y4Jmh-7jDohvYxaXSJt7aug&usqp=CAU',
        name: "Categories"),
    HomeCategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfQZFM208vIYcfSdwccANFbKSpvaHb6X-s4Q&usqp=CAU',
        name: "Kurti & Suit"),
    HomeCategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBhR8l_NEbcaPvM3JLlpAgD9HYX-_QaXgWEQ&usqp=CAU',
        name: "Western Wear"),
    HomeCategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1JuyGyD1_iHnw_CdaprPgu3E0Fi_TIdWQUA&usqp=CAU',
        name: 'Men'),
    HomeCategoryModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiizk7zzkdSShmH-3gk-j_oU3QsuAvr4iJsw&usqp=CAU",
        name: 'Kids'),
    HomeCategoryModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDSoHlDhlgqMu-SdKKr_tOQrYLBrwMYhG7Rg&usqp=CAU",
        name: "Saree"),
    HomeCategoryModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi5kxHPPvIY4TCymEpkcpduassZNUMsTOCww&usqp=CAU",
        name: "Accessories"),
    HomeCategoryModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6aexUmv3BZhH_uF2KuLA1gq93LWheksqAdA&usqp=CAU",
        name: "Jewellery"),
  ];
  List<CarouselModel> carouselModelList = [
    CarouselModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSv_PROJ2izsSjzMte9xyt5g-T5_G3GOpMHg&usqp=CAU'),
    CarouselModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWJkBC3QuZuURa-_MTwodqW07PQgxTkRe4uw&usqp=CAU"),
    CarouselModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9yWeUc3CWaRBYc1nsBYb3vBEZLcGTAgiLXQ&usqp=CAU'),
    CarouselModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTWLbuHJKfbePmsaifRZlWTiPqa7yjSKOqeg&usqp=CAU'),
  ];
  List<HomeBestSellingProductsModel> bestSellingProductsList = [
    HomeBestSellingProductsModel(
        category: "Dresses",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVoZVSHz72Rbyu_jX6BOEbTw9TaUYdfk6BjQ&usqp=CAU"),
    HomeBestSellingProductsModel(
        category: "Suits & Dresses",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKJzg_5UnWhhwq-VAH1bxBpizBsx-ZxCDgaQ&usqp=CAU"),
    HomeBestSellingProductsModel(
        category: "Baby Sets",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUnfAIiNrNB-zPu-fXFUOfQuAopVfS9VNxiw&usqp=CAU"),
    HomeBestSellingProductsModel(
        category: "Boys Cloth",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaCFwvRje1b8DaJbO0XEFl5vVADiqaKU272w&usqp=CAU"),
    HomeBestSellingProductsModel(
        category: "Women Trousers",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0gVewRIvXC8lnrXvGQM44Qvw3sXvz6ZwAlA&usqp=CAU"),
  ];
  List<HomeFashionStylesModel> fashionStylesList = [
    HomeFashionStylesModel(
        category: "Women Fit",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYsCN7QuaSmEdR3DCf2ZoLOhu3ZF_-ILWrsw&usqp=CAU"),
    HomeFashionStylesModel(
        category: "Women Long Sleeve",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk8EFFTIK14Aqtb1Q5ZC-Br9nYppP9nIg9JA&usqp=CAU"),
    HomeFashionStylesModel(
        category: "Women Casual Watches",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1fdV8w5PCXW9GzIr4CX6jp4L4g1R1HFEvRg&usqp=CAU"),
    HomeFashionStylesModel(
        category: "Women Printed Dresses",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlwkVNnWxDov-xiPAkLKxcyB7uZ2oF06JVTqNs1LcfvDUf6RDeX0Wg85lnmvaYasrc6sE&usqp=CAU")
  ];
  List<HomeLowPriceStoreModel> lowPriceList = [
    HomeLowPriceStoreModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRndtX1A1ElhyAobMl0-NSBkbhQHE-Ctp6Iw&usqp=CAU',
        name: 'Home Textiles'),
    HomeLowPriceStoreModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG_KASJLdh8aj90AQZplP66pGQawlpJ_T_Cg&usqp=CAU',
        name: 'Women Suits & Dress Materials'),
    HomeLowPriceStoreModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBp9nZ6Ik-5457sNemAUKHJUozLI-lPJa3qg&usqp=CAU',
        name: 'Kids Boys'),
  ];
  Color favoriteIconColor = Colors.grey;
  void changeIconColor() {
    notifyListeners();
    if (favoriteIconColor == Colors.grey) {
      favoriteIconColor = Colors.red;
      notifyListeners();
    } else {
      favoriteIconColor = Colors.grey;
      notifyListeners();
    }
    notifyListeners();
  }

  void getUserData() async {
    notifyListeners();
    isLoading = true;
    notifyListeners();

    usersList = await DataBaseFunctions().getUserRegistrationData();
    isLoading = false;
    notifyListeners();
  }

  List<BestSellingProductsModel> bestSellingList = [
    BestSellingProductsModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ64Sz1lPcrsHD_FUnLkX61VduYW-wvEGDfQ&usqp=CAU'),
    BestSellingProductsModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpvdjeH-t4EFPm5isPoOa7O4Yv86Ehkx0Ivg&usqp=CAU'),
    BestSellingProductsModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR60PCqfVpN3kpDasyF2B3IarlF_Of0FKhvgA&usqp=CAU'),
    BestSellingProductsModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI_V80WzQUeELFrA_67TJOAtbKBNcTHbWUtw&usqp=CAU'),
    BestSellingProductsModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA5Kd0lcfdJm0PUfzcJnADdfgTLqYJLa8JqQ&usqp=CAU'),
  ];
}
