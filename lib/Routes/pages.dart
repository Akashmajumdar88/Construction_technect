import 'package:get/get.dart';
import '../Binding/dashboard_binding.dart';
import '../Binding/splash_binding.dart';
import '../Binding/materials_binding.dart';
import '../Binding/item_detail_binding.dart';
import '../Binding/product_listing_binding.dart';
import '../Binding/product_detail_binding.dart';
import '../Binding/add_product_binding.dart';
import '../Presentation/dashboard_view.dart';
import '../Presentation/splash_view.dart';
import '../Presentation/materials_view.dart';
import '../Presentation/item_detail_view.dart';
import '../Presentation/product_listing_view.dart';
import '../Presentation/product_detail_view.dart';
import '../Presentation/add_product_view.dart';

class Pages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: "/",
      page: () => SplashView(),
      popGesture: true,
      binding: SplashBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/Dashboard",
      page: () => Dashboard(),
      popGesture: true,
      binding: DashboardBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/Materials",
      page: () => MaterialsView(),
      popGesture: true,
      binding: MaterialsBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/ItemDetail",
      page: () => ItemDetailView(),
      popGesture: true,
      binding: ItemDetailBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/ProductListing",
      page: () => ProductListingView(),
      popGesture: true,
      binding: ProductListingBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/ProductDetail",
      page: () => const ProductDetailView(),
      popGesture: true,
      binding: ProductDetailBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: "/AddProduct",
      page: () => const AddProductView(),
      popGesture: true,
      binding: AddProductBinding(),
      showCupertinoParallax: true,
    ),
  ];
}